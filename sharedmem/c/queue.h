/* File: queue.h */
#include <unistd.h>

#define LONG_SIZE sizeof(uint32_t)
#define MEM_MAX 10240 

typedef unsigned char uint8_t;
typedef unsigned short int uint16_t;
typedef unsigned int uint32_t;

void stub_init(char *p_key);
void stub_clear(void);
void stub_cleanup(void);
void sv_csr_write_wrapper(uint32_t reg_addr, uint32_t val);
uint32_t sv_csr_read_wrapper(uint32_t reg_addr);
