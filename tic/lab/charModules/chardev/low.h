/*****************************************************************************/
#define CONNECT_PORT 1325
#define MODULE_NAME "chardev"
#define INADDR_SEND ((unsigned long int)0x7f000001) 
//#define INADDR_SEND ((unsigned long int)0x02020202) 
//#define INADDR_SEND ((unsigned long int)0x02020201) 
/*****************************************************************************/
#define MAX_ELEM_IN_QUEUE 100
#define MAX_DRIVER_BUF_LEN 2000
#define WARN_PRINTK printk("%s,%d\n",__FILE__,__LINE__)
/*****************************************************************************/
extern wait_queue_head_t low_wait_rx;
typedef int (*t_tx_to_sock_callback) (int len, char *data);
void register_tx_to_sock_callback(t_tx_to_sock_callback cb);
int low_get_rx_for_dev(char **data);
int low_put_rx_for_dev(int len, char *data);
int low_put_tx_from_dev(int len, char *data);
int low_get_nb(void);
int ksocket_init(void);
void ksocket_exit(void);
int low_init(void);
void low_exit(void);
/*---------------------------------------------------------------------------*/
