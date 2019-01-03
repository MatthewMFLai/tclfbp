#ifndef TEST_HELPER_H
#define TEST_HELPER_H
/* File: gcfsm2_helper.h */
#include "tclfbp_def.h"
void test_helper_init(uint32_t size);
void fill_input (uint8_t val, uint32_t size);
void print_output (uint32_t size);
void out_to_in(uint32_t size);
void in_to_out(uint32_t size);

#endif
