/* File : test_helper.c */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "sock_helper.h"

static char setinel[] = "sentinel_dont_delete";
static keynode_t *m_p_head = NULL;

void key_mgr_init(void)
{
    key_mgr_add(setinel, -1);
}

void key_mgr_reset(void)
{
    keynode_t *p_cur = m_p_head;
    while (p_cur != NULL)
    {
        if (!(strcmp(p_cur->p_key, setinel)))
            break;
     
        m_p_head = p_cur->p_next;
        free(p_cur->p_key);
        if (p_cur->size > 0)
        {
            free(p_cur->p_buffer);
            free(p_cur->p_bcd_buffer);
        }
        free(p_cur);
        p_cur = m_p_head;
    }
}

void key_mgr_add(char *p_key, int size)
{
    keynode_t *p_cur = m_p_head;
    p_cur = (keynode_t *)malloc(sizeof(keynode_t));
    p_cur->p_key = (char *)malloc((strlen(p_key) + 1));
    strcpy(p_cur->p_key, p_key);
    p_cur->size = size;
    if (size > 0)
    {
        p_cur->p_buffer = (char *)malloc(size);
        memset(p_cur->p_buffer, 0, size);
        p_cur->p_bcd_buffer = (char *)malloc(size * 2 + 1);
        memset(p_cur->p_bcd_buffer, 0, size * 2 + 1);
    }

    p_cur->p_next = m_p_head;
    m_p_head = p_cur; 
}

bool key_mgr_delete(char *p_key)
{
    keynode_t *p_cur_next;
    keynode_t *p_cur = m_p_head;

    while (p_cur != NULL)
    {
        if ((strcmp(p_cur->p_key, p_key)) != 0)
        {
            p_cur = p_cur->p_next;
            continue;
        }
        p_cur_next = p_cur->p_next;
        free(p_cur->p_key);
        if (p_cur->size > 0)
        {
            free(p_cur->p_buffer);
            free(p_cur->p_bcd_buffer);
        }
        memcpy(p_cur, p_cur_next, sizeof(keynode_t));
        free(p_cur_next);
        return (true);
    }
    return (false);
}

static keynode_t *key_mgr_get(char *p_key)
{
    keynode_t *p_cur = m_p_head;
    while (p_cur != NULL)
    {
        if (!(strcmp(p_cur->p_key, p_key)))
            return (p_cur);

        p_cur = p_cur->p_next;
    }
    return (NULL);
}

static char *key_mgr_get_buffer(char *p_key)
{
    char *p_buffer = NULL;

    keynode_t *p_cur = key_mgr_get(p_key);
    if (p_cur != NULL)
        p_buffer = p_cur->p_buffer;

    return (p_buffer);
}

void *key_mgr_get_msg(char *p_key)
{
    return ((void *)key_mgr_get_buffer(p_key));
}

int key_mgr_get_size(char *p_key)
{
    int size  = -1;

    keynode_t *p_cur = key_mgr_get(p_key);
    if (p_cur != NULL)
        size = p_cur->size;

    return (size);

}

bool key_mgr_check(char *p_key)
{
    keynode_t *p_cur = m_p_head;
    while (p_cur != NULL)
    {
        if (!(strcmp(p_cur->p_key, p_key)))
            return (true);

        p_cur = p_cur->p_next;
    }
    return (false);
}

void key_mgr_dump(void)
{
    keynode_t *p_cur = m_p_head;
    while (p_cur != NULL)
    {
        printf("%s %p %p %d\n", p_cur->p_key, p_cur->p_buffer, p_cur->p_bcd_buffer, p_cur->size);
        p_cur = p_cur->p_next;
    }
}

char *key_mgr_bcd_get(char *p_key)
{
    int i, j;
    char bcd_hi, bcd_lo;
    keynode_t *p_cur = key_mgr_get(p_key);

    if (p_cur == NULL)
        return (NULL);

    char *p_buffer = p_cur->p_buffer;
    char *p_bcd_buffer = p_cur->p_bcd_buffer;
    for (i = 0, j = 0; i < p_cur->size; i++, j++)
    {
        bcd_lo = (p_buffer[i] & 0x0f);
        bcd_hi = ((p_buffer[i] & 0xf0) >> 4);

        if (bcd_hi >= 0 && bcd_hi <= 9)
            *(p_bcd_buffer + j) = '0' + bcd_hi; 
        else
            *(p_bcd_buffer + j) = 'A' + bcd_hi - 10;
 
        j++; 
        if (bcd_lo >= 0 && bcd_lo <= 9)
        {
            *(p_bcd_buffer + j) = '0' + bcd_lo; 
        }
        else
        {
            *(p_bcd_buffer + j) = 'A' + bcd_lo - 10;
        } 
    } 
    return (p_bcd_buffer);
}

int key_mgr_bcd_set(char *p_key, char *p_bcd)
{
    int i, j;
    char bcd_hi, bcd_lo;
    char msnibble, lsnibble;
    keynode_t *p_cur = key_mgr_get(p_key);

    if (p_cur == NULL)
        return (-1);

    char *p_buffer = p_cur->p_buffer;
    char *p_bcd_buffer = p_cur->p_bcd_buffer;
    strcpy(p_bcd_buffer, p_bcd);

    for (i = 0, j = 0; i < (2 * p_cur->size); i++,j++)
    {
        bcd_hi = p_bcd_buffer[i++];
        bcd_lo = p_bcd_buffer[i];

        if (bcd_hi >= '0' && bcd_hi <= '9')
            msnibble =  bcd_hi - '0'; 
        else
            msnibble = bcd_hi - 'A' + 10;
 
        if (bcd_lo >= '0' && bcd_lo <= '9')
            lsnibble = bcd_lo - '0'; 
        else
            lsnibble = bcd_lo - 'A' + 10;

        *(p_buffer + j) = (msnibble << 4) | lsnibble;
    }
    memset(p_bcd_buffer, 0, p_cur->size * 2 + 1);
    return (0);
}

void test_bcd (char *p_key)
{
    char *p_buffer;
    char str1[] = "hello";
    char str2[] = "world";
    keynode_t *p_cur = key_mgr_get(p_key);

    if (p_cur == NULL)
        return;

    p_buffer = p_cur->p_buffer;

    strcpy(p_buffer, str1);
    strcpy(p_buffer + 10, str2);
    return;
}
