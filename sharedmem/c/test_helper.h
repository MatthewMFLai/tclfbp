#ifndef TEST_HELPER_H
#define TEST_HELPER_H
/* File: test_helper.h */
#include <stdbool.h>
#include "tclfbp_def.h"

typedef struct node {
    struct node *p_next;
    char *p_port;
    char *p_shmkey;
    char *p_buffer;
    int size;
} node_t; 

void port_mgr_init (void);
void port_mgr_reset(void);
void port_mgr_add(char *p_port, int size, char *p_key);
bool port_mgr_delete(char *p_port);
char *port_mgr_get_shmkey(char *p_port);
void *port_mgr_get_msg(char *p_port);
int port_mgr_get_size(char *p_port);
bool port_mgr_check(char *p_port);
void port_mgr_dump(void);

void port_mgr_msg_set(char *p_port, char *p_data, int offset);
char *port_mgr_msg_get(char *p_port, int offset);


#endif
