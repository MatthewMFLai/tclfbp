#ifndef QUEUE_H 
#define QUEUE_H
#include <unistd.h>
#include "tclfbp_def.h"

#define LONG_SIZE sizeof(uint32_t)
#define MEM_MAX 10240 

// len = logical length of array. MUST be power of 2!!!
void stub_init(char *p_key, uint32_t len, uint32_t size);
void stub_clear(uint32_t len, uint32_t size);
void stub_cleanup(void);
// Return 0 if write successful, else queue is full
uint32_t sv_csr_write_wrapper(void *p_data);
// Return 0 if read successful, else queue is empty 
uint32_t sv_csr_read_wrapper(void *p_data);

#endif /* QUEUE_H */
