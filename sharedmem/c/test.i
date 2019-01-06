/* File : test.i */
%module tclsharedmem 
%typedef unsigned char uint8_t;
%typedef unsigned short int uint16_t;
%typedef unsigned int uint32_t;
%{
#include "queue.h"
#include "test_helper.h"
%}

#pragma SWIG nowarn=SWIGWARN_TYPEMAP_SWIGTYPELEAK

/* Some helper functions to make it easier to test */

%include "queue.h"
%include "test_helper.h"
