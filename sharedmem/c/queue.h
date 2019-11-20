#ifndef QUEUE_H 
#define QUEUE_H
#include <unistd.h>
#include "tclfbp_def.h"

void queue_init(void);
// len = logical length of array. MUST be power of 2!!!
void stub_init(char *p_key, uint32_t len, uint32_t size);
void stub_clear(char *p_key, uint32_t len, uint32_t size);
void stub_cleanup(char *p_key);
// Return 0 if write successful, else queue is full
uint32_t sv_csr_write_wrapper(char *p_key, void *p_data);
// Return 0 if read successful, else queue is empty 
uint32_t sv_csr_read_wrapper(char *p_key, void *p_data);
// Return 0 if peek successful, else queue is empty 
uint32_t sv_csr_peek_wrapper(char *p_key, void *p_data);
// Return queue length 
uint32_t sv_csr_qlen_wrapper(char *p_key);

#endif /* QUEUE_H */
