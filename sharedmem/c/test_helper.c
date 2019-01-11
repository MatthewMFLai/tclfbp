/* File : test_helper.c */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "test_helper.h"

static char setinel[] = "sentinel_dont_delete";
static node_t *m_p_head = NULL;

void port_mgr_init(void)
{
    port_mgr_add(setinel, -1);
}

void port_mgr_reset(void)
{
    node_t *p_cur = m_p_head;
    while (p_cur != NULL)
    {
        if (!(strcmp(p_cur->p_port, setinel)))
            break;
     
        m_p_head = p_cur->p_next;
        free(p_cur->p_port);
        if (p_cur->size > 0)
            free(p_cur->p_buffer);
        free(p_cur);
        p_cur = m_p_head;
    }
}

void port_mgr_add(char *p_port, int size)
{
    node_t *p_cur = m_p_head;
    p_cur = (node_t *)malloc(sizeof(node_t));
    p_cur->p_port = (char *)malloc((strlen(p_port) + 1));
    strcpy(p_cur->p_port, p_port);
    p_cur->size = size;
    if (size > 0)
    {
        p_cur->p_buffer = (char *)malloc(size);
        memset(p_cur->p_buffer, 0, size);
    }

    p_cur->p_next = m_p_head;
    m_p_head = p_cur; 
}

bool port_mgr_delete(char *p_port)
{
    node_t *p_cur_next;
    node_t *p_cur = m_p_head;

    while (p_cur != NULL)
    {
        if ((strcmp(p_cur->p_port, p_port)) != 0)
        {
            p_cur = p_cur->p_next;
            continue;
        }
        p_cur_next = p_cur->p_next;
        free(p_cur->p_port);
        if (p_cur->size > 0)
            free(p_cur->p_buffer);
        memcpy(p_cur, p_cur_next, sizeof(node_t));
        free(p_cur_next);
        return (true);
    }
    return (false);
}

static node_t *port_mgr_get(char *p_port)
{
    node_t *p_cur = m_p_head;
    while (p_cur != NULL)
    {
        if (!(strcmp(p_cur->p_port, p_port)))
            return (p_cur);

        p_cur = p_cur->p_next;
    }
    return (NULL);
}

static char *port_mgr_get_buffer(char *p_port)
{
    char *p_buffer = NULL;

    node_t *p_cur = port_mgr_get(p_port);
    if (p_cur != NULL)
        p_buffer = p_cur->p_buffer;

    return (p_buffer);
}

void *port_mgr_get_msg(char *p_port)
{
    return ((void *)port_mgr_get_buffer(p_port));
}

int port_mgr_get_size(char *p_port)
{
    int size  = -1;

    node_t *p_cur = port_mgr_get(p_port);
    if (p_cur != NULL)
        size = p_cur->size;

    return (size);

}

bool port_mgr_check(char *p_port)
{
    node_t *p_cur = m_p_head;
    while (p_cur != NULL)
    {
        if (!(strcmp(p_cur->p_port, p_port)))
            return (true);

        p_cur = p_cur->p_next;
    }
    return (false);
}

void port_mgr_dump(void)
{
    node_t *p_cur = m_p_head;
    while (p_cur != NULL)
    {
        printf("%s %p %d\n", p_cur->p_port, p_cur->p_buffer, p_cur->size);
        p_cur = p_cur->p_next;
    }
}

void port_mgr_msg_set(char *p_port, char *p_data, int offset)
{
    char *p_buffer = port_mgr_get_buffer(p_port);
    if (p_buffer == NULL)
        return;

    strcpy(p_buffer + offset, p_data);
}

char *port_mgr_msg_get(char *p_port, int offset)
{
    char *p_buffer = port_mgr_get_buffer(p_port);
    if (p_buffer == NULL)
        return (NULL);

    return (p_buffer + offset);
}
