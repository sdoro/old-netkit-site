/****************************************************************************/
#include <linux/init.h>
#include <linux/module.h>
#include <linux/sched.h>
#include <linux/wait.h>
#include <linux/semaphore.h>
#include "low.h"
/****************************************************************************/
DECLARE_WAIT_QUEUE_HEAD(low_wait_rx);
static struct semaphore data_lock;

/****************************************************************************/
typedef struct t_hard_zone_queue
{
  char *data;
  int data_len;
  struct t_hard_zone_queue *prev;
  struct t_hard_zone_queue *next;
} t_hard_zone_queue;
/*--------------------------------------------------------------------------*/

/****************************************************************************/
static t_hard_zone_queue *qhead;
static int nb_hard_zone_el;
static t_hard_zone_queue *qnext_to_get;
/*--------------------------------------------------------------------------*/
static t_tx_to_sock_callback tx_to_sock_callback;

/*****************************************************************************/
/*                   low_get_nb                                              */
/*---------------------------------------------------------------------------*/
int low_get_nb(void)
{
  return nb_hard_zone_el;
}
/*--------------------------------------------------------------------------*/

/*****************************************************************************/
/*                   low_get_rx_for_dev                                      */
/*---------------------------------------------------------------------------*/
int low_get_rx_for_dev(char **data)
{
  int data_len = -1;
  t_hard_zone_queue *cur;
  *data = NULL;
  if (!down_interruptible(&data_lock))
    {
    cur = qnext_to_get;
    if (cur)
      {
      *data = cur->data;
      data_len = cur->data_len;
      qnext_to_get = cur->prev;
      if (cur->prev)
        cur->prev->next = NULL;
      else
        qhead = NULL;
      kfree(cur);
      nb_hard_zone_el--;
      if (nb_hard_zone_el < 0)
        WARN_PRINTK;
      } 
    up(&data_lock);
    }
  if (data_len < 0)
    WARN_PRINTK;
  return data_len;
}
/*--------------------------------------------------------------------------*/




/*****************************************************************************/
/*                   low_put_rx_for_dev                                      */
/*---------------------------------------------------------------------------*/
int low_put_rx_for_dev(int len, char *data)
{
  int result = -1;
  t_hard_zone_queue *queue; 
  if (nb_hard_zone_el > MAX_ELEM_IN_QUEUE)
    kfree(data);
  else
    {
    queue = (t_hard_zone_queue *)kmalloc(sizeof(t_hard_zone_queue),GFP_KERNEL);
    if ((len >= MAX_DRIVER_BUF_LEN) || (len <= 0))
      {
      WARN_PRINTK;
      kfree(data);
      }
    else if (!queue)
      {
      WARN_PRINTK;
      kfree(data);
      }
    else
      {
      memset(queue, 0, sizeof(t_hard_zone_queue));
      queue->data = data;
      queue->data_len = len;
      queue->next = qhead;
      if (!down_interruptible(&data_lock))
        {
        nb_hard_zone_el++;
        if (qhead == NULL)
          qnext_to_get = queue;
        else
          qhead->prev = queue;
        qhead = queue;
        result = 0;
        up(&data_lock);
        }
      wake_up_interruptible(&low_wait_rx);
      }
    }
  return result;
}
/*--------------------------------------------------------------------------*/

/*****************************************************************************/
/*                   register_tx_to_sock_callback                            */
/*---------------------------------------------------------------------------*/
void register_tx_to_sock_callback(t_tx_to_sock_callback cb)
{
  tx_to_sock_callback = cb;
}
/*--------------------------------------------------------------------------*/

/*****************************************************************************/
/*                   low_put_tx_from_dev                                     */
/*---------------------------------------------------------------------------*/
int low_put_tx_from_dev(int len, char *data)
{
  int result = -1;
  if (tx_to_sock_callback)
    result = tx_to_sock_callback(len, data);
  else
    {
    kfree(data);
    WARN_PRINTK;
    }
  return result;
}
/*--------------------------------------------------------------------------*/


/*****************************************************************************/
/*                   low_init                                                */
/*---------------------------------------------------------------------------*/
int low_init(void)
{
  int ret = 0;
  sema_init( &data_lock, 1);
  qhead = NULL;
  qnext_to_get = NULL;
  nb_hard_zone_el = 0;
  tx_to_sock_callback = NULL;
  return ret;
}
/*--------------------------------------------------------------------------*/

/*****************************************************************************/
/*                   low_exit                                                */
/*---------------------------------------------------------------------------*/
void low_exit(void)
{
}
/*--------------------------------------------------------------------------*/
MODULE_LICENSE("GPL");
/*--------------------------------------------------------------------------*/
