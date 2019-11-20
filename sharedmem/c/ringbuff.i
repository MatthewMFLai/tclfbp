# 1 "ringbuff.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "ringbuff.c"
# 30 "ringbuff.c"
# 1 "ringbuff.h" 1
# 33 "ringbuff.h"
# 1 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stdint.h" 1 3 4
# 9 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stdint.h" 3 4
# 1 "/usr/include/stdint.h" 1 3 4
# 25 "/usr/include/stdint.h" 3 4
# 1 "/usr/include/features.h" 1 3 4
# 367 "/usr/include/features.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 1 3 4
# 410 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 411 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 2 3 4
# 368 "/usr/include/features.h" 2 3 4
# 391 "/usr/include/features.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 1 3 4
# 10 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/gnu/stubs-64.h" 1 3 4
# 11 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 2 3 4
# 392 "/usr/include/features.h" 2 3 4
# 26 "/usr/include/stdint.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wchar.h" 1 3 4
# 27 "/usr/include/stdint.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 28 "/usr/include/stdint.h" 2 3 4
# 36 "/usr/include/stdint.h" 3 4

# 36 "/usr/include/stdint.h" 3 4
typedef signed char int8_t;
typedef short int int16_t;
typedef int int32_t;

typedef long int int64_t;







typedef unsigned char uint8_t;
typedef unsigned short int uint16_t;

typedef unsigned int uint32_t;



typedef unsigned long int uint64_t;
# 65 "/usr/include/stdint.h" 3 4
typedef signed char int_least8_t;
typedef short int int_least16_t;
typedef int int_least32_t;

typedef long int int_least64_t;






typedef unsigned char uint_least8_t;
typedef unsigned short int uint_least16_t;
typedef unsigned int uint_least32_t;

typedef unsigned long int uint_least64_t;
# 90 "/usr/include/stdint.h" 3 4
typedef signed char int_fast8_t;

typedef long int int_fast16_t;
typedef long int int_fast32_t;
typedef long int int_fast64_t;
# 103 "/usr/include/stdint.h" 3 4
typedef unsigned char uint_fast8_t;

typedef unsigned long int uint_fast16_t;
typedef unsigned long int uint_fast32_t;
typedef unsigned long int uint_fast64_t;
# 119 "/usr/include/stdint.h" 3 4
typedef long int intptr_t;


typedef unsigned long int uintptr_t;
# 134 "/usr/include/stdint.h" 3 4
typedef long int intmax_t;
typedef unsigned long int uintmax_t;
# 10 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stdint.h" 2 3 4
# 34 "ringbuff.h" 2
# 1 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stdbool.h" 1 3 4
# 35 "ringbuff.h" 2
# 1 "tclfbp_def.h" 1




# 4 "tclfbp_def.h"
typedef unsigned char uint8_t;
typedef unsigned short int uint16_t;
typedef unsigned int uint32_t;
# 36 "ringbuff.h" 2

enum RBUFF_RC {RBUFF_SUCCESS,
               RBUFF_ERROR_NULL,
               RBUFF_ERROR_NO_MEM};

typedef struct
{
  void* elem_array;
  uint32_t elem_size;
  uint32_t array_len;
  uint32_t head;
  uint32_t tail;
} rbuff_t;

void rbuff_init(rbuff_t* p_rbuff);
uint32_t rbuff_push(rbuff_t* p_rbuff, const void* p_elem);
uint32_t rbuff_pop(rbuff_t* p_rbuff, void* p_elem);
uint32_t rbuff_peek_at(rbuff_t* p_rbuff, void* p_elem, uint32_t elem);
uint32_t rbuff_peek(rbuff_t* p_rbuff, void* p_elem);
uint32_t rbuff_peek_all(rbuff_t* p_rbuff, void* p_elem, uint32_t* p_length);
void rbuff_flush(rbuff_t* p_rbuff);
uint32_t rbuff_get_len(rbuff_t* p_rbuff);

# 58 "ringbuff.h" 3 4
_Bool 
# 58 "ringbuff.h"
    rbuff_is_full(rbuff_t* p_rbuff);

# 59 "ringbuff.h" 3 4
_Bool 
# 59 "ringbuff.h"
    rbuff_is_empty(rbuff_t* p_rbuff);
# 31 "ringbuff.c" 2
# 1 "/usr/include/string.h" 1 3 4
# 27 "/usr/include/string.h" 3 4





# 1 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h" 1 3 4
# 216 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h" 3 4

# 216 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h" 3 4
typedef long unsigned int size_t;
# 33 "/usr/include/string.h" 2 3 4









extern void *memcpy (void *__restrict __dest, const void *__restrict __src,
       size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern void *memmove (void *__dest, const void *__src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));






extern void *memccpy (void *__restrict __dest, const void *__restrict __src,
        int __c, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));





extern void *memset (void *__s, int __c, size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int memcmp (const void *__s1, const void *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 92 "/usr/include/string.h" 3 4
extern void *memchr (const void *__s, int __c, size_t __n)
      __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));


# 123 "/usr/include/string.h" 3 4


extern char *strcpy (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

extern char *strncpy (char *__restrict __dest,
        const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern char *strcat (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

extern char *strncat (char *__restrict __dest, const char *__restrict __src,
        size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int strcmp (const char *__s1, const char *__s2)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

extern int strncmp (const char *__s1, const char *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern int strcoll (const char *__s1, const char *__s2)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

extern size_t strxfrm (char *__restrict __dest,
         const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));






# 1 "/usr/include/xlocale.h" 1 3 4
# 27 "/usr/include/xlocale.h" 3 4
typedef struct __locale_struct
{

  struct __locale_data *__locales[13];


  const unsigned short int *__ctype_b;
  const int *__ctype_tolower;
  const int *__ctype_toupper;


  const char *__names[13];
} *__locale_t;


typedef __locale_t locale_t;
# 160 "/usr/include/string.h" 2 3 4


extern int strcoll_l (const char *__s1, const char *__s2, __locale_t __l)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 3)));

extern size_t strxfrm_l (char *__dest, const char *__src, size_t __n,
    __locale_t __l) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 4)));




extern char *strdup (const char *__s)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__nonnull__ (1)));






extern char *strndup (const char *__string, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__nonnull__ (1)));
# 206 "/usr/include/string.h" 3 4

# 231 "/usr/include/string.h" 3 4
extern char *strchr (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 258 "/usr/include/string.h" 3 4
extern char *strrchr (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));


# 277 "/usr/include/string.h" 3 4



extern size_t strcspn (const char *__s, const char *__reject)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern size_t strspn (const char *__s, const char *__accept)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 310 "/usr/include/string.h" 3 4
extern char *strpbrk (const char *__s, const char *__accept)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 337 "/usr/include/string.h" 3 4
extern char *strstr (const char *__haystack, const char *__needle)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));




extern char *strtok (char *__restrict __s, const char *__restrict __delim)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));




extern char *__strtok_r (char *__restrict __s,
    const char *__restrict __delim,
    char **__restrict __save_ptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3)));

extern char *strtok_r (char *__restrict __s, const char *__restrict __delim,
         char **__restrict __save_ptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3)));
# 392 "/usr/include/string.h" 3 4


extern size_t strlen (const char *__s)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));





extern size_t strnlen (const char *__string, size_t __maxlen)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));





extern char *strerror (int __errnum) __attribute__ ((__nothrow__ , __leaf__));

# 422 "/usr/include/string.h" 3 4
extern int strerror_r (int __errnum, char *__buf, size_t __buflen) __asm__ ("" "__xpg_strerror_r") __attribute__ ((__nothrow__ , __leaf__))

                        __attribute__ ((__nonnull__ (2)));
# 440 "/usr/include/string.h" 3 4
extern char *strerror_l (int __errnum, __locale_t __l) __attribute__ ((__nothrow__ , __leaf__));





extern void __bzero (void *__s, size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



extern void bcopy (const void *__src, void *__dest, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern void bzero (void *__s, size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int bcmp (const void *__s1, const void *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 484 "/usr/include/string.h" 3 4
extern char *index (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 512 "/usr/include/string.h" 3 4
extern char *rindex (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));




extern int ffs (int __i) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
# 529 "/usr/include/string.h" 3 4
extern int strcasecmp (const char *__s1, const char *__s2)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern int strncasecmp (const char *__s1, const char *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 552 "/usr/include/string.h" 3 4
extern char *strsep (char **__restrict __stringp,
       const char *__restrict __delim)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));




extern char *strsignal (int __sig) __attribute__ ((__nothrow__ , __leaf__));


extern char *__stpcpy (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *stpcpy (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));



extern char *__stpncpy (char *__restrict __dest,
   const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *stpncpy (char *__restrict __dest,
        const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
# 658 "/usr/include/string.h" 3 4

# 32 "ringbuff.c" 2
# 42 "ringbuff.c"

# 42 "ringbuff.c"
void rbuff_init(rbuff_t* p_rbuff)
{

    uint32_t i = 32;
    while (!((p_rbuff->array_len >> --i) & 0x01));
    p_rbuff->array_len = (1 << i);

    p_rbuff->head = 0;
    p_rbuff->tail = 0;
}

uint32_t rbuff_push(rbuff_t* p_rbuff, const void* p_elem)
{
    if (p_elem == 
# 55 "ringbuff.c" 3 4
                 ((void *)0)
# 55 "ringbuff.c"
                     )
    {
        return RBUFF_ERROR_NULL;
    }

    if ((p_rbuff->tail + p_rbuff->array_len == p_rbuff->head))
    {
        return RBUFF_ERROR_NO_MEM;
    }

    void* p_dest = ((uint8_t*) ((uint8_t*) p_rbuff + sizeof(rbuff_t)) + (p_rbuff->elem_size) * (p_rbuff->head & (p_rbuff->array_len - 1)));
    memcpy(p_dest, p_elem, p_rbuff->elem_size);

    ++p_rbuff->head;
    return RBUFF_SUCCESS;
}

uint32_t rbuff_pop(rbuff_t* p_rbuff, void* p_elem)
{
    if ((p_rbuff->tail == p_rbuff->head))
    {
        return RBUFF_ERROR_NULL;
    }

    if (p_elem != 
# 79 "ringbuff.c" 3 4
                 ((void *)0)
# 79 "ringbuff.c"
                     )
    {
        void* p_src = ((uint8_t*) ((uint8_t*) p_rbuff + sizeof(rbuff_t)) + (p_rbuff->elem_size) * (p_rbuff->tail & (p_rbuff->array_len - 1)));
        memcpy(p_elem, p_src, p_rbuff->elem_size);
    }

    ++p_rbuff->tail;
    return RBUFF_SUCCESS;
}

uint32_t rbuff_peek_at(rbuff_t* p_rbuff, void* p_elem, uint32_t elem)
{
    if (p_elem == 
# 91 "ringbuff.c" 3 4
                 ((void *)0)
# 91 "ringbuff.c"
                     )
    {
        return RBUFF_ERROR_NULL;
    }

    if (rbuff_get_len(p_rbuff) <= elem)
    {
        return RBUFF_ERROR_NULL;
    }

    void* p_src = ((uint8_t*) ((uint8_t*) p_rbuff + sizeof(rbuff_t)) + (p_rbuff->elem_size) * ((p_rbuff->tail + elem) & (p_rbuff->array_len - 1)));
    memcpy(p_elem, p_src, p_rbuff->elem_size);

    return RBUFF_SUCCESS;
}

uint32_t rbuff_peek(rbuff_t* p_rbuff, void* p_elem)
{
    return rbuff_peek_at(p_rbuff, p_elem, 0);
}

uint32_t rbuff_peek_all(rbuff_t* p_rbuff, void* p_elem, uint32_t* p_length)
{
 uint32_t len = rbuff_get_len(p_rbuff);
 uint32_t i;
 uint32_t rc;

 for (i = 0; i < len; i++)
 {
        rc = rbuff_peek_at(p_rbuff, p_elem + (i * p_rbuff->elem_size), i);
  if (rc != RBUFF_SUCCESS)
   return (rc);
 }
 *p_length = len;
 return RBUFF_SUCCESS;
}

void rbuff_flush(rbuff_t* p_rbuff)
{
    p_rbuff->tail = p_rbuff->head;
}

uint32_t rbuff_get_len(rbuff_t* p_rbuff)
{
    return (p_rbuff->head - p_rbuff->tail);
}

inline 
# 138 "ringbuff.c" 3 4
      _Bool 
# 138 "ringbuff.c"
           rbuff_is_full(rbuff_t* p_rbuff)
{
    return (p_rbuff->tail + p_rbuff->array_len == p_rbuff->head);
}


# 143 "ringbuff.c" 3 4
_Bool 
# 143 "ringbuff.c"
    rbuff_is_empty(rbuff_t* p_rbuff)
{
    return (p_rbuff->tail == p_rbuff->head);
}
