/* File : gueue.c */

/* I'm a file containing some C global variables */

/* Deal with Microsoft's attempt at deprecating C standard runtime functions */
#if !defined(SWIG_NO_CRT_SECURE_NO_DEPRECATE) && defined(_MSC_VER)
# define _CRT_SECURE_NO_DEPRECATE
#endif

#include <stdlib.h>
#include <string.h>
#include "shm_mgr.h"

static char setinel[] = "sentinel_dont_delete";
static node_t *m_p_head = NULL;

void shm_mgr_reset(void)
{
    node_t *p_cur = m_p_head;
    while (p_cur != NULL)
    {
        if (!(strcmp(p_cur->p_key, setinel)))
            break;
     
        m_p_head = p_cur->p_next;
        free(p_cur->p_key);
        free(p_cur);
        p_cur = m_p_head;
    }
}

void shm_mgr_add(char *p_key, int shmid, uint8_t *p_csr)
{
    node_t *p_cur = m_p_head;
    p_cur = (node_t *)malloc(sizeof(node_t));
    p_cur->p_key = (char *)malloc((strlen(p_key) + 1));
    strcpy(p_cur->p_key, p_key);
    p_cur->shmid = shmid;
    p_cur->p_csr = p_csr;
    p_cur->p_next = m_p_head;
    m_p_head = p_cur; 
}

bool shm_mgr_delete(char *p_key)
{
    node_t *p_cur_next;
    node_t *p_cur = m_p_head;

    while (p_cur != NULL)
    {
        if ((strcmp(p_cur->p_key, p_key)) != 0)
        {
            p_cur = p_cur->p_next;
            continue;
        }
        p_cur_next = p_cur->p_next;
        memcpy(p_cur, p_cur_next, sizeof(node_t));

        free(p_cur_next->p_key);
        free(p_cur_next);
        return (true);
    }
    return (false);
}

static node_t *shm_mgr_get(char *p_key)
{
    node_t *p_cur = m_p_head;
    while (p_cur != NULL)
    {
        if (!(strcmp(p_cur->p_key, p_key)))
            return (p_cur);

        p_cur = p_cur->p_next;
    }
    return (NULL);
}

uint8_t *shm_mgr_get_addr(char *p_key)
{
    uint8_t *p_csr = NULL;

    node_t *p_cur = shm_mgr_get(p_key);
    if (p_cur != NULL)
        p_csr = p_cur->p_csr;

    return (p_csr);
}

int shm_mgr_get_shmid(char *p_key)
{
    int shmid  = -1;

    node_t *p_cur = shm_mgr_get(p_key);
    if (p_cur != NULL)
        shmid = p_cur->shmid;

    return (shmid);

}

bool shm_mgr_check(char *p_key)
{
    node_t *p_cur = m_p_head;
    while (p_cur != NULL)
    {
        if (!(strcmp(p_cur->p_key, p_key)))
            return (true);

        p_cur = p_cur->p_next;
    }
    return (false);
}

