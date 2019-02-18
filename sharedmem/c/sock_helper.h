#ifndef SOCK_HELPER_H
#define SOCK_HELPER_H
/* File: test_helper.h */
#include <stdbool.h>
#include "tclfbp_def.h"

typedef struct keynode {
    struct keynode *p_next;
    char *p_key;
    char *p_buffer;
    char *p_bcd_buffer;
    int size;
} keynode_t; 

void key_mgr_init (void);
void key_mgr_reset(void);
void key_mgr_add(char *p_key, int size);
bool key_mgr_delete(char *p_key);
void *key_mgr_get_msg(char *p_key);
int key_mgr_get_size(char *p_key);
bool key_mgr_check(char *p_key);
void key_mgr_dump(void);

char *key_mgr_bcd_get(char *p_key);
int key_mgr_bcd_set(char *p_key, char *p_bcd);

void test_bcd(char *p_key);
void key_mgr_set_buff(char *p_key, void *p_src);
#endif
