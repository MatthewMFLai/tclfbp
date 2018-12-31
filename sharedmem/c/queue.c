/* File : gueue.c */

/* I'm a file containing some C global variables */

/* Deal with Microsoft's attempt at deprecating C standard runtime functions */
#if !defined(SWIG_NO_CRT_SECURE_NO_DEPRECATE) && defined(_MSC_VER)
# define _CRT_SECURE_NO_DEPRECATE
#endif

#include <stdlib.h>
#include <string.h>
#include "queue.h"
#include "sem.h"
#include "shm.h"

static uint8_t *m_p_csr;

void sv_csr_write_wrapper(uint32_t reg_addr, uint32_t val)
{
    sem_lock();
    *(uint32_t *)(m_p_csr + reg_addr) = val;
    sem_unlock();
}

uint32_t sv_csr_read_wrapper(uint32_t reg_addr)
{
    uint32_t val;
    sem_lock();
    val = *(uint32_t *)(m_p_csr + reg_addr);
    sem_unlock();
    return (val);
}

void stub_init(char *p_key)
{
    my_sem_init(p_key);
    m_p_csr = (uint8_t *)shm_init(MEM_MAX, p_key);
}

void stub_clear(void)
{
    sem_lock();
    memset(m_p_csr, 0, MEM_MAX);
    sem_unlock();
}

void stub_cleanup(void)
{
    sem_remove();
    shm_remove();
}
