/* File : gueue.c */

/* I'm a file containing some C global variables */

/* Deal with Microsoft's attempt at deprecating C standard runtime functions */
#if !defined(SWIG_NO_CRT_SECURE_NO_DEPRECATE) && defined(_MSC_VER)
# define _CRT_SECURE_NO_DEPRECATE
#endif

#include <stdlib.h>
#include <string.h>
#include "queue.h"
#include "shm.h"
#include "ringbuff.h"
#include "shm_mgr.h"

// Return 0 if write successful, else queue is full
uint32_t sv_csr_write_wrapper(char *p_key, void *p_data)
{
    enum RBUFF_RC rc;
    rbuff_t *p_rbuff;
    uint8_t *p_csr;
   
    p_csr = shm_mgr_get_addr(p_key);
    if (p_csr == NULL)
        return(3);

    p_rbuff = (rbuff_t *)p_csr;
    rc = rbuff_push(p_rbuff, p_data);
    return (rc);
}

// Return 0 if read successful, else queue is empty 
uint32_t sv_csr_read_wrapper(char *p_key, void *p_data)
{
    enum RBUFF_RC rc;
    rbuff_t *p_rbuff;
    uint8_t *p_csr;
   
    p_csr = shm_mgr_get_addr(p_key);
    if (p_csr == NULL)
        return(3);


    p_rbuff = (rbuff_t *)p_csr;
    rc = rbuff_pop(p_rbuff, p_data);
    return (rc);
}

void queue_init(void)
{
    shm_mgr_init();
}

// len = logical length of array. MUST be power of 2!!!
void stub_init(char *p_key, uint32_t len, uint32_t size)
{
    uint8_t *p_csr;
    int shmid;

    if (!shm_mgr_check(p_key))
    {
        p_csr = (uint8_t *)shm_init(sizeof(rbuff_t) + (len * size), p_key, &shmid);
        shm_mgr_add(p_key, shmid, p_csr);
    }
}

void stub_clear(char *p_key, uint32_t len, uint32_t size)
{
    rbuff_t *p_rbuff;
    uint8_t *p_csr;
   
    p_csr = shm_mgr_get_addr(p_key);
    if (p_csr == NULL)
        return;
 
    memset(p_csr, 0, sizeof(rbuff_t) + (len * size));
   
    // set up rbuff_t
    p_rbuff = (rbuff_t *)p_csr;
    p_rbuff->array_len = len;
    p_rbuff->elem_size = size;
    rbuff_init(p_rbuff);
}

void stub_cleanup(char *p_key)
{
    int shmid;
   
    shmid = shm_mgr_get_shmid(p_key);
    if (shmid != -1)
    {
        shm_remove(shmid);
        shm_mgr_delete(p_key);
    } 
}
