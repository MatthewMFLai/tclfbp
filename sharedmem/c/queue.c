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

static uint8_t *m_p_csr;
static int m_shmid;

// Return 0 if write successful, else queue is full
uint32_t sv_csr_write_wrapper(void *p_data)
{
    enum RBUFF_RC rc;
    rbuff_t *p_rbuff;

    p_rbuff = (rbuff_t *)m_p_csr;
    rc = rbuff_push(p_rbuff, p_data);
    return (rc);
}

// Return 0 if read successful, else queue is empty 
uint32_t sv_csr_read_wrapper(void *p_data)
{
    enum RBUFF_RC rc;
    rbuff_t *p_rbuff;

    p_rbuff = (rbuff_t *)m_p_csr;
    rc = rbuff_pop(p_rbuff, p_data);
    return (rc);
}

// len = logical length of array. MUST be power of 2!!!
void stub_init(char *p_key, uint32_t len, uint32_t size)
{
    m_p_csr = (uint8_t *)shm_init(sizeof(rbuff_t) + (len * size), p_key, &m_shmid);
}

void stub_clear(uint32_t len, uint32_t size)
{
    rbuff_t *p_rbuff;

    memset(m_p_csr, 0, sizeof(rbuff_t) + (len * size));
   
    // set up rbuff_t
    p_rbuff = (rbuff_t *)m_p_csr;
    p_rbuff->array_len = len;
    p_rbuff->elem_size = size;
    p_rbuff->elem_array = m_p_csr + sizeof(rbuff_t);
    rbuff_init(p_rbuff);
}

void stub_cleanup(void)
{
    shm_remove(m_shmid);
}
