/* File : test_helper.c */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "test_helper.h"

void *p_input;
void *p_output;

void test_helper_init(uint32_t size)
{
    p_input = (char *)malloc(size);
    p_output = (char *)malloc(size);
    memset(p_input, 0, size);
    memset(p_output, 0, size);
}

void fill_input (uint8_t val, uint32_t size)
{
    uint8_t *p_data = (uint8_t *)p_input;
    uint32_t i;

    for (i = 0; i < size; i++)
        *p_data++ = val++;
}
    
void print_output (uint32_t size)
{
    uint8_t *p_data = (uint8_t *)p_output;
    uint32_t i;

    for (i = 0; i < size; i++, p_data++)
        printf("%d ", *(uint8_t *)p_data);
    printf("\n");
}    
