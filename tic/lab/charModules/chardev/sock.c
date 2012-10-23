/*****************************************************************************/
#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/init.h>
#include <linux/kthread.h>
#include <linux/errno.h>
#include <linux/types.h>
#include <linux/netdevice.h>
#include <linux/ip.h>
#include <linux/in.h>
#include <linux/delay.h>
#include "low.h"
/*---------------------------------------------------------------------------*/


/*****************************************************************************/
struct kthread_t
{
  struct task_struct *thread;
  struct socket *sock;
  struct sockaddr_in addr;
  struct socket *sock_send;
  struct sockaddr_in addr_send;
  int running;
  int stop_request;
};
/*---------------------------------------------------------------------------*/

/*****************************************************************************/
struct kthread_t *kthread = NULL;
/*---------------------------------------------------------------------------*/


/*****************************************************************************/
/*                   ksocket_send                                            */
/*---------------------------------------------------------------------------*/
static int ksocket_send(struct socket *sock, 
                        struct sockaddr_in *addr, 
                        unsigned char *buf, int len)
{
  struct msghdr msg;
  struct iovec iov;
  mm_segment_t oldfs;
  int size = 0;
  if (sock->sk==NULL)
     return 0;
  iov.iov_base = buf;
  iov.iov_len = len;
  msg.msg_flags = 0;
  msg.msg_name = addr;
  msg.msg_namelen  = sizeof(struct sockaddr_in);
  msg.msg_control = NULL;
  msg.msg_controllen = 0;
  msg.msg_iov = &iov;
  msg.msg_iovlen = 1;
  msg.msg_control = NULL;
  oldfs = get_fs();
  set_fs(KERNEL_DS);
  size = sock_sendmsg(sock,&msg,len);
  set_fs(oldfs);
  return size;
}
/*---------------------------------------------------------------------------*/

/*****************************************************************************/
/*                   ksocket_receive                                         */
/*---------------------------------------------------------------------------*/
static int ksocket_receive(struct socket* sock, 
                           struct sockaddr_in* addr, 
                           unsigned char* buf, int len)

{
  struct msghdr msg;
  struct iovec iov;
  mm_segment_t oldfs;
  int size = 0;
  if (sock->sk==NULL) return 0;
  iov.iov_base = buf;
  iov.iov_len = len;
  msg.msg_flags = 0;
  msg.msg_name = addr;
  msg.msg_namelen  = sizeof(struct sockaddr_in);
  msg.msg_control = NULL;
  msg.msg_controllen = 0;
  msg.msg_iov = &iov;
  msg.msg_iovlen = 1;
  msg.msg_control = NULL;
  oldfs = get_fs();
  set_fs(KERNEL_DS);
  size = sock_recvmsg(sock, &msg, len, msg.msg_flags);
  set_fs(oldfs);
  return size;
}
/*---------------------------------------------------------------------------*/

/*****************************************************************************/
/*                   tx_to_sock                                              */
/*---------------------------------------------------------------------------*/
static int tx_to_sock (int len, char *buf)
{
  int res = -1;
  if (kthread)
    {
    res = ksocket_send(kthread->sock_send, &kthread->addr_send,
                      (unsigned char *)buf, len);
    kfree(buf);
    }
  return res;
}
/*---------------------------------------------------------------------------*/

/*****************************************************************************/
/*                   ksocket_start                                           */
/*---------------------------------------------------------------------------*/
static void ksocket_start(void)
{
  int size, bufsize = MAX_DRIVER_BUF_LEN;
  char *buf;
  kthread->running = 1;
//  current->flags |= PF_NOFREEZE;
  daemonize(MODULE_NAME);
  allow_signal(SIGKILL);
  if ((sock_create(AF_INET, SOCK_DGRAM, IPPROTO_UDP, &kthread->sock) == 0) && 
      (sock_create(AF_INET, SOCK_DGRAM, IPPROTO_UDP, &kthread->sock_send) == 0)) 
    {
    memset(&kthread->addr, 0, sizeof(struct sockaddr_in));
    memset(&kthread->addr_send, 0, sizeof(struct sockaddr_in));
    kthread->addr.sin_family      = AF_INET;
    kthread->addr_send.sin_family      = AF_INET;
    kthread->addr.sin_addr.s_addr      = htonl(INADDR_ANY);
    kthread->addr_send.sin_addr.s_addr      = htonl(INADDR_SEND);
    kthread->addr.sin_port = htons(CONNECT_PORT);
    kthread->addr_send.sin_port = htons(CONNECT_PORT);
    if (kthread->sock->ops->bind(kthread->sock, 
                                (struct sockaddr *)&kthread->addr, 
                                 sizeof(struct sockaddr)) == 0) 
      {
      printk(KERN_INFO MODULE_NAME": listening on port %d\n", CONNECT_PORT);
      for (;!kthread->stop_request;)
        {
        buf = (char *)kmalloc((bufsize+1)*sizeof(char), GFP_KERNEL);
        if (buf)
          {
          memset(buf, 0, (bufsize+1)*sizeof(char));
          size = ksocket_receive(kthread->sock, &kthread->addr, 
                                 (unsigned char *) buf, bufsize);
          if (signal_pending(current))
            {
            WARN_PRINTK;
            kfree(buf);
            break;
            }
          if (size <= 0)
            {
            WARN_PRINTK;
            kfree(buf);
            }
          else 
            low_put_rx_for_dev(size, buf);
          }
        else
          WARN_PRINTK;
        }
      sock_release(kthread->sock_send);
      kthread->sock_send = NULL;
      sock_release(kthread->sock);
      kthread->sock = NULL;
      WARN_PRINTK;
      }
    }
  kthread->thread = NULL;
  kthread->running = 0;
}
/*---------------------------------------------------------------------------*/

/*****************************************************************************/
/*                   ksocket_exit                                            */
/*---------------------------------------------------------------------------*/
int ksocket_init(void)
{
  int result = -ENOMEM;
  kthread = kmalloc(sizeof(struct kthread_t), GFP_KERNEL);
  if (kthread)
    { 
    memset(kthread, 0, sizeof(struct kthread_t));
    kthread->thread = kthread_run((void *)ksocket_start, NULL, MODULE_NAME);
    if (IS_ERR(kthread->thread)) 
      {
      printk(KERN_INFO MODULE_NAME": unable to start kernel thread\n");
      kfree(kthread);
      kthread = NULL;
      }
    else
      {
      register_tx_to_sock_callback(tx_to_sock);
      result = 0;
      }
    }
  return result;
}
/*---------------------------------------------------------------------------*/

/*****************************************************************************/
/*                   ksocket_exit                                            */
/*---------------------------------------------------------------------------*/
void ksocket_exit(void)
{
  if (kthread)
    {
    if (kthread->thread != NULL)
      {
      kthread->stop_request = 1;
      if (kthread->sock_send != NULL) 
        ksocket_send(kthread->sock_send, &kthread->addr_send, NULL, 0);
      if (kthread_stop(kthread->thread) < 0)
        WARN_PRINTK;
      else 
        {
        while (kthread->running == 1)
          {
        printk(KERN_INFO MODULE_NAME": uunnsuccesfully killed kernel thread!\n");
          msleep(10);
          }
        printk(KERN_INFO MODULE_NAME": succesfully killed kernel thread!\n");
        }
      if (kthread->sock != NULL) 
        {
        sock_release(kthread->sock);
        kthread->sock = NULL;
        }
      }
    kfree(kthread);
    kthread = NULL;
    }
  printk(KERN_INFO MODULE_NAME": module unloaded\n");
}
/*---------------------------------------------------------------------------*/
MODULE_LICENSE("GPL");
/*---------------------------------------------------------------------------*/
