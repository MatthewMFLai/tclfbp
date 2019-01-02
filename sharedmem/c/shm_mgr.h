#ifndef SHM_MGR_H 
#define SHM_MGR_H
#include <stdbool.h>
#include "tclfbp_def.h"

typedef struct node {
    struct node *p_next;
    char *p_key;
    uint8_t *p_csr;
    int shmid;
} node_t; 

void shm_mgr_reset(void);
void shm_mgr_add(char *p_key, int shmid, uint8_t *p_csr);
bool shm_mgr_delete(char *p_key);
uint8_t *shm_mgr_get_addr(char *p_key);
int shm_mgr_get_shmid(char *p_key);
bool shm_mgr_check(char *p_key);

#endif /* SHM_MGR_H */
