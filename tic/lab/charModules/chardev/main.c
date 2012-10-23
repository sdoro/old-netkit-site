#include <linux/fs.h>
#include <linux/init.h>
#include <linux/miscdevice.h>
#include <linux/module.h>
#include <linux/sched.h>
#include <linux/poll.h>
#include "low.h"

/****************************************************************************/
static int ident_71;
/*--------------------------------------------------------------------------*/

/*****************************************************************************/
/*                   chardev_open                                            */
/*---------------------------------------------------------------------------*/
static int chardev_open(struct inode *inode, struct file *file)
{
  int result = -1;
  if (imajor(inode) == 10) 
    {
    if ((iminor(inode) == 71) && (file->private_data == NULL))
      {
      result = 0;
      file->private_data = (void *)&ident_71;
      }
    else
      WARN_PRINTK;
    }
  return result; 
}
/*--------------------------------------------------------------------------*/

/*****************************************************************************/
/*                   chardev_close                                           */
/*---------------------------------------------------------------------------*/
static int chardev_close(struct inode *inode, struct file *file)
{
  int result = -1;
  if (imajor(inode) == 10)
    {
    if ((iminor(inode) == 71) && (file->private_data == (void *)(&ident_71)))
      {
      result = 0;
      file->private_data = NULL;
      }
    else
      WARN_PRINTK;
    }
  return result;
}
/*--------------------------------------------------------------------------*/

/*****************************************************************************/
/*                   chardev_read                                            */
/*---------------------------------------------------------------------------*/
static ssize_t chardev_read(struct file *file, char __user *buf, 
                            size_t count, loff_t *ppos)
{
  int len = -1;
  char *data;
  if (file->private_data == &ident_71)
    {
    if (!wait_event_interruptible(low_wait_rx, low_get_nb()))
      {
      len = low_get_rx_for_dev(&data);
      if ((len >= 0) && data)
        {
        if (copy_to_user(buf, data, len))
          {
          WARN_PRINTK;
          len = -1;
          }
        kfree (data);
        }
      else
        WARN_PRINTK;
      }
    }
  return len;
}
/*--------------------------------------------------------------------------*/

/*****************************************************************************/
/*                   chardev_write                                           */
/*---------------------------------------------------------------------------*/
static ssize_t chardev_write(struct file *file, const char __user *buf,
                             size_t count, loff_t *ppos)
{
  int len = -ENOMEM;
  int alloc_len;
  char *data;
  if ((count > 0) && (count < MAX_DRIVER_BUF_LEN))
    {
    if (file->private_data == &ident_71)
      {
      alloc_len = (count+1) * sizeof(char);
      data = (char *)kmalloc(alloc_len, GFP_KERNEL);
      if (data)
        {
        memset(data, 0, alloc_len);
        if (!copy_from_user(data, buf, count)) 
          len = low_put_tx_from_dev(count, data);
        else
          {
          kfree(data);
          WARN_PRINTK;
          }
        }
      else
        WARN_PRINTK;
      }
    else
      WARN_PRINTK;
    }
  else
    WARN_PRINTK;
  return len;
}
/*--------------------------------------------------------------------------*/

/*****************************************************************************/
/*                   chardev_poll                                            */
/*---------------------------------------------------------------------------*/
static unsigned int chardev_poll(struct file *file, poll_table *wait)
{
  unsigned int result = 0;
  int nb_in_queue = low_get_nb();
  if (file->private_data == &ident_71)
    {
    if (nb_in_queue)
      result |= POLLIN | POLLRDNORM;
      result |= POLLOUT | POLLWRNORM;
    poll_wait(file, &low_wait_rx, wait);
    }
  return result;
}
/*--------------------------------------------------------------------------*/

/*****************************************************************************/
/*                   chardev_ioctl                                           */
/*---------------------------------------------------------------------------*/
static int chardev_ioctl(struct inode *inode, struct file *file,
                          unsigned int cmd, unsigned long arg)
{
        return 0;
}
/*--------------------------------------------------------------------------*/

/****************************************************************************/
static const struct file_operations chardev_fops = 
{
  .owner  = THIS_MODULE,
  .open   = chardev_open,
  .read	  = chardev_read,
  .write  = chardev_write,
  .poll   = chardev_poll,
  .release = chardev_close,
  .ioctl   = chardev_ioctl,
};
static struct miscdevice chardev_71 = {71,"chardev_71",&chardev_fops};

/*****************************************************************************/
/*                   chardev_init                                            */
/*---------------------------------------------------------------------------*/
static int __init chardev_init(void)
{
  int ret = 0;
  ret = low_init();
  if (!ret)
    {
    if (misc_register(&chardev_71))
      {
      WARN_PRINTK;
      ret = -1;
      } 
    ret = ksocket_init();
    if (ret)
      WARN_PRINTK;
    }
  else
    WARN_PRINTK;
  return ret;
}
/*--------------------------------------------------------------------------*/

/*****************************************************************************/
/*                   chardev_exit                                            */
/*---------------------------------------------------------------------------*/
static void __exit chardev_exit(void)
{
  ksocket_exit();
  low_exit();
  misc_deregister(&chardev_71);
}
/*--------------------------------------------------------------------------*/
module_init(chardev_init);
module_exit(chardev_exit);
MODULE_LICENSE("GPL");
/*--------------------------------------------------------------------------*/
