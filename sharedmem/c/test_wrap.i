# 1 "test_wrap.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "test_wrap.c"
# 141 "test_wrap.c"
# 1 "/usr/include/stdio.h" 1 3 4
# 27 "/usr/include/stdio.h" 3 4
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
# 28 "/usr/include/stdio.h" 2 3 4





# 1 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h" 1 3 4
# 216 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h" 3 4

# 216 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h" 3 4
typedef long unsigned int size_t;
# 34 "/usr/include/stdio.h" 2 3 4

# 1 "/usr/include/x86_64-linux-gnu/bits/types.h" 1 3 4
# 27 "/usr/include/x86_64-linux-gnu/bits/types.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 28 "/usr/include/x86_64-linux-gnu/bits/types.h" 2 3 4


typedef unsigned char __u_char;
typedef unsigned short int __u_short;
typedef unsigned int __u_int;
typedef unsigned long int __u_long;


typedef signed char __int8_t;
typedef unsigned char __uint8_t;
typedef signed short int __int16_t;
typedef unsigned short int __uint16_t;
typedef signed int __int32_t;
typedef unsigned int __uint32_t;

typedef signed long int __int64_t;
typedef unsigned long int __uint64_t;







typedef long int __quad_t;
typedef unsigned long int __u_quad_t;
# 121 "/usr/include/x86_64-linux-gnu/bits/types.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/typesizes.h" 1 3 4
# 122 "/usr/include/x86_64-linux-gnu/bits/types.h" 2 3 4


typedef unsigned long int __dev_t;
typedef unsigned int __uid_t;
typedef unsigned int __gid_t;
typedef unsigned long int __ino_t;
typedef unsigned long int __ino64_t;
typedef unsigned int __mode_t;
typedef unsigned long int __nlink_t;
typedef long int __off_t;
typedef long int __off64_t;
typedef int __pid_t;
typedef struct { int __val[2]; } __fsid_t;
typedef long int __clock_t;
typedef unsigned long int __rlim_t;
typedef unsigned long int __rlim64_t;
typedef unsigned int __id_t;
typedef long int __time_t;
typedef unsigned int __useconds_t;
typedef long int __suseconds_t;

typedef int __daddr_t;
typedef int __key_t;


typedef int __clockid_t;


typedef void * __timer_t;


typedef long int __blksize_t;




typedef long int __blkcnt_t;
typedef long int __blkcnt64_t;


typedef unsigned long int __fsblkcnt_t;
typedef unsigned long int __fsblkcnt64_t;


typedef unsigned long int __fsfilcnt_t;
typedef unsigned long int __fsfilcnt64_t;


typedef long int __fsword_t;

typedef long int __ssize_t;


typedef long int __syscall_slong_t;

typedef unsigned long int __syscall_ulong_t;



typedef __off64_t __loff_t;
typedef __quad_t *__qaddr_t;
typedef char *__caddr_t;


typedef long int __intptr_t;


typedef unsigned int __socklen_t;
# 36 "/usr/include/stdio.h" 2 3 4
# 44 "/usr/include/stdio.h" 3 4
struct _IO_FILE;



typedef struct _IO_FILE FILE;





# 64 "/usr/include/stdio.h" 3 4
typedef struct _IO_FILE __FILE;
# 74 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/libio.h" 1 3 4
# 31 "/usr/include/libio.h" 3 4
# 1 "/usr/include/_G_config.h" 1 3 4
# 15 "/usr/include/_G_config.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h" 1 3 4
# 16 "/usr/include/_G_config.h" 2 3 4




# 1 "/usr/include/wchar.h" 1 3 4
# 82 "/usr/include/wchar.h" 3 4
typedef struct
{
  int __count;
  union
  {

    unsigned int __wch;



    char __wchb[4];
  } __value;
} __mbstate_t;
# 21 "/usr/include/_G_config.h" 2 3 4
typedef struct
{
  __off_t __pos;
  __mbstate_t __state;
} _G_fpos_t;
typedef struct
{
  __off64_t __pos;
  __mbstate_t __state;
} _G_fpos64_t;
# 32 "/usr/include/libio.h" 2 3 4
# 49 "/usr/include/libio.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stdarg.h" 1 3 4
# 40 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 50 "/usr/include/libio.h" 2 3 4
# 144 "/usr/include/libio.h" 3 4
struct _IO_jump_t; struct _IO_FILE;





typedef void _IO_lock_t;





struct _IO_marker {
  struct _IO_marker *_next;
  struct _IO_FILE *_sbuf;



  int _pos;
# 173 "/usr/include/libio.h" 3 4
};


enum __codecvt_result
{
  __codecvt_ok,
  __codecvt_partial,
  __codecvt_error,
  __codecvt_noconv
};
# 241 "/usr/include/libio.h" 3 4
struct _IO_FILE {
  int _flags;




  char* _IO_read_ptr;
  char* _IO_read_end;
  char* _IO_read_base;
  char* _IO_write_base;
  char* _IO_write_ptr;
  char* _IO_write_end;
  char* _IO_buf_base;
  char* _IO_buf_end;

  char *_IO_save_base;
  char *_IO_backup_base;
  char *_IO_save_end;

  struct _IO_marker *_markers;

  struct _IO_FILE *_chain;

  int _fileno;



  int _flags2;

  __off_t _old_offset;



  unsigned short _cur_column;
  signed char _vtable_offset;
  char _shortbuf[1];



  _IO_lock_t *_lock;
# 289 "/usr/include/libio.h" 3 4
  __off64_t _offset;







  void *__pad1;
  void *__pad2;
  void *__pad3;
  void *__pad4;

  size_t __pad5;
  int _mode;

  char _unused2[15 * sizeof (int) - 4 * sizeof (void *) - sizeof (size_t)];

};


typedef struct _IO_FILE _IO_FILE;


struct _IO_FILE_plus;

extern struct _IO_FILE_plus _IO_2_1_stdin_;
extern struct _IO_FILE_plus _IO_2_1_stdout_;
extern struct _IO_FILE_plus _IO_2_1_stderr_;
# 333 "/usr/include/libio.h" 3 4
typedef __ssize_t __io_read_fn (void *__cookie, char *__buf, size_t __nbytes);







typedef __ssize_t __io_write_fn (void *__cookie, const char *__buf,
     size_t __n);







typedef int __io_seek_fn (void *__cookie, __off64_t *__pos, int __w);


typedef int __io_close_fn (void *__cookie);
# 385 "/usr/include/libio.h" 3 4
extern int __underflow (_IO_FILE *);
extern int __uflow (_IO_FILE *);
extern int __overflow (_IO_FILE *, int);
# 429 "/usr/include/libio.h" 3 4
extern int _IO_getc (_IO_FILE *__fp);
extern int _IO_putc (int __c, _IO_FILE *__fp);
extern int _IO_feof (_IO_FILE *__fp) __attribute__ ((__nothrow__ , __leaf__));
extern int _IO_ferror (_IO_FILE *__fp) __attribute__ ((__nothrow__ , __leaf__));

extern int _IO_peekc_locked (_IO_FILE *__fp);





extern void _IO_flockfile (_IO_FILE *) __attribute__ ((__nothrow__ , __leaf__));
extern void _IO_funlockfile (_IO_FILE *) __attribute__ ((__nothrow__ , __leaf__));
extern int _IO_ftrylockfile (_IO_FILE *) __attribute__ ((__nothrow__ , __leaf__));
# 459 "/usr/include/libio.h" 3 4
extern int _IO_vfscanf (_IO_FILE * __restrict, const char * __restrict,
   __gnuc_va_list, int *__restrict);
extern int _IO_vfprintf (_IO_FILE *__restrict, const char *__restrict,
    __gnuc_va_list);
extern __ssize_t _IO_padn (_IO_FILE *, int, __ssize_t);
extern size_t _IO_sgetn (_IO_FILE *, void *, size_t);

extern __off64_t _IO_seekoff (_IO_FILE *, __off64_t, int, int);
extern __off64_t _IO_seekpos (_IO_FILE *, __off64_t, int);

extern void _IO_free_backup_area (_IO_FILE *) __attribute__ ((__nothrow__ , __leaf__));
# 75 "/usr/include/stdio.h" 2 3 4




typedef __gnuc_va_list va_list;
# 90 "/usr/include/stdio.h" 3 4
typedef __off_t off_t;
# 102 "/usr/include/stdio.h" 3 4
typedef __ssize_t ssize_t;







typedef _G_fpos_t fpos_t;




# 164 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/stdio_lim.h" 1 3 4
# 165 "/usr/include/stdio.h" 2 3 4



extern struct _IO_FILE *stdin;
extern struct _IO_FILE *stdout;
extern struct _IO_FILE *stderr;







extern int remove (const char *__filename) __attribute__ ((__nothrow__ , __leaf__));

extern int rename (const char *__old, const char *__new) __attribute__ ((__nothrow__ , __leaf__));




extern int renameat (int __oldfd, const char *__old, int __newfd,
       const char *__new) __attribute__ ((__nothrow__ , __leaf__));








extern FILE *tmpfile (void) ;
# 209 "/usr/include/stdio.h" 3 4
extern char *tmpnam (char *__s) __attribute__ ((__nothrow__ , __leaf__)) ;





extern char *tmpnam_r (char *__s) __attribute__ ((__nothrow__ , __leaf__)) ;
# 227 "/usr/include/stdio.h" 3 4
extern char *tempnam (const char *__dir, const char *__pfx)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) ;








extern int fclose (FILE *__stream);




extern int fflush (FILE *__stream);

# 252 "/usr/include/stdio.h" 3 4
extern int fflush_unlocked (FILE *__stream);
# 266 "/usr/include/stdio.h" 3 4






extern FILE *fopen (const char *__restrict __filename,
      const char *__restrict __modes) ;




extern FILE *freopen (const char *__restrict __filename,
        const char *__restrict __modes,
        FILE *__restrict __stream) ;
# 295 "/usr/include/stdio.h" 3 4

# 306 "/usr/include/stdio.h" 3 4
extern FILE *fdopen (int __fd, const char *__modes) __attribute__ ((__nothrow__ , __leaf__)) ;
# 319 "/usr/include/stdio.h" 3 4
extern FILE *fmemopen (void *__s, size_t __len, const char *__modes)
  __attribute__ ((__nothrow__ , __leaf__)) ;




extern FILE *open_memstream (char **__bufloc, size_t *__sizeloc) __attribute__ ((__nothrow__ , __leaf__)) ;






extern void setbuf (FILE *__restrict __stream, char *__restrict __buf) __attribute__ ((__nothrow__ , __leaf__));



extern int setvbuf (FILE *__restrict __stream, char *__restrict __buf,
      int __modes, size_t __n) __attribute__ ((__nothrow__ , __leaf__));





extern void setbuffer (FILE *__restrict __stream, char *__restrict __buf,
         size_t __size) __attribute__ ((__nothrow__ , __leaf__));


extern void setlinebuf (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));








extern int fprintf (FILE *__restrict __stream,
      const char *__restrict __format, ...);




extern int printf (const char *__restrict __format, ...);

extern int sprintf (char *__restrict __s,
      const char *__restrict __format, ...) __attribute__ ((__nothrow__));





extern int vfprintf (FILE *__restrict __s, const char *__restrict __format,
       __gnuc_va_list __arg);




extern int vprintf (const char *__restrict __format, __gnuc_va_list __arg);

extern int vsprintf (char *__restrict __s, const char *__restrict __format,
       __gnuc_va_list __arg) __attribute__ ((__nothrow__));





extern int snprintf (char *__restrict __s, size_t __maxlen,
       const char *__restrict __format, ...)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 3, 4)));

extern int vsnprintf (char *__restrict __s, size_t __maxlen,
        const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 3, 0)));

# 412 "/usr/include/stdio.h" 3 4
extern int vdprintf (int __fd, const char *__restrict __fmt,
       __gnuc_va_list __arg)
     __attribute__ ((__format__ (__printf__, 2, 0)));
extern int dprintf (int __fd, const char *__restrict __fmt, ...)
     __attribute__ ((__format__ (__printf__, 2, 3)));








extern int fscanf (FILE *__restrict __stream,
     const char *__restrict __format, ...) ;




extern int scanf (const char *__restrict __format, ...) ;

extern int sscanf (const char *__restrict __s,
     const char *__restrict __format, ...) __attribute__ ((__nothrow__ , __leaf__));
# 443 "/usr/include/stdio.h" 3 4
extern int fscanf (FILE *__restrict __stream, const char *__restrict __format, ...) __asm__ ("" "__isoc99_fscanf")

                               ;
extern int scanf (const char *__restrict __format, ...) __asm__ ("" "__isoc99_scanf")
                              ;
extern int sscanf (const char *__restrict __s, const char *__restrict __format, ...) __asm__ ("" "__isoc99_sscanf") __attribute__ ((__nothrow__ , __leaf__))

                      ;
# 463 "/usr/include/stdio.h" 3 4








extern int vfscanf (FILE *__restrict __s, const char *__restrict __format,
      __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 2, 0))) ;





extern int vscanf (const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 1, 0))) ;


extern int vsscanf (const char *__restrict __s,
      const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__format__ (__scanf__, 2, 0)));
# 494 "/usr/include/stdio.h" 3 4
extern int vfscanf (FILE *__restrict __s, const char *__restrict __format, __gnuc_va_list __arg) __asm__ ("" "__isoc99_vfscanf")



     __attribute__ ((__format__ (__scanf__, 2, 0))) ;
extern int vscanf (const char *__restrict __format, __gnuc_va_list __arg) __asm__ ("" "__isoc99_vscanf")

     __attribute__ ((__format__ (__scanf__, 1, 0))) ;
extern int vsscanf (const char *__restrict __s, const char *__restrict __format, __gnuc_va_list __arg) __asm__ ("" "__isoc99_vsscanf") __attribute__ ((__nothrow__ , __leaf__))



     __attribute__ ((__format__ (__scanf__, 2, 0)));
# 522 "/usr/include/stdio.h" 3 4









extern int fgetc (FILE *__stream);
extern int getc (FILE *__stream);





extern int getchar (void);

# 550 "/usr/include/stdio.h" 3 4
extern int getc_unlocked (FILE *__stream);
extern int getchar_unlocked (void);
# 561 "/usr/include/stdio.h" 3 4
extern int fgetc_unlocked (FILE *__stream);











extern int fputc (int __c, FILE *__stream);
extern int putc (int __c, FILE *__stream);





extern int putchar (int __c);

# 594 "/usr/include/stdio.h" 3 4
extern int fputc_unlocked (int __c, FILE *__stream);







extern int putc_unlocked (int __c, FILE *__stream);
extern int putchar_unlocked (int __c);






extern int getw (FILE *__stream);


extern int putw (int __w, FILE *__stream);








extern char *fgets (char *__restrict __s, int __n, FILE *__restrict __stream)
     ;
# 640 "/usr/include/stdio.h" 3 4

# 665 "/usr/include/stdio.h" 3 4
extern __ssize_t __getdelim (char **__restrict __lineptr,
          size_t *__restrict __n, int __delimiter,
          FILE *__restrict __stream) ;
extern __ssize_t getdelim (char **__restrict __lineptr,
        size_t *__restrict __n, int __delimiter,
        FILE *__restrict __stream) ;







extern __ssize_t getline (char **__restrict __lineptr,
       size_t *__restrict __n,
       FILE *__restrict __stream) ;








extern int fputs (const char *__restrict __s, FILE *__restrict __stream);





extern int puts (const char *__s);






extern int ungetc (int __c, FILE *__stream);






extern size_t fread (void *__restrict __ptr, size_t __size,
       size_t __n, FILE *__restrict __stream) ;




extern size_t fwrite (const void *__restrict __ptr, size_t __size,
        size_t __n, FILE *__restrict __s);

# 737 "/usr/include/stdio.h" 3 4
extern size_t fread_unlocked (void *__restrict __ptr, size_t __size,
         size_t __n, FILE *__restrict __stream) ;
extern size_t fwrite_unlocked (const void *__restrict __ptr, size_t __size,
          size_t __n, FILE *__restrict __stream);








extern int fseek (FILE *__stream, long int __off, int __whence);




extern long int ftell (FILE *__stream) ;




extern void rewind (FILE *__stream);

# 773 "/usr/include/stdio.h" 3 4
extern int fseeko (FILE *__stream, __off_t __off, int __whence);




extern __off_t ftello (FILE *__stream) ;
# 792 "/usr/include/stdio.h" 3 4






extern int fgetpos (FILE *__restrict __stream, fpos_t *__restrict __pos);




extern int fsetpos (FILE *__stream, const fpos_t *__pos);
# 815 "/usr/include/stdio.h" 3 4

# 824 "/usr/include/stdio.h" 3 4


extern void clearerr (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));

extern int feof (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;

extern int ferror (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;




extern void clearerr_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));
extern int feof_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;
extern int ferror_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;








extern void perror (const char *__s);






# 1 "/usr/include/x86_64-linux-gnu/bits/sys_errlist.h" 1 3 4
# 26 "/usr/include/x86_64-linux-gnu/bits/sys_errlist.h" 3 4
extern int sys_nerr;
extern const char *const sys_errlist[];
# 854 "/usr/include/stdio.h" 2 3 4




extern int fileno (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;




extern int fileno_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;
# 872 "/usr/include/stdio.h" 3 4
extern FILE *popen (const char *__command, const char *__modes) ;





extern int pclose (FILE *__stream);





extern char *ctermid (char *__s) __attribute__ ((__nothrow__ , __leaf__));
# 912 "/usr/include/stdio.h" 3 4
extern void flockfile (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));



extern int ftrylockfile (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;


extern void funlockfile (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));
# 942 "/usr/include/stdio.h" 3 4

# 142 "test_wrap.c" 2
# 1 "./tcl.h" 1
# 137 "./tcl.h"
# 1 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stdarg.h" 1 3 4
# 138 "./tcl.h" 2
# 344 "./tcl.h"
 
# 344 "./tcl.h"
typedef void *ClientData;
# 419 "./tcl.h"
typedef long long Tcl_WideInt;
typedef unsigned long long Tcl_WideUInt;
# 474 "./tcl.h"
    typedef struct stat Tcl_StatBuf;
# 497 "./tcl.h"
typedef struct Tcl_Interp

{
# 516 "./tcl.h"
    char *resultDontUse;
    void (*freeProcDontUse) (char *);







    int errorLineDontUse;

}

Tcl_Interp;

typedef struct Tcl_AsyncHandler_ *Tcl_AsyncHandler;
typedef struct Tcl_Channel_ *Tcl_Channel;
typedef struct Tcl_ChannelTypeVersion_ *Tcl_ChannelTypeVersion;
typedef struct Tcl_Command_ *Tcl_Command;
typedef struct Tcl_Condition_ *Tcl_Condition;
typedef struct Tcl_Dict_ *Tcl_Dict;
typedef struct Tcl_EncodingState_ *Tcl_EncodingState;
typedef struct Tcl_Encoding_ *Tcl_Encoding;
typedef struct Tcl_Event Tcl_Event;
typedef struct Tcl_InterpState_ *Tcl_InterpState;
typedef struct Tcl_LoadHandle_ *Tcl_LoadHandle;
typedef struct Tcl_Mutex_ *Tcl_Mutex;
typedef struct Tcl_Pid_ *Tcl_Pid;
typedef struct Tcl_RegExp_ *Tcl_RegExp;
typedef struct Tcl_ThreadDataKey_ *Tcl_ThreadDataKey;
typedef struct Tcl_ThreadId_ *Tcl_ThreadId;
typedef struct Tcl_TimerToken_ *Tcl_TimerToken;
typedef struct Tcl_Trace_ *Tcl_Trace;
typedef struct Tcl_Var_ *Tcl_Var;
typedef struct Tcl_ZLibStream_ *Tcl_ZlibStream;
# 562 "./tcl.h"
typedef void (Tcl_ThreadCreateProc) (ClientData clientData);
# 627 "./tcl.h"
typedef struct Tcl_RegExpIndices {
    long start;

    long end;

} Tcl_RegExpIndices;

typedef struct Tcl_RegExpInfo {
    int nsubs;

    Tcl_RegExpIndices *matches;
    long extendStart;

    long reserved;
} Tcl_RegExpInfo;






typedef Tcl_StatBuf *Tcl_Stat_;
typedef struct stat *Tcl_OldStat_;
# 694 "./tcl.h"
typedef enum {
    TCL_INT, TCL_DOUBLE, TCL_EITHER, TCL_WIDE_INT
} Tcl_ValueType;

typedef struct Tcl_Value {
    Tcl_ValueType type;

    long intValue;
    double doubleValue;
    Tcl_WideInt wideValue;
} Tcl_Value;






struct Tcl_Obj;






typedef int (Tcl_AppInitProc) (Tcl_Interp *interp);
typedef int (Tcl_AsyncProc) (ClientData clientData, Tcl_Interp *interp,
 int code);
typedef void (Tcl_ChannelProc) (ClientData clientData, int mask);
typedef void (Tcl_CloseProc) (ClientData data);
typedef void (Tcl_CmdDeleteProc) (ClientData clientData);
typedef int (Tcl_CmdProc) (ClientData clientData, Tcl_Interp *interp,
 int argc, const char *argv[]);
typedef void (Tcl_CmdTraceProc) (ClientData clientData, Tcl_Interp *interp,
 int level, char *command, Tcl_CmdProc *proc,
 ClientData cmdClientData, int argc, const char *argv[]);
typedef int (Tcl_CmdObjTraceProc) (ClientData clientData, Tcl_Interp *interp,
 int level, const char *command, Tcl_Command commandInfo, int objc,
 struct Tcl_Obj *const *objv);
typedef void (Tcl_CmdObjTraceDeleteProc) (ClientData clientData);
typedef void (Tcl_DupInternalRepProc) (struct Tcl_Obj *srcPtr,
 struct Tcl_Obj *dupPtr);
typedef int (Tcl_EncodingConvertProc) (ClientData clientData, const char *src,
 int srcLen, int flags, Tcl_EncodingState *statePtr, char *dst,
 int dstLen, int *srcReadPtr, int *dstWrotePtr, int *dstCharsPtr);
typedef void (Tcl_EncodingFreeProc) (ClientData clientData);
typedef int (Tcl_EventProc) (Tcl_Event *evPtr, int flags);
typedef void (Tcl_EventCheckProc) (ClientData clientData, int flags);
typedef int (Tcl_EventDeleteProc) (Tcl_Event *evPtr, ClientData clientData);
typedef void (Tcl_EventSetupProc) (ClientData clientData, int flags);
typedef void (Tcl_ExitProc) (ClientData clientData);
typedef void (Tcl_FileProc) (ClientData clientData, int mask);
typedef void (Tcl_FileFreeProc) (ClientData clientData);
typedef void (Tcl_FreeInternalRepProc) (struct Tcl_Obj *objPtr);
typedef void (Tcl_FreeProc) (char *blockPtr);
typedef void (Tcl_IdleProc) (ClientData clientData);
typedef void (Tcl_InterpDeleteProc) (ClientData clientData,
 Tcl_Interp *interp);
typedef int (Tcl_MathProc) (ClientData clientData, Tcl_Interp *interp,
 Tcl_Value *args, Tcl_Value *resultPtr);
typedef void (Tcl_NamespaceDeleteProc) (ClientData clientData);
typedef int (Tcl_ObjCmdProc) (ClientData clientData, Tcl_Interp *interp,
 int objc, struct Tcl_Obj *const *objv);
typedef int (Tcl_PackageInitProc) (Tcl_Interp *interp);
typedef int (Tcl_PackageUnloadProc) (Tcl_Interp *interp, int flags);
typedef void (Tcl_PanicProc) (const char *format, ...);
typedef void (Tcl_TcpAcceptProc) (ClientData callbackData, Tcl_Channel chan,
 char *address, int port);
typedef void (Tcl_TimerProc) (ClientData clientData);
typedef int (Tcl_SetFromAnyProc) (Tcl_Interp *interp, struct Tcl_Obj *objPtr);
typedef void (Tcl_UpdateStringProc) (struct Tcl_Obj *objPtr);
typedef char * (Tcl_VarTraceProc) (ClientData clientData, Tcl_Interp *interp,
 const char *part1, const char *part2, int flags);
typedef void (Tcl_CommandTraceProc) (ClientData clientData, Tcl_Interp *interp,
 const char *oldName, const char *newName, int flags);
typedef void (Tcl_CreateFileHandlerProc) (int fd, int mask, Tcl_FileProc *proc,
 ClientData clientData);
typedef void (Tcl_DeleteFileHandlerProc) (int fd);
typedef void (Tcl_AlertNotifierProc) (ClientData clientData);
typedef void (Tcl_ServiceModeHookProc) (int mode);
typedef ClientData (Tcl_InitNotifierProc) (void);
typedef void (Tcl_FinalizeNotifierProc) (ClientData clientData);
typedef void (Tcl_MainLoopProc) (void);
# 784 "./tcl.h"
typedef struct Tcl_ObjType {
    const char *name;
    Tcl_FreeInternalRepProc *freeIntRepProc;



    Tcl_DupInternalRepProc *dupIntRepProc;


    Tcl_UpdateStringProc *updateStringProc;


    Tcl_SetFromAnyProc *setFromAnyProc;



} Tcl_ObjType;







typedef struct Tcl_Obj {
    int refCount;
    char *bytes;
# 821 "./tcl.h"
    int length;

    const Tcl_ObjType *typePtr;



    union {
 long longValue;
 double doubleValue;
 void *otherValuePtr;

 Tcl_WideInt wideValue;
 struct {




     void *ptr1;
     void *ptr2;
 } twoPtrValue;
 struct {

     void *ptr;
     unsigned long value;
 } ptrAndLongRep;
    } internalRep;
} Tcl_Obj;
# 857 "./tcl.h"
void Tcl_IncrRefCount(Tcl_Obj *objPtr);
void Tcl_DecrRefCount(Tcl_Obj *objPtr);
int Tcl_IsShared(Tcl_Obj *objPtr);
# 868 "./tcl.h"
typedef struct Tcl_SavedResult {
    char *result;
    Tcl_FreeProc *freeProc;
    Tcl_Obj *objResultPtr;
    char *appendResult;
    int appendAvl;
    int appendUsed;
    char resultSpace[200 +1];
} Tcl_SavedResult;
# 885 "./tcl.h"
typedef struct Tcl_Namespace {
    char *name;



    char *fullName;

    ClientData clientData;

    Tcl_NamespaceDeleteProc *deleteProc;


    struct Tcl_Namespace *parentPtr;



} Tcl_Namespace;
# 926 "./tcl.h"
typedef struct Tcl_CallFrame {
    Tcl_Namespace *nsPtr;
    int dummy1;
    int dummy2;
    void *dummy3;
    void *dummy4;
    void *dummy5;
    int dummy6;
    void *dummy7;
    void *dummy8;
    int dummy9;
    void *dummy10;
    void *dummy11;
    void *dummy12;
    void *dummy13;
} Tcl_CallFrame;
# 958 "./tcl.h"
typedef struct Tcl_CmdInfo {
    int isNativeObjectProc;



    Tcl_ObjCmdProc *objProc;
    ClientData objClientData;
    Tcl_CmdProc *proc;
    ClientData clientData;
    Tcl_CmdDeleteProc *deleteProc;


    ClientData deleteData;

    Tcl_Namespace *namespacePtr;




} Tcl_CmdInfo;
# 987 "./tcl.h"
typedef struct Tcl_DString {
    char *string;

    int length;

    int spaceAvl;

    char staticSpace[200];


} Tcl_DString;
# 1156 "./tcl.h"
typedef struct Tcl_HashKeyType Tcl_HashKeyType;
typedef struct Tcl_HashTable Tcl_HashTable;
typedef struct Tcl_HashEntry Tcl_HashEntry;

typedef unsigned (Tcl_HashKeyProc) (Tcl_HashTable *tablePtr, void *keyPtr);
typedef int (Tcl_CompareHashKeysProc) (void *keyPtr, Tcl_HashEntry *hPtr);
typedef Tcl_HashEntry * (Tcl_AllocHashEntryProc) (Tcl_HashTable *tablePtr,
 void *keyPtr);
typedef void (Tcl_FreeHashEntryProc) (Tcl_HashEntry *hPtr);
# 1183 "./tcl.h"
struct Tcl_HashEntry {
    Tcl_HashEntry *nextPtr;

    Tcl_HashTable *tablePtr;

    void *hash;







    ClientData clientData;

    union {
 char *oneWordValue;
 Tcl_Obj *objPtr;
 int words[1];


 char string[1];

    } key;
};
# 1232 "./tcl.h"
struct Tcl_HashKeyType {
    int version;



    int flags;
    Tcl_HashKeyProc *hashKeyProc;



    Tcl_CompareHashKeysProc *compareKeysProc;




    Tcl_AllocHashEntryProc *allocEntryProc;
# 1261 "./tcl.h"
    Tcl_FreeHashEntryProc *freeEntryProc;






};
# 1277 "./tcl.h"
struct Tcl_HashTable {
    Tcl_HashEntry **buckets;


    Tcl_HashEntry *staticBuckets[4];


    int numBuckets;

    int numEntries;

    int rebuildSize;

    int downShift;


    int mask;
    int keyType;




    Tcl_HashEntry *(*findProc) (Tcl_HashTable *tablePtr, const char *key);
    Tcl_HashEntry *(*createProc) (Tcl_HashTable *tablePtr, const char *key,
     int *newPtr);
    const Tcl_HashKeyType *typePtr;


};






typedef struct Tcl_HashSearch {
    Tcl_HashTable *tablePtr;
    int nextIndex;

    Tcl_HashEntry *nextEntryPtr;

} Tcl_HashSearch;
# 1352 "./tcl.h"
typedef struct {
    void *next;

    int epoch;

    Tcl_Dict dictionaryPtr;
} Tcl_DictSearch;
# 1382 "./tcl.h"
struct Tcl_Event {
    Tcl_EventProc *proc;
    struct Tcl_Event *nextPtr;
};





typedef enum {
    TCL_QUEUE_TAIL, TCL_QUEUE_HEAD, TCL_QUEUE_MARK
} Tcl_QueuePosition;
# 1409 "./tcl.h"
typedef struct Tcl_Time {
    long sec;
    long usec;
} Tcl_Time;

typedef void (Tcl_SetTimerProc) (const Tcl_Time *timePtr);
typedef int (Tcl_WaitForEventProc) (const Tcl_Time *timePtr);





typedef void (Tcl_GetTimeProc) (Tcl_Time *timebuf, ClientData clientData);
typedef void (Tcl_ScaleTimeProc) (Tcl_Time *timebuf, ClientData clientData);
# 1481 "./tcl.h"
typedef int (Tcl_DriverBlockModeProc) (ClientData instanceData, int mode);
typedef int (Tcl_DriverCloseProc) (ClientData instanceData,
   Tcl_Interp *interp);
typedef int (Tcl_DriverClose2Proc) (ClientData instanceData,
   Tcl_Interp *interp, int flags);
typedef int (Tcl_DriverInputProc) (ClientData instanceData, char *buf,
   int toRead, int *errorCodePtr);
typedef int (Tcl_DriverOutputProc) (ClientData instanceData,
   const char *buf, int toWrite, int *errorCodePtr);
typedef int (Tcl_DriverSeekProc) (ClientData instanceData, long offset,
   int mode, int *errorCodePtr);
typedef int (Tcl_DriverSetOptionProc) (ClientData instanceData,
   Tcl_Interp *interp, const char *optionName,
   const char *value);
typedef int (Tcl_DriverGetOptionProc) (ClientData instanceData,
   Tcl_Interp *interp, const char *optionName,
   Tcl_DString *dsPtr);
typedef void (Tcl_DriverWatchProc) (ClientData instanceData, int mask);
typedef int (Tcl_DriverGetHandleProc) (ClientData instanceData,
   int direction, ClientData *handlePtr);
typedef int (Tcl_DriverFlushProc) (ClientData instanceData);
typedef int (Tcl_DriverHandlerProc) (ClientData instanceData,
   int interestMask);
typedef Tcl_WideInt (Tcl_DriverWideSeekProc) (ClientData instanceData,
   Tcl_WideInt offset, int mode, int *errorCodePtr);



typedef void (Tcl_DriverThreadActionProc) (ClientData instanceData,
   int action);



typedef int (Tcl_DriverTruncateProc) (ClientData instanceData,
   Tcl_WideInt length);
# 1528 "./tcl.h"
typedef struct Tcl_ChannelType {
    const char *typeName;


    Tcl_ChannelTypeVersion version;

    Tcl_DriverCloseProc *closeProc;



    Tcl_DriverInputProc *inputProc;

    Tcl_DriverOutputProc *outputProc;

    Tcl_DriverSeekProc *seekProc;


    Tcl_DriverSetOptionProc *setOptionProc;

    Tcl_DriverGetOptionProc *getOptionProc;

    Tcl_DriverWatchProc *watchProc;


    Tcl_DriverGetHandleProc *getHandleProc;


    Tcl_DriverClose2Proc *close2Proc;



    Tcl_DriverBlockModeProc *blockModeProc;





    Tcl_DriverFlushProc *flushProc;


    Tcl_DriverHandlerProc *handlerProc;






    Tcl_DriverWideSeekProc *wideSeekProc;
# 1584 "./tcl.h"
    Tcl_DriverThreadActionProc *threadActionProc;







    Tcl_DriverTruncateProc *truncateProc;



} Tcl_ChannelType;
# 1613 "./tcl.h"
typedef enum Tcl_PathType {
    TCL_PATH_ABSOLUTE,
    TCL_PATH_RELATIVE,
    TCL_PATH_VOLUME_RELATIVE
} Tcl_PathType;






typedef struct Tcl_GlobTypeData {
    int type;
    int perm;
    Tcl_Obj *macType;
    Tcl_Obj *macCreator;
} Tcl_GlobTypeData;
# 1661 "./tcl.h"
typedef int (Tcl_FSStatProc) (Tcl_Obj *pathPtr, Tcl_StatBuf *buf);
typedef int (Tcl_FSAccessProc) (Tcl_Obj *pathPtr, int mode);
typedef Tcl_Channel (Tcl_FSOpenFileChannelProc) (Tcl_Interp *interp,
 Tcl_Obj *pathPtr, int mode, int permissions);
typedef int (Tcl_FSMatchInDirectoryProc) (Tcl_Interp *interp, Tcl_Obj *result,
 Tcl_Obj *pathPtr, const char *pattern, Tcl_GlobTypeData *types);
typedef Tcl_Obj * (Tcl_FSGetCwdProc) (Tcl_Interp *interp);
typedef int (Tcl_FSChdirProc) (Tcl_Obj *pathPtr);
typedef int (Tcl_FSLstatProc) (Tcl_Obj *pathPtr, Tcl_StatBuf *buf);
typedef int (Tcl_FSCreateDirectoryProc) (Tcl_Obj *pathPtr);
typedef int (Tcl_FSDeleteFileProc) (Tcl_Obj *pathPtr);
typedef int (Tcl_FSCopyDirectoryProc) (Tcl_Obj *srcPathPtr,
 Tcl_Obj *destPathPtr, Tcl_Obj **errorPtr);
typedef int (Tcl_FSCopyFileProc) (Tcl_Obj *srcPathPtr, Tcl_Obj *destPathPtr);
typedef int (Tcl_FSRemoveDirectoryProc) (Tcl_Obj *pathPtr, int recursive,
 Tcl_Obj **errorPtr);
typedef int (Tcl_FSRenameFileProc) (Tcl_Obj *srcPathPtr, Tcl_Obj *destPathPtr);
typedef void (Tcl_FSUnloadFileProc) (Tcl_LoadHandle loadHandle);
typedef Tcl_Obj * (Tcl_FSListVolumesProc) (void);

struct utimbuf;
typedef int (Tcl_FSUtimeProc) (Tcl_Obj *pathPtr, struct utimbuf *tval);
typedef int (Tcl_FSNormalizePathProc) (Tcl_Interp *interp, Tcl_Obj *pathPtr,
 int nextCheckpoint);
typedef int (Tcl_FSFileAttrsGetProc) (Tcl_Interp *interp, int index,
 Tcl_Obj *pathPtr, Tcl_Obj **objPtrRef);
typedef const char *const * (Tcl_FSFileAttrStringsProc) (Tcl_Obj *pathPtr,
 Tcl_Obj **objPtrRef);
typedef int (Tcl_FSFileAttrsSetProc) (Tcl_Interp *interp, int index,
 Tcl_Obj *pathPtr, Tcl_Obj *objPtr);
typedef Tcl_Obj * (Tcl_FSLinkProc) (Tcl_Obj *pathPtr, Tcl_Obj *toPtr,
 int linkType);
typedef int (Tcl_FSLoadFileProc) (Tcl_Interp *interp, Tcl_Obj *pathPtr,
 Tcl_LoadHandle *handlePtr, Tcl_FSUnloadFileProc **unloadProcPtr);
typedef int (Tcl_FSPathInFilesystemProc) (Tcl_Obj *pathPtr,
 ClientData *clientDataPtr);
typedef Tcl_Obj * (Tcl_FSFilesystemPathTypeProc) (Tcl_Obj *pathPtr);
typedef Tcl_Obj * (Tcl_FSFilesystemSeparatorProc) (Tcl_Obj *pathPtr);
typedef void (Tcl_FSFreeInternalRepProc) (ClientData clientData);
typedef ClientData (Tcl_FSDupInternalRepProc) (ClientData clientData);
typedef Tcl_Obj * (Tcl_FSInternalToNormalizedProc) (ClientData clientData);
typedef ClientData (Tcl_FSCreateInternalRepProc) (Tcl_Obj *pathPtr);

typedef struct Tcl_FSVersion_ *Tcl_FSVersion;
# 1730 "./tcl.h"
typedef struct Tcl_Filesystem {
    const char *typeName;
    int structureLength;

    Tcl_FSVersion version;
    Tcl_FSPathInFilesystemProc *pathInFilesystemProc;



    Tcl_FSDupInternalRepProc *dupInternalRepProc;


    Tcl_FSFreeInternalRepProc *freeInternalRepProc;



    Tcl_FSInternalToNormalizedProc *internalToNormalizedProc;




    Tcl_FSCreateInternalRepProc *createInternalRepProc;







    Tcl_FSNormalizePathProc *normalizePathProc;




    Tcl_FSFilesystemPathTypeProc *filesystemPathTypeProc;


    Tcl_FSFilesystemSeparatorProc *filesystemSeparatorProc;



    Tcl_FSStatProc *statProc;


    Tcl_FSAccessProc *accessProc;



    Tcl_FSOpenFileChannelProc *openFileChannelProc;




    Tcl_FSMatchInDirectoryProc *matchInDirectoryProc;





    Tcl_FSUtimeProc *utimeProc;




    Tcl_FSLinkProc *linkProc;



    Tcl_FSListVolumesProc *listVolumesProc;




    Tcl_FSFileAttrStringsProc *fileAttrStringsProc;






    Tcl_FSFileAttrsGetProc *fileAttrsGetProc;



    Tcl_FSFileAttrsSetProc *fileAttrsSetProc;



    Tcl_FSCreateDirectoryProc *createDirectoryProc;



    Tcl_FSRemoveDirectoryProc *removeDirectoryProc;



    Tcl_FSDeleteFileProc *deleteFileProc;



    Tcl_FSCopyFileProc *copyFileProc;





    Tcl_FSRenameFileProc *renameFileProc;




    Tcl_FSCopyDirectoryProc *copyDirectoryProc;






    Tcl_FSLstatProc *lstatProc;


    Tcl_FSLoadFileProc *loadFileProc;




    Tcl_FSGetCwdProc *getCwdProc;





    Tcl_FSChdirProc *chdirProc;
# 1877 "./tcl.h"
} Tcl_Filesystem;
# 1898 "./tcl.h"
typedef struct Tcl_NotifierProcs {
    Tcl_SetTimerProc *setTimerProc;
    Tcl_WaitForEventProc *waitForEventProc;
    Tcl_CreateFileHandlerProc *createFileHandlerProc;
    Tcl_DeleteFileHandlerProc *deleteFileHandlerProc;
    Tcl_InitNotifierProc *initNotifierProc;
    Tcl_FinalizeNotifierProc *finalizeNotifierProc;
    Tcl_AlertNotifierProc *alertNotifierProc;
    Tcl_ServiceModeHookProc *serviceModeHookProc;
} Tcl_NotifierProcs;
# 1918 "./tcl.h"
typedef struct Tcl_Token {
    int type;

    const char *start;
    int size;
    int numComponents;




} Tcl_Token;
# 2034 "./tcl.h"
typedef struct Tcl_Parse {
    const char *commentStart;

    int commentSize;



    const char *commandStart;

    int commandSize;



    int numWords;

    Tcl_Token *tokenPtr;




    int numTokens;
    int tokensAvailable;

    int errorType;







    const char *string;

    const char *end;

    Tcl_Interp *interp;

    const char *term;





    int incomplete;



    Tcl_Token staticTokens[20];





} Tcl_Parse;







typedef struct Tcl_EncodingType {
    const char *encodingName;


    Tcl_EncodingConvertProc *toUtfProc;


    Tcl_EncodingConvertProc *fromUtfProc;


    Tcl_EncodingFreeProc *freeProc;


    ClientData clientData;

    int nullSize;




} Tcl_EncodingType;
# 2232 "./tcl.h"
typedef unsigned short Tcl_UniChar;
# 2241 "./tcl.h"
typedef struct Tcl_Config {
    const char *key;

    const char *value;

} Tcl_Config;
# 2262 "./tcl.h"
typedef void (Tcl_LimitHandlerProc) (ClientData clientData, Tcl_Interp *interp);
typedef void (Tcl_LimitHandlerDeleteProc) (ClientData clientData);






typedef struct mp_int mp_int;

typedef unsigned int mp_digit;
# 2282 "./tcl.h"
typedef struct {
    int type;
    const char *keyStr;

    void *srcPtr;

    void *dstPtr;

    const char *helpStr;

    ClientData clientData;
} Tcl_ArgvInfo;
# 2315 "./tcl.h"
typedef int (Tcl_ArgvFuncProc)(ClientData clientData, Tcl_Obj *objPtr,
 void *dstPtr);
typedef int (Tcl_ArgvGenFuncProc)(ClientData clientData, Tcl_Interp *interp,
 int objc, Tcl_Obj *const *objv, void *dstPtr);
# 2387 "./tcl.h"
typedef int (Tcl_NRPostProc) (ClientData data[], Tcl_Interp *interp,
    int result);
# 2408 "./tcl.h"
const char * Tcl_InitStubs(Tcl_Interp *interp, const char *version,
       int exact);
const char * TclTomMathInitializeStubs(Tcl_Interp *interp,
       const char *version, int epoch, int revision);
# 2433 "./tcl.h"
extern void Tcl_MainEx(int argc, char **argv,
       Tcl_AppInitProc *appInitProc, Tcl_Interp *interp);
extern const char * Tcl_PkgInitStubsCheck(Tcl_Interp *interp,
       const char *version, int exact);
extern void Tcl_GetMemoryInfo(Tcl_DString *dsPtr);







# 1 "/usr/include/tcl8.6/tclDecls.h" 1
# 43 "/usr/include/tcl8.6/tclDecls.h"
extern int Tcl_PkgProvideEx(Tcl_Interp *interp,
    const char *name, const char *version,
    const void *clientData);

extern const char * Tcl_PkgRequireEx(Tcl_Interp *interp,
    const char *name, const char *version,
    int exact, void *clientDataPtr);

extern __attribute__ ((noreturn)) void Tcl_Panic(const char *format, ...) __attribute__ ((__format__ (__printf__, 1, 2)));

extern char * Tcl_Alloc(unsigned int size);

extern void Tcl_Free(char *ptr);

extern char * Tcl_Realloc(char *ptr, unsigned int size);

extern char * Tcl_DbCkalloc(unsigned int size, const char *file,
    int line);

extern void Tcl_DbCkfree(char *ptr, const char *file, int line);

extern char * Tcl_DbCkrealloc(char *ptr, unsigned int size,
    const char *file, int line);


extern void Tcl_CreateFileHandler(int fd, int mask,
    Tcl_FileProc *proc, ClientData clientData);
# 78 "/usr/include/tcl8.6/tclDecls.h"
extern void Tcl_DeleteFileHandler(int fd);






extern void Tcl_SetTimer(const Tcl_Time *timePtr);

extern void Tcl_Sleep(int ms);

extern int Tcl_WaitForEvent(const Tcl_Time *timePtr);

extern int Tcl_AppendAllObjTypes(Tcl_Interp *interp,
    Tcl_Obj *objPtr);

extern void Tcl_AppendStringsToObj(Tcl_Obj *objPtr, ...);

extern void Tcl_AppendToObj(Tcl_Obj *objPtr, const char *bytes,
    int length);

extern Tcl_Obj * Tcl_ConcatObj(int objc, Tcl_Obj *const objv[]);

extern int Tcl_ConvertToType(Tcl_Interp *interp,
    Tcl_Obj *objPtr, const Tcl_ObjType *typePtr);

extern void Tcl_DbDecrRefCount(Tcl_Obj *objPtr, const char *file,
    int line);

extern void Tcl_DbIncrRefCount(Tcl_Obj *objPtr, const char *file,
    int line);

extern int Tcl_DbIsShared(Tcl_Obj *objPtr, const char *file,
    int line);

extern Tcl_Obj * Tcl_DbNewBooleanObj(int boolValue, const char *file,
    int line);

extern Tcl_Obj * Tcl_DbNewByteArrayObj(const unsigned char *bytes,
    int length, const char *file, int line);

extern Tcl_Obj * Tcl_DbNewDoubleObj(double doubleValue,
    const char *file, int line);

extern Tcl_Obj * Tcl_DbNewListObj(int objc, Tcl_Obj *const *objv,
    const char *file, int line);

extern Tcl_Obj * Tcl_DbNewLongObj(long longValue, const char *file,
    int line);

extern Tcl_Obj * Tcl_DbNewObj(const char *file, int line);

extern Tcl_Obj * Tcl_DbNewStringObj(const char *bytes, int length,
    const char *file, int line);

extern Tcl_Obj * Tcl_DuplicateObj(Tcl_Obj *objPtr);

extern void TclFreeObj(Tcl_Obj *objPtr);

extern int Tcl_GetBoolean(Tcl_Interp *interp, const char *src,
    int *boolPtr);

extern int Tcl_GetBooleanFromObj(Tcl_Interp *interp,
    Tcl_Obj *objPtr, int *boolPtr);

extern unsigned char * Tcl_GetByteArrayFromObj(Tcl_Obj *objPtr,
    int *lengthPtr);

extern int Tcl_GetDouble(Tcl_Interp *interp, const char *src,
    double *doublePtr);

extern int Tcl_GetDoubleFromObj(Tcl_Interp *interp,
    Tcl_Obj *objPtr, double *doublePtr);

extern int Tcl_GetIndexFromObj(Tcl_Interp *interp,
    Tcl_Obj *objPtr,
    const char *const *tablePtr,
    const char *msg, int flags, int *indexPtr);

extern int Tcl_GetInt(Tcl_Interp *interp, const char *src,
    int *intPtr);

extern int Tcl_GetIntFromObj(Tcl_Interp *interp,
    Tcl_Obj *objPtr, int *intPtr);

extern int Tcl_GetLongFromObj(Tcl_Interp *interp,
    Tcl_Obj *objPtr, long *longPtr);

extern const Tcl_ObjType * Tcl_GetObjType(const char *typeName);

extern char * Tcl_GetStringFromObj(Tcl_Obj *objPtr, int *lengthPtr);

extern void Tcl_InvalidateStringRep(Tcl_Obj *objPtr);

extern int Tcl_ListObjAppendList(Tcl_Interp *interp,
    Tcl_Obj *listPtr, Tcl_Obj *elemListPtr);

extern int Tcl_ListObjAppendElement(Tcl_Interp *interp,
    Tcl_Obj *listPtr, Tcl_Obj *objPtr);

extern int Tcl_ListObjGetElements(Tcl_Interp *interp,
    Tcl_Obj *listPtr, int *objcPtr,
    Tcl_Obj ***objvPtr);

extern int Tcl_ListObjIndex(Tcl_Interp *interp,
    Tcl_Obj *listPtr, int index,
    Tcl_Obj **objPtrPtr);

extern int Tcl_ListObjLength(Tcl_Interp *interp,
    Tcl_Obj *listPtr, int *lengthPtr);

extern int Tcl_ListObjReplace(Tcl_Interp *interp,
    Tcl_Obj *listPtr, int first, int count,
    int objc, Tcl_Obj *const objv[]);

extern Tcl_Obj * Tcl_NewBooleanObj(int boolValue);

extern Tcl_Obj * Tcl_NewByteArrayObj(const unsigned char *bytes,
    int length);

extern Tcl_Obj * Tcl_NewDoubleObj(double doubleValue);

extern Tcl_Obj * Tcl_NewIntObj(int intValue);

extern Tcl_Obj * Tcl_NewListObj(int objc, Tcl_Obj *const objv[]);

extern Tcl_Obj * Tcl_NewLongObj(long longValue);

extern Tcl_Obj * Tcl_NewObj(void);

extern Tcl_Obj * Tcl_NewStringObj(const char *bytes, int length);

extern void Tcl_SetBooleanObj(Tcl_Obj *objPtr, int boolValue);

extern unsigned char * Tcl_SetByteArrayLength(Tcl_Obj *objPtr, int length);

extern void Tcl_SetByteArrayObj(Tcl_Obj *objPtr,
    const unsigned char *bytes, int length);

extern void Tcl_SetDoubleObj(Tcl_Obj *objPtr, double doubleValue);

extern void Tcl_SetIntObj(Tcl_Obj *objPtr, int intValue);

extern void Tcl_SetListObj(Tcl_Obj *objPtr, int objc,
    Tcl_Obj *const objv[]);

extern void Tcl_SetLongObj(Tcl_Obj *objPtr, long longValue);

extern void Tcl_SetObjLength(Tcl_Obj *objPtr, int length);

extern void Tcl_SetStringObj(Tcl_Obj *objPtr, const char *bytes,
    int length);

extern void Tcl_AddErrorInfo(Tcl_Interp *interp,
    const char *message);

extern void Tcl_AddObjErrorInfo(Tcl_Interp *interp,
    const char *message, int length);

extern void Tcl_AllowExceptions(Tcl_Interp *interp);

extern void Tcl_AppendElement(Tcl_Interp *interp,
    const char *element);

extern void Tcl_AppendResult(Tcl_Interp *interp, ...);

extern Tcl_AsyncHandler Tcl_AsyncCreate(Tcl_AsyncProc *proc,
    ClientData clientData);

extern void Tcl_AsyncDelete(Tcl_AsyncHandler async);

extern int Tcl_AsyncInvoke(Tcl_Interp *interp, int code);

extern void Tcl_AsyncMark(Tcl_AsyncHandler async);

extern int Tcl_AsyncReady(void);

extern void Tcl_BackgroundError(Tcl_Interp *interp);

extern char Tcl_Backslash(const char *src, int *readPtr);

extern int Tcl_BadChannelOption(Tcl_Interp *interp,
    const char *optionName,
    const char *optionList);

extern void Tcl_CallWhenDeleted(Tcl_Interp *interp,
    Tcl_InterpDeleteProc *proc,
    ClientData clientData);

extern void Tcl_CancelIdleCall(Tcl_IdleProc *idleProc,
    ClientData clientData);

extern int Tcl_Close(Tcl_Interp *interp, Tcl_Channel chan);

extern int Tcl_CommandComplete(const char *cmd);

extern char * Tcl_Concat(int argc, const char *const *argv);

extern int Tcl_ConvertElement(const char *src, char *dst,
    int flags);

extern int Tcl_ConvertCountedElement(const char *src,
    int length, char *dst, int flags);

extern int Tcl_CreateAlias(Tcl_Interp *slave,
    const char *slaveCmd, Tcl_Interp *target,
    const char *targetCmd, int argc,
    const char *const *argv);

extern int Tcl_CreateAliasObj(Tcl_Interp *slave,
    const char *slaveCmd, Tcl_Interp *target,
    const char *targetCmd, int objc,
    Tcl_Obj *const objv[]);

extern Tcl_Channel Tcl_CreateChannel(const Tcl_ChannelType *typePtr,
    const char *chanName,
    ClientData instanceData, int mask);

extern void Tcl_CreateChannelHandler(Tcl_Channel chan, int mask,
    Tcl_ChannelProc *proc, ClientData clientData);

extern void Tcl_CreateCloseHandler(Tcl_Channel chan,
    Tcl_CloseProc *proc, ClientData clientData);

extern Tcl_Command Tcl_CreateCommand(Tcl_Interp *interp,
    const char *cmdName, Tcl_CmdProc *proc,
    ClientData clientData,
    Tcl_CmdDeleteProc *deleteProc);

extern void Tcl_CreateEventSource(Tcl_EventSetupProc *setupProc,
    Tcl_EventCheckProc *checkProc,
    ClientData clientData);

extern void Tcl_CreateExitHandler(Tcl_ExitProc *proc,
    ClientData clientData);

extern Tcl_Interp * Tcl_CreateInterp(void);

extern void Tcl_CreateMathFunc(Tcl_Interp *interp,
    const char *name, int numArgs,
    Tcl_ValueType *argTypes, Tcl_MathProc *proc,
    ClientData clientData);

extern Tcl_Command Tcl_CreateObjCommand(Tcl_Interp *interp,
    const char *cmdName, Tcl_ObjCmdProc *proc,
    ClientData clientData,
    Tcl_CmdDeleteProc *deleteProc);

extern Tcl_Interp * Tcl_CreateSlave(Tcl_Interp *interp,
    const char *slaveName, int isSafe);

extern Tcl_TimerToken Tcl_CreateTimerHandler(int milliseconds,
    Tcl_TimerProc *proc, ClientData clientData);

extern Tcl_Trace Tcl_CreateTrace(Tcl_Interp *interp, int level,
    Tcl_CmdTraceProc *proc,
    ClientData clientData);

extern void Tcl_DeleteAssocData(Tcl_Interp *interp,
    const char *name);

extern void Tcl_DeleteChannelHandler(Tcl_Channel chan,
    Tcl_ChannelProc *proc, ClientData clientData);

extern void Tcl_DeleteCloseHandler(Tcl_Channel chan,
    Tcl_CloseProc *proc, ClientData clientData);

extern int Tcl_DeleteCommand(Tcl_Interp *interp,
    const char *cmdName);

extern int Tcl_DeleteCommandFromToken(Tcl_Interp *interp,
    Tcl_Command command);

extern void Tcl_DeleteEvents(Tcl_EventDeleteProc *proc,
    ClientData clientData);

extern void Tcl_DeleteEventSource(Tcl_EventSetupProc *setupProc,
    Tcl_EventCheckProc *checkProc,
    ClientData clientData);

extern void Tcl_DeleteExitHandler(Tcl_ExitProc *proc,
    ClientData clientData);

extern void Tcl_DeleteHashEntry(Tcl_HashEntry *entryPtr);

extern void Tcl_DeleteHashTable(Tcl_HashTable *tablePtr);

extern void Tcl_DeleteInterp(Tcl_Interp *interp);

extern void Tcl_DetachPids(int numPids, Tcl_Pid *pidPtr);

extern void Tcl_DeleteTimerHandler(Tcl_TimerToken token);

extern void Tcl_DeleteTrace(Tcl_Interp *interp, Tcl_Trace trace);

extern void Tcl_DontCallWhenDeleted(Tcl_Interp *interp,
    Tcl_InterpDeleteProc *proc,
    ClientData clientData);

extern int Tcl_DoOneEvent(int flags);

extern void Tcl_DoWhenIdle(Tcl_IdleProc *proc,
    ClientData clientData);

extern char * Tcl_DStringAppend(Tcl_DString *dsPtr,
    const char *bytes, int length);

extern char * Tcl_DStringAppendElement(Tcl_DString *dsPtr,
    const char *element);

extern void Tcl_DStringEndSublist(Tcl_DString *dsPtr);

extern void Tcl_DStringFree(Tcl_DString *dsPtr);

extern void Tcl_DStringGetResult(Tcl_Interp *interp,
    Tcl_DString *dsPtr);

extern void Tcl_DStringInit(Tcl_DString *dsPtr);

extern void Tcl_DStringResult(Tcl_Interp *interp,
    Tcl_DString *dsPtr);

extern void Tcl_DStringSetLength(Tcl_DString *dsPtr, int length);

extern void Tcl_DStringStartSublist(Tcl_DString *dsPtr);

extern int Tcl_Eof(Tcl_Channel chan);

extern const char * Tcl_ErrnoId(void);

extern const char * Tcl_ErrnoMsg(int err);

extern int Tcl_Eval(Tcl_Interp *interp, const char *script);

extern int Tcl_EvalFile(Tcl_Interp *interp,
    const char *fileName);

extern int Tcl_EvalObj(Tcl_Interp *interp, Tcl_Obj *objPtr);

extern void Tcl_EventuallyFree(ClientData clientData,
    Tcl_FreeProc *freeProc);

extern __attribute__ ((noreturn)) void Tcl_Exit(int status);

extern int Tcl_ExposeCommand(Tcl_Interp *interp,
    const char *hiddenCmdToken,
    const char *cmdName);

extern int Tcl_ExprBoolean(Tcl_Interp *interp, const char *expr,
    int *ptr);

extern int Tcl_ExprBooleanObj(Tcl_Interp *interp,
    Tcl_Obj *objPtr, int *ptr);

extern int Tcl_ExprDouble(Tcl_Interp *interp, const char *expr,
    double *ptr);

extern int Tcl_ExprDoubleObj(Tcl_Interp *interp,
    Tcl_Obj *objPtr, double *ptr);

extern int Tcl_ExprLong(Tcl_Interp *interp, const char *expr,
    long *ptr);

extern int Tcl_ExprLongObj(Tcl_Interp *interp, Tcl_Obj *objPtr,
    long *ptr);

extern int Tcl_ExprObj(Tcl_Interp *interp, Tcl_Obj *objPtr,
    Tcl_Obj **resultPtrPtr);

extern int Tcl_ExprString(Tcl_Interp *interp, const char *expr);

extern void Tcl_Finalize(void);

extern void Tcl_FindExecutable(const char *argv0);

extern Tcl_HashEntry * Tcl_FirstHashEntry(Tcl_HashTable *tablePtr,
    Tcl_HashSearch *searchPtr);

extern int Tcl_Flush(Tcl_Channel chan);

extern void Tcl_FreeResult(Tcl_Interp *interp);

extern int Tcl_GetAlias(Tcl_Interp *interp,
    const char *slaveCmd,
    Tcl_Interp **targetInterpPtr,
    const char **targetCmdPtr, int *argcPtr,
    const char ***argvPtr);

extern int Tcl_GetAliasObj(Tcl_Interp *interp,
    const char *slaveCmd,
    Tcl_Interp **targetInterpPtr,
    const char **targetCmdPtr, int *objcPtr,
    Tcl_Obj ***objv);

extern ClientData Tcl_GetAssocData(Tcl_Interp *interp,
    const char *name,
    Tcl_InterpDeleteProc **procPtr);

extern Tcl_Channel Tcl_GetChannel(Tcl_Interp *interp,
    const char *chanName, int *modePtr);

extern int Tcl_GetChannelBufferSize(Tcl_Channel chan);

extern int Tcl_GetChannelHandle(Tcl_Channel chan, int direction,
    ClientData *handlePtr);

extern ClientData Tcl_GetChannelInstanceData(Tcl_Channel chan);

extern int Tcl_GetChannelMode(Tcl_Channel chan);

extern const char * Tcl_GetChannelName(Tcl_Channel chan);

extern int Tcl_GetChannelOption(Tcl_Interp *interp,
    Tcl_Channel chan, const char *optionName,
    Tcl_DString *dsPtr);

extern const Tcl_ChannelType * Tcl_GetChannelType(Tcl_Channel chan);

extern int Tcl_GetCommandInfo(Tcl_Interp *interp,
    const char *cmdName, Tcl_CmdInfo *infoPtr);

extern const char * Tcl_GetCommandName(Tcl_Interp *interp,
    Tcl_Command command);

extern int Tcl_GetErrno(void);

extern const char * Tcl_GetHostName(void);

extern int Tcl_GetInterpPath(Tcl_Interp *askInterp,
    Tcl_Interp *slaveInterp);

extern Tcl_Interp * Tcl_GetMaster(Tcl_Interp *interp);

extern const char * Tcl_GetNameOfExecutable(void);

extern Tcl_Obj * Tcl_GetObjResult(Tcl_Interp *interp);


extern int Tcl_GetOpenFile(Tcl_Interp *interp,
    const char *chanID, int forWriting,
    int checkUsage, ClientData *filePtr);
# 527 "/usr/include/tcl8.6/tclDecls.h"
extern Tcl_PathType Tcl_GetPathType(const char *path);

extern int Tcl_Gets(Tcl_Channel chan, Tcl_DString *dsPtr);

extern int Tcl_GetsObj(Tcl_Channel chan, Tcl_Obj *objPtr);

extern int Tcl_GetServiceMode(void);

extern Tcl_Interp * Tcl_GetSlave(Tcl_Interp *interp,
    const char *slaveName);

extern Tcl_Channel Tcl_GetStdChannel(int type);

extern const char * Tcl_GetStringResult(Tcl_Interp *interp);

extern const char * Tcl_GetVar(Tcl_Interp *interp,
    const char *varName, int flags);

extern const char * Tcl_GetVar2(Tcl_Interp *interp,
    const char *part1, const char *part2,
    int flags);

extern int Tcl_GlobalEval(Tcl_Interp *interp,
    const char *command);

extern int Tcl_GlobalEvalObj(Tcl_Interp *interp,
    Tcl_Obj *objPtr);

extern int Tcl_HideCommand(Tcl_Interp *interp,
    const char *cmdName,
    const char *hiddenCmdToken);

extern int Tcl_Init(Tcl_Interp *interp);

extern void Tcl_InitHashTable(Tcl_HashTable *tablePtr,
    int keyType);

extern int Tcl_InputBlocked(Tcl_Channel chan);

extern int Tcl_InputBuffered(Tcl_Channel chan);

extern int Tcl_InterpDeleted(Tcl_Interp *interp);

extern int Tcl_IsSafe(Tcl_Interp *interp);

extern char * Tcl_JoinPath(int argc, const char *const *argv,
    Tcl_DString *resultPtr);

extern int Tcl_LinkVar(Tcl_Interp *interp, const char *varName,
    char *addr, int type);


extern Tcl_Channel Tcl_MakeFileChannel(ClientData handle, int mode);

extern int Tcl_MakeSafe(Tcl_Interp *interp);

extern Tcl_Channel Tcl_MakeTcpClientChannel(ClientData tcpSocket);

extern char * Tcl_Merge(int argc, const char *const *argv);

extern Tcl_HashEntry * Tcl_NextHashEntry(Tcl_HashSearch *searchPtr);

extern void Tcl_NotifyChannel(Tcl_Channel channel, int mask);

extern Tcl_Obj * Tcl_ObjGetVar2(Tcl_Interp *interp, Tcl_Obj *part1Ptr,
    Tcl_Obj *part2Ptr, int flags);

extern Tcl_Obj * Tcl_ObjSetVar2(Tcl_Interp *interp, Tcl_Obj *part1Ptr,
    Tcl_Obj *part2Ptr, Tcl_Obj *newValuePtr,
    int flags);

extern Tcl_Channel Tcl_OpenCommandChannel(Tcl_Interp *interp, int argc,
    const char **argv, int flags);

extern Tcl_Channel Tcl_OpenFileChannel(Tcl_Interp *interp,
    const char *fileName, const char *modeString,
    int permissions);

extern Tcl_Channel Tcl_OpenTcpClient(Tcl_Interp *interp, int port,
    const char *address, const char *myaddr,
    int myport, int async);

extern Tcl_Channel Tcl_OpenTcpServer(Tcl_Interp *interp, int port,
    const char *host,
    Tcl_TcpAcceptProc *acceptProc,
    ClientData callbackData);

extern void Tcl_Preserve(ClientData data);

extern void Tcl_PrintDouble(Tcl_Interp *interp, double value,
    char *dst);

extern int Tcl_PutEnv(const char *assignment);

extern const char * Tcl_PosixError(Tcl_Interp *interp);

extern void Tcl_QueueEvent(Tcl_Event *evPtr,
    Tcl_QueuePosition position);

extern int Tcl_Read(Tcl_Channel chan, char *bufPtr, int toRead);

extern void Tcl_ReapDetachedProcs(void);

extern int Tcl_RecordAndEval(Tcl_Interp *interp,
    const char *cmd, int flags);

extern int Tcl_RecordAndEvalObj(Tcl_Interp *interp,
    Tcl_Obj *cmdPtr, int flags);

extern void Tcl_RegisterChannel(Tcl_Interp *interp,
    Tcl_Channel chan);

extern void Tcl_RegisterObjType(const Tcl_ObjType *typePtr);

extern Tcl_RegExp Tcl_RegExpCompile(Tcl_Interp *interp,
    const char *pattern);

extern int Tcl_RegExpExec(Tcl_Interp *interp, Tcl_RegExp regexp,
    const char *text, const char *start);

extern int Tcl_RegExpMatch(Tcl_Interp *interp, const char *text,
    const char *pattern);

extern void Tcl_RegExpRange(Tcl_RegExp regexp, int index,
    const char **startPtr,
    const char **endPtr);

extern void Tcl_Release(ClientData clientData);

extern void Tcl_ResetResult(Tcl_Interp *interp);

extern int Tcl_ScanElement(const char *src, int *flagPtr);

extern int Tcl_ScanCountedElement(const char *src, int length,
    int *flagPtr);

extern int Tcl_SeekOld(Tcl_Channel chan, int offset, int mode);

extern int Tcl_ServiceAll(void);

extern int Tcl_ServiceEvent(int flags);

extern void Tcl_SetAssocData(Tcl_Interp *interp,
    const char *name, Tcl_InterpDeleteProc *proc,
    ClientData clientData);

extern void Tcl_SetChannelBufferSize(Tcl_Channel chan, int sz);

extern int Tcl_SetChannelOption(Tcl_Interp *interp,
    Tcl_Channel chan, const char *optionName,
    const char *newValue);

extern int Tcl_SetCommandInfo(Tcl_Interp *interp,
    const char *cmdName,
    const Tcl_CmdInfo *infoPtr);

extern void Tcl_SetErrno(int err);

extern void Tcl_SetErrorCode(Tcl_Interp *interp, ...);

extern void Tcl_SetMaxBlockTime(const Tcl_Time *timePtr);

extern void Tcl_SetPanicProc(
    Tcl_PanicProc *panicProc);

extern int Tcl_SetRecursionLimit(Tcl_Interp *interp, int depth);

extern void Tcl_SetResult(Tcl_Interp *interp, char *result,
    Tcl_FreeProc *freeProc);

extern int Tcl_SetServiceMode(int mode);

extern void Tcl_SetObjErrorCode(Tcl_Interp *interp,
    Tcl_Obj *errorObjPtr);

extern void Tcl_SetObjResult(Tcl_Interp *interp,
    Tcl_Obj *resultObjPtr);

extern void Tcl_SetStdChannel(Tcl_Channel channel, int type);

extern const char * Tcl_SetVar(Tcl_Interp *interp,
    const char *varName, const char *newValue,
    int flags);

extern const char * Tcl_SetVar2(Tcl_Interp *interp,
    const char *part1, const char *part2,
    const char *newValue, int flags);

extern const char * Tcl_SignalId(int sig);

extern const char * Tcl_SignalMsg(int sig);

extern void Tcl_SourceRCFile(Tcl_Interp *interp);

extern int Tcl_SplitList(Tcl_Interp *interp,
    const char *listStr, int *argcPtr,
    const char ***argvPtr);

extern void Tcl_SplitPath(const char *path, int *argcPtr,
    const char ***argvPtr);

extern void Tcl_StaticPackage(Tcl_Interp *interp,
    const char *pkgName,
    Tcl_PackageInitProc *initProc,
    Tcl_PackageInitProc *safeInitProc);

extern int Tcl_StringMatch(const char *str, const char *pattern);

extern int Tcl_TellOld(Tcl_Channel chan);

extern int Tcl_TraceVar(Tcl_Interp *interp, const char *varName,
    int flags, Tcl_VarTraceProc *proc,
    ClientData clientData);

extern int Tcl_TraceVar2(Tcl_Interp *interp, const char *part1,
    const char *part2, int flags,
    Tcl_VarTraceProc *proc,
    ClientData clientData);

extern char * Tcl_TranslateFileName(Tcl_Interp *interp,
    const char *name, Tcl_DString *bufferPtr);

extern int Tcl_Ungets(Tcl_Channel chan, const char *str,
    int len, int atHead);

extern void Tcl_UnlinkVar(Tcl_Interp *interp,
    const char *varName);

extern int Tcl_UnregisterChannel(Tcl_Interp *interp,
    Tcl_Channel chan);

extern int Tcl_UnsetVar(Tcl_Interp *interp, const char *varName,
    int flags);

extern int Tcl_UnsetVar2(Tcl_Interp *interp, const char *part1,
    const char *part2, int flags);

extern void Tcl_UntraceVar(Tcl_Interp *interp,
    const char *varName, int flags,
    Tcl_VarTraceProc *proc,
    ClientData clientData);

extern void Tcl_UntraceVar2(Tcl_Interp *interp,
    const char *part1, const char *part2,
    int flags, Tcl_VarTraceProc *proc,
    ClientData clientData);

extern void Tcl_UpdateLinkedVar(Tcl_Interp *interp,
    const char *varName);

extern int Tcl_UpVar(Tcl_Interp *interp, const char *frameName,
    const char *varName, const char *localName,
    int flags);

extern int Tcl_UpVar2(Tcl_Interp *interp, const char *frameName,
    const char *part1, const char *part2,
    const char *localName, int flags);

extern int Tcl_VarEval(Tcl_Interp *interp, ...);

extern ClientData Tcl_VarTraceInfo(Tcl_Interp *interp,
    const char *varName, int flags,
    Tcl_VarTraceProc *procPtr,
    ClientData prevClientData);

extern ClientData Tcl_VarTraceInfo2(Tcl_Interp *interp,
    const char *part1, const char *part2,
    int flags, Tcl_VarTraceProc *procPtr,
    ClientData prevClientData);

extern int Tcl_Write(Tcl_Channel chan, const char *s, int slen);

extern void Tcl_WrongNumArgs(Tcl_Interp *interp, int objc,
    Tcl_Obj *const objv[], const char *message);

extern int Tcl_DumpActiveMemory(const char *fileName);

extern void Tcl_ValidateAllMemory(const char *file, int line);

extern void Tcl_AppendResultVA(Tcl_Interp *interp,
    va_list argList);

extern void Tcl_AppendStringsToObjVA(Tcl_Obj *objPtr,
    va_list argList);

extern char * Tcl_HashStats(Tcl_HashTable *tablePtr);

extern const char * Tcl_ParseVar(Tcl_Interp *interp,
    const char *start, const char **termPtr);

extern const char * Tcl_PkgPresent(Tcl_Interp *interp,
    const char *name, const char *version,
    int exact);

extern const char * Tcl_PkgPresentEx(Tcl_Interp *interp,
    const char *name, const char *version,
    int exact, void *clientDataPtr);

extern int Tcl_PkgProvide(Tcl_Interp *interp, const char *name,
    const char *version);

extern const char * Tcl_PkgRequire(Tcl_Interp *interp,
    const char *name, const char *version,
    int exact);

extern void Tcl_SetErrorCodeVA(Tcl_Interp *interp,
    va_list argList);

extern int Tcl_VarEvalVA(Tcl_Interp *interp, va_list argList);

extern Tcl_Pid Tcl_WaitPid(Tcl_Pid pid, int *statPtr, int options);

extern __attribute__ ((noreturn)) void Tcl_PanicVA(const char *format, va_list argList);

extern void Tcl_GetVersion(int *major, int *minor,
    int *patchLevel, int *type);

extern void Tcl_InitMemory(Tcl_Interp *interp);

extern Tcl_Channel Tcl_StackChannel(Tcl_Interp *interp,
    const Tcl_ChannelType *typePtr,
    ClientData instanceData, int mask,
    Tcl_Channel prevChan);

extern int Tcl_UnstackChannel(Tcl_Interp *interp,
    Tcl_Channel chan);

extern Tcl_Channel Tcl_GetStackedChannel(Tcl_Channel chan);

extern void Tcl_SetMainLoop(Tcl_MainLoopProc *proc);


extern void Tcl_AppendObjToObj(Tcl_Obj *objPtr,
    Tcl_Obj *appendObjPtr);

extern Tcl_Encoding Tcl_CreateEncoding(const Tcl_EncodingType *typePtr);

extern void Tcl_CreateThreadExitHandler(Tcl_ExitProc *proc,
    ClientData clientData);

extern void Tcl_DeleteThreadExitHandler(Tcl_ExitProc *proc,
    ClientData clientData);

extern void Tcl_DiscardResult(Tcl_SavedResult *statePtr);

extern int Tcl_EvalEx(Tcl_Interp *interp, const char *script,
    int numBytes, int flags);

extern int Tcl_EvalObjv(Tcl_Interp *interp, int objc,
    Tcl_Obj *const objv[], int flags);

extern int Tcl_EvalObjEx(Tcl_Interp *interp, Tcl_Obj *objPtr,
    int flags);

extern void Tcl_ExitThread(int status);

extern int Tcl_ExternalToUtf(Tcl_Interp *interp,
    Tcl_Encoding encoding, const char *src,
    int srcLen, int flags,
    Tcl_EncodingState *statePtr, char *dst,
    int dstLen, int *srcReadPtr,
    int *dstWrotePtr, int *dstCharsPtr);

extern char * Tcl_ExternalToUtfDString(Tcl_Encoding encoding,
    const char *src, int srcLen,
    Tcl_DString *dsPtr);

extern void Tcl_FinalizeThread(void);

extern void Tcl_FinalizeNotifier(ClientData clientData);

extern void Tcl_FreeEncoding(Tcl_Encoding encoding);

extern Tcl_ThreadId Tcl_GetCurrentThread(void);

extern Tcl_Encoding Tcl_GetEncoding(Tcl_Interp *interp, const char *name);

extern const char * Tcl_GetEncodingName(Tcl_Encoding encoding);

extern void Tcl_GetEncodingNames(Tcl_Interp *interp);

extern int Tcl_GetIndexFromObjStruct(Tcl_Interp *interp,
    Tcl_Obj *objPtr, const void *tablePtr,
    int offset, const char *msg, int flags,
    int *indexPtr);

extern void * Tcl_GetThreadData(Tcl_ThreadDataKey *keyPtr,
    int size);

extern Tcl_Obj * Tcl_GetVar2Ex(Tcl_Interp *interp, const char *part1,
    const char *part2, int flags);

extern ClientData Tcl_InitNotifier(void);

extern void Tcl_MutexLock(Tcl_Mutex *mutexPtr);

extern void Tcl_MutexUnlock(Tcl_Mutex *mutexPtr);

extern void Tcl_ConditionNotify(Tcl_Condition *condPtr);

extern void Tcl_ConditionWait(Tcl_Condition *condPtr,
    Tcl_Mutex *mutexPtr, const Tcl_Time *timePtr);

extern int Tcl_NumUtfChars(const char *src, int length);

extern int Tcl_ReadChars(Tcl_Channel channel, Tcl_Obj *objPtr,
    int charsToRead, int appendFlag);

extern void Tcl_RestoreResult(Tcl_Interp *interp,
    Tcl_SavedResult *statePtr);

extern void Tcl_SaveResult(Tcl_Interp *interp,
    Tcl_SavedResult *statePtr);

extern int Tcl_SetSystemEncoding(Tcl_Interp *interp,
    const char *name);

extern Tcl_Obj * Tcl_SetVar2Ex(Tcl_Interp *interp, const char *part1,
    const char *part2, Tcl_Obj *newValuePtr,
    int flags);

extern void Tcl_ThreadAlert(Tcl_ThreadId threadId);

extern void Tcl_ThreadQueueEvent(Tcl_ThreadId threadId,
    Tcl_Event *evPtr, Tcl_QueuePosition position);

extern Tcl_UniChar Tcl_UniCharAtIndex(const char *src, int index);

extern Tcl_UniChar Tcl_UniCharToLower(int ch);

extern Tcl_UniChar Tcl_UniCharToTitle(int ch);

extern Tcl_UniChar Tcl_UniCharToUpper(int ch);

extern int Tcl_UniCharToUtf(int ch, char *buf);

extern const char * Tcl_UtfAtIndex(const char *src, int index);

extern int Tcl_UtfCharComplete(const char *src, int length);

extern int Tcl_UtfBackslash(const char *src, int *readPtr,
    char *dst);

extern const char * Tcl_UtfFindFirst(const char *src, int ch);

extern const char * Tcl_UtfFindLast(const char *src, int ch);

extern const char * Tcl_UtfNext(const char *src);

extern const char * Tcl_UtfPrev(const char *src, const char *start);

extern int Tcl_UtfToExternal(Tcl_Interp *interp,
    Tcl_Encoding encoding, const char *src,
    int srcLen, int flags,
    Tcl_EncodingState *statePtr, char *dst,
    int dstLen, int *srcReadPtr,
    int *dstWrotePtr, int *dstCharsPtr);

extern char * Tcl_UtfToExternalDString(Tcl_Encoding encoding,
    const char *src, int srcLen,
    Tcl_DString *dsPtr);

extern int Tcl_UtfToLower(char *src);

extern int Tcl_UtfToTitle(char *src);

extern int Tcl_UtfToUniChar(const char *src, Tcl_UniChar *chPtr);

extern int Tcl_UtfToUpper(char *src);

extern int Tcl_WriteChars(Tcl_Channel chan, const char *src,
    int srcLen);

extern int Tcl_WriteObj(Tcl_Channel chan, Tcl_Obj *objPtr);

extern char * Tcl_GetString(Tcl_Obj *objPtr);

extern const char * Tcl_GetDefaultEncodingDir(void);

extern void Tcl_SetDefaultEncodingDir(const char *path);

extern void Tcl_AlertNotifier(ClientData clientData);

extern void Tcl_ServiceModeHook(int mode);

extern int Tcl_UniCharIsAlnum(int ch);

extern int Tcl_UniCharIsAlpha(int ch);

extern int Tcl_UniCharIsDigit(int ch);

extern int Tcl_UniCharIsLower(int ch);

extern int Tcl_UniCharIsSpace(int ch);

extern int Tcl_UniCharIsUpper(int ch);

extern int Tcl_UniCharIsWordChar(int ch);

extern int Tcl_UniCharLen(const Tcl_UniChar *uniStr);

extern int Tcl_UniCharNcmp(const Tcl_UniChar *ucs,
    const Tcl_UniChar *uct,
    unsigned long numChars);

extern char * Tcl_UniCharToUtfDString(const Tcl_UniChar *uniStr,
    int uniLength, Tcl_DString *dsPtr);

extern Tcl_UniChar * Tcl_UtfToUniCharDString(const char *src, int length,
    Tcl_DString *dsPtr);

extern Tcl_RegExp Tcl_GetRegExpFromObj(Tcl_Interp *interp,
    Tcl_Obj *patObj, int flags);

extern Tcl_Obj * Tcl_EvalTokens(Tcl_Interp *interp,
    Tcl_Token *tokenPtr, int count);

extern void Tcl_FreeParse(Tcl_Parse *parsePtr);

extern void Tcl_LogCommandInfo(Tcl_Interp *interp,
    const char *script, const char *command,
    int length);

extern int Tcl_ParseBraces(Tcl_Interp *interp,
    const char *start, int numBytes,
    Tcl_Parse *parsePtr, int append,
    const char **termPtr);

extern int Tcl_ParseCommand(Tcl_Interp *interp,
    const char *start, int numBytes, int nested,
    Tcl_Parse *parsePtr);

extern int Tcl_ParseExpr(Tcl_Interp *interp, const char *start,
    int numBytes, Tcl_Parse *parsePtr);

extern int Tcl_ParseQuotedString(Tcl_Interp *interp,
    const char *start, int numBytes,
    Tcl_Parse *parsePtr, int append,
    const char **termPtr);

extern int Tcl_ParseVarName(Tcl_Interp *interp,
    const char *start, int numBytes,
    Tcl_Parse *parsePtr, int append);

extern char * Tcl_GetCwd(Tcl_Interp *interp, Tcl_DString *cwdPtr);

extern int Tcl_Chdir(const char *dirName);

extern int Tcl_Access(const char *path, int mode);

extern int Tcl_Stat(const char *path, struct stat *bufPtr);

extern int Tcl_UtfNcmp(const char *s1, const char *s2,
    unsigned long n);

extern int Tcl_UtfNcasecmp(const char *s1, const char *s2,
    unsigned long n);

extern int Tcl_StringCaseMatch(const char *str,
    const char *pattern, int nocase);

extern int Tcl_UniCharIsControl(int ch);

extern int Tcl_UniCharIsGraph(int ch);

extern int Tcl_UniCharIsPrint(int ch);

extern int Tcl_UniCharIsPunct(int ch);

extern int Tcl_RegExpExecObj(Tcl_Interp *interp,
    Tcl_RegExp regexp, Tcl_Obj *textObj,
    int offset, int nmatches, int flags);

extern void Tcl_RegExpGetInfo(Tcl_RegExp regexp,
    Tcl_RegExpInfo *infoPtr);

extern Tcl_Obj * Tcl_NewUnicodeObj(const Tcl_UniChar *unicode,
    int numChars);

extern void Tcl_SetUnicodeObj(Tcl_Obj *objPtr,
    const Tcl_UniChar *unicode, int numChars);

extern int Tcl_GetCharLength(Tcl_Obj *objPtr);

extern Tcl_UniChar Tcl_GetUniChar(Tcl_Obj *objPtr, int index);

extern Tcl_UniChar * Tcl_GetUnicode(Tcl_Obj *objPtr);

extern Tcl_Obj * Tcl_GetRange(Tcl_Obj *objPtr, int first, int last);

extern void Tcl_AppendUnicodeToObj(Tcl_Obj *objPtr,
    const Tcl_UniChar *unicode, int length);

extern int Tcl_RegExpMatchObj(Tcl_Interp *interp,
    Tcl_Obj *textObj, Tcl_Obj *patternObj);

extern void Tcl_SetNotifier(Tcl_NotifierProcs *notifierProcPtr);

extern Tcl_Mutex * Tcl_GetAllocMutex(void);

extern int Tcl_GetChannelNames(Tcl_Interp *interp);

extern int Tcl_GetChannelNamesEx(Tcl_Interp *interp,
    const char *pattern);

extern int Tcl_ProcObjCmd(ClientData clientData,
    Tcl_Interp *interp, int objc,
    Tcl_Obj *const objv[]);

extern void Tcl_ConditionFinalize(Tcl_Condition *condPtr);

extern void Tcl_MutexFinalize(Tcl_Mutex *mutex);

extern int Tcl_CreateThread(Tcl_ThreadId *idPtr,
    Tcl_ThreadCreateProc *proc,
    ClientData clientData, int stackSize,
    int flags);

extern int Tcl_ReadRaw(Tcl_Channel chan, char *dst,
    int bytesToRead);

extern int Tcl_WriteRaw(Tcl_Channel chan, const char *src,
    int srcLen);

extern Tcl_Channel Tcl_GetTopChannel(Tcl_Channel chan);

extern int Tcl_ChannelBuffered(Tcl_Channel chan);

extern const char * Tcl_ChannelName(
    const Tcl_ChannelType *chanTypePtr);

extern Tcl_ChannelTypeVersion Tcl_ChannelVersion(
    const Tcl_ChannelType *chanTypePtr);

extern Tcl_DriverBlockModeProc * Tcl_ChannelBlockModeProc(
    const Tcl_ChannelType *chanTypePtr);

extern Tcl_DriverCloseProc * Tcl_ChannelCloseProc(
    const Tcl_ChannelType *chanTypePtr);

extern Tcl_DriverClose2Proc * Tcl_ChannelClose2Proc(
    const Tcl_ChannelType *chanTypePtr);

extern Tcl_DriverInputProc * Tcl_ChannelInputProc(
    const Tcl_ChannelType *chanTypePtr);

extern Tcl_DriverOutputProc * Tcl_ChannelOutputProc(
    const Tcl_ChannelType *chanTypePtr);

extern Tcl_DriverSeekProc * Tcl_ChannelSeekProc(
    const Tcl_ChannelType *chanTypePtr);

extern Tcl_DriverSetOptionProc * Tcl_ChannelSetOptionProc(
    const Tcl_ChannelType *chanTypePtr);

extern Tcl_DriverGetOptionProc * Tcl_ChannelGetOptionProc(
    const Tcl_ChannelType *chanTypePtr);

extern Tcl_DriverWatchProc * Tcl_ChannelWatchProc(
    const Tcl_ChannelType *chanTypePtr);

extern Tcl_DriverGetHandleProc * Tcl_ChannelGetHandleProc(
    const Tcl_ChannelType *chanTypePtr);

extern Tcl_DriverFlushProc * Tcl_ChannelFlushProc(
    const Tcl_ChannelType *chanTypePtr);

extern Tcl_DriverHandlerProc * Tcl_ChannelHandlerProc(
    const Tcl_ChannelType *chanTypePtr);

extern int Tcl_JoinThread(Tcl_ThreadId threadId, int *result);

extern int Tcl_IsChannelShared(Tcl_Channel channel);

extern int Tcl_IsChannelRegistered(Tcl_Interp *interp,
    Tcl_Channel channel);

extern void Tcl_CutChannel(Tcl_Channel channel);

extern void Tcl_SpliceChannel(Tcl_Channel channel);

extern void Tcl_ClearChannelHandlers(Tcl_Channel channel);

extern int Tcl_IsChannelExisting(const char *channelName);

extern int Tcl_UniCharNcasecmp(const Tcl_UniChar *ucs,
    const Tcl_UniChar *uct,
    unsigned long numChars);

extern int Tcl_UniCharCaseMatch(const Tcl_UniChar *uniStr,
    const Tcl_UniChar *uniPattern, int nocase);

extern Tcl_HashEntry * Tcl_FindHashEntry(Tcl_HashTable *tablePtr,
    const void *key);

extern Tcl_HashEntry * Tcl_CreateHashEntry(Tcl_HashTable *tablePtr,
    const void *key, int *newPtr);

extern void Tcl_InitCustomHashTable(Tcl_HashTable *tablePtr,
    int keyType, const Tcl_HashKeyType *typePtr);

extern void Tcl_InitObjHashTable(Tcl_HashTable *tablePtr);

extern ClientData Tcl_CommandTraceInfo(Tcl_Interp *interp,
    const char *varName, int flags,
    Tcl_CommandTraceProc *procPtr,
    ClientData prevClientData);

extern int Tcl_TraceCommand(Tcl_Interp *interp,
    const char *varName, int flags,
    Tcl_CommandTraceProc *proc,
    ClientData clientData);

extern void Tcl_UntraceCommand(Tcl_Interp *interp,
    const char *varName, int flags,
    Tcl_CommandTraceProc *proc,
    ClientData clientData);

extern char * Tcl_AttemptAlloc(unsigned int size);

extern char * Tcl_AttemptDbCkalloc(unsigned int size,
    const char *file, int line);

extern char * Tcl_AttemptRealloc(char *ptr, unsigned int size);

extern char * Tcl_AttemptDbCkrealloc(char *ptr, unsigned int size,
    const char *file, int line);

extern int Tcl_AttemptSetObjLength(Tcl_Obj *objPtr, int length);

extern Tcl_ThreadId Tcl_GetChannelThread(Tcl_Channel channel);

extern Tcl_UniChar * Tcl_GetUnicodeFromObj(Tcl_Obj *objPtr,
    int *lengthPtr);

extern int Tcl_GetMathFuncInfo(Tcl_Interp *interp,
    const char *name, int *numArgsPtr,
    Tcl_ValueType **argTypesPtr,
    Tcl_MathProc **procPtr,
    ClientData *clientDataPtr);

extern Tcl_Obj * Tcl_ListMathFuncs(Tcl_Interp *interp,
    const char *pattern);

extern Tcl_Obj * Tcl_SubstObj(Tcl_Interp *interp, Tcl_Obj *objPtr,
    int flags);

extern int Tcl_DetachChannel(Tcl_Interp *interp,
    Tcl_Channel channel);

extern int Tcl_IsStandardChannel(Tcl_Channel channel);

extern int Tcl_FSCopyFile(Tcl_Obj *srcPathPtr,
    Tcl_Obj *destPathPtr);

extern int Tcl_FSCopyDirectory(Tcl_Obj *srcPathPtr,
    Tcl_Obj *destPathPtr, Tcl_Obj **errorPtr);

extern int Tcl_FSCreateDirectory(Tcl_Obj *pathPtr);

extern int Tcl_FSDeleteFile(Tcl_Obj *pathPtr);

extern int Tcl_FSLoadFile(Tcl_Interp *interp, Tcl_Obj *pathPtr,
    const char *sym1, const char *sym2,
    Tcl_PackageInitProc **proc1Ptr,
    Tcl_PackageInitProc **proc2Ptr,
    Tcl_LoadHandle *handlePtr,
    Tcl_FSUnloadFileProc **unloadProcPtr);

extern int Tcl_FSMatchInDirectory(Tcl_Interp *interp,
    Tcl_Obj *result, Tcl_Obj *pathPtr,
    const char *pattern, Tcl_GlobTypeData *types);

extern Tcl_Obj * Tcl_FSLink(Tcl_Obj *pathPtr, Tcl_Obj *toPtr,
    int linkAction);

extern int Tcl_FSRemoveDirectory(Tcl_Obj *pathPtr,
    int recursive, Tcl_Obj **errorPtr);

extern int Tcl_FSRenameFile(Tcl_Obj *srcPathPtr,
    Tcl_Obj *destPathPtr);

extern int Tcl_FSLstat(Tcl_Obj *pathPtr, Tcl_StatBuf *buf);

extern int Tcl_FSUtime(Tcl_Obj *pathPtr, struct utimbuf *tval);

extern int Tcl_FSFileAttrsGet(Tcl_Interp *interp, int index,
    Tcl_Obj *pathPtr, Tcl_Obj **objPtrRef);

extern int Tcl_FSFileAttrsSet(Tcl_Interp *interp, int index,
    Tcl_Obj *pathPtr, Tcl_Obj *objPtr);

extern const char *const * Tcl_FSFileAttrStrings(Tcl_Obj *pathPtr,
    Tcl_Obj **objPtrRef);

extern int Tcl_FSStat(Tcl_Obj *pathPtr, Tcl_StatBuf *buf);

extern int Tcl_FSAccess(Tcl_Obj *pathPtr, int mode);

extern Tcl_Channel Tcl_FSOpenFileChannel(Tcl_Interp *interp,
    Tcl_Obj *pathPtr, const char *modeString,
    int permissions);

extern Tcl_Obj * Tcl_FSGetCwd(Tcl_Interp *interp);

extern int Tcl_FSChdir(Tcl_Obj *pathPtr);

extern int Tcl_FSConvertToPathType(Tcl_Interp *interp,
    Tcl_Obj *pathPtr);

extern Tcl_Obj * Tcl_FSJoinPath(Tcl_Obj *listObj, int elements);

extern Tcl_Obj * Tcl_FSSplitPath(Tcl_Obj *pathPtr, int *lenPtr);

extern int Tcl_FSEqualPaths(Tcl_Obj *firstPtr,
    Tcl_Obj *secondPtr);

extern Tcl_Obj * Tcl_FSGetNormalizedPath(Tcl_Interp *interp,
    Tcl_Obj *pathPtr);

extern Tcl_Obj * Tcl_FSJoinToPath(Tcl_Obj *pathPtr, int objc,
    Tcl_Obj *const objv[]);

extern ClientData Tcl_FSGetInternalRep(Tcl_Obj *pathPtr,
    const Tcl_Filesystem *fsPtr);

extern Tcl_Obj * Tcl_FSGetTranslatedPath(Tcl_Interp *interp,
    Tcl_Obj *pathPtr);

extern int Tcl_FSEvalFile(Tcl_Interp *interp, Tcl_Obj *fileName);

extern Tcl_Obj * Tcl_FSNewNativePath(
    const Tcl_Filesystem *fromFilesystem,
    ClientData clientData);

extern const void * Tcl_FSGetNativePath(Tcl_Obj *pathPtr);

extern Tcl_Obj * Tcl_FSFileSystemInfo(Tcl_Obj *pathPtr);

extern Tcl_Obj * Tcl_FSPathSeparator(Tcl_Obj *pathPtr);

extern Tcl_Obj * Tcl_FSListVolumes(void);

extern int Tcl_FSRegister(ClientData clientData,
    const Tcl_Filesystem *fsPtr);

extern int Tcl_FSUnregister(const Tcl_Filesystem *fsPtr);

extern ClientData Tcl_FSData(const Tcl_Filesystem *fsPtr);

extern const char * Tcl_FSGetTranslatedStringPath(Tcl_Interp *interp,
    Tcl_Obj *pathPtr);

extern const Tcl_Filesystem * Tcl_FSGetFileSystemForPath(Tcl_Obj *pathPtr);

extern Tcl_PathType Tcl_FSGetPathType(Tcl_Obj *pathPtr);

extern int Tcl_OutputBuffered(Tcl_Channel chan);

extern void Tcl_FSMountsChanged(const Tcl_Filesystem *fsPtr);

extern int Tcl_EvalTokensStandard(Tcl_Interp *interp,
    Tcl_Token *tokenPtr, int count);

extern void Tcl_GetTime(Tcl_Time *timeBuf);

extern Tcl_Trace Tcl_CreateObjTrace(Tcl_Interp *interp, int level,
    int flags, Tcl_CmdObjTraceProc *objProc,
    ClientData clientData,
    Tcl_CmdObjTraceDeleteProc *delProc);

extern int Tcl_GetCommandInfoFromToken(Tcl_Command token,
    Tcl_CmdInfo *infoPtr);

extern int Tcl_SetCommandInfoFromToken(Tcl_Command token,
    const Tcl_CmdInfo *infoPtr);

extern Tcl_Obj * Tcl_DbNewWideIntObj(Tcl_WideInt wideValue,
    const char *file, int line);

extern int Tcl_GetWideIntFromObj(Tcl_Interp *interp,
    Tcl_Obj *objPtr, Tcl_WideInt *widePtr);

extern Tcl_Obj * Tcl_NewWideIntObj(Tcl_WideInt wideValue);

extern void Tcl_SetWideIntObj(Tcl_Obj *objPtr,
    Tcl_WideInt wideValue);

extern Tcl_StatBuf * Tcl_AllocStatBuf(void);

extern Tcl_WideInt Tcl_Seek(Tcl_Channel chan, Tcl_WideInt offset,
    int mode);

extern Tcl_WideInt Tcl_Tell(Tcl_Channel chan);

extern Tcl_DriverWideSeekProc * Tcl_ChannelWideSeekProc(
    const Tcl_ChannelType *chanTypePtr);

extern int Tcl_DictObjPut(Tcl_Interp *interp, Tcl_Obj *dictPtr,
    Tcl_Obj *keyPtr, Tcl_Obj *valuePtr);

extern int Tcl_DictObjGet(Tcl_Interp *interp, Tcl_Obj *dictPtr,
    Tcl_Obj *keyPtr, Tcl_Obj **valuePtrPtr);

extern int Tcl_DictObjRemove(Tcl_Interp *interp,
    Tcl_Obj *dictPtr, Tcl_Obj *keyPtr);

extern int Tcl_DictObjSize(Tcl_Interp *interp, Tcl_Obj *dictPtr,
    int *sizePtr);

extern int Tcl_DictObjFirst(Tcl_Interp *interp,
    Tcl_Obj *dictPtr, Tcl_DictSearch *searchPtr,
    Tcl_Obj **keyPtrPtr, Tcl_Obj **valuePtrPtr,
    int *donePtr);

extern void Tcl_DictObjNext(Tcl_DictSearch *searchPtr,
    Tcl_Obj **keyPtrPtr, Tcl_Obj **valuePtrPtr,
    int *donePtr);

extern void Tcl_DictObjDone(Tcl_DictSearch *searchPtr);

extern int Tcl_DictObjPutKeyList(Tcl_Interp *interp,
    Tcl_Obj *dictPtr, int keyc,
    Tcl_Obj *const *keyv, Tcl_Obj *valuePtr);

extern int Tcl_DictObjRemoveKeyList(Tcl_Interp *interp,
    Tcl_Obj *dictPtr, int keyc,
    Tcl_Obj *const *keyv);

extern Tcl_Obj * Tcl_NewDictObj(void);

extern Tcl_Obj * Tcl_DbNewDictObj(const char *file, int line);

extern void Tcl_RegisterConfig(Tcl_Interp *interp,
    const char *pkgName,
    const Tcl_Config *configuration,
    const char *valEncoding);

extern Tcl_Namespace * Tcl_CreateNamespace(Tcl_Interp *interp,
    const char *name, ClientData clientData,
    Tcl_NamespaceDeleteProc *deleteProc);

extern void Tcl_DeleteNamespace(Tcl_Namespace *nsPtr);

extern int Tcl_AppendExportList(Tcl_Interp *interp,
    Tcl_Namespace *nsPtr, Tcl_Obj *objPtr);

extern int Tcl_Export(Tcl_Interp *interp, Tcl_Namespace *nsPtr,
    const char *pattern, int resetListFirst);

extern int Tcl_Import(Tcl_Interp *interp, Tcl_Namespace *nsPtr,
    const char *pattern, int allowOverwrite);

extern int Tcl_ForgetImport(Tcl_Interp *interp,
    Tcl_Namespace *nsPtr, const char *pattern);

extern Tcl_Namespace * Tcl_GetCurrentNamespace(Tcl_Interp *interp);

extern Tcl_Namespace * Tcl_GetGlobalNamespace(Tcl_Interp *interp);

extern Tcl_Namespace * Tcl_FindNamespace(Tcl_Interp *interp,
    const char *name,
    Tcl_Namespace *contextNsPtr, int flags);

extern Tcl_Command Tcl_FindCommand(Tcl_Interp *interp, const char *name,
    Tcl_Namespace *contextNsPtr, int flags);

extern Tcl_Command Tcl_GetCommandFromObj(Tcl_Interp *interp,
    Tcl_Obj *objPtr);

extern void Tcl_GetCommandFullName(Tcl_Interp *interp,
    Tcl_Command command, Tcl_Obj *objPtr);

extern int Tcl_FSEvalFileEx(Tcl_Interp *interp,
    Tcl_Obj *fileName, const char *encodingName);

extern Tcl_ExitProc * Tcl_SetExitProc( Tcl_ExitProc *proc);

extern void Tcl_LimitAddHandler(Tcl_Interp *interp, int type,
    Tcl_LimitHandlerProc *handlerProc,
    ClientData clientData,
    Tcl_LimitHandlerDeleteProc *deleteProc);

extern void Tcl_LimitRemoveHandler(Tcl_Interp *interp, int type,
    Tcl_LimitHandlerProc *handlerProc,
    ClientData clientData);

extern int Tcl_LimitReady(Tcl_Interp *interp);

extern int Tcl_LimitCheck(Tcl_Interp *interp);

extern int Tcl_LimitExceeded(Tcl_Interp *interp);

extern void Tcl_LimitSetCommands(Tcl_Interp *interp,
    int commandLimit);

extern void Tcl_LimitSetTime(Tcl_Interp *interp,
    Tcl_Time *timeLimitPtr);

extern void Tcl_LimitSetGranularity(Tcl_Interp *interp, int type,
    int granularity);

extern int Tcl_LimitTypeEnabled(Tcl_Interp *interp, int type);

extern int Tcl_LimitTypeExceeded(Tcl_Interp *interp, int type);

extern void Tcl_LimitTypeSet(Tcl_Interp *interp, int type);

extern void Tcl_LimitTypeReset(Tcl_Interp *interp, int type);

extern int Tcl_LimitGetCommands(Tcl_Interp *interp);

extern void Tcl_LimitGetTime(Tcl_Interp *interp,
    Tcl_Time *timeLimitPtr);

extern int Tcl_LimitGetGranularity(Tcl_Interp *interp, int type);

extern Tcl_InterpState Tcl_SaveInterpState(Tcl_Interp *interp, int status);

extern int Tcl_RestoreInterpState(Tcl_Interp *interp,
    Tcl_InterpState state);

extern void Tcl_DiscardInterpState(Tcl_InterpState state);

extern int Tcl_SetReturnOptions(Tcl_Interp *interp,
    Tcl_Obj *options);

extern Tcl_Obj * Tcl_GetReturnOptions(Tcl_Interp *interp, int result);

extern int Tcl_IsEnsemble(Tcl_Command token);

extern Tcl_Command Tcl_CreateEnsemble(Tcl_Interp *interp,
    const char *name,
    Tcl_Namespace *namespacePtr, int flags);

extern Tcl_Command Tcl_FindEnsemble(Tcl_Interp *interp,
    Tcl_Obj *cmdNameObj, int flags);

extern int Tcl_SetEnsembleSubcommandList(Tcl_Interp *interp,
    Tcl_Command token, Tcl_Obj *subcmdList);

extern int Tcl_SetEnsembleMappingDict(Tcl_Interp *interp,
    Tcl_Command token, Tcl_Obj *mapDict);

extern int Tcl_SetEnsembleUnknownHandler(Tcl_Interp *interp,
    Tcl_Command token, Tcl_Obj *unknownList);

extern int Tcl_SetEnsembleFlags(Tcl_Interp *interp,
    Tcl_Command token, int flags);

extern int Tcl_GetEnsembleSubcommandList(Tcl_Interp *interp,
    Tcl_Command token, Tcl_Obj **subcmdListPtr);

extern int Tcl_GetEnsembleMappingDict(Tcl_Interp *interp,
    Tcl_Command token, Tcl_Obj **mapDictPtr);

extern int Tcl_GetEnsembleUnknownHandler(Tcl_Interp *interp,
    Tcl_Command token, Tcl_Obj **unknownListPtr);

extern int Tcl_GetEnsembleFlags(Tcl_Interp *interp,
    Tcl_Command token, int *flagsPtr);

extern int Tcl_GetEnsembleNamespace(Tcl_Interp *interp,
    Tcl_Command token,
    Tcl_Namespace **namespacePtrPtr);

extern void Tcl_SetTimeProc(Tcl_GetTimeProc *getProc,
    Tcl_ScaleTimeProc *scaleProc,
    ClientData clientData);

extern void Tcl_QueryTimeProc(Tcl_GetTimeProc **getProc,
    Tcl_ScaleTimeProc **scaleProc,
    ClientData *clientData);

extern Tcl_DriverThreadActionProc * Tcl_ChannelThreadActionProc(
    const Tcl_ChannelType *chanTypePtr);

extern Tcl_Obj * Tcl_NewBignumObj(mp_int *value);

extern Tcl_Obj * Tcl_DbNewBignumObj(mp_int *value, const char *file,
    int line);

extern void Tcl_SetBignumObj(Tcl_Obj *obj, mp_int *value);

extern int Tcl_GetBignumFromObj(Tcl_Interp *interp,
    Tcl_Obj *obj, mp_int *value);

extern int Tcl_TakeBignumFromObj(Tcl_Interp *interp,
    Tcl_Obj *obj, mp_int *value);

extern int Tcl_TruncateChannel(Tcl_Channel chan,
    Tcl_WideInt length);

extern Tcl_DriverTruncateProc * Tcl_ChannelTruncateProc(
    const Tcl_ChannelType *chanTypePtr);

extern void Tcl_SetChannelErrorInterp(Tcl_Interp *interp,
    Tcl_Obj *msg);

extern void Tcl_GetChannelErrorInterp(Tcl_Interp *interp,
    Tcl_Obj **msg);

extern void Tcl_SetChannelError(Tcl_Channel chan, Tcl_Obj *msg);

extern void Tcl_GetChannelError(Tcl_Channel chan, Tcl_Obj **msg);

extern int Tcl_InitBignumFromDouble(Tcl_Interp *interp,
    double initval, mp_int *toInit);

extern Tcl_Obj * Tcl_GetNamespaceUnknownHandler(Tcl_Interp *interp,
    Tcl_Namespace *nsPtr);

extern int Tcl_SetNamespaceUnknownHandler(Tcl_Interp *interp,
    Tcl_Namespace *nsPtr, Tcl_Obj *handlerPtr);

extern int Tcl_GetEncodingFromObj(Tcl_Interp *interp,
    Tcl_Obj *objPtr, Tcl_Encoding *encodingPtr);

extern Tcl_Obj * Tcl_GetEncodingSearchPath(void);

extern int Tcl_SetEncodingSearchPath(Tcl_Obj *searchPath);

extern const char * Tcl_GetEncodingNameFromEnvironment(
    Tcl_DString *bufPtr);

extern int Tcl_PkgRequireProc(Tcl_Interp *interp,
    const char *name, int objc,
    Tcl_Obj *const objv[], void *clientDataPtr);

extern void Tcl_AppendObjToErrorInfo(Tcl_Interp *interp,
    Tcl_Obj *objPtr);

extern void Tcl_AppendLimitedToObj(Tcl_Obj *objPtr,
    const char *bytes, int length, int limit,
    const char *ellipsis);

extern Tcl_Obj * Tcl_Format(Tcl_Interp *interp, const char *format,
    int objc, Tcl_Obj *const objv[]);

extern int Tcl_AppendFormatToObj(Tcl_Interp *interp,
    Tcl_Obj *objPtr, const char *format,
    int objc, Tcl_Obj *const objv[]);

extern Tcl_Obj * Tcl_ObjPrintf(const char *format, ...) __attribute__ ((__format__ (__printf__, 1, 2)));

extern void Tcl_AppendPrintfToObj(Tcl_Obj *objPtr,
    const char *format, ...) __attribute__ ((__format__ (__printf__, 2, 3)));

extern int Tcl_CancelEval(Tcl_Interp *interp,
    Tcl_Obj *resultObjPtr, ClientData clientData,
    int flags);

extern int Tcl_Canceled(Tcl_Interp *interp, int flags);

extern int Tcl_CreatePipe(Tcl_Interp *interp,
    Tcl_Channel *rchan, Tcl_Channel *wchan,
    int flags);

extern Tcl_Command Tcl_NRCreateCommand(Tcl_Interp *interp,
    const char *cmdName, Tcl_ObjCmdProc *proc,
    Tcl_ObjCmdProc *nreProc,
    ClientData clientData,
    Tcl_CmdDeleteProc *deleteProc);

extern int Tcl_NREvalObj(Tcl_Interp *interp, Tcl_Obj *objPtr,
    int flags);

extern int Tcl_NREvalObjv(Tcl_Interp *interp, int objc,
    Tcl_Obj *const objv[], int flags);

extern int Tcl_NRCmdSwap(Tcl_Interp *interp, Tcl_Command cmd,
    int objc, Tcl_Obj *const objv[], int flags);

extern void Tcl_NRAddCallback(Tcl_Interp *interp,
    Tcl_NRPostProc *postProcPtr,
    ClientData data0, ClientData data1,
    ClientData data2, ClientData data3);

extern int Tcl_NRCallObjProc(Tcl_Interp *interp,
    Tcl_ObjCmdProc *objProc,
    ClientData clientData, int objc,
    Tcl_Obj *const objv[]);

extern unsigned Tcl_GetFSDeviceFromStat(const Tcl_StatBuf *statPtr);

extern unsigned Tcl_GetFSInodeFromStat(const Tcl_StatBuf *statPtr);

extern unsigned Tcl_GetModeFromStat(const Tcl_StatBuf *statPtr);

extern int Tcl_GetLinkCountFromStat(const Tcl_StatBuf *statPtr);

extern int Tcl_GetUserIdFromStat(const Tcl_StatBuf *statPtr);

extern int Tcl_GetGroupIdFromStat(const Tcl_StatBuf *statPtr);

extern int Tcl_GetDeviceTypeFromStat(const Tcl_StatBuf *statPtr);

extern Tcl_WideInt Tcl_GetAccessTimeFromStat(const Tcl_StatBuf *statPtr);

extern Tcl_WideInt Tcl_GetModificationTimeFromStat(
    const Tcl_StatBuf *statPtr);

extern Tcl_WideInt Tcl_GetChangeTimeFromStat(const Tcl_StatBuf *statPtr);

extern Tcl_WideUInt Tcl_GetSizeFromStat(const Tcl_StatBuf *statPtr);

extern Tcl_WideUInt Tcl_GetBlocksFromStat(const Tcl_StatBuf *statPtr);

extern unsigned Tcl_GetBlockSizeFromStat(const Tcl_StatBuf *statPtr);

extern int Tcl_SetEnsembleParameterList(Tcl_Interp *interp,
    Tcl_Command token, Tcl_Obj *paramList);

extern int Tcl_GetEnsembleParameterList(Tcl_Interp *interp,
    Tcl_Command token, Tcl_Obj **paramListPtr);

extern int Tcl_ParseArgsObjv(Tcl_Interp *interp,
    const Tcl_ArgvInfo *argTable, int *objcPtr,
    Tcl_Obj *const *objv, Tcl_Obj ***remObjv);

extern int Tcl_GetErrorLine(Tcl_Interp *interp);

extern void Tcl_SetErrorLine(Tcl_Interp *interp, int lineNum);

extern void Tcl_TransferResult(Tcl_Interp *sourceInterp,
    int result, Tcl_Interp *targetInterp);

extern int Tcl_InterpActive(Tcl_Interp *interp);

extern void Tcl_BackgroundException(Tcl_Interp *interp, int code);

extern int Tcl_ZlibDeflate(Tcl_Interp *interp, int format,
    Tcl_Obj *data, int level,
    Tcl_Obj *gzipHeaderDictObj);

extern int Tcl_ZlibInflate(Tcl_Interp *interp, int format,
    Tcl_Obj *data, int buffersize,
    Tcl_Obj *gzipHeaderDictObj);

extern unsigned int Tcl_ZlibCRC32(unsigned int crc,
    const unsigned char *buf, int len);

extern unsigned int Tcl_ZlibAdler32(unsigned int adler,
    const unsigned char *buf, int len);

extern int Tcl_ZlibStreamInit(Tcl_Interp *interp, int mode,
    int format, int level, Tcl_Obj *dictObj,
    Tcl_ZlibStream *zshandle);

extern Tcl_Obj * Tcl_ZlibStreamGetCommandName(Tcl_ZlibStream zshandle);

extern int Tcl_ZlibStreamEof(Tcl_ZlibStream zshandle);

extern int Tcl_ZlibStreamChecksum(Tcl_ZlibStream zshandle);

extern int Tcl_ZlibStreamPut(Tcl_ZlibStream zshandle,
    Tcl_Obj *data, int flush);

extern int Tcl_ZlibStreamGet(Tcl_ZlibStream zshandle,
    Tcl_Obj *data, int count);

extern int Tcl_ZlibStreamClose(Tcl_ZlibStream zshandle);

extern int Tcl_ZlibStreamReset(Tcl_ZlibStream zshandle);

extern void Tcl_SetStartupScript(Tcl_Obj *path,
    const char *encoding);

extern Tcl_Obj * Tcl_GetStartupScript(const char **encodingPtr);

extern int Tcl_CloseEx(Tcl_Interp *interp, Tcl_Channel chan,
    int flags);

extern int Tcl_NRExprObj(Tcl_Interp *interp, Tcl_Obj *objPtr,
    Tcl_Obj *resultPtr);

extern int Tcl_NRSubstObj(Tcl_Interp *interp, Tcl_Obj *objPtr,
    int flags);

extern int Tcl_LoadFile(Tcl_Interp *interp, Tcl_Obj *pathPtr,
    const char *const symv[], int flags,
    void *procPtrs, Tcl_LoadHandle *handlePtr);

extern void * Tcl_FindSymbol(Tcl_Interp *interp,
    Tcl_LoadHandle handle, const char *symbol);

extern int Tcl_FSUnloadFile(Tcl_Interp *interp,
    Tcl_LoadHandle handlePtr);

extern void Tcl_ZlibStreamSetCompressionDictionary(
    Tcl_ZlibStream zhandle,
    Tcl_Obj *compressionDictionaryObj);

typedef struct {
    const struct TclPlatStubs *tclPlatStubs;
    const struct TclIntStubs *tclIntStubs;
    const struct TclIntPlatStubs *tclIntPlatStubs;
} TclStubHooks;

typedef struct TclStubs {
    int magic;
    const TclStubHooks *hooks;

    int (*tcl_PkgProvideEx) (Tcl_Interp *interp, const char *name, const char *version, const void *clientData);
    const char * (*tcl_PkgRequireEx) (Tcl_Interp *interp, const char *name, const char *version, int exact, void *clientDataPtr);
    void (*tcl_Panic) (const char *format, ...) __attribute__ ((__format__ (__printf__, 1, 2)));
    char * (*tcl_Alloc) (unsigned int size);
    void (*tcl_Free) (char *ptr);
    char * (*tcl_Realloc) (char *ptr, unsigned int size);
    char * (*tcl_DbCkalloc) (unsigned int size, const char *file, int line);
    void (*tcl_DbCkfree) (char *ptr, const char *file, int line);
    char * (*tcl_DbCkrealloc) (char *ptr, unsigned int size, const char *file, int line);

    void (*tcl_CreateFileHandler) (int fd, int mask, Tcl_FileProc *proc, ClientData clientData);
# 1849 "/usr/include/tcl8.6/tclDecls.h"
    void (*tcl_DeleteFileHandler) (int fd);







    void (*tcl_SetTimer) (const Tcl_Time *timePtr);
    void (*tcl_Sleep) (int ms);
    int (*tcl_WaitForEvent) (const Tcl_Time *timePtr);
    int (*tcl_AppendAllObjTypes) (Tcl_Interp *interp, Tcl_Obj *objPtr);
    void (*tcl_AppendStringsToObj) (Tcl_Obj *objPtr, ...);
    void (*tcl_AppendToObj) (Tcl_Obj *objPtr, const char *bytes, int length);
    Tcl_Obj * (*tcl_ConcatObj) (int objc, Tcl_Obj *const objv[]);
    int (*tcl_ConvertToType) (Tcl_Interp *interp, Tcl_Obj *objPtr, const Tcl_ObjType *typePtr);
    void (*tcl_DbDecrRefCount) (Tcl_Obj *objPtr, const char *file, int line);
    void (*tcl_DbIncrRefCount) (Tcl_Obj *objPtr, const char *file, int line);
    int (*tcl_DbIsShared) (Tcl_Obj *objPtr, const char *file, int line);
    Tcl_Obj * (*tcl_DbNewBooleanObj) (int boolValue, const char *file, int line);
    Tcl_Obj * (*tcl_DbNewByteArrayObj) (const unsigned char *bytes, int length, const char *file, int line);
    Tcl_Obj * (*tcl_DbNewDoubleObj) (double doubleValue, const char *file, int line);
    Tcl_Obj * (*tcl_DbNewListObj) (int objc, Tcl_Obj *const *objv, const char *file, int line);
    Tcl_Obj * (*tcl_DbNewLongObj) (long longValue, const char *file, int line);
    Tcl_Obj * (*tcl_DbNewObj) (const char *file, int line);
    Tcl_Obj * (*tcl_DbNewStringObj) (const char *bytes, int length, const char *file, int line);
    Tcl_Obj * (*tcl_DuplicateObj) (Tcl_Obj *objPtr);
    void (*tclFreeObj) (Tcl_Obj *objPtr);
    int (*tcl_GetBoolean) (Tcl_Interp *interp, const char *src, int *boolPtr);
    int (*tcl_GetBooleanFromObj) (Tcl_Interp *interp, Tcl_Obj *objPtr, int *boolPtr);
    unsigned char * (*tcl_GetByteArrayFromObj) (Tcl_Obj *objPtr, int *lengthPtr);
    int (*tcl_GetDouble) (Tcl_Interp *interp, const char *src, double *doublePtr);
    int (*tcl_GetDoubleFromObj) (Tcl_Interp *interp, Tcl_Obj *objPtr, double *doublePtr);
    int (*tcl_GetIndexFromObj) (Tcl_Interp *interp, Tcl_Obj *objPtr, const char *const *tablePtr, const char *msg, int flags, int *indexPtr);
    int (*tcl_GetInt) (Tcl_Interp *interp, const char *src, int *intPtr);
    int (*tcl_GetIntFromObj) (Tcl_Interp *interp, Tcl_Obj *objPtr, int *intPtr);
    int (*tcl_GetLongFromObj) (Tcl_Interp *interp, Tcl_Obj *objPtr, long *longPtr);
    const Tcl_ObjType * (*tcl_GetObjType) (const char *typeName);
    char * (*tcl_GetStringFromObj) (Tcl_Obj *objPtr, int *lengthPtr);
    void (*tcl_InvalidateStringRep) (Tcl_Obj *objPtr);
    int (*tcl_ListObjAppendList) (Tcl_Interp *interp, Tcl_Obj *listPtr, Tcl_Obj *elemListPtr);
    int (*tcl_ListObjAppendElement) (Tcl_Interp *interp, Tcl_Obj *listPtr, Tcl_Obj *objPtr);
    int (*tcl_ListObjGetElements) (Tcl_Interp *interp, Tcl_Obj *listPtr, int *objcPtr, Tcl_Obj ***objvPtr);
    int (*tcl_ListObjIndex) (Tcl_Interp *interp, Tcl_Obj *listPtr, int index, Tcl_Obj **objPtrPtr);
    int (*tcl_ListObjLength) (Tcl_Interp *interp, Tcl_Obj *listPtr, int *lengthPtr);
    int (*tcl_ListObjReplace) (Tcl_Interp *interp, Tcl_Obj *listPtr, int first, int count, int objc, Tcl_Obj *const objv[]);
    Tcl_Obj * (*tcl_NewBooleanObj) (int boolValue);
    Tcl_Obj * (*tcl_NewByteArrayObj) (const unsigned char *bytes, int length);
    Tcl_Obj * (*tcl_NewDoubleObj) (double doubleValue);
    Tcl_Obj * (*tcl_NewIntObj) (int intValue);
    Tcl_Obj * (*tcl_NewListObj) (int objc, Tcl_Obj *const objv[]);
    Tcl_Obj * (*tcl_NewLongObj) (long longValue);
    Tcl_Obj * (*tcl_NewObj) (void);
    Tcl_Obj * (*tcl_NewStringObj) (const char *bytes, int length);
    void (*tcl_SetBooleanObj) (Tcl_Obj *objPtr, int boolValue);
    unsigned char * (*tcl_SetByteArrayLength) (Tcl_Obj *objPtr, int length);
    void (*tcl_SetByteArrayObj) (Tcl_Obj *objPtr, const unsigned char *bytes, int length);
    void (*tcl_SetDoubleObj) (Tcl_Obj *objPtr, double doubleValue);
    void (*tcl_SetIntObj) (Tcl_Obj *objPtr, int intValue);
    void (*tcl_SetListObj) (Tcl_Obj *objPtr, int objc, Tcl_Obj *const objv[]);
    void (*tcl_SetLongObj) (Tcl_Obj *objPtr, long longValue);
    void (*tcl_SetObjLength) (Tcl_Obj *objPtr, int length);
    void (*tcl_SetStringObj) (Tcl_Obj *objPtr, const char *bytes, int length);
    void (*tcl_AddErrorInfo) (Tcl_Interp *interp, const char *message);
    void (*tcl_AddObjErrorInfo) (Tcl_Interp *interp, const char *message, int length);
    void (*tcl_AllowExceptions) (Tcl_Interp *interp);
    void (*tcl_AppendElement) (Tcl_Interp *interp, const char *element);
    void (*tcl_AppendResult) (Tcl_Interp *interp, ...);
    Tcl_AsyncHandler (*tcl_AsyncCreate) (Tcl_AsyncProc *proc, ClientData clientData);
    void (*tcl_AsyncDelete) (Tcl_AsyncHandler async);
    int (*tcl_AsyncInvoke) (Tcl_Interp *interp, int code);
    void (*tcl_AsyncMark) (Tcl_AsyncHandler async);
    int (*tcl_AsyncReady) (void);
    void (*tcl_BackgroundError) (Tcl_Interp *interp);
    char (*tcl_Backslash) (const char *src, int *readPtr);
    int (*tcl_BadChannelOption) (Tcl_Interp *interp, const char *optionName, const char *optionList);
    void (*tcl_CallWhenDeleted) (Tcl_Interp *interp, Tcl_InterpDeleteProc *proc, ClientData clientData);
    void (*tcl_CancelIdleCall) (Tcl_IdleProc *idleProc, ClientData clientData);
    int (*tcl_Close) (Tcl_Interp *interp, Tcl_Channel chan);
    int (*tcl_CommandComplete) (const char *cmd);
    char * (*tcl_Concat) (int argc, const char *const *argv);
    int (*tcl_ConvertElement) (const char *src, char *dst, int flags);
    int (*tcl_ConvertCountedElement) (const char *src, int length, char *dst, int flags);
    int (*tcl_CreateAlias) (Tcl_Interp *slave, const char *slaveCmd, Tcl_Interp *target, const char *targetCmd, int argc, const char *const *argv);
    int (*tcl_CreateAliasObj) (Tcl_Interp *slave, const char *slaveCmd, Tcl_Interp *target, const char *targetCmd, int objc, Tcl_Obj *const objv[]);
    Tcl_Channel (*tcl_CreateChannel) (const Tcl_ChannelType *typePtr, const char *chanName, ClientData instanceData, int mask);
    void (*tcl_CreateChannelHandler) (Tcl_Channel chan, int mask, Tcl_ChannelProc *proc, ClientData clientData);
    void (*tcl_CreateCloseHandler) (Tcl_Channel chan, Tcl_CloseProc *proc, ClientData clientData);
    Tcl_Command (*tcl_CreateCommand) (Tcl_Interp *interp, const char *cmdName, Tcl_CmdProc *proc, ClientData clientData, Tcl_CmdDeleteProc *deleteProc);
    void (*tcl_CreateEventSource) (Tcl_EventSetupProc *setupProc, Tcl_EventCheckProc *checkProc, ClientData clientData);
    void (*tcl_CreateExitHandler) (Tcl_ExitProc *proc, ClientData clientData);
    Tcl_Interp * (*tcl_CreateInterp) (void);
    void (*tcl_CreateMathFunc) (Tcl_Interp *interp, const char *name, int numArgs, Tcl_ValueType *argTypes, Tcl_MathProc *proc, ClientData clientData);
    Tcl_Command (*tcl_CreateObjCommand) (Tcl_Interp *interp, const char *cmdName, Tcl_ObjCmdProc *proc, ClientData clientData, Tcl_CmdDeleteProc *deleteProc);
    Tcl_Interp * (*tcl_CreateSlave) (Tcl_Interp *interp, const char *slaveName, int isSafe);
    Tcl_TimerToken (*tcl_CreateTimerHandler) (int milliseconds, Tcl_TimerProc *proc, ClientData clientData);
    Tcl_Trace (*tcl_CreateTrace) (Tcl_Interp *interp, int level, Tcl_CmdTraceProc *proc, ClientData clientData);
    void (*tcl_DeleteAssocData) (Tcl_Interp *interp, const char *name);
    void (*tcl_DeleteChannelHandler) (Tcl_Channel chan, Tcl_ChannelProc *proc, ClientData clientData);
    void (*tcl_DeleteCloseHandler) (Tcl_Channel chan, Tcl_CloseProc *proc, ClientData clientData);
    int (*tcl_DeleteCommand) (Tcl_Interp *interp, const char *cmdName);
    int (*tcl_DeleteCommandFromToken) (Tcl_Interp *interp, Tcl_Command command);
    void (*tcl_DeleteEvents) (Tcl_EventDeleteProc *proc, ClientData clientData);
    void (*tcl_DeleteEventSource) (Tcl_EventSetupProc *setupProc, Tcl_EventCheckProc *checkProc, ClientData clientData);
    void (*tcl_DeleteExitHandler) (Tcl_ExitProc *proc, ClientData clientData);
    void (*tcl_DeleteHashEntry) (Tcl_HashEntry *entryPtr);
    void (*tcl_DeleteHashTable) (Tcl_HashTable *tablePtr);
    void (*tcl_DeleteInterp) (Tcl_Interp *interp);
    void (*tcl_DetachPids) (int numPids, Tcl_Pid *pidPtr);
    void (*tcl_DeleteTimerHandler) (Tcl_TimerToken token);
    void (*tcl_DeleteTrace) (Tcl_Interp *interp, Tcl_Trace trace);
    void (*tcl_DontCallWhenDeleted) (Tcl_Interp *interp, Tcl_InterpDeleteProc *proc, ClientData clientData);
    int (*tcl_DoOneEvent) (int flags);
    void (*tcl_DoWhenIdle) (Tcl_IdleProc *proc, ClientData clientData);
    char * (*tcl_DStringAppend) (Tcl_DString *dsPtr, const char *bytes, int length);
    char * (*tcl_DStringAppendElement) (Tcl_DString *dsPtr, const char *element);
    void (*tcl_DStringEndSublist) (Tcl_DString *dsPtr);
    void (*tcl_DStringFree) (Tcl_DString *dsPtr);
    void (*tcl_DStringGetResult) (Tcl_Interp *interp, Tcl_DString *dsPtr);
    void (*tcl_DStringInit) (Tcl_DString *dsPtr);
    void (*tcl_DStringResult) (Tcl_Interp *interp, Tcl_DString *dsPtr);
    void (*tcl_DStringSetLength) (Tcl_DString *dsPtr, int length);
    void (*tcl_DStringStartSublist) (Tcl_DString *dsPtr);
    int (*tcl_Eof) (Tcl_Channel chan);
    const char * (*tcl_ErrnoId) (void);
    const char * (*tcl_ErrnoMsg) (int err);
    int (*tcl_Eval) (Tcl_Interp *interp, const char *script);
    int (*tcl_EvalFile) (Tcl_Interp *interp, const char *fileName);
    int (*tcl_EvalObj) (Tcl_Interp *interp, Tcl_Obj *objPtr);
    void (*tcl_EventuallyFree) (ClientData clientData, Tcl_FreeProc *freeProc);
    void (*tcl_Exit) (int status);
    int (*tcl_ExposeCommand) (Tcl_Interp *interp, const char *hiddenCmdToken, const char *cmdName);
    int (*tcl_ExprBoolean) (Tcl_Interp *interp, const char *expr, int *ptr);
    int (*tcl_ExprBooleanObj) (Tcl_Interp *interp, Tcl_Obj *objPtr, int *ptr);
    int (*tcl_ExprDouble) (Tcl_Interp *interp, const char *expr, double *ptr);
    int (*tcl_ExprDoubleObj) (Tcl_Interp *interp, Tcl_Obj *objPtr, double *ptr);
    int (*tcl_ExprLong) (Tcl_Interp *interp, const char *expr, long *ptr);
    int (*tcl_ExprLongObj) (Tcl_Interp *interp, Tcl_Obj *objPtr, long *ptr);
    int (*tcl_ExprObj) (Tcl_Interp *interp, Tcl_Obj *objPtr, Tcl_Obj **resultPtrPtr);
    int (*tcl_ExprString) (Tcl_Interp *interp, const char *expr);
    void (*tcl_Finalize) (void);
    void (*tcl_FindExecutable) (const char *argv0);
    Tcl_HashEntry * (*tcl_FirstHashEntry) (Tcl_HashTable *tablePtr, Tcl_HashSearch *searchPtr);
    int (*tcl_Flush) (Tcl_Channel chan);
    void (*tcl_FreeResult) (Tcl_Interp *interp);
    int (*tcl_GetAlias) (Tcl_Interp *interp, const char *slaveCmd, Tcl_Interp **targetInterpPtr, const char **targetCmdPtr, int *argcPtr, const char ***argvPtr);
    int (*tcl_GetAliasObj) (Tcl_Interp *interp, const char *slaveCmd, Tcl_Interp **targetInterpPtr, const char **targetCmdPtr, int *objcPtr, Tcl_Obj ***objv);
    ClientData (*tcl_GetAssocData) (Tcl_Interp *interp, const char *name, Tcl_InterpDeleteProc **procPtr);
    Tcl_Channel (*tcl_GetChannel) (Tcl_Interp *interp, const char *chanName, int *modePtr);
    int (*tcl_GetChannelBufferSize) (Tcl_Channel chan);
    int (*tcl_GetChannelHandle) (Tcl_Channel chan, int direction, ClientData *handlePtr);
    ClientData (*tcl_GetChannelInstanceData) (Tcl_Channel chan);
    int (*tcl_GetChannelMode) (Tcl_Channel chan);
    const char * (*tcl_GetChannelName) (Tcl_Channel chan);
    int (*tcl_GetChannelOption) (Tcl_Interp *interp, Tcl_Channel chan, const char *optionName, Tcl_DString *dsPtr);
    const Tcl_ChannelType * (*tcl_GetChannelType) (Tcl_Channel chan);
    int (*tcl_GetCommandInfo) (Tcl_Interp *interp, const char *cmdName, Tcl_CmdInfo *infoPtr);
    const char * (*tcl_GetCommandName) (Tcl_Interp *interp, Tcl_Command command);
    int (*tcl_GetErrno) (void);
    const char * (*tcl_GetHostName) (void);
    int (*tcl_GetInterpPath) (Tcl_Interp *askInterp, Tcl_Interp *slaveInterp);
    Tcl_Interp * (*tcl_GetMaster) (Tcl_Interp *interp);
    const char * (*tcl_GetNameOfExecutable) (void);
    Tcl_Obj * (*tcl_GetObjResult) (Tcl_Interp *interp);

    int (*tcl_GetOpenFile) (Tcl_Interp *interp, const char *chanID, int forWriting, int checkUsage, ClientData *filePtr);







    Tcl_PathType (*tcl_GetPathType) (const char *path);
    int (*tcl_Gets) (Tcl_Channel chan, Tcl_DString *dsPtr);
    int (*tcl_GetsObj) (Tcl_Channel chan, Tcl_Obj *objPtr);
    int (*tcl_GetServiceMode) (void);
    Tcl_Interp * (*tcl_GetSlave) (Tcl_Interp *interp, const char *slaveName);
    Tcl_Channel (*tcl_GetStdChannel) (int type);
    const char * (*tcl_GetStringResult) (Tcl_Interp *interp);
    const char * (*tcl_GetVar) (Tcl_Interp *interp, const char *varName, int flags);
    const char * (*tcl_GetVar2) (Tcl_Interp *interp, const char *part1, const char *part2, int flags);
    int (*tcl_GlobalEval) (Tcl_Interp *interp, const char *command);
    int (*tcl_GlobalEvalObj) (Tcl_Interp *interp, Tcl_Obj *objPtr);
    int (*tcl_HideCommand) (Tcl_Interp *interp, const char *cmdName, const char *hiddenCmdToken);
    int (*tcl_Init) (Tcl_Interp *interp);
    void (*tcl_InitHashTable) (Tcl_HashTable *tablePtr, int keyType);
    int (*tcl_InputBlocked) (Tcl_Channel chan);
    int (*tcl_InputBuffered) (Tcl_Channel chan);
    int (*tcl_InterpDeleted) (Tcl_Interp *interp);
    int (*tcl_IsSafe) (Tcl_Interp *interp);
    char * (*tcl_JoinPath) (int argc, const char *const *argv, Tcl_DString *resultPtr);
    int (*tcl_LinkVar) (Tcl_Interp *interp, const char *varName, char *addr, int type);
    void (*reserved188)(void);
    Tcl_Channel (*tcl_MakeFileChannel) (ClientData handle, int mode);
    int (*tcl_MakeSafe) (Tcl_Interp *interp);
    Tcl_Channel (*tcl_MakeTcpClientChannel) (ClientData tcpSocket);
    char * (*tcl_Merge) (int argc, const char *const *argv);
    Tcl_HashEntry * (*tcl_NextHashEntry) (Tcl_HashSearch *searchPtr);
    void (*tcl_NotifyChannel) (Tcl_Channel channel, int mask);
    Tcl_Obj * (*tcl_ObjGetVar2) (Tcl_Interp *interp, Tcl_Obj *part1Ptr, Tcl_Obj *part2Ptr, int flags);
    Tcl_Obj * (*tcl_ObjSetVar2) (Tcl_Interp *interp, Tcl_Obj *part1Ptr, Tcl_Obj *part2Ptr, Tcl_Obj *newValuePtr, int flags);
    Tcl_Channel (*tcl_OpenCommandChannel) (Tcl_Interp *interp, int argc, const char **argv, int flags);
    Tcl_Channel (*tcl_OpenFileChannel) (Tcl_Interp *interp, const char *fileName, const char *modeString, int permissions);
    Tcl_Channel (*tcl_OpenTcpClient) (Tcl_Interp *interp, int port, const char *address, const char *myaddr, int myport, int async);
    Tcl_Channel (*tcl_OpenTcpServer) (Tcl_Interp *interp, int port, const char *host, Tcl_TcpAcceptProc *acceptProc, ClientData callbackData);
    void (*tcl_Preserve) (ClientData data);
    void (*tcl_PrintDouble) (Tcl_Interp *interp, double value, char *dst);
    int (*tcl_PutEnv) (const char *assignment);
    const char * (*tcl_PosixError) (Tcl_Interp *interp);
    void (*tcl_QueueEvent) (Tcl_Event *evPtr, Tcl_QueuePosition position);
    int (*tcl_Read) (Tcl_Channel chan, char *bufPtr, int toRead);
    void (*tcl_ReapDetachedProcs) (void);
    int (*tcl_RecordAndEval) (Tcl_Interp *interp, const char *cmd, int flags);
    int (*tcl_RecordAndEvalObj) (Tcl_Interp *interp, Tcl_Obj *cmdPtr, int flags);
    void (*tcl_RegisterChannel) (Tcl_Interp *interp, Tcl_Channel chan);
    void (*tcl_RegisterObjType) (const Tcl_ObjType *typePtr);
    Tcl_RegExp (*tcl_RegExpCompile) (Tcl_Interp *interp, const char *pattern);
    int (*tcl_RegExpExec) (Tcl_Interp *interp, Tcl_RegExp regexp, const char *text, const char *start);
    int (*tcl_RegExpMatch) (Tcl_Interp *interp, const char *text, const char *pattern);
    void (*tcl_RegExpRange) (Tcl_RegExp regexp, int index, const char **startPtr, const char **endPtr);
    void (*tcl_Release) (ClientData clientData);
    void (*tcl_ResetResult) (Tcl_Interp *interp);
    int (*tcl_ScanElement) (const char *src, int *flagPtr);
    int (*tcl_ScanCountedElement) (const char *src, int length, int *flagPtr);
    int (*tcl_SeekOld) (Tcl_Channel chan, int offset, int mode);
    int (*tcl_ServiceAll) (void);
    int (*tcl_ServiceEvent) (int flags);
    void (*tcl_SetAssocData) (Tcl_Interp *interp, const char *name, Tcl_InterpDeleteProc *proc, ClientData clientData);
    void (*tcl_SetChannelBufferSize) (Tcl_Channel chan, int sz);
    int (*tcl_SetChannelOption) (Tcl_Interp *interp, Tcl_Channel chan, const char *optionName, const char *newValue);
    int (*tcl_SetCommandInfo) (Tcl_Interp *interp, const char *cmdName, const Tcl_CmdInfo *infoPtr);
    void (*tcl_SetErrno) (int err);
    void (*tcl_SetErrorCode) (Tcl_Interp *interp, ...);
    void (*tcl_SetMaxBlockTime) (const Tcl_Time *timePtr);
    void (*tcl_SetPanicProc) ( Tcl_PanicProc *panicProc);
    int (*tcl_SetRecursionLimit) (Tcl_Interp *interp, int depth);
    void (*tcl_SetResult) (Tcl_Interp *interp, char *result, Tcl_FreeProc *freeProc);
    int (*tcl_SetServiceMode) (int mode);
    void (*tcl_SetObjErrorCode) (Tcl_Interp *interp, Tcl_Obj *errorObjPtr);
    void (*tcl_SetObjResult) (Tcl_Interp *interp, Tcl_Obj *resultObjPtr);
    void (*tcl_SetStdChannel) (Tcl_Channel channel, int type);
    const char * (*tcl_SetVar) (Tcl_Interp *interp, const char *varName, const char *newValue, int flags);
    const char * (*tcl_SetVar2) (Tcl_Interp *interp, const char *part1, const char *part2, const char *newValue, int flags);
    const char * (*tcl_SignalId) (int sig);
    const char * (*tcl_SignalMsg) (int sig);
    void (*tcl_SourceRCFile) (Tcl_Interp *interp);
    int (*tcl_SplitList) (Tcl_Interp *interp, const char *listStr, int *argcPtr, const char ***argvPtr);
    void (*tcl_SplitPath) (const char *path, int *argcPtr, const char ***argvPtr);
    void (*tcl_StaticPackage) (Tcl_Interp *interp, const char *pkgName, Tcl_PackageInitProc *initProc, Tcl_PackageInitProc *safeInitProc);
    int (*tcl_StringMatch) (const char *str, const char *pattern);
    int (*tcl_TellOld) (Tcl_Channel chan);
    int (*tcl_TraceVar) (Tcl_Interp *interp, const char *varName, int flags, Tcl_VarTraceProc *proc, ClientData clientData);
    int (*tcl_TraceVar2) (Tcl_Interp *interp, const char *part1, const char *part2, int flags, Tcl_VarTraceProc *proc, ClientData clientData);
    char * (*tcl_TranslateFileName) (Tcl_Interp *interp, const char *name, Tcl_DString *bufferPtr);
    int (*tcl_Ungets) (Tcl_Channel chan, const char *str, int len, int atHead);
    void (*tcl_UnlinkVar) (Tcl_Interp *interp, const char *varName);
    int (*tcl_UnregisterChannel) (Tcl_Interp *interp, Tcl_Channel chan);
    int (*tcl_UnsetVar) (Tcl_Interp *interp, const char *varName, int flags);
    int (*tcl_UnsetVar2) (Tcl_Interp *interp, const char *part1, const char *part2, int flags);
    void (*tcl_UntraceVar) (Tcl_Interp *interp, const char *varName, int flags, Tcl_VarTraceProc *proc, ClientData clientData);
    void (*tcl_UntraceVar2) (Tcl_Interp *interp, const char *part1, const char *part2, int flags, Tcl_VarTraceProc *proc, ClientData clientData);
    void (*tcl_UpdateLinkedVar) (Tcl_Interp *interp, const char *varName);
    int (*tcl_UpVar) (Tcl_Interp *interp, const char *frameName, const char *varName, const char *localName, int flags);
    int (*tcl_UpVar2) (Tcl_Interp *interp, const char *frameName, const char *part1, const char *part2, const char *localName, int flags);
    int (*tcl_VarEval) (Tcl_Interp *interp, ...);
    ClientData (*tcl_VarTraceInfo) (Tcl_Interp *interp, const char *varName, int flags, Tcl_VarTraceProc *procPtr, ClientData prevClientData);
    ClientData (*tcl_VarTraceInfo2) (Tcl_Interp *interp, const char *part1, const char *part2, int flags, Tcl_VarTraceProc *procPtr, ClientData prevClientData);
    int (*tcl_Write) (Tcl_Channel chan, const char *s, int slen);
    void (*tcl_WrongNumArgs) (Tcl_Interp *interp, int objc, Tcl_Obj *const objv[], const char *message);
    int (*tcl_DumpActiveMemory) (const char *fileName);
    void (*tcl_ValidateAllMemory) (const char *file, int line);
    void (*tcl_AppendResultVA) (Tcl_Interp *interp, va_list argList);
    void (*tcl_AppendStringsToObjVA) (Tcl_Obj *objPtr, va_list argList);
    char * (*tcl_HashStats) (Tcl_HashTable *tablePtr);
    const char * (*tcl_ParseVar) (Tcl_Interp *interp, const char *start, const char **termPtr);
    const char * (*tcl_PkgPresent) (Tcl_Interp *interp, const char *name, const char *version, int exact);
    const char * (*tcl_PkgPresentEx) (Tcl_Interp *interp, const char *name, const char *version, int exact, void *clientDataPtr);
    int (*tcl_PkgProvide) (Tcl_Interp *interp, const char *name, const char *version);
    const char * (*tcl_PkgRequire) (Tcl_Interp *interp, const char *name, const char *version, int exact);
    void (*tcl_SetErrorCodeVA) (Tcl_Interp *interp, va_list argList);
    int (*tcl_VarEvalVA) (Tcl_Interp *interp, va_list argList);
    Tcl_Pid (*tcl_WaitPid) (Tcl_Pid pid, int *statPtr, int options);
    void (*tcl_PanicVA) (const char *format, va_list argList);
    void (*tcl_GetVersion) (int *major, int *minor, int *patchLevel, int *type);
    void (*tcl_InitMemory) (Tcl_Interp *interp);
    Tcl_Channel (*tcl_StackChannel) (Tcl_Interp *interp, const Tcl_ChannelType *typePtr, ClientData instanceData, int mask, Tcl_Channel prevChan);
    int (*tcl_UnstackChannel) (Tcl_Interp *interp, Tcl_Channel chan);
    Tcl_Channel (*tcl_GetStackedChannel) (Tcl_Channel chan);
    void (*tcl_SetMainLoop) (Tcl_MainLoopProc *proc);
    void (*reserved285)(void);
    void (*tcl_AppendObjToObj) (Tcl_Obj *objPtr, Tcl_Obj *appendObjPtr);
    Tcl_Encoding (*tcl_CreateEncoding) (const Tcl_EncodingType *typePtr);
    void (*tcl_CreateThreadExitHandler) (Tcl_ExitProc *proc, ClientData clientData);
    void (*tcl_DeleteThreadExitHandler) (Tcl_ExitProc *proc, ClientData clientData);
    void (*tcl_DiscardResult) (Tcl_SavedResult *statePtr);
    int (*tcl_EvalEx) (Tcl_Interp *interp, const char *script, int numBytes, int flags);
    int (*tcl_EvalObjv) (Tcl_Interp *interp, int objc, Tcl_Obj *const objv[], int flags);
    int (*tcl_EvalObjEx) (Tcl_Interp *interp, Tcl_Obj *objPtr, int flags);
    void (*tcl_ExitThread) (int status);
    int (*tcl_ExternalToUtf) (Tcl_Interp *interp, Tcl_Encoding encoding, const char *src, int srcLen, int flags, Tcl_EncodingState *statePtr, char *dst, int dstLen, int *srcReadPtr, int *dstWrotePtr, int *dstCharsPtr);
    char * (*tcl_ExternalToUtfDString) (Tcl_Encoding encoding, const char *src, int srcLen, Tcl_DString *dsPtr);
    void (*tcl_FinalizeThread) (void);
    void (*tcl_FinalizeNotifier) (ClientData clientData);
    void (*tcl_FreeEncoding) (Tcl_Encoding encoding);
    Tcl_ThreadId (*tcl_GetCurrentThread) (void);
    Tcl_Encoding (*tcl_GetEncoding) (Tcl_Interp *interp, const char *name);
    const char * (*tcl_GetEncodingName) (Tcl_Encoding encoding);
    void (*tcl_GetEncodingNames) (Tcl_Interp *interp);
    int (*tcl_GetIndexFromObjStruct) (Tcl_Interp *interp, Tcl_Obj *objPtr, const void *tablePtr, int offset, const char *msg, int flags, int *indexPtr);
    void * (*tcl_GetThreadData) (Tcl_ThreadDataKey *keyPtr, int size);
    Tcl_Obj * (*tcl_GetVar2Ex) (Tcl_Interp *interp, const char *part1, const char *part2, int flags);
    ClientData (*tcl_InitNotifier) (void);
    void (*tcl_MutexLock) (Tcl_Mutex *mutexPtr);
    void (*tcl_MutexUnlock) (Tcl_Mutex *mutexPtr);
    void (*tcl_ConditionNotify) (Tcl_Condition *condPtr);
    void (*tcl_ConditionWait) (Tcl_Condition *condPtr, Tcl_Mutex *mutexPtr, const Tcl_Time *timePtr);
    int (*tcl_NumUtfChars) (const char *src, int length);
    int (*tcl_ReadChars) (Tcl_Channel channel, Tcl_Obj *objPtr, int charsToRead, int appendFlag);
    void (*tcl_RestoreResult) (Tcl_Interp *interp, Tcl_SavedResult *statePtr);
    void (*tcl_SaveResult) (Tcl_Interp *interp, Tcl_SavedResult *statePtr);
    int (*tcl_SetSystemEncoding) (Tcl_Interp *interp, const char *name);
    Tcl_Obj * (*tcl_SetVar2Ex) (Tcl_Interp *interp, const char *part1, const char *part2, Tcl_Obj *newValuePtr, int flags);
    void (*tcl_ThreadAlert) (Tcl_ThreadId threadId);
    void (*tcl_ThreadQueueEvent) (Tcl_ThreadId threadId, Tcl_Event *evPtr, Tcl_QueuePosition position);
    Tcl_UniChar (*tcl_UniCharAtIndex) (const char *src, int index);
    Tcl_UniChar (*tcl_UniCharToLower) (int ch);
    Tcl_UniChar (*tcl_UniCharToTitle) (int ch);
    Tcl_UniChar (*tcl_UniCharToUpper) (int ch);
    int (*tcl_UniCharToUtf) (int ch, char *buf);
    const char * (*tcl_UtfAtIndex) (const char *src, int index);
    int (*tcl_UtfCharComplete) (const char *src, int length);
    int (*tcl_UtfBackslash) (const char *src, int *readPtr, char *dst);
    const char * (*tcl_UtfFindFirst) (const char *src, int ch);
    const char * (*tcl_UtfFindLast) (const char *src, int ch);
    const char * (*tcl_UtfNext) (const char *src);
    const char * (*tcl_UtfPrev) (const char *src, const char *start);
    int (*tcl_UtfToExternal) (Tcl_Interp *interp, Tcl_Encoding encoding, const char *src, int srcLen, int flags, Tcl_EncodingState *statePtr, char *dst, int dstLen, int *srcReadPtr, int *dstWrotePtr, int *dstCharsPtr);
    char * (*tcl_UtfToExternalDString) (Tcl_Encoding encoding, const char *src, int srcLen, Tcl_DString *dsPtr);
    int (*tcl_UtfToLower) (char *src);
    int (*tcl_UtfToTitle) (char *src);
    int (*tcl_UtfToUniChar) (const char *src, Tcl_UniChar *chPtr);
    int (*tcl_UtfToUpper) (char *src);
    int (*tcl_WriteChars) (Tcl_Channel chan, const char *src, int srcLen);
    int (*tcl_WriteObj) (Tcl_Channel chan, Tcl_Obj *objPtr);
    char * (*tcl_GetString) (Tcl_Obj *objPtr);
    const char * (*tcl_GetDefaultEncodingDir) (void);
    void (*tcl_SetDefaultEncodingDir) (const char *path);
    void (*tcl_AlertNotifier) (ClientData clientData);
    void (*tcl_ServiceModeHook) (int mode);
    int (*tcl_UniCharIsAlnum) (int ch);
    int (*tcl_UniCharIsAlpha) (int ch);
    int (*tcl_UniCharIsDigit) (int ch);
    int (*tcl_UniCharIsLower) (int ch);
    int (*tcl_UniCharIsSpace) (int ch);
    int (*tcl_UniCharIsUpper) (int ch);
    int (*tcl_UniCharIsWordChar) (int ch);
    int (*tcl_UniCharLen) (const Tcl_UniChar *uniStr);
    int (*tcl_UniCharNcmp) (const Tcl_UniChar *ucs, const Tcl_UniChar *uct, unsigned long numChars);
    char * (*tcl_UniCharToUtfDString) (const Tcl_UniChar *uniStr, int uniLength, Tcl_DString *dsPtr);
    Tcl_UniChar * (*tcl_UtfToUniCharDString) (const char *src, int length, Tcl_DString *dsPtr);
    Tcl_RegExp (*tcl_GetRegExpFromObj) (Tcl_Interp *interp, Tcl_Obj *patObj, int flags);
    Tcl_Obj * (*tcl_EvalTokens) (Tcl_Interp *interp, Tcl_Token *tokenPtr, int count);
    void (*tcl_FreeParse) (Tcl_Parse *parsePtr);
    void (*tcl_LogCommandInfo) (Tcl_Interp *interp, const char *script, const char *command, int length);
    int (*tcl_ParseBraces) (Tcl_Interp *interp, const char *start, int numBytes, Tcl_Parse *parsePtr, int append, const char **termPtr);
    int (*tcl_ParseCommand) (Tcl_Interp *interp, const char *start, int numBytes, int nested, Tcl_Parse *parsePtr);
    int (*tcl_ParseExpr) (Tcl_Interp *interp, const char *start, int numBytes, Tcl_Parse *parsePtr);
    int (*tcl_ParseQuotedString) (Tcl_Interp *interp, const char *start, int numBytes, Tcl_Parse *parsePtr, int append, const char **termPtr);
    int (*tcl_ParseVarName) (Tcl_Interp *interp, const char *start, int numBytes, Tcl_Parse *parsePtr, int append);
    char * (*tcl_GetCwd) (Tcl_Interp *interp, Tcl_DString *cwdPtr);
    int (*tcl_Chdir) (const char *dirName);
    int (*tcl_Access) (const char *path, int mode);
    int (*tcl_Stat) (const char *path, struct stat *bufPtr);
    int (*tcl_UtfNcmp) (const char *s1, const char *s2, unsigned long n);
    int (*tcl_UtfNcasecmp) (const char *s1, const char *s2, unsigned long n);
    int (*tcl_StringCaseMatch) (const char *str, const char *pattern, int nocase);
    int (*tcl_UniCharIsControl) (int ch);
    int (*tcl_UniCharIsGraph) (int ch);
    int (*tcl_UniCharIsPrint) (int ch);
    int (*tcl_UniCharIsPunct) (int ch);
    int (*tcl_RegExpExecObj) (Tcl_Interp *interp, Tcl_RegExp regexp, Tcl_Obj *textObj, int offset, int nmatches, int flags);
    void (*tcl_RegExpGetInfo) (Tcl_RegExp regexp, Tcl_RegExpInfo *infoPtr);
    Tcl_Obj * (*tcl_NewUnicodeObj) (const Tcl_UniChar *unicode, int numChars);
    void (*tcl_SetUnicodeObj) (Tcl_Obj *objPtr, const Tcl_UniChar *unicode, int numChars);
    int (*tcl_GetCharLength) (Tcl_Obj *objPtr);
    Tcl_UniChar (*tcl_GetUniChar) (Tcl_Obj *objPtr, int index);
    Tcl_UniChar * (*tcl_GetUnicode) (Tcl_Obj *objPtr);
    Tcl_Obj * (*tcl_GetRange) (Tcl_Obj *objPtr, int first, int last);
    void (*tcl_AppendUnicodeToObj) (Tcl_Obj *objPtr, const Tcl_UniChar *unicode, int length);
    int (*tcl_RegExpMatchObj) (Tcl_Interp *interp, Tcl_Obj *textObj, Tcl_Obj *patternObj);
    void (*tcl_SetNotifier) (Tcl_NotifierProcs *notifierProcPtr);
    Tcl_Mutex * (*tcl_GetAllocMutex) (void);
    int (*tcl_GetChannelNames) (Tcl_Interp *interp);
    int (*tcl_GetChannelNamesEx) (Tcl_Interp *interp, const char *pattern);
    int (*tcl_ProcObjCmd) (ClientData clientData, Tcl_Interp *interp, int objc, Tcl_Obj *const objv[]);
    void (*tcl_ConditionFinalize) (Tcl_Condition *condPtr);
    void (*tcl_MutexFinalize) (Tcl_Mutex *mutex);
    int (*tcl_CreateThread) (Tcl_ThreadId *idPtr, Tcl_ThreadCreateProc *proc, ClientData clientData, int stackSize, int flags);
    int (*tcl_ReadRaw) (Tcl_Channel chan, char *dst, int bytesToRead);
    int (*tcl_WriteRaw) (Tcl_Channel chan, const char *src, int srcLen);
    Tcl_Channel (*tcl_GetTopChannel) (Tcl_Channel chan);
    int (*tcl_ChannelBuffered) (Tcl_Channel chan);
    const char * (*tcl_ChannelName) (const Tcl_ChannelType *chanTypePtr);
    Tcl_ChannelTypeVersion (*tcl_ChannelVersion) (const Tcl_ChannelType *chanTypePtr);
    Tcl_DriverBlockModeProc * (*tcl_ChannelBlockModeProc) (const Tcl_ChannelType *chanTypePtr);
    Tcl_DriverCloseProc * (*tcl_ChannelCloseProc) (const Tcl_ChannelType *chanTypePtr);
    Tcl_DriverClose2Proc * (*tcl_ChannelClose2Proc) (const Tcl_ChannelType *chanTypePtr);
    Tcl_DriverInputProc * (*tcl_ChannelInputProc) (const Tcl_ChannelType *chanTypePtr);
    Tcl_DriverOutputProc * (*tcl_ChannelOutputProc) (const Tcl_ChannelType *chanTypePtr);
    Tcl_DriverSeekProc * (*tcl_ChannelSeekProc) (const Tcl_ChannelType *chanTypePtr);
    Tcl_DriverSetOptionProc * (*tcl_ChannelSetOptionProc) (const Tcl_ChannelType *chanTypePtr);
    Tcl_DriverGetOptionProc * (*tcl_ChannelGetOptionProc) (const Tcl_ChannelType *chanTypePtr);
    Tcl_DriverWatchProc * (*tcl_ChannelWatchProc) (const Tcl_ChannelType *chanTypePtr);
    Tcl_DriverGetHandleProc * (*tcl_ChannelGetHandleProc) (const Tcl_ChannelType *chanTypePtr);
    Tcl_DriverFlushProc * (*tcl_ChannelFlushProc) (const Tcl_ChannelType *chanTypePtr);
    Tcl_DriverHandlerProc * (*tcl_ChannelHandlerProc) (const Tcl_ChannelType *chanTypePtr);
    int (*tcl_JoinThread) (Tcl_ThreadId threadId, int *result);
    int (*tcl_IsChannelShared) (Tcl_Channel channel);
    int (*tcl_IsChannelRegistered) (Tcl_Interp *interp, Tcl_Channel channel);
    void (*tcl_CutChannel) (Tcl_Channel channel);
    void (*tcl_SpliceChannel) (Tcl_Channel channel);
    void (*tcl_ClearChannelHandlers) (Tcl_Channel channel);
    int (*tcl_IsChannelExisting) (const char *channelName);
    int (*tcl_UniCharNcasecmp) (const Tcl_UniChar *ucs, const Tcl_UniChar *uct, unsigned long numChars);
    int (*tcl_UniCharCaseMatch) (const Tcl_UniChar *uniStr, const Tcl_UniChar *uniPattern, int nocase);
    Tcl_HashEntry * (*tcl_FindHashEntry) (Tcl_HashTable *tablePtr, const void *key);
    Tcl_HashEntry * (*tcl_CreateHashEntry) (Tcl_HashTable *tablePtr, const void *key, int *newPtr);
    void (*tcl_InitCustomHashTable) (Tcl_HashTable *tablePtr, int keyType, const Tcl_HashKeyType *typePtr);
    void (*tcl_InitObjHashTable) (Tcl_HashTable *tablePtr);
    ClientData (*tcl_CommandTraceInfo) (Tcl_Interp *interp, const char *varName, int flags, Tcl_CommandTraceProc *procPtr, ClientData prevClientData);
    int (*tcl_TraceCommand) (Tcl_Interp *interp, const char *varName, int flags, Tcl_CommandTraceProc *proc, ClientData clientData);
    void (*tcl_UntraceCommand) (Tcl_Interp *interp, const char *varName, int flags, Tcl_CommandTraceProc *proc, ClientData clientData);
    char * (*tcl_AttemptAlloc) (unsigned int size);
    char * (*tcl_AttemptDbCkalloc) (unsigned int size, const char *file, int line);
    char * (*tcl_AttemptRealloc) (char *ptr, unsigned int size);
    char * (*tcl_AttemptDbCkrealloc) (char *ptr, unsigned int size, const char *file, int line);
    int (*tcl_AttemptSetObjLength) (Tcl_Obj *objPtr, int length);
    Tcl_ThreadId (*tcl_GetChannelThread) (Tcl_Channel channel);
    Tcl_UniChar * (*tcl_GetUnicodeFromObj) (Tcl_Obj *objPtr, int *lengthPtr);
    int (*tcl_GetMathFuncInfo) (Tcl_Interp *interp, const char *name, int *numArgsPtr, Tcl_ValueType **argTypesPtr, Tcl_MathProc **procPtr, ClientData *clientDataPtr);
    Tcl_Obj * (*tcl_ListMathFuncs) (Tcl_Interp *interp, const char *pattern);
    Tcl_Obj * (*tcl_SubstObj) (Tcl_Interp *interp, Tcl_Obj *objPtr, int flags);
    int (*tcl_DetachChannel) (Tcl_Interp *interp, Tcl_Channel channel);
    int (*tcl_IsStandardChannel) (Tcl_Channel channel);
    int (*tcl_FSCopyFile) (Tcl_Obj *srcPathPtr, Tcl_Obj *destPathPtr);
    int (*tcl_FSCopyDirectory) (Tcl_Obj *srcPathPtr, Tcl_Obj *destPathPtr, Tcl_Obj **errorPtr);
    int (*tcl_FSCreateDirectory) (Tcl_Obj *pathPtr);
    int (*tcl_FSDeleteFile) (Tcl_Obj *pathPtr);
    int (*tcl_FSLoadFile) (Tcl_Interp *interp, Tcl_Obj *pathPtr, const char *sym1, const char *sym2, Tcl_PackageInitProc **proc1Ptr, Tcl_PackageInitProc **proc2Ptr, Tcl_LoadHandle *handlePtr, Tcl_FSUnloadFileProc **unloadProcPtr);
    int (*tcl_FSMatchInDirectory) (Tcl_Interp *interp, Tcl_Obj *result, Tcl_Obj *pathPtr, const char *pattern, Tcl_GlobTypeData *types);
    Tcl_Obj * (*tcl_FSLink) (Tcl_Obj *pathPtr, Tcl_Obj *toPtr, int linkAction);
    int (*tcl_FSRemoveDirectory) (Tcl_Obj *pathPtr, int recursive, Tcl_Obj **errorPtr);
    int (*tcl_FSRenameFile) (Tcl_Obj *srcPathPtr, Tcl_Obj *destPathPtr);
    int (*tcl_FSLstat) (Tcl_Obj *pathPtr, Tcl_StatBuf *buf);
    int (*tcl_FSUtime) (Tcl_Obj *pathPtr, struct utimbuf *tval);
    int (*tcl_FSFileAttrsGet) (Tcl_Interp *interp, int index, Tcl_Obj *pathPtr, Tcl_Obj **objPtrRef);
    int (*tcl_FSFileAttrsSet) (Tcl_Interp *interp, int index, Tcl_Obj *pathPtr, Tcl_Obj *objPtr);
    const char *const * (*tcl_FSFileAttrStrings) (Tcl_Obj *pathPtr, Tcl_Obj **objPtrRef);
    int (*tcl_FSStat) (Tcl_Obj *pathPtr, Tcl_StatBuf *buf);
    int (*tcl_FSAccess) (Tcl_Obj *pathPtr, int mode);
    Tcl_Channel (*tcl_FSOpenFileChannel) (Tcl_Interp *interp, Tcl_Obj *pathPtr, const char *modeString, int permissions);
    Tcl_Obj * (*tcl_FSGetCwd) (Tcl_Interp *interp);
    int (*tcl_FSChdir) (Tcl_Obj *pathPtr);
    int (*tcl_FSConvertToPathType) (Tcl_Interp *interp, Tcl_Obj *pathPtr);
    Tcl_Obj * (*tcl_FSJoinPath) (Tcl_Obj *listObj, int elements);
    Tcl_Obj * (*tcl_FSSplitPath) (Tcl_Obj *pathPtr, int *lenPtr);
    int (*tcl_FSEqualPaths) (Tcl_Obj *firstPtr, Tcl_Obj *secondPtr);
    Tcl_Obj * (*tcl_FSGetNormalizedPath) (Tcl_Interp *interp, Tcl_Obj *pathPtr);
    Tcl_Obj * (*tcl_FSJoinToPath) (Tcl_Obj *pathPtr, int objc, Tcl_Obj *const objv[]);
    ClientData (*tcl_FSGetInternalRep) (Tcl_Obj *pathPtr, const Tcl_Filesystem *fsPtr);
    Tcl_Obj * (*tcl_FSGetTranslatedPath) (Tcl_Interp *interp, Tcl_Obj *pathPtr);
    int (*tcl_FSEvalFile) (Tcl_Interp *interp, Tcl_Obj *fileName);
    Tcl_Obj * (*tcl_FSNewNativePath) (const Tcl_Filesystem *fromFilesystem, ClientData clientData);
    const void * (*tcl_FSGetNativePath) (Tcl_Obj *pathPtr);
    Tcl_Obj * (*tcl_FSFileSystemInfo) (Tcl_Obj *pathPtr);
    Tcl_Obj * (*tcl_FSPathSeparator) (Tcl_Obj *pathPtr);
    Tcl_Obj * (*tcl_FSListVolumes) (void);
    int (*tcl_FSRegister) (ClientData clientData, const Tcl_Filesystem *fsPtr);
    int (*tcl_FSUnregister) (const Tcl_Filesystem *fsPtr);
    ClientData (*tcl_FSData) (const Tcl_Filesystem *fsPtr);
    const char * (*tcl_FSGetTranslatedStringPath) (Tcl_Interp *interp, Tcl_Obj *pathPtr);
    const Tcl_Filesystem * (*tcl_FSGetFileSystemForPath) (Tcl_Obj *pathPtr);
    Tcl_PathType (*tcl_FSGetPathType) (Tcl_Obj *pathPtr);
    int (*tcl_OutputBuffered) (Tcl_Channel chan);
    void (*tcl_FSMountsChanged) (const Tcl_Filesystem *fsPtr);
    int (*tcl_EvalTokensStandard) (Tcl_Interp *interp, Tcl_Token *tokenPtr, int count);
    void (*tcl_GetTime) (Tcl_Time *timeBuf);
    Tcl_Trace (*tcl_CreateObjTrace) (Tcl_Interp *interp, int level, int flags, Tcl_CmdObjTraceProc *objProc, ClientData clientData, Tcl_CmdObjTraceDeleteProc *delProc);
    int (*tcl_GetCommandInfoFromToken) (Tcl_Command token, Tcl_CmdInfo *infoPtr);
    int (*tcl_SetCommandInfoFromToken) (Tcl_Command token, const Tcl_CmdInfo *infoPtr);
    Tcl_Obj * (*tcl_DbNewWideIntObj) (Tcl_WideInt wideValue, const char *file, int line);
    int (*tcl_GetWideIntFromObj) (Tcl_Interp *interp, Tcl_Obj *objPtr, Tcl_WideInt *widePtr);
    Tcl_Obj * (*tcl_NewWideIntObj) (Tcl_WideInt wideValue);
    void (*tcl_SetWideIntObj) (Tcl_Obj *objPtr, Tcl_WideInt wideValue);
    Tcl_StatBuf * (*tcl_AllocStatBuf) (void);
    Tcl_WideInt (*tcl_Seek) (Tcl_Channel chan, Tcl_WideInt offset, int mode);
    Tcl_WideInt (*tcl_Tell) (Tcl_Channel chan);
    Tcl_DriverWideSeekProc * (*tcl_ChannelWideSeekProc) (const Tcl_ChannelType *chanTypePtr);
    int (*tcl_DictObjPut) (Tcl_Interp *interp, Tcl_Obj *dictPtr, Tcl_Obj *keyPtr, Tcl_Obj *valuePtr);
    int (*tcl_DictObjGet) (Tcl_Interp *interp, Tcl_Obj *dictPtr, Tcl_Obj *keyPtr, Tcl_Obj **valuePtrPtr);
    int (*tcl_DictObjRemove) (Tcl_Interp *interp, Tcl_Obj *dictPtr, Tcl_Obj *keyPtr);
    int (*tcl_DictObjSize) (Tcl_Interp *interp, Tcl_Obj *dictPtr, int *sizePtr);
    int (*tcl_DictObjFirst) (Tcl_Interp *interp, Tcl_Obj *dictPtr, Tcl_DictSearch *searchPtr, Tcl_Obj **keyPtrPtr, Tcl_Obj **valuePtrPtr, int *donePtr);
    void (*tcl_DictObjNext) (Tcl_DictSearch *searchPtr, Tcl_Obj **keyPtrPtr, Tcl_Obj **valuePtrPtr, int *donePtr);
    void (*tcl_DictObjDone) (Tcl_DictSearch *searchPtr);
    int (*tcl_DictObjPutKeyList) (Tcl_Interp *interp, Tcl_Obj *dictPtr, int keyc, Tcl_Obj *const *keyv, Tcl_Obj *valuePtr);
    int (*tcl_DictObjRemoveKeyList) (Tcl_Interp *interp, Tcl_Obj *dictPtr, int keyc, Tcl_Obj *const *keyv);
    Tcl_Obj * (*tcl_NewDictObj) (void);
    Tcl_Obj * (*tcl_DbNewDictObj) (const char *file, int line);
    void (*tcl_RegisterConfig) (Tcl_Interp *interp, const char *pkgName, const Tcl_Config *configuration, const char *valEncoding);
    Tcl_Namespace * (*tcl_CreateNamespace) (Tcl_Interp *interp, const char *name, ClientData clientData, Tcl_NamespaceDeleteProc *deleteProc);
    void (*tcl_DeleteNamespace) (Tcl_Namespace *nsPtr);
    int (*tcl_AppendExportList) (Tcl_Interp *interp, Tcl_Namespace *nsPtr, Tcl_Obj *objPtr);
    int (*tcl_Export) (Tcl_Interp *interp, Tcl_Namespace *nsPtr, const char *pattern, int resetListFirst);
    int (*tcl_Import) (Tcl_Interp *interp, Tcl_Namespace *nsPtr, const char *pattern, int allowOverwrite);
    int (*tcl_ForgetImport) (Tcl_Interp *interp, Tcl_Namespace *nsPtr, const char *pattern);
    Tcl_Namespace * (*tcl_GetCurrentNamespace) (Tcl_Interp *interp);
    Tcl_Namespace * (*tcl_GetGlobalNamespace) (Tcl_Interp *interp);
    Tcl_Namespace * (*tcl_FindNamespace) (Tcl_Interp *interp, const char *name, Tcl_Namespace *contextNsPtr, int flags);
    Tcl_Command (*tcl_FindCommand) (Tcl_Interp *interp, const char *name, Tcl_Namespace *contextNsPtr, int flags);
    Tcl_Command (*tcl_GetCommandFromObj) (Tcl_Interp *interp, Tcl_Obj *objPtr);
    void (*tcl_GetCommandFullName) (Tcl_Interp *interp, Tcl_Command command, Tcl_Obj *objPtr);
    int (*tcl_FSEvalFileEx) (Tcl_Interp *interp, Tcl_Obj *fileName, const char *encodingName);
    Tcl_ExitProc * (*tcl_SetExitProc) ( Tcl_ExitProc *proc);
    void (*tcl_LimitAddHandler) (Tcl_Interp *interp, int type, Tcl_LimitHandlerProc *handlerProc, ClientData clientData, Tcl_LimitHandlerDeleteProc *deleteProc);
    void (*tcl_LimitRemoveHandler) (Tcl_Interp *interp, int type, Tcl_LimitHandlerProc *handlerProc, ClientData clientData);
    int (*tcl_LimitReady) (Tcl_Interp *interp);
    int (*tcl_LimitCheck) (Tcl_Interp *interp);
    int (*tcl_LimitExceeded) (Tcl_Interp *interp);
    void (*tcl_LimitSetCommands) (Tcl_Interp *interp, int commandLimit);
    void (*tcl_LimitSetTime) (Tcl_Interp *interp, Tcl_Time *timeLimitPtr);
    void (*tcl_LimitSetGranularity) (Tcl_Interp *interp, int type, int granularity);
    int (*tcl_LimitTypeEnabled) (Tcl_Interp *interp, int type);
    int (*tcl_LimitTypeExceeded) (Tcl_Interp *interp, int type);
    void (*tcl_LimitTypeSet) (Tcl_Interp *interp, int type);
    void (*tcl_LimitTypeReset) (Tcl_Interp *interp, int type);
    int (*tcl_LimitGetCommands) (Tcl_Interp *interp);
    void (*tcl_LimitGetTime) (Tcl_Interp *interp, Tcl_Time *timeLimitPtr);
    int (*tcl_LimitGetGranularity) (Tcl_Interp *interp, int type);
    Tcl_InterpState (*tcl_SaveInterpState) (Tcl_Interp *interp, int status);
    int (*tcl_RestoreInterpState) (Tcl_Interp *interp, Tcl_InterpState state);
    void (*tcl_DiscardInterpState) (Tcl_InterpState state);
    int (*tcl_SetReturnOptions) (Tcl_Interp *interp, Tcl_Obj *options);
    Tcl_Obj * (*tcl_GetReturnOptions) (Tcl_Interp *interp, int result);
    int (*tcl_IsEnsemble) (Tcl_Command token);
    Tcl_Command (*tcl_CreateEnsemble) (Tcl_Interp *interp, const char *name, Tcl_Namespace *namespacePtr, int flags);
    Tcl_Command (*tcl_FindEnsemble) (Tcl_Interp *interp, Tcl_Obj *cmdNameObj, int flags);
    int (*tcl_SetEnsembleSubcommandList) (Tcl_Interp *interp, Tcl_Command token, Tcl_Obj *subcmdList);
    int (*tcl_SetEnsembleMappingDict) (Tcl_Interp *interp, Tcl_Command token, Tcl_Obj *mapDict);
    int (*tcl_SetEnsembleUnknownHandler) (Tcl_Interp *interp, Tcl_Command token, Tcl_Obj *unknownList);
    int (*tcl_SetEnsembleFlags) (Tcl_Interp *interp, Tcl_Command token, int flags);
    int (*tcl_GetEnsembleSubcommandList) (Tcl_Interp *interp, Tcl_Command token, Tcl_Obj **subcmdListPtr);
    int (*tcl_GetEnsembleMappingDict) (Tcl_Interp *interp, Tcl_Command token, Tcl_Obj **mapDictPtr);
    int (*tcl_GetEnsembleUnknownHandler) (Tcl_Interp *interp, Tcl_Command token, Tcl_Obj **unknownListPtr);
    int (*tcl_GetEnsembleFlags) (Tcl_Interp *interp, Tcl_Command token, int *flagsPtr);
    int (*tcl_GetEnsembleNamespace) (Tcl_Interp *interp, Tcl_Command token, Tcl_Namespace **namespacePtrPtr);
    void (*tcl_SetTimeProc) (Tcl_GetTimeProc *getProc, Tcl_ScaleTimeProc *scaleProc, ClientData clientData);
    void (*tcl_QueryTimeProc) (Tcl_GetTimeProc **getProc, Tcl_ScaleTimeProc **scaleProc, ClientData *clientData);
    Tcl_DriverThreadActionProc * (*tcl_ChannelThreadActionProc) (const Tcl_ChannelType *chanTypePtr);
    Tcl_Obj * (*tcl_NewBignumObj) (mp_int *value);
    Tcl_Obj * (*tcl_DbNewBignumObj) (mp_int *value, const char *file, int line);
    void (*tcl_SetBignumObj) (Tcl_Obj *obj, mp_int *value);
    int (*tcl_GetBignumFromObj) (Tcl_Interp *interp, Tcl_Obj *obj, mp_int *value);
    int (*tcl_TakeBignumFromObj) (Tcl_Interp *interp, Tcl_Obj *obj, mp_int *value);
    int (*tcl_TruncateChannel) (Tcl_Channel chan, Tcl_WideInt length);
    Tcl_DriverTruncateProc * (*tcl_ChannelTruncateProc) (const Tcl_ChannelType *chanTypePtr);
    void (*tcl_SetChannelErrorInterp) (Tcl_Interp *interp, Tcl_Obj *msg);
    void (*tcl_GetChannelErrorInterp) (Tcl_Interp *interp, Tcl_Obj **msg);
    void (*tcl_SetChannelError) (Tcl_Channel chan, Tcl_Obj *msg);
    void (*tcl_GetChannelError) (Tcl_Channel chan, Tcl_Obj **msg);
    int (*tcl_InitBignumFromDouble) (Tcl_Interp *interp, double initval, mp_int *toInit);
    Tcl_Obj * (*tcl_GetNamespaceUnknownHandler) (Tcl_Interp *interp, Tcl_Namespace *nsPtr);
    int (*tcl_SetNamespaceUnknownHandler) (Tcl_Interp *interp, Tcl_Namespace *nsPtr, Tcl_Obj *handlerPtr);
    int (*tcl_GetEncodingFromObj) (Tcl_Interp *interp, Tcl_Obj *objPtr, Tcl_Encoding *encodingPtr);
    Tcl_Obj * (*tcl_GetEncodingSearchPath) (void);
    int (*tcl_SetEncodingSearchPath) (Tcl_Obj *searchPath);
    const char * (*tcl_GetEncodingNameFromEnvironment) (Tcl_DString *bufPtr);
    int (*tcl_PkgRequireProc) (Tcl_Interp *interp, const char *name, int objc, Tcl_Obj *const objv[], void *clientDataPtr);
    void (*tcl_AppendObjToErrorInfo) (Tcl_Interp *interp, Tcl_Obj *objPtr);
    void (*tcl_AppendLimitedToObj) (Tcl_Obj *objPtr, const char *bytes, int length, int limit, const char *ellipsis);
    Tcl_Obj * (*tcl_Format) (Tcl_Interp *interp, const char *format, int objc, Tcl_Obj *const objv[]);
    int (*tcl_AppendFormatToObj) (Tcl_Interp *interp, Tcl_Obj *objPtr, const char *format, int objc, Tcl_Obj *const objv[]);
    Tcl_Obj * (*tcl_ObjPrintf) (const char *format, ...) __attribute__ ((__format__ (__printf__, 1, 2)));
    void (*tcl_AppendPrintfToObj) (Tcl_Obj *objPtr, const char *format, ...) __attribute__ ((__format__ (__printf__, 2, 3)));
    int (*tcl_CancelEval) (Tcl_Interp *interp, Tcl_Obj *resultObjPtr, ClientData clientData, int flags);
    int (*tcl_Canceled) (Tcl_Interp *interp, int flags);
    int (*tcl_CreatePipe) (Tcl_Interp *interp, Tcl_Channel *rchan, Tcl_Channel *wchan, int flags);
    Tcl_Command (*tcl_NRCreateCommand) (Tcl_Interp *interp, const char *cmdName, Tcl_ObjCmdProc *proc, Tcl_ObjCmdProc *nreProc, ClientData clientData, Tcl_CmdDeleteProc *deleteProc);
    int (*tcl_NREvalObj) (Tcl_Interp *interp, Tcl_Obj *objPtr, int flags);
    int (*tcl_NREvalObjv) (Tcl_Interp *interp, int objc, Tcl_Obj *const objv[], int flags);
    int (*tcl_NRCmdSwap) (Tcl_Interp *interp, Tcl_Command cmd, int objc, Tcl_Obj *const objv[], int flags);
    void (*tcl_NRAddCallback) (Tcl_Interp *interp, Tcl_NRPostProc *postProcPtr, ClientData data0, ClientData data1, ClientData data2, ClientData data3);
    int (*tcl_NRCallObjProc) (Tcl_Interp *interp, Tcl_ObjCmdProc *objProc, ClientData clientData, int objc, Tcl_Obj *const objv[]);
    unsigned (*tcl_GetFSDeviceFromStat) (const Tcl_StatBuf *statPtr);
    unsigned (*tcl_GetFSInodeFromStat) (const Tcl_StatBuf *statPtr);
    unsigned (*tcl_GetModeFromStat) (const Tcl_StatBuf *statPtr);
    int (*tcl_GetLinkCountFromStat) (const Tcl_StatBuf *statPtr);
    int (*tcl_GetUserIdFromStat) (const Tcl_StatBuf *statPtr);
    int (*tcl_GetGroupIdFromStat) (const Tcl_StatBuf *statPtr);
    int (*tcl_GetDeviceTypeFromStat) (const Tcl_StatBuf *statPtr);
    Tcl_WideInt (*tcl_GetAccessTimeFromStat) (const Tcl_StatBuf *statPtr);
    Tcl_WideInt (*tcl_GetModificationTimeFromStat) (const Tcl_StatBuf *statPtr);
    Tcl_WideInt (*tcl_GetChangeTimeFromStat) (const Tcl_StatBuf *statPtr);
    Tcl_WideUInt (*tcl_GetSizeFromStat) (const Tcl_StatBuf *statPtr);
    Tcl_WideUInt (*tcl_GetBlocksFromStat) (const Tcl_StatBuf *statPtr);
    unsigned (*tcl_GetBlockSizeFromStat) (const Tcl_StatBuf *statPtr);
    int (*tcl_SetEnsembleParameterList) (Tcl_Interp *interp, Tcl_Command token, Tcl_Obj *paramList);
    int (*tcl_GetEnsembleParameterList) (Tcl_Interp *interp, Tcl_Command token, Tcl_Obj **paramListPtr);
    int (*tcl_ParseArgsObjv) (Tcl_Interp *interp, const Tcl_ArgvInfo *argTable, int *objcPtr, Tcl_Obj *const *objv, Tcl_Obj ***remObjv);
    int (*tcl_GetErrorLine) (Tcl_Interp *interp);
    void (*tcl_SetErrorLine) (Tcl_Interp *interp, int lineNum);
    void (*tcl_TransferResult) (Tcl_Interp *sourceInterp, int result, Tcl_Interp *targetInterp);
    int (*tcl_InterpActive) (Tcl_Interp *interp);
    void (*tcl_BackgroundException) (Tcl_Interp *interp, int code);
    int (*tcl_ZlibDeflate) (Tcl_Interp *interp, int format, Tcl_Obj *data, int level, Tcl_Obj *gzipHeaderDictObj);
    int (*tcl_ZlibInflate) (Tcl_Interp *interp, int format, Tcl_Obj *data, int buffersize, Tcl_Obj *gzipHeaderDictObj);
    unsigned int (*tcl_ZlibCRC32) (unsigned int crc, const unsigned char *buf, int len);
    unsigned int (*tcl_ZlibAdler32) (unsigned int adler, const unsigned char *buf, int len);
    int (*tcl_ZlibStreamInit) (Tcl_Interp *interp, int mode, int format, int level, Tcl_Obj *dictObj, Tcl_ZlibStream *zshandle);
    Tcl_Obj * (*tcl_ZlibStreamGetCommandName) (Tcl_ZlibStream zshandle);
    int (*tcl_ZlibStreamEof) (Tcl_ZlibStream zshandle);
    int (*tcl_ZlibStreamChecksum) (Tcl_ZlibStream zshandle);
    int (*tcl_ZlibStreamPut) (Tcl_ZlibStream zshandle, Tcl_Obj *data, int flush);
    int (*tcl_ZlibStreamGet) (Tcl_ZlibStream zshandle, Tcl_Obj *data, int count);
    int (*tcl_ZlibStreamClose) (Tcl_ZlibStream zshandle);
    int (*tcl_ZlibStreamReset) (Tcl_ZlibStream zshandle);
    void (*tcl_SetStartupScript) (Tcl_Obj *path, const char *encoding);
    Tcl_Obj * (*tcl_GetStartupScript) (const char **encodingPtr);
    int (*tcl_CloseEx) (Tcl_Interp *interp, Tcl_Channel chan, int flags);
    int (*tcl_NRExprObj) (Tcl_Interp *interp, Tcl_Obj *objPtr, Tcl_Obj *resultPtr);
    int (*tcl_NRSubstObj) (Tcl_Interp *interp, Tcl_Obj *objPtr, int flags);
    int (*tcl_LoadFile) (Tcl_Interp *interp, Tcl_Obj *pathPtr, const char *const symv[], int flags, void *procPtrs, Tcl_LoadHandle *handlePtr);
    void * (*tcl_FindSymbol) (Tcl_Interp *interp, Tcl_LoadHandle handle, const char *symbol);
    int (*tcl_FSUnloadFile) (Tcl_Interp *interp, Tcl_LoadHandle handlePtr);
    void (*tcl_ZlibStreamSetCompressionDictionary) (Tcl_ZlibStream zhandle, Tcl_Obj *compressionDictionaryObj);
} TclStubs;

extern const TclStubs *tclStubsPtr;
# 2446 "./tcl.h" 2
# 2458 "./tcl.h"
# 1 "/usr/include/tcl8.6/tclPlatDecls.h" 1
# 74 "/usr/include/tcl8.6/tclPlatDecls.h"
typedef struct TclPlatStubs {
    int magic;
    void *hooks;
# 86 "/usr/include/tcl8.6/tclPlatDecls.h"
} TclPlatStubs;

extern const TclPlatStubs *tclPlatStubsPtr;
# 2459 "./tcl.h" 2
# 2646 "./tcl.h"
extern Tcl_AppInitProc Tcl_AppInit;
# 143 "test_wrap.c" 2
# 1 "/usr/include/errno.h" 1 3 4
# 31 "/usr/include/errno.h" 3 4




# 1 "/usr/include/x86_64-linux-gnu/bits/errno.h" 1 3 4
# 24 "/usr/include/x86_64-linux-gnu/bits/errno.h" 3 4
# 1 "/usr/include/linux/errno.h" 1 3 4
# 1 "/usr/include/x86_64-linux-gnu/asm/errno.h" 1 3 4
# 1 "/usr/include/asm-generic/errno.h" 1 3 4



# 1 "/usr/include/asm-generic/errno-base.h" 1 3 4
# 5 "/usr/include/asm-generic/errno.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/asm/errno.h" 2 3 4
# 1 "/usr/include/linux/errno.h" 2 3 4
# 25 "/usr/include/x86_64-linux-gnu/bits/errno.h" 2 3 4
# 50 "/usr/include/x86_64-linux-gnu/bits/errno.h" 3 4

# 50 "/usr/include/x86_64-linux-gnu/bits/errno.h" 3 4
extern int *__errno_location (void) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
# 36 "/usr/include/errno.h" 2 3 4
# 58 "/usr/include/errno.h" 3 4

# 144 "test_wrap.c" 2
# 1 "/usr/include/stdlib.h" 1 3 4
# 32 "/usr/include/stdlib.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h" 1 3 4
# 328 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h" 3 4
typedef int wchar_t;
# 33 "/usr/include/stdlib.h" 2 3 4








# 1 "/usr/include/x86_64-linux-gnu/bits/waitflags.h" 1 3 4
# 50 "/usr/include/x86_64-linux-gnu/bits/waitflags.h" 3 4
typedef enum
{
  P_ALL,
  P_PID,
  P_PGID
} idtype_t;
# 42 "/usr/include/stdlib.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/waitstatus.h" 1 3 4
# 64 "/usr/include/x86_64-linux-gnu/bits/waitstatus.h" 3 4
# 1 "/usr/include/endian.h" 1 3 4
# 36 "/usr/include/endian.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/endian.h" 1 3 4
# 37 "/usr/include/endian.h" 2 3 4
# 60 "/usr/include/endian.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/byteswap.h" 1 3 4
# 28 "/usr/include/x86_64-linux-gnu/bits/byteswap.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 29 "/usr/include/x86_64-linux-gnu/bits/byteswap.h" 2 3 4






# 1 "/usr/include/x86_64-linux-gnu/bits/byteswap-16.h" 1 3 4
# 36 "/usr/include/x86_64-linux-gnu/bits/byteswap.h" 2 3 4
# 44 "/usr/include/x86_64-linux-gnu/bits/byteswap.h" 3 4
static __inline unsigned int
__bswap_32 (unsigned int __bsx)
{
  return __builtin_bswap32 (__bsx);
}
# 108 "/usr/include/x86_64-linux-gnu/bits/byteswap.h" 3 4
static __inline __uint64_t
__bswap_64 (__uint64_t __bsx)
{
  return __builtin_bswap64 (__bsx);
}
# 61 "/usr/include/endian.h" 2 3 4
# 65 "/usr/include/x86_64-linux-gnu/bits/waitstatus.h" 2 3 4

union wait
  {
    int w_status;
    struct
      {

 unsigned int __w_termsig:7;
 unsigned int __w_coredump:1;
 unsigned int __w_retcode:8;
 unsigned int:16;







      } __wait_terminated;
    struct
      {

 unsigned int __w_stopval:8;
 unsigned int __w_stopsig:8;
 unsigned int:16;






      } __wait_stopped;
  };
# 43 "/usr/include/stdlib.h" 2 3 4
# 67 "/usr/include/stdlib.h" 3 4
typedef union
  {
    union wait *__uptr;
    int *__iptr;
  } __WAIT_STATUS __attribute__ ((__transparent_union__));
# 95 "/usr/include/stdlib.h" 3 4


typedef struct
  {
    int quot;
    int rem;
  } div_t;



typedef struct
  {
    long int quot;
    long int rem;
  } ldiv_t;







__extension__ typedef struct
  {
    long long int quot;
    long long int rem;
  } lldiv_t;


# 139 "/usr/include/stdlib.h" 3 4
extern size_t __ctype_get_mb_cur_max (void) __attribute__ ((__nothrow__ , __leaf__)) ;




extern double atof (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;

extern int atoi (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;

extern long int atol (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;





__extension__ extern long long int atoll (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;





extern double strtod (const char *__restrict __nptr,
        char **__restrict __endptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));





extern float strtof (const char *__restrict __nptr,
       char **__restrict __endptr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

extern long double strtold (const char *__restrict __nptr,
       char **__restrict __endptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));





extern long int strtol (const char *__restrict __nptr,
   char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

extern unsigned long int strtoul (const char *__restrict __nptr,
      char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));




__extension__
extern long long int strtoq (const char *__restrict __nptr,
        char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

__extension__
extern unsigned long long int strtouq (const char *__restrict __nptr,
           char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));





__extension__
extern long long int strtoll (const char *__restrict __nptr,
         char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

__extension__
extern unsigned long long int strtoull (const char *__restrict __nptr,
     char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

# 305 "/usr/include/stdlib.h" 3 4
extern char *l64a (long int __n) __attribute__ ((__nothrow__ , __leaf__)) ;


extern long int a64l (const char *__s)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;




# 1 "/usr/include/x86_64-linux-gnu/sys/types.h" 1 3 4
# 27 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4






typedef __u_char u_char;
typedef __u_short u_short;
typedef __u_int u_int;
typedef __u_long u_long;
typedef __quad_t quad_t;
typedef __u_quad_t u_quad_t;
typedef __fsid_t fsid_t;




typedef __loff_t loff_t;



typedef __ino_t ino_t;
# 60 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
typedef __dev_t dev_t;




typedef __gid_t gid_t;




typedef __mode_t mode_t;




typedef __nlink_t nlink_t;




typedef __uid_t uid_t;
# 98 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
typedef __pid_t pid_t;





typedef __id_t id_t;
# 115 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
typedef __daddr_t daddr_t;
typedef __caddr_t caddr_t;





typedef __key_t key_t;
# 132 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
# 1 "/usr/include/time.h" 1 3 4
# 57 "/usr/include/time.h" 3 4


typedef __clock_t clock_t;



# 73 "/usr/include/time.h" 3 4


typedef __time_t time_t;



# 91 "/usr/include/time.h" 3 4
typedef __clockid_t clockid_t;
# 103 "/usr/include/time.h" 3 4
typedef __timer_t timer_t;
# 133 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4
# 146 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h" 1 3 4
# 147 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4



typedef unsigned long int ulong;
typedef unsigned short int ushort;
typedef unsigned int uint;
# 194 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
typedef int int8_t __attribute__ ((__mode__ (__QI__)));
typedef int int16_t __attribute__ ((__mode__ (__HI__)));
typedef int int32_t __attribute__ ((__mode__ (__SI__)));
typedef int int64_t __attribute__ ((__mode__ (__DI__)));


typedef unsigned int u_int8_t __attribute__ ((__mode__ (__QI__)));
typedef unsigned int u_int16_t __attribute__ ((__mode__ (__HI__)));
typedef unsigned int u_int32_t __attribute__ ((__mode__ (__SI__)));
typedef unsigned int u_int64_t __attribute__ ((__mode__ (__DI__)));

typedef int register_t __attribute__ ((__mode__ (__word__)));
# 219 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/sys/select.h" 1 3 4
# 30 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/select.h" 1 3 4
# 22 "/usr/include/x86_64-linux-gnu/bits/select.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 23 "/usr/include/x86_64-linux-gnu/bits/select.h" 2 3 4
# 31 "/usr/include/x86_64-linux-gnu/sys/select.h" 2 3 4


# 1 "/usr/include/x86_64-linux-gnu/bits/sigset.h" 1 3 4
# 22 "/usr/include/x86_64-linux-gnu/bits/sigset.h" 3 4
typedef int __sig_atomic_t;




typedef struct
  {
    unsigned long int __val[(1024 / (8 * sizeof (unsigned long int)))];
  } __sigset_t;
# 34 "/usr/include/x86_64-linux-gnu/sys/select.h" 2 3 4



typedef __sigset_t sigset_t;





# 1 "/usr/include/time.h" 1 3 4
# 120 "/usr/include/time.h" 3 4
struct timespec
  {
    __time_t tv_sec;
    __syscall_slong_t tv_nsec;
  };
# 44 "/usr/include/x86_64-linux-gnu/sys/select.h" 2 3 4

# 1 "/usr/include/x86_64-linux-gnu/bits/time.h" 1 3 4
# 30 "/usr/include/x86_64-linux-gnu/bits/time.h" 3 4
struct timeval
  {
    __time_t tv_sec;
    __suseconds_t tv_usec;
  };
# 46 "/usr/include/x86_64-linux-gnu/sys/select.h" 2 3 4


typedef __suseconds_t suseconds_t;





typedef long int __fd_mask;
# 64 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
typedef struct
  {






    __fd_mask __fds_bits[1024 / (8 * (int) sizeof (__fd_mask))];


  } fd_set;






typedef __fd_mask fd_mask;
# 96 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4

# 106 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
extern int select (int __nfds, fd_set *__restrict __readfds,
     fd_set *__restrict __writefds,
     fd_set *__restrict __exceptfds,
     struct timeval *__restrict __timeout);
# 118 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
extern int pselect (int __nfds, fd_set *__restrict __readfds,
      fd_set *__restrict __writefds,
      fd_set *__restrict __exceptfds,
      const struct timespec *__restrict __timeout,
      const __sigset_t *__restrict __sigmask);
# 131 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4

# 220 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4


# 1 "/usr/include/x86_64-linux-gnu/sys/sysmacros.h" 1 3 4
# 24 "/usr/include/x86_64-linux-gnu/sys/sysmacros.h" 3 4


__extension__
extern unsigned int gnu_dev_major (unsigned long long int __dev)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
__extension__
extern unsigned int gnu_dev_minor (unsigned long long int __dev)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
__extension__
extern unsigned long long int gnu_dev_makedev (unsigned int __major,
            unsigned int __minor)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
# 58 "/usr/include/x86_64-linux-gnu/sys/sysmacros.h" 3 4

# 223 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4





typedef __blksize_t blksize_t;






typedef __blkcnt_t blkcnt_t;



typedef __fsblkcnt_t fsblkcnt_t;



typedef __fsfilcnt_t fsfilcnt_t;
# 270 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 1 3 4
# 21 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 22 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 2 3 4
# 60 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 3 4
typedef unsigned long int pthread_t;


union pthread_attr_t
{
  char __size[56];
  long int __align;
};

typedef union pthread_attr_t pthread_attr_t;





typedef struct __pthread_internal_list
{
  struct __pthread_internal_list *__prev;
  struct __pthread_internal_list *__next;
} __pthread_list_t;
# 90 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 3 4
typedef union
{
  struct __pthread_mutex_s
  {
    int __lock;
    unsigned int __count;
    int __owner;

    unsigned int __nusers;



    int __kind;

    short __spins;
    short __elision;
    __pthread_list_t __list;
# 125 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 3 4
  } __data;
  char __size[40];
  long int __align;
} pthread_mutex_t;

typedef union
{
  char __size[4];
  int __align;
} pthread_mutexattr_t;




typedef union
{
  struct
  {
    int __lock;
    unsigned int __futex;
    __extension__ unsigned long long int __total_seq;
    __extension__ unsigned long long int __wakeup_seq;
    __extension__ unsigned long long int __woken_seq;
    void *__mutex;
    unsigned int __nwaiters;
    unsigned int __broadcast_seq;
  } __data;
  char __size[48];
  __extension__ long long int __align;
} pthread_cond_t;

typedef union
{
  char __size[4];
  int __align;
} pthread_condattr_t;



typedef unsigned int pthread_key_t;



typedef int pthread_once_t;





typedef union
{

  struct
  {
    int __lock;
    unsigned int __nr_readers;
    unsigned int __readers_wakeup;
    unsigned int __writer_wakeup;
    unsigned int __nr_readers_queued;
    unsigned int __nr_writers_queued;
    int __writer;
    int __shared;
    signed char __rwelision;




    unsigned char __pad1[7];


    unsigned long int __pad2;


    unsigned int __flags;

  } __data;
# 220 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 3 4
  char __size[56];
  long int __align;
} pthread_rwlock_t;

typedef union
{
  char __size[8];
  long int __align;
} pthread_rwlockattr_t;





typedef volatile int pthread_spinlock_t;




typedef union
{
  char __size[32];
  long int __align;
} pthread_barrier_t;

typedef union
{
  char __size[4];
  int __align;
} pthread_barrierattr_t;
# 271 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4



# 315 "/usr/include/stdlib.h" 2 3 4






extern long int random (void) __attribute__ ((__nothrow__ , __leaf__));


extern void srandom (unsigned int __seed) __attribute__ ((__nothrow__ , __leaf__));





extern char *initstate (unsigned int __seed, char *__statebuf,
   size_t __statelen) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));



extern char *setstate (char *__statebuf) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));







struct random_data
  {
    int32_t *fptr;
    int32_t *rptr;
    int32_t *state;
    int rand_type;
    int rand_deg;
    int rand_sep;
    int32_t *end_ptr;
  };

extern int random_r (struct random_data *__restrict __buf,
       int32_t *__restrict __result) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

extern int srandom_r (unsigned int __seed, struct random_data *__buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));

extern int initstate_r (unsigned int __seed, char *__restrict __statebuf,
   size_t __statelen,
   struct random_data *__restrict __buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 4)));

extern int setstate_r (char *__restrict __statebuf,
         struct random_data *__restrict __buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));






extern int rand (void) __attribute__ ((__nothrow__ , __leaf__));

extern void srand (unsigned int __seed) __attribute__ ((__nothrow__ , __leaf__));




extern int rand_r (unsigned int *__seed) __attribute__ ((__nothrow__ , __leaf__));







extern double drand48 (void) __attribute__ ((__nothrow__ , __leaf__));
extern double erand48 (unsigned short int __xsubi[3]) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern long int lrand48 (void) __attribute__ ((__nothrow__ , __leaf__));
extern long int nrand48 (unsigned short int __xsubi[3])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern long int mrand48 (void) __attribute__ ((__nothrow__ , __leaf__));
extern long int jrand48 (unsigned short int __xsubi[3])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern void srand48 (long int __seedval) __attribute__ ((__nothrow__ , __leaf__));
extern unsigned short int *seed48 (unsigned short int __seed16v[3])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern void lcong48 (unsigned short int __param[7]) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));





struct drand48_data
  {
    unsigned short int __x[3];
    unsigned short int __old_x[3];
    unsigned short int __c;
    unsigned short int __init;
    __extension__ unsigned long long int __a;

  };


extern int drand48_r (struct drand48_data *__restrict __buffer,
        double *__restrict __result) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int erand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        double *__restrict __result) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int lrand48_r (struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int nrand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int mrand48_r (struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int jrand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int srand48_r (long int __seedval, struct drand48_data *__buffer)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));

extern int seed48_r (unsigned short int __seed16v[3],
       struct drand48_data *__buffer) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

extern int lcong48_r (unsigned short int __param[7],
        struct drand48_data *__buffer)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));









extern void *malloc (size_t __size) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) ;

extern void *calloc (size_t __nmemb, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) ;










extern void *realloc (void *__ptr, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));

extern void free (void *__ptr) __attribute__ ((__nothrow__ , __leaf__));




extern void cfree (void *__ptr) __attribute__ ((__nothrow__ , __leaf__));



# 1 "/usr/include/alloca.h" 1 3 4
# 24 "/usr/include/alloca.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h" 1 3 4
# 25 "/usr/include/alloca.h" 2 3 4







extern void *alloca (size_t __size) __attribute__ ((__nothrow__ , __leaf__));






# 493 "/usr/include/stdlib.h" 2 3 4





extern void *valloc (size_t __size) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) ;




extern int posix_memalign (void **__memptr, size_t __alignment, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;




extern void *aligned_alloc (size_t __alignment, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__alloc_size__ (2))) ;




extern void abort (void) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));



extern int atexit (void (*__func) (void)) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));







extern int at_quick_exit (void (*__func) (void)) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));







extern int on_exit (void (*__func) (int __status, void *__arg), void *__arg)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));






extern void exit (int __status) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));





extern void quick_exit (int __status) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));







extern void _Exit (int __status) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));






extern char *getenv (const char *__name) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;

# 578 "/usr/include/stdlib.h" 3 4
extern int putenv (char *__string) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));





extern int setenv (const char *__name, const char *__value, int __replace)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));


extern int unsetenv (const char *__name) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));






extern int clearenv (void) __attribute__ ((__nothrow__ , __leaf__));
# 606 "/usr/include/stdlib.h" 3 4
extern char *mktemp (char *__template) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
# 619 "/usr/include/stdlib.h" 3 4
extern int mkstemp (char *__template) __attribute__ ((__nonnull__ (1))) ;
# 641 "/usr/include/stdlib.h" 3 4
extern int mkstemps (char *__template, int __suffixlen) __attribute__ ((__nonnull__ (1))) ;
# 662 "/usr/include/stdlib.h" 3 4
extern char *mkdtemp (char *__template) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;
# 711 "/usr/include/stdlib.h" 3 4





extern int system (const char *__command) ;

# 733 "/usr/include/stdlib.h" 3 4
extern char *realpath (const char *__restrict __name,
         char *__restrict __resolved) __attribute__ ((__nothrow__ , __leaf__)) ;






typedef int (*__compar_fn_t) (const void *, const void *);
# 751 "/usr/include/stdlib.h" 3 4



extern void *bsearch (const void *__key, const void *__base,
        size_t __nmemb, size_t __size, __compar_fn_t __compar)
     __attribute__ ((__nonnull__ (1, 2, 5))) ;







extern void qsort (void *__base, size_t __nmemb, size_t __size,
     __compar_fn_t __compar) __attribute__ ((__nonnull__ (1, 4)));
# 774 "/usr/include/stdlib.h" 3 4
extern int abs (int __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;
extern long int labs (long int __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;



__extension__ extern long long int llabs (long long int __x)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;







extern div_t div (int __numer, int __denom)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;
extern ldiv_t ldiv (long int __numer, long int __denom)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;




__extension__ extern lldiv_t lldiv (long long int __numer,
        long long int __denom)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;

# 811 "/usr/include/stdlib.h" 3 4
extern char *ecvt (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4))) ;




extern char *fcvt (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4))) ;




extern char *gcvt (double __value, int __ndigit, char *__buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3))) ;




extern char *qecvt (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4))) ;
extern char *qfcvt (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4))) ;
extern char *qgcvt (long double __value, int __ndigit, char *__buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3))) ;




extern int ecvt_r (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign, char *__restrict __buf,
     size_t __len) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4, 5)));
extern int fcvt_r (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign, char *__restrict __buf,
     size_t __len) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4, 5)));

extern int qecvt_r (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign,
      char *__restrict __buf, size_t __len)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4, 5)));
extern int qfcvt_r (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign,
      char *__restrict __buf, size_t __len)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4, 5)));






extern int mblen (const char *__s, size_t __n) __attribute__ ((__nothrow__ , __leaf__));


extern int mbtowc (wchar_t *__restrict __pwc,
     const char *__restrict __s, size_t __n) __attribute__ ((__nothrow__ , __leaf__));


extern int wctomb (char *__s, wchar_t __wchar) __attribute__ ((__nothrow__ , __leaf__));



extern size_t mbstowcs (wchar_t *__restrict __pwcs,
   const char *__restrict __s, size_t __n) __attribute__ ((__nothrow__ , __leaf__));

extern size_t wcstombs (char *__restrict __s,
   const wchar_t *__restrict __pwcs, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__));








extern int rpmatch (const char *__response) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;
# 898 "/usr/include/stdlib.h" 3 4
extern int getsubopt (char **__restrict __optionp,
        char *const *__restrict __tokens,
        char **__restrict __valuep)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2, 3))) ;
# 950 "/usr/include/stdlib.h" 3 4
extern int getloadavg (double __loadavg[], int __nelem)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


# 1 "/usr/include/x86_64-linux-gnu/bits/stdlib-float.h" 1 3 4
# 955 "/usr/include/stdlib.h" 2 3 4
# 967 "/usr/include/stdlib.h" 3 4

# 145 "test_wrap.c" 2

# 1 "/usr/include/ctype.h" 1 3 4
# 28 "/usr/include/ctype.h" 3 4

# 46 "/usr/include/ctype.h" 3 4
enum
{
  _ISupper = ((0) < 8 ? ((1 << (0)) << 8) : ((1 << (0)) >> 8)),
  _ISlower = ((1) < 8 ? ((1 << (1)) << 8) : ((1 << (1)) >> 8)),
  _ISalpha = ((2) < 8 ? ((1 << (2)) << 8) : ((1 << (2)) >> 8)),
  _ISdigit = ((3) < 8 ? ((1 << (3)) << 8) : ((1 << (3)) >> 8)),
  _ISxdigit = ((4) < 8 ? ((1 << (4)) << 8) : ((1 << (4)) >> 8)),
  _ISspace = ((5) < 8 ? ((1 << (5)) << 8) : ((1 << (5)) >> 8)),
  _ISprint = ((6) < 8 ? ((1 << (6)) << 8) : ((1 << (6)) >> 8)),
  _ISgraph = ((7) < 8 ? ((1 << (7)) << 8) : ((1 << (7)) >> 8)),
  _ISblank = ((8) < 8 ? ((1 << (8)) << 8) : ((1 << (8)) >> 8)),
  _IScntrl = ((9) < 8 ? ((1 << (9)) << 8) : ((1 << (9)) >> 8)),
  _ISpunct = ((10) < 8 ? ((1 << (10)) << 8) : ((1 << (10)) >> 8)),
  _ISalnum = ((11) < 8 ? ((1 << (11)) << 8) : ((1 << (11)) >> 8))
};
# 79 "/usr/include/ctype.h" 3 4
extern const unsigned short int **__ctype_b_loc (void)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern const __int32_t **__ctype_tolower_loc (void)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern const __int32_t **__ctype_toupper_loc (void)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
# 104 "/usr/include/ctype.h" 3 4






extern int isalnum (int) __attribute__ ((__nothrow__ , __leaf__));
extern int isalpha (int) __attribute__ ((__nothrow__ , __leaf__));
extern int iscntrl (int) __attribute__ ((__nothrow__ , __leaf__));
extern int isdigit (int) __attribute__ ((__nothrow__ , __leaf__));
extern int islower (int) __attribute__ ((__nothrow__ , __leaf__));
extern int isgraph (int) __attribute__ ((__nothrow__ , __leaf__));
extern int isprint (int) __attribute__ ((__nothrow__ , __leaf__));
extern int ispunct (int) __attribute__ ((__nothrow__ , __leaf__));
extern int isspace (int) __attribute__ ((__nothrow__ , __leaf__));
extern int isupper (int) __attribute__ ((__nothrow__ , __leaf__));
extern int isxdigit (int) __attribute__ ((__nothrow__ , __leaf__));



extern int tolower (int __c) __attribute__ ((__nothrow__ , __leaf__));


extern int toupper (int __c) __attribute__ ((__nothrow__ , __leaf__));








extern int isblank (int) __attribute__ ((__nothrow__ , __leaf__));


# 150 "/usr/include/ctype.h" 3 4
extern int isascii (int __c) __attribute__ ((__nothrow__ , __leaf__));



extern int toascii (int __c) __attribute__ ((__nothrow__ , __leaf__));



extern int _toupper (int) __attribute__ ((__nothrow__ , __leaf__));
extern int _tolower (int) __attribute__ ((__nothrow__ , __leaf__));
# 257 "/usr/include/ctype.h" 3 4
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
# 258 "/usr/include/ctype.h" 2 3 4
# 271 "/usr/include/ctype.h" 3 4
extern int isalnum_l (int, __locale_t) __attribute__ ((__nothrow__ , __leaf__));
extern int isalpha_l (int, __locale_t) __attribute__ ((__nothrow__ , __leaf__));
extern int iscntrl_l (int, __locale_t) __attribute__ ((__nothrow__ , __leaf__));
extern int isdigit_l (int, __locale_t) __attribute__ ((__nothrow__ , __leaf__));
extern int islower_l (int, __locale_t) __attribute__ ((__nothrow__ , __leaf__));
extern int isgraph_l (int, __locale_t) __attribute__ ((__nothrow__ , __leaf__));
extern int isprint_l (int, __locale_t) __attribute__ ((__nothrow__ , __leaf__));
extern int ispunct_l (int, __locale_t) __attribute__ ((__nothrow__ , __leaf__));
extern int isspace_l (int, __locale_t) __attribute__ ((__nothrow__ , __leaf__));
extern int isupper_l (int, __locale_t) __attribute__ ((__nothrow__ , __leaf__));
extern int isxdigit_l (int, __locale_t) __attribute__ ((__nothrow__ , __leaf__));

extern int isblank_l (int, __locale_t) __attribute__ ((__nothrow__ , __leaf__));



extern int __tolower_l (int __c, __locale_t __l) __attribute__ ((__nothrow__ , __leaf__));
extern int tolower_l (int __c, __locale_t __l) __attribute__ ((__nothrow__ , __leaf__));


extern int __toupper_l (int __c, __locale_t __l) __attribute__ ((__nothrow__ , __leaf__));
extern int toupper_l (int __c, __locale_t __l) __attribute__ ((__nothrow__ , __leaf__));
# 347 "/usr/include/ctype.h" 3 4

# 147 "test_wrap.c" 2
# 324 "test_wrap.c"
# 1 "/usr/include/string.h" 1 3 4
# 27 "/usr/include/string.h" 3 4





# 1 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h" 1 3 4
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

# 162 "/usr/include/string.h" 3 4
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

# 325 "test_wrap.c" 2






# 330 "test_wrap.c"
typedef void *(*swig_converter_func)(void *, int *);
typedef struct swig_type_info *(*swig_dycast_func)(void **);


typedef struct swig_type_info {
  const char *name;
  const char *str;
  swig_dycast_func dcast;
  struct swig_cast_info *cast;
  void *clientdata;
  int owndata;
} swig_type_info;


typedef struct swig_cast_info {
  swig_type_info *type;
  swig_converter_func converter;
  struct swig_cast_info *next;
  struct swig_cast_info *prev;
} swig_cast_info;




typedef struct swig_module_info {
  swig_type_info **types;
  size_t size;
  struct swig_module_info *next;
  swig_type_info **type_initial;
  swig_cast_info **cast_initial;
  void *clientdata;
} swig_module_info;
# 370 "test_wrap.c"
static __attribute__ ((__unused__)) int
SWIG_TypeNameComp(const char *f1, const char *l1,
    const char *f2, const char *l2) {
  for (;(f1 != l1) && (f2 != l2); ++f1, ++f2) {
    while ((*f1 == ' ') && (f1 != l1)) ++f1;
    while ((*f2 == ' ') && (f2 != l2)) ++f2;
    if (*f1 != *f2) return (*f1 > *f2) ? 1 : -1;
  }
  return (int)((l1 - f1) - (l2 - f2));
}





static __attribute__ ((__unused__)) int
SWIG_TypeCmp(const char *nb, const char *tb) {
  int equiv = 1;
  const char* te = tb + strlen(tb);
  const char* ne = nb;
  while (equiv != 0 && *ne) {
    for (nb = ne; *ne; ++ne) {
      if (*ne == '|') break;
    }
    equiv = SWIG_TypeNameComp(nb, ne, tb, te);
    if (*ne) ++ne;
  }
  return equiv;
}





static __attribute__ ((__unused__)) int
SWIG_TypeEquiv(const char *nb, const char *tb) {
  return SWIG_TypeCmp(nb, tb) == 0 ? 1 : 0;
}




static __attribute__ ((__unused__)) swig_cast_info *
SWIG_TypeCheck(const char *c, swig_type_info *ty) {
  if (ty) {
    swig_cast_info *iter = ty->cast;
    while (iter) {
      if (strcmp(iter->type->name, c) == 0) {
        if (iter == ty->cast)
          return iter;

        iter->prev->next = iter->next;
        if (iter->next)
          iter->next->prev = iter->prev;
        iter->next = ty->cast;
        iter->prev = 0;
        if (ty->cast) ty->cast->prev = iter;
        ty->cast = iter;
        return iter;
      }
      iter = iter->next;
    }
  }
  return 0;
}




static __attribute__ ((__unused__)) swig_cast_info *
SWIG_TypeCheckStruct(swig_type_info *from, swig_type_info *ty) {
  if (ty) {
    swig_cast_info *iter = ty->cast;
    while (iter) {
      if (iter->type == from) {
        if (iter == ty->cast)
          return iter;

        iter->prev->next = iter->next;
        if (iter->next)
          iter->next->prev = iter->prev;
        iter->next = ty->cast;
        iter->prev = 0;
        if (ty->cast) ty->cast->prev = iter;
        ty->cast = iter;
        return iter;
      }
      iter = iter->next;
    }
  }
  return 0;
}




static __attribute__ ((__unused__)) inline void *
SWIG_TypeCast(swig_cast_info *ty, void *ptr, int *newmemory) {
  return ((!ty) || (!ty->converter)) ? ptr : (*ty->converter)(ptr, newmemory);
}




static __attribute__ ((__unused__)) swig_type_info *
SWIG_TypeDynamicCast(swig_type_info *ty, void **ptr) {
  swig_type_info *lastty = ty;
  if (!ty || !ty->dcast) return ty;
  while (ty && (ty->dcast)) {
    ty = (*ty->dcast)(ptr);
    if (ty) lastty = ty;
  }
  return lastty;
}




static __attribute__ ((__unused__)) inline const char *
SWIG_TypeName(const swig_type_info *ty) {
  return ty->name;
}





static __attribute__ ((__unused__)) const char *
SWIG_TypePrettyName(const swig_type_info *type) {




  if (!type) return 
# 503 "test_wrap.c" 3 4
                   ((void *)0)
# 503 "test_wrap.c"
                       ;
  if (type->str != 
# 504 "test_wrap.c" 3 4
                  ((void *)0)
# 504 "test_wrap.c"
                      ) {
    const char *last_name = type->str;
    const char *s;
    for (s = type->str; *s; s++)
      if (*s == '|') last_name = s+1;
    return last_name;
  }
  else
    return type->name;
}




static __attribute__ ((__unused__)) void
SWIG_TypeClientData(swig_type_info *ti, void *clientdata) {
  swig_cast_info *cast = ti->cast;

  ti->clientdata = clientdata;

  while (cast) {
    if (!cast->converter) {
      swig_type_info *tc = cast->type;
      if (!tc->clientdata) {
 SWIG_TypeClientData(tc, clientdata);
      }
    }
    cast = cast->next;
  }
}
static __attribute__ ((__unused__)) void
SWIG_TypeNewClientData(swig_type_info *ti, void *clientdata) {
  SWIG_TypeClientData(ti, clientdata);
  ti->owndata = 1;
}
# 548 "test_wrap.c"
static __attribute__ ((__unused__)) swig_type_info *
SWIG_MangledTypeQueryModule(swig_module_info *start,
                            swig_module_info *end,
              const char *name) {
  swig_module_info *iter = start;
  do {
    if (iter->size) {
      size_t l = 0;
      size_t r = iter->size - 1;
      do {

 size_t i = (l + r) >> 1;
 const char *iname = iter->types[i]->name;
 if (iname) {
   int compare = strcmp(name, iname);
   if (compare == 0) {
     return iter->types[i];
   } else if (compare < 0) {
     if (i) {
       r = i - 1;
     } else {
       break;
     }
   } else if (compare > 0) {
     l = i + 1;
   }
 } else {
   break;
 }
      } while (l <= r);
    }
    iter = iter->next;
  } while (iter != end);
  return 0;
}
# 593 "test_wrap.c"
static __attribute__ ((__unused__)) swig_type_info *
SWIG_TypeQueryModule(swig_module_info *start,
                     swig_module_info *end,
       const char *name) {

  swig_type_info *ret = SWIG_MangledTypeQueryModule(start, end, name);
  if (ret) {
    return ret;
  } else {


    swig_module_info *iter = start;
    do {
      size_t i = 0;
      for (; i < iter->size; ++i) {
 if (iter->types[i]->str && (SWIG_TypeEquiv(iter->types[i]->str, name)))
   return iter->types[i];
      }
      iter = iter->next;
    } while (iter != end);
  }


  return 0;
}




static __attribute__ ((__unused__)) char *
SWIG_PackData(char *c, void *ptr, size_t sz) {
  static const char hex[17] = "0123456789abcdef";
  const unsigned char *u = (unsigned char *) ptr;
  const unsigned char *eu = u + sz;
  for (; u != eu; ++u) {
    unsigned char uu = *u;
    *(c++) = hex[(uu & 0xf0) >> 4];
    *(c++) = hex[uu & 0xf];
  }
  return c;
}




static __attribute__ ((__unused__)) const char *
SWIG_UnpackData(const char *c, void *ptr, size_t sz) {
  unsigned char *u = (unsigned char *) ptr;
  const unsigned char *eu = u + sz;
  for (; u != eu; ++u) {
    char d = *(c++);
    unsigned char uu;
    if ((d >= '0') && (d <= '9'))
      uu = (unsigned char)((d - '0') << 4);
    else if ((d >= 'a') && (d <= 'f'))
      uu = (unsigned char)((d - ('a'-10)) << 4);
    else
      return (char *) 0;
    d = *(c++);
    if ((d >= '0') && (d <= '9'))
      uu |= (unsigned char)(d - '0');
    else if ((d >= 'a') && (d <= 'f'))
      uu |= (unsigned char)(d - ('a'-10));
    else
      return (char *) 0;
    *u = uu;
  }
  return c;
}




static __attribute__ ((__unused__)) char *
SWIG_PackVoidPtr(char *buff, void *ptr, const char *name, size_t bsz) {
  char *r = buff;
  if ((2*sizeof(void *) + 2) > bsz) return 0;
  *(r++) = '_';
  r = SWIG_PackData(r,&ptr,sizeof(void *));
  if (strlen(name) + 1 > (bsz - (r - buff))) return 0;
  strcpy(r,name);
  return buff;
}

static __attribute__ ((__unused__)) const char *
SWIG_UnpackVoidPtr(const char *c, void **ptr, const char *name) {
  if (*c != '_') {
    if (strcmp(c,"NULL") == 0) {
      *ptr = (void *) 0;
      return name;
    } else {
      return 0;
    }
  }
  return SWIG_UnpackData(++c,ptr,sizeof(void *));
}

static __attribute__ ((__unused__)) char *
SWIG_PackDataName(char *buff, void *ptr, size_t sz, const char *name, size_t bsz) {
  char *r = buff;
  size_t lname = (name ? strlen(name) : 0);
  if ((2*sz + 2 + lname) > bsz) return 0;
  *(r++) = '_';
  r = SWIG_PackData(r,ptr,sz);
  if (lname) {
    strncpy(r,name,lname+1);
  } else {
    *r = 0;
  }
  return buff;
}

static __attribute__ ((__unused__)) const char *
SWIG_UnpackDataName(const char *c, void *ptr, size_t sz, const char *name) {
  if (*c != '_') {
    if (strcmp(c,"NULL") == 0) {
      memset(ptr,0,sz);
      return name;
    } else {
      return 0;
    }
  }
  return SWIG_UnpackData(++c,ptr,sz);
}
# 743 "test_wrap.c"
static __attribute__ ((__unused__)) const char*
SWIG_Tcl_ErrorType(int code) {
  const char* type = 0;
  switch(code) {
  case -12:
    type = "MemoryError";
    break;
  case -2:
    type = "IOError";
    break;
  case -3:
    type = "RuntimeError";
    break;
  case -4:
    type = "IndexError";
    break;
  case -5:
    type = "TypeError";
    break;
  case -6:
    type = "ZeroDivisionError";
    break;
  case -7:
    type = "OverflowError";
    break;
  case -8:
    type = "SyntaxError";
    break;
  case -9:
    type = "ValueError";
    break;
  case -10:
    type = "SystemError";
    break;
  case -11:
    type = "AttributeError";
    break;
  default:
    type = "RuntimeError";
  }
  return type;
}


static __attribute__ ((__unused__)) void
SWIG_Tcl_SetErrorObj(Tcl_Interp *interp, const char *ctype, Tcl_Obj *obj)
{
  Tcl_ResetResult(interp);
  Tcl_SetObjResult(interp, obj);
  Tcl_SetErrorCode(interp, "SWIG", ctype, 
# 792 "test_wrap.c" 3 4
                                         ((void *)0)
# 792 "test_wrap.c"
                                             );
}

static __attribute__ ((__unused__)) void
SWIG_Tcl_SetErrorMsg(Tcl_Interp *interp, const char *ctype, const char *mesg)
{
  Tcl_ResetResult(interp);
  Tcl_SetErrorCode(interp, "SWIG", ctype, 
# 799 "test_wrap.c" 3 4
                                         ((void *)0)
# 799 "test_wrap.c"
                                             );
  Tcl_AppendResult(interp, ctype, " ", mesg, 
# 800 "test_wrap.c" 3 4
                                            ((void *)0)
# 800 "test_wrap.c"
                                                );





}

static __attribute__ ((__unused__)) inline void
SWIG_Tcl_AddErrorMsg(Tcl_Interp *interp, const char* mesg)
{
  Tcl_AddErrorInfo(interp, mesg);
}
# 832 "test_wrap.c"
typedef struct swig_const_info {
    int type;
    const char *name;
    long lvalue;
    double dvalue;
    void *pvalue;
    swig_type_info **ptype;
} swig_const_info;

typedef int (*swig_wrapper)(ClientData, Tcl_Interp *, int, Tcl_Obj *const []);
typedef int (*swig_wrapper_func)(ClientData, Tcl_Interp *, int, Tcl_Obj *const []);
typedef char *(*swig_variable_func)(ClientData, Tcl_Interp *, char *, char *, int);
typedef void (*swig_delete_func)(ClientData);

typedef struct swig_method {
  const char *name;
  swig_wrapper method;
} swig_method;

typedef struct swig_attribute {
  const char *name;
  swig_wrapper getmethod;
  swig_wrapper setmethod;
} swig_attribute;

typedef struct swig_class {
  const char *name;
  swig_type_info **type;
  swig_wrapper constructor;
  void (*destructor)(void *);
  swig_method *methods;
  swig_attribute *attributes;
  struct swig_class **bases;
  const char **base_names;
  swig_module_info *module;
  Tcl_HashTable hashtable;
} swig_class;

typedef struct swig_instance {
  Tcl_Obj *thisptr;
  void *thisvalue;
  swig_class *classptr;
  int destroy;
  Tcl_Command cmdtok;
} swig_instance;


typedef struct {
  const char *name;
  int (*wrapper)(ClientData, Tcl_Interp *, int, Tcl_Obj *const []);
  ClientData clientdata;
} swig_command_info;


typedef struct {
  const char *name;
  void *addr;
  char * (*get)(ClientData, Tcl_Interp *, char *, char *, int);
  char * (*set)(ClientData, Tcl_Interp *, char *, char *, int);
} swig_var_info;






static Tcl_HashTable swigconstTable;
static int swigconstTableinit = 0;

static __attribute__ ((__unused__)) void
SWIG_Tcl_SetConstantObj(Tcl_Interp *interp, const char* name, Tcl_Obj *obj) {
  int newobj;
  Tcl_ObjSetVar2(interp,Tcl_NewStringObj(name,-1), 
# 904 "test_wrap.c" 3 4
                                                  ((void *)0)
# 904 "test_wrap.c"
                                                      , obj, 1);
  (((*((&swigconstTable)->createProc))(&swigconstTable, (const char *)(name), &newobj))->clientData = (ClientData) ((ClientData) obj));
}

static __attribute__ ((__unused__)) Tcl_Obj *
SWIG_Tcl_GetConstantObj(const char *key) {
  Tcl_HashEntry *entryPtr;
  if (!swigconstTableinit) return 0;
  entryPtr = (*((&swigconstTable)->findProc))(&swigconstTable, (const char *)(key));
  if (entryPtr) {
    return (Tcl_Obj *) ((entryPtr)->clientData);
  }
  return 0;
}
# 1000 "test_wrap.c"
# 1 "/usr/include/assert.h" 1 3 4
# 66 "/usr/include/assert.h" 3 4




# 69 "/usr/include/assert.h" 3 4
extern void __assert_fail (const char *__assertion, const char *__file,
      unsigned int __line, const char *__function)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));


extern void __assert_perror_fail (int __errnum, const char *__file,
      unsigned int __line, const char *__function)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));




extern void __assert (const char *__assertion, const char *__file, int __line)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));



# 1001 "test_wrap.c" 2








# 1008 "test_wrap.c"
static __attribute__ ((__unused__)) Tcl_HashTable*
SWIG_Tcl_ObjectTable(void) {
  static Tcl_HashTable swigobjectTable;
  static int swigobjectTableinit = 0;
  if (!swigobjectTableinit) {
    Tcl_InitHashTable(&swigobjectTable, (1));
    swigobjectTableinit = 1;
  }
  return &swigobjectTable;
}


static __attribute__ ((__unused__)) void
SWIG_Tcl_Acquire(void *ptr) {
  int newobj;
  (*((SWIG_Tcl_ObjectTable())->createProc))(SWIG_Tcl_ObjectTable(), (const char *)((char *) ptr), &newobj);
}

static __attribute__ ((__unused__)) int
SWIG_Tcl_Thisown(void *ptr) {
  if ((*((SWIG_Tcl_ObjectTable())->findProc))(SWIG_Tcl_ObjectTable(), (const char *)((char *) ptr))) {
    return 1;
  }
  return 0;
}


static __attribute__ ((__unused__)) int
SWIG_Tcl_Disown(void *ptr) {
  Tcl_HashEntry *entryPtr = (*((SWIG_Tcl_ObjectTable())->findProc))(SWIG_Tcl_ObjectTable(), (const char *)((char *) ptr));
  if (entryPtr) {
    Tcl_DeleteHashEntry(entryPtr);
    return 1;
  }
  return 0;
}


static __attribute__ ((__unused__)) int
SWIG_Tcl_ConvertPtrFromString(Tcl_Interp *interp, const char *c, void **ptr, swig_type_info *ty, int flags) {
  swig_cast_info *tc;

  while (*c != '_') {
    *ptr = (void *) 0;
    if (strcmp(c,"NULL") == 0)
      return (flags & 0x4) ? -13 : (0);


    if (*c == 0) return (-1);





    if (Tcl_VarEval(interp,"info commands ", c, (char *) 
# 1062 "test_wrap.c" 3 4
                                                        ((void *)0)
# 1062 "test_wrap.c"
                                                            ) == 0) {
      Tcl_Obj *result = Tcl_GetObjResult(interp);
      if (*(Tcl_GetStringFromObj(result, 
# 1064 "test_wrap.c" 3 4
                                        ((void *)0)
# 1064 "test_wrap.c"
                                            )) == 0) {

        Tcl_ResetResult(interp);
        return (-1);
      }
    } else {


      Tcl_ResetResult(interp);
      return (-1);
    }


    if (Tcl_VarEval(interp,c," cget -this", (char *) 
# 1077 "test_wrap.c" 3 4
                                                    ((void *)0)
# 1077 "test_wrap.c"
                                                        ) != 0) {
      Tcl_ResetResult(interp);
      return (-1);
    }

    c = Tcl_GetStringFromObj(Tcl_GetObjResult(interp), 
# 1082 "test_wrap.c" 3 4
                                                      ((void *)0)
# 1082 "test_wrap.c"
                                                          );
  }

  c++;
  c = SWIG_UnpackData(c,ptr,sizeof(void *));
  if (ty) {
    tc = c ? SWIG_TypeCheck(c,ty) : 0;
    if (!tc) {
      return (-1);
    }
    if (flags & 0x1) {
      SWIG_Tcl_Disown((void *) *ptr);
    }
    {
      int newmemory = 0;
      *ptr = SWIG_TypeCast(tc,(void *) *ptr,&newmemory);
      
# 1098 "test_wrap.c" 3 4
     ((
# 1098 "test_wrap.c"
     !newmemory
# 1098 "test_wrap.c" 3 4
     ) ? (void) (0) : __assert_fail (
# 1098 "test_wrap.c"
     "!newmemory"
# 1098 "test_wrap.c" 3 4
     , "test_wrap.c", 1098, __PRETTY_FUNCTION__))
# 1098 "test_wrap.c"
                       ;
    }
  }
  return (0);
}


static __attribute__ ((__unused__)) inline int
SWIG_Tcl_ConvertPtr(Tcl_Interp *interp, Tcl_Obj *oc, void **ptr, swig_type_info *ty, int flags) {
  return SWIG_Tcl_ConvertPtrFromString(interp, Tcl_GetStringFromObj(oc,
# 1107 "test_wrap.c" 3 4
                                                                      ((void *)0)
# 1107 "test_wrap.c"
                                                                          ), ptr, ty, flags);
}


static __attribute__ ((__unused__)) char *
SWIG_Tcl_PointerTypeFromString(char *c) {
  char d;

  if (*c != '_') {
    return 0;
  }
  c++;

  while ((d = *c)) {
    if (!(((d >= '0') && (d <= '9')) || ((d >= 'a') && (d <= 'f')))) break;
    c++;
  }
  return c;
}


static __attribute__ ((__unused__)) int
SWIG_Tcl_ConvertPacked(Tcl_Interp *interp __attribute__ ((__unused__)) , Tcl_Obj *obj, void *ptr, int sz, swig_type_info *ty) {
  swig_cast_info *tc;
  const char *c;

  if (!obj) goto type_error;
  c = Tcl_GetStringFromObj(obj,
# 1134 "test_wrap.c" 3 4
                              ((void *)0)
# 1134 "test_wrap.c"
                                  );

  if (*c != '_') goto type_error;
  c++;
  c = SWIG_UnpackData(c,ptr,sz);
  if (ty) {
    tc = SWIG_TypeCheck(c,ty);
    if (!tc) goto type_error;
  }
  return (0);

 type_error:

  return (-1);
}



static __attribute__ ((__unused__)) void
SWIG_Tcl_MakePtr(char *c, void *ptr, swig_type_info *ty, int flags __attribute__ ((__unused__))) {
  if (ptr) {
    *(c++) = '_';
    c = SWIG_PackData(c,&ptr,sizeof(void *));
    strcpy(c,ty->name);
  } else {
    strcpy(c,"NULL");
  }
}


static __attribute__ ((__unused__)) inline Tcl_Obj *
SWIG_Tcl_NewPointerObj(void *ptr, swig_type_info *type, int flags) {
  Tcl_Obj *robj;
  char result[1024];
  SWIG_Tcl_MakePtr(result, ptr, type, flags);
  robj = Tcl_NewStringObj(result,-1);
  return robj;
}

static __attribute__ ((__unused__)) Tcl_Obj *
SWIG_Tcl_NewPackedObj(void *ptr, int sz, swig_type_info *type) {
  char result[1024];
  char *r = result;
  if ((2*sz + 1 + strlen(type->name)) > 1000) return 0;
  *(r++) = '_';
  r = SWIG_PackData(r,ptr,sz);
  strcpy(r,type->name);
  return Tcl_NewStringObj(result,-1);
}





static __attribute__ ((__unused__)) swig_module_info *
SWIG_Tcl_GetModule(Tcl_Interp *interp) {
  const char *data;
  swig_module_info *ret = 0;


  data = Tcl_GetVar2(interp, (char *)"swig_runtime_data_type_pointer" "4" , 
# 1194 "test_wrap.c" 3 4
        ((void *)0)
# 1194 "test_wrap.c"
        , 1);
  if (data) {
    SWIG_UnpackData(data, &ret, sizeof(swig_type_info **));
  }

  return ret;
}

static __attribute__ ((__unused__)) void
SWIG_Tcl_SetModule(Tcl_Interp *interp, swig_module_info *module) {
  char buf[1024];
  char *data;


  data = SWIG_PackData(buf, &module, sizeof(swig_type_info **));
  *data = 0;
  Tcl_SetVar2(interp, (char *)"swig_runtime_data_type_pointer" "4" , 
# 1210 "test_wrap.c" 3 4
 ((void *)0)
# 1210 "test_wrap.c"
 , buf, 1);
}






static __attribute__ ((__unused__)) void
SWIG_Tcl_ObjectDelete(ClientData clientData) {
  swig_instance *si = (swig_instance *) clientData;
  if (!si) return;
  if (si->destroy && SWIG_Tcl_Disown(si->thisvalue)) {
    if (si->classptr->destructor) {
      (si->classptr->destructor)(si->thisvalue);
    }
  }
  do { Tcl_Obj *_objPtr = (si->thisptr); if ((_objPtr)->refCount-- <= 1) { TclFreeObj(_objPtr); } } while(0);
  free(si);
}


static __attribute__ ((__unused__)) int
SWIG_Tcl_MethodCommand(ClientData clientData, Tcl_Interp *interp, int objc, Tcl_Obj *const _objv[]) {
  char *method, *attrname;
  swig_instance *inst = (swig_instance *) clientData;
  swig_method *meth;
  swig_attribute *attr;
  Tcl_Obj *oldarg;
  Tcl_Obj **objv;
  int rcode;
  swig_class *cls;
  swig_class *cls_stack[64];
  int cls_stack_bi[64];
  int cls_stack_top = 0;
  int numconf = 2;
  int bi;

  objv = (Tcl_Obj **) _objv;
  if (objc < 2) {
    Tcl_SetResult(interp, (char *) "wrong # args.", ((Tcl_FreeProc *) 0));
    return 1;
  }
  method = Tcl_GetStringFromObj(objv[1],
# 1253 "test_wrap.c" 3 4
                                       ((void *)0)
# 1253 "test_wrap.c"
                                           );
  if (strcmp(method,"-acquire") == 0) {
    inst->destroy = 1;
    SWIG_Tcl_Acquire(inst->thisvalue);
    return 0;
  }
  if (strcmp(method,"-disown") == 0) {
    if (inst->destroy) {
      SWIG_Tcl_Disown(inst->thisvalue);
    }
    inst->destroy = 0;
    return 0;
  }
  if (strcmp(method,"-delete") == 0) {
    Tcl_DeleteCommandFromToken(interp,inst->cmdtok);
    return 0;
  }
  cls_stack[cls_stack_top] = inst->classptr;
  cls_stack_bi[cls_stack_top] = -1;
  while (1) {
    Tcl_HashEntry* hashentry;
    bi = cls_stack_bi[cls_stack_top];
    cls = cls_stack[cls_stack_top];
    if (bi != -1) {
      if (!cls->bases[bi] && cls->base_names[bi]) {

 swig_type_info *info = SWIG_TypeQueryModule(cls->module, cls->module, cls->base_names[bi]);
 if (info) cls->bases[bi] = (swig_class *) info->clientdata;
      }
      cls = cls->bases[bi];
      if (cls) {
        cls_stack_bi[cls_stack_top]++;
        cls_stack_top++;
        cls_stack[cls_stack_top] = cls;
        cls_stack_bi[cls_stack_top] = -1;
        continue;
      }
    }
    if (!cls) {
      cls_stack_top--;
      if (cls_stack_top < 0) break;
      else continue;
    }
    cls_stack_bi[cls_stack_top]++;

    hashentry = (*((&(cls->hashtable))->findProc))(&(cls->hashtable), (const char *)(method));
    if (hashentry) {
        ClientData cd = ((hashentry)->clientData);
        swig_wrapper method_wrapper = (swig_wrapper)cd;
        oldarg = objv[1];
        objv[1] = inst->thisptr;
        ++(inst->thisptr)->refCount;
        rcode = (method_wrapper)(clientData,interp,objc,objv);
        objv[1] = oldarg;
        do { Tcl_Obj *_objPtr = (inst->thisptr); if ((_objPtr)->refCount-- <= 1) { TclFreeObj(_objPtr); } } while(0);
        return rcode;
    }

    if (strcmp(method,"cget") == 0) {
      if (objc < 3) {
        Tcl_SetResult(interp, (char *) "wrong # args.", ((Tcl_FreeProc *) 0));
        return 1;
      }
      attrname = Tcl_GetStringFromObj(objv[2],
# 1316 "test_wrap.c" 3 4
                                             ((void *)0)
# 1316 "test_wrap.c"
                                                 );
      attr = cls->attributes;
      while (attr && attr->name) {
        if ((strcmp(attr->name, attrname) == 0) && (attr->getmethod)) {
          oldarg = objv[1];
          objv[1] = inst->thisptr;
          ++(inst->thisptr)->refCount;
          rcode = (*attr->getmethod)(clientData,interp,2, objv);
          objv[1] = oldarg;
          do { Tcl_Obj *_objPtr = (inst->thisptr); if ((_objPtr)->refCount-- <= 1) { TclFreeObj(_objPtr); } } while(0);
          return rcode;
        }
        attr++;
      }
      if (strcmp(attrname, "-this") == 0) {
        Tcl_SetObjResult(interp, Tcl_DuplicateObj(inst->thisptr));
        return 0;
      }
      if (strcmp(attrname, "-thisown") == 0) {
        if (SWIG_Tcl_Thisown(inst->thisvalue)) {
          Tcl_SetResult(interp,(char*)"1",((Tcl_FreeProc *) 0));
        } else {
          Tcl_SetResult(interp,(char*)"0",((Tcl_FreeProc *) 0));
        }
        return 0;
      }
    } else if (strcmp(method, "configure") == 0) {
      int i;
      if (objc < 4) {
        Tcl_SetResult(interp, (char *) "wrong # args.", ((Tcl_FreeProc *) 0));
        return 1;
      }
      i = 2;
      while (i < objc) {
        attrname = Tcl_GetStringFromObj(objv[i],
# 1350 "test_wrap.c" 3 4
                                               ((void *)0)
# 1350 "test_wrap.c"
                                                   );
        attr = cls->attributes;
        while (attr && attr->name) {
          if ((strcmp(attr->name, attrname) == 0) && (attr->setmethod)) {
            oldarg = objv[i];
            objv[i] = inst->thisptr;
            ++(inst->thisptr)->refCount;
            rcode = (*attr->setmethod)(clientData,interp,3, &objv[i-1]);
            objv[i] = oldarg;
            do { Tcl_Obj *_objPtr = (inst->thisptr); if ((_objPtr)->refCount-- <= 1) { TclFreeObj(_objPtr); } } while(0);
            if (rcode != 0) return rcode;
            numconf += 2;
          }
          attr++;
        }
        i+=2;
      }
    }
  }
  if (strcmp(method,"configure") == 0) {
    if (numconf >= objc) {
      return 0;
    } else {
      Tcl_SetResult(interp,(char *) "Invalid attribute name.", ((Tcl_FreeProc *) 0));
      return 1;
    }
  }
  if (strcmp(method,"cget") == 0) {
    Tcl_SetResult(interp,(char *) "Invalid attribute name.", ((Tcl_FreeProc *) 0));
    return 1;
  }
  Tcl_SetResult(interp, (char *) "Invalid method. Must be one of: configure cget -acquire -disown -delete", ((Tcl_FreeProc *) 0));
  cls = inst->classptr;
  bi = 0;
  while (cls) {
    meth = cls->methods;
    while (meth && meth->name) {
      char *cr = (char *) Tcl_GetStringResult(interp);
      size_t meth_len = strlen(meth->name);
      char* where = strchr(cr,':');
      while(where) {
        where = strstr(where, meth->name);
        if(where) {
          if(where[-1] == ' ' && (where[meth_len] == ' ' || where[meth_len]==0)) {
            break;
          } else {
            where++;
          }
        }
      }

      if (!where)
        Tcl_AppendElement(interp, (char *) meth->name);
      meth++;
    }
    cls = inst->classptr->bases[bi++];
  }
  return 1;
}


static __attribute__ ((__unused__)) Tcl_Obj *
SWIG_Tcl_NewInstanceObj(Tcl_Interp *interp, void *thisvalue, swig_type_info *type, int flags) {
  Tcl_Obj *robj = SWIG_Tcl_NewPointerObj(thisvalue, type, 0);

  if (thisvalue && (type->clientdata) && (interp)) {
    Tcl_CmdInfo ci;
    char *name;
    name = Tcl_GetStringFromObj(robj,
# 1418 "test_wrap.c" 3 4
                                    ((void *)0)
# 1418 "test_wrap.c"
                                        );
    if (!Tcl_GetCommandInfo(interp,name, &ci) || (flags)) {
      swig_instance *newinst = (swig_instance *) malloc(sizeof(swig_instance));
      newinst->thisptr = Tcl_DuplicateObj(robj);
      ++(newinst->thisptr)->refCount;
      newinst->thisvalue = thisvalue;
      newinst->classptr = (swig_class *) type->clientdata;
      newinst->destroy = flags;
      newinst->cmdtok = Tcl_CreateObjCommand(interp, Tcl_GetStringFromObj(robj,
# 1426 "test_wrap.c" 3 4
                                                                              ((void *)0)
# 1426 "test_wrap.c"
                                                                                  ), (swig_wrapper_func) SWIG_Tcl_MethodCommand, (ClientData) newinst, (swig_delete_func) SWIG_Tcl_ObjectDelete);
      if (flags) {
        SWIG_Tcl_Acquire(thisvalue);
      }
    }
  }
  return robj;
}


static __attribute__ ((__unused__)) int
SWIG_Tcl_ObjectConstructor(ClientData clientData, Tcl_Interp *interp, int objc, Tcl_Obj *const objv[]) {
  Tcl_Obj *newObj = 0;
  void *thisvalue = 0;
  swig_instance *newinst = 0;
  swig_class *classptr = (swig_class *) clientData;
  swig_wrapper cons = 0;
  char *name = 0;
  int firstarg = 0;
  int thisarg = 0;
  int destroy = 1;

  if (!classptr) {
    Tcl_SetResult(interp, (char *) "swig: internal runtime error. No class object defined.", ((Tcl_FreeProc *) 0));
    return 1;
  }
  cons = classptr->constructor;
  if (objc > 1) {
    char *s = Tcl_GetStringFromObj(objv[1],
# 1454 "test_wrap.c" 3 4
                                          ((void *)0)
# 1454 "test_wrap.c"
                                              );
    if (strcmp(s,"-this") == 0) {
      thisarg = 2;
      cons = 0;
    } else if (strcmp(s,"-args") == 0) {
      firstarg = 1;
    } else if (objc == 2) {
      firstarg = 1;
      name = s;
    } else if (objc >= 3) {
      char *s1;
      name = s;
      s1 = Tcl_GetStringFromObj(objv[2],
# 1466 "test_wrap.c" 3 4
                                       ((void *)0)
# 1466 "test_wrap.c"
                                           );
      if (strcmp(s1,"-this") == 0) {
 thisarg = 3;
 cons = 0;
      } else {
 firstarg = 1;
      }
    }
  }
  if (cons) {
    int result;
    result = (*cons)(0, interp, objc-firstarg, &objv[firstarg]);
    if (result != 0) {
      return result;
    }
    newObj = Tcl_DuplicateObj(Tcl_GetObjResult(interp));
    if (!name) name = Tcl_GetStringFromObj(newObj,
# 1482 "test_wrap.c" 3 4
                                                 ((void *)0)
# 1482 "test_wrap.c"
                                                     );
  } else if (thisarg > 0) {
    if (thisarg < objc) {
      destroy = 0;
      newObj = Tcl_DuplicateObj(objv[thisarg]);
      if (!name) name = Tcl_GetStringFromObj(newObj,
# 1487 "test_wrap.c" 3 4
                                                   ((void *)0)
# 1487 "test_wrap.c"
                                                       );
    } else {
      Tcl_SetResult(interp, (char *) "wrong # args.", ((Tcl_FreeProc *) 0));
      return 1;
    }
  } else {
    Tcl_SetResult(interp, (char *) "No constructor available.", ((Tcl_FreeProc *) 0));
    return 1;
  }
  if (SWIG_Tcl_ConvertPtr(interp,newObj, (void **) &thisvalue, *(classptr->type), 0) != (0)) {
    do { Tcl_Obj *_objPtr = (newObj); if ((_objPtr)->refCount-- <= 1) { TclFreeObj(_objPtr); } } while(0);
    return 1;
  }
  newinst = (swig_instance *) malloc(sizeof(swig_instance));
  newinst->thisptr = newObj;
  ++(newObj)->refCount;
  newinst->thisvalue = thisvalue;
  newinst->classptr = classptr;
  newinst->destroy = destroy;
  if (destroy) {
    SWIG_Tcl_Acquire(thisvalue);
  }
  newinst->cmdtok = Tcl_CreateObjCommand(interp,name, (swig_wrapper) SWIG_Tcl_MethodCommand, (ClientData) newinst, (swig_delete_func) SWIG_Tcl_ObjectDelete);
  return 0;
}




static __attribute__ ((__unused__)) int
SWIG_Tcl_GetArgs(Tcl_Interp *interp, int objc, Tcl_Obj *const objv[], const char *fmt, ...) {
  int argno = 0, opt = 0;
  long tempi;
  double tempd;
  const char *c;
  va_list ap;
  void *vptr;
  Tcl_Obj *obj = 0;
  swig_type_info *ty;

  
# 1527 "test_wrap.c" 3 4
 __builtin_va_start(
# 1527 "test_wrap.c"
 ap
# 1527 "test_wrap.c" 3 4
 ,
# 1527 "test_wrap.c"
 fmt
# 1527 "test_wrap.c" 3 4
 )
# 1527 "test_wrap.c"
                 ;
  for (c = fmt; (*c && (*c != ':') && (*c != ';')); c++,argno++) {
    if (*c == '|') {
      opt = 1;
      c++;
    }
    if (argno >= (objc-1)) {
      if (!opt) {
        Tcl_SetResult(interp, (char *) "Wrong number of arguments ", ((Tcl_FreeProc *) 0));
        goto argerror;
      } else {
        
# 1538 "test_wrap.c" 3 4
       __builtin_va_end(
# 1538 "test_wrap.c"
       ap
# 1538 "test_wrap.c" 3 4
       )
# 1538 "test_wrap.c"
                 ;
        return 0;
      }
    }

    vptr = 
# 1543 "test_wrap.c" 3 4
          __builtin_va_arg(
# 1543 "test_wrap.c"
          ap
# 1543 "test_wrap.c" 3 4
          ,
# 1543 "test_wrap.c"
          void *
# 1543 "test_wrap.c" 3 4
          )
# 1543 "test_wrap.c"
                           ;
    if (vptr) {
      if (
# 1545 "test_wrap.c" 3 4
         ((*__ctype_b_loc ())[(int) ((
# 1545 "test_wrap.c"
         *c
# 1545 "test_wrap.c" 3 4
         ))] & (unsigned short int) _ISupper)
# 1545 "test_wrap.c"
                    ) {
        obj = SWIG_Tcl_GetConstantObj(Tcl_GetStringFromObj(objv[argno+1],0));
        if (!obj) obj = objv[argno+1];
      } else {
        obj = objv[argno+1];
      }
      switch(*c) {
      case 'i': case 'I':
      case 'l': case 'L':
      case 'h': case 'H':
      case 'b': case 'B':
        if (Tcl_GetLongFromObj(interp,obj,&tempi) != 0) goto argerror;
        if ((*c == 'i') || (*c == 'I')) *((int *)vptr) = (int)tempi;
        else if ((*c == 'l') || (*c == 'L')) *((long *)vptr) = (long)tempi;
        else if ((*c == 'h') || (*c == 'H')) *((short*)vptr) = (short)tempi;
        else if ((*c == 'b') || (*c == 'B')) *((unsigned char *)vptr) = (unsigned char)tempi;
        break;
      case 'f': case 'F':
      case 'd': case 'D':
        if (Tcl_GetDoubleFromObj(interp,obj,&tempd) != 0) goto argerror;
        if ((*c == 'f') || (*c == 'F')) *((float *) vptr) = (float)tempd;
        else if ((*c == 'd') || (*c == 'D')) *((double*) vptr) = tempd;
        break;
      case 's': case 'S':
        if (*(c+1) == '#') {
          int *vlptr = (int *) 
# 1570 "test_wrap.c" 3 4
                              __builtin_va_arg(
# 1570 "test_wrap.c"
                              ap
# 1570 "test_wrap.c" 3 4
                              ,
# 1570 "test_wrap.c"
                              void *
# 1570 "test_wrap.c" 3 4
                              )
# 1570 "test_wrap.c"
                                                ;
          *((char **) vptr) = Tcl_GetStringFromObj(obj, vlptr);
          c++;
        } else {
          *((char **)vptr) = Tcl_GetStringFromObj(obj,
# 1574 "test_wrap.c" 3 4
                                                     ((void *)0)
# 1574 "test_wrap.c"
                                                         );
        }
        break;
      case 'c': case 'C':
        *((char *)vptr) = *(Tcl_GetStringFromObj(obj,
# 1578 "test_wrap.c" 3 4
                                                    ((void *)0)
# 1578 "test_wrap.c"
                                                        ));
        break;
      case 'p': case 'P':
        ty = (swig_type_info *) 
# 1581 "test_wrap.c" 3 4
                               __builtin_va_arg(
# 1581 "test_wrap.c"
                               ap
# 1581 "test_wrap.c" 3 4
                               ,
# 1581 "test_wrap.c"
                               void *
# 1581 "test_wrap.c" 3 4
                               )
# 1581 "test_wrap.c"
                                                 ;
        if (SWIG_Tcl_ConvertPtr(interp, obj, (void **) vptr, ty, 0) != (0)) goto argerror;
        break;
      case 'o': case 'O':
        *((Tcl_Obj **)vptr) = objv[argno+1];
        break;
      default:
        break;
      }
    }
  }

  if ((*c != ';') && ((objc-1) > argno)) {
    Tcl_SetResult(interp, (char *) "Wrong # args.", ((Tcl_FreeProc *) 0));
    goto argerror;
  }
  
# 1597 "test_wrap.c" 3 4
 __builtin_va_end(
# 1597 "test_wrap.c"
 ap
# 1597 "test_wrap.c" 3 4
 )
# 1597 "test_wrap.c"
           ;
  return 0;

 argerror:
  {
    char temp[32];
    sprintf(temp,"%d", argno+1);
    c = strchr(fmt,':');
    if (!c) c = strchr(fmt,';');
    if (!c) c = (char *)"";
    Tcl_AppendResult(interp,c," argument ", temp, 
# 1607 "test_wrap.c" 3 4
                                                 ((void *)0)
# 1607 "test_wrap.c"
                                                     );
    
# 1608 "test_wrap.c" 3 4
   __builtin_va_end(
# 1608 "test_wrap.c"
   ap
# 1608 "test_wrap.c" 3 4
   )
# 1608 "test_wrap.c"
             ;
    return 1;
  }
}
# 1634 "test_wrap.c"
static swig_type_info *swig_types[8];
static swig_module_info swig_module = {swig_types, 7, 0, 0, 0, 0};
# 1661 "test_wrap.c"
__attribute__ ((visibility("default"))) int Tclsharedmem_Init(Tcl_Interp *);
# 1676 "test_wrap.c"
# 1 "queue.h" 1


# 1 "/usr/include/unistd.h" 1 3 4
# 27 "/usr/include/unistd.h" 3 4

# 205 "/usr/include/unistd.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/posix_opt.h" 1 3 4
# 206 "/usr/include/unistd.h" 2 3 4



# 1 "/usr/include/x86_64-linux-gnu/bits/environments.h" 1 3 4
# 22 "/usr/include/x86_64-linux-gnu/bits/environments.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 23 "/usr/include/x86_64-linux-gnu/bits/environments.h" 2 3 4
# 210 "/usr/include/unistd.h" 2 3 4
# 229 "/usr/include/unistd.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h" 1 3 4
# 230 "/usr/include/unistd.h" 2 3 4
# 258 "/usr/include/unistd.h" 3 4

# 258 "/usr/include/unistd.h" 3 4
typedef __useconds_t useconds_t;
# 270 "/usr/include/unistd.h" 3 4
typedef __intptr_t intptr_t;






typedef __socklen_t socklen_t;
# 290 "/usr/include/unistd.h" 3 4
extern int access (const char *__name, int __type) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
# 307 "/usr/include/unistd.h" 3 4
extern int faccessat (int __fd, const char *__file, int __type, int __flag)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2))) ;
# 337 "/usr/include/unistd.h" 3 4
extern __off_t lseek (int __fd, __off_t __offset, int __whence) __attribute__ ((__nothrow__ , __leaf__));
# 356 "/usr/include/unistd.h" 3 4
extern int close (int __fd);






extern ssize_t read (int __fd, void *__buf, size_t __nbytes) ;





extern ssize_t write (int __fd, const void *__buf, size_t __n) ;
# 379 "/usr/include/unistd.h" 3 4
extern ssize_t pread (int __fd, void *__buf, size_t __nbytes,
        __off_t __offset) ;






extern ssize_t pwrite (int __fd, const void *__buf, size_t __n,
         __off_t __offset) ;
# 420 "/usr/include/unistd.h" 3 4
extern int pipe (int __pipedes[2]) __attribute__ ((__nothrow__ , __leaf__)) ;
# 435 "/usr/include/unistd.h" 3 4
extern unsigned int alarm (unsigned int __seconds) __attribute__ ((__nothrow__ , __leaf__));
# 447 "/usr/include/unistd.h" 3 4
extern unsigned int sleep (unsigned int __seconds);







extern __useconds_t ualarm (__useconds_t __value, __useconds_t __interval)
     __attribute__ ((__nothrow__ , __leaf__));






extern int usleep (__useconds_t __useconds);
# 472 "/usr/include/unistd.h" 3 4
extern int pause (void);



extern int chown (const char *__file, __uid_t __owner, __gid_t __group)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;



extern int fchown (int __fd, __uid_t __owner, __gid_t __group) __attribute__ ((__nothrow__ , __leaf__)) ;




extern int lchown (const char *__file, __uid_t __owner, __gid_t __group)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;






extern int fchownat (int __fd, const char *__file, __uid_t __owner,
       __gid_t __group, int __flag)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2))) ;



extern int chdir (const char *__path) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;



extern int fchdir (int __fd) __attribute__ ((__nothrow__ , __leaf__)) ;
# 514 "/usr/include/unistd.h" 3 4
extern char *getcwd (char *__buf, size_t __size) __attribute__ ((__nothrow__ , __leaf__)) ;
# 528 "/usr/include/unistd.h" 3 4
extern char *getwd (char *__buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__deprecated__)) ;




extern int dup (int __fd) __attribute__ ((__nothrow__ , __leaf__)) ;


extern int dup2 (int __fd, int __fd2) __attribute__ ((__nothrow__ , __leaf__));
# 546 "/usr/include/unistd.h" 3 4
extern char **__environ;







extern int execve (const char *__path, char *const __argv[],
     char *const __envp[]) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));




extern int fexecve (int __fd, char *const __argv[], char *const __envp[])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));




extern int execv (const char *__path, char *const __argv[])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));



extern int execle (const char *__path, const char *__arg, ...)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));



extern int execl (const char *__path, const char *__arg, ...)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));



extern int execvp (const char *__file, char *const __argv[])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));




extern int execlp (const char *__file, const char *__arg, ...)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
# 601 "/usr/include/unistd.h" 3 4
extern int nice (int __inc) __attribute__ ((__nothrow__ , __leaf__)) ;




extern void _exit (int __status) __attribute__ ((__noreturn__));





# 1 "/usr/include/x86_64-linux-gnu/bits/confname.h" 1 3 4
# 24 "/usr/include/x86_64-linux-gnu/bits/confname.h" 3 4
enum
  {
    _PC_LINK_MAX,

    _PC_MAX_CANON,

    _PC_MAX_INPUT,

    _PC_NAME_MAX,

    _PC_PATH_MAX,

    _PC_PIPE_BUF,

    _PC_CHOWN_RESTRICTED,

    _PC_NO_TRUNC,

    _PC_VDISABLE,

    _PC_SYNC_IO,

    _PC_ASYNC_IO,

    _PC_PRIO_IO,

    _PC_SOCK_MAXBUF,

    _PC_FILESIZEBITS,

    _PC_REC_INCR_XFER_SIZE,

    _PC_REC_MAX_XFER_SIZE,

    _PC_REC_MIN_XFER_SIZE,

    _PC_REC_XFER_ALIGN,

    _PC_ALLOC_SIZE_MIN,

    _PC_SYMLINK_MAX,

    _PC_2_SYMLINKS

  };


enum
  {
    _SC_ARG_MAX,

    _SC_CHILD_MAX,

    _SC_CLK_TCK,

    _SC_NGROUPS_MAX,

    _SC_OPEN_MAX,

    _SC_STREAM_MAX,

    _SC_TZNAME_MAX,

    _SC_JOB_CONTROL,

    _SC_SAVED_IDS,

    _SC_REALTIME_SIGNALS,

    _SC_PRIORITY_SCHEDULING,

    _SC_TIMERS,

    _SC_ASYNCHRONOUS_IO,

    _SC_PRIORITIZED_IO,

    _SC_SYNCHRONIZED_IO,

    _SC_FSYNC,

    _SC_MAPPED_FILES,

    _SC_MEMLOCK,

    _SC_MEMLOCK_RANGE,

    _SC_MEMORY_PROTECTION,

    _SC_MESSAGE_PASSING,

    _SC_SEMAPHORES,

    _SC_SHARED_MEMORY_OBJECTS,

    _SC_AIO_LISTIO_MAX,

    _SC_AIO_MAX,

    _SC_AIO_PRIO_DELTA_MAX,

    _SC_DELAYTIMER_MAX,

    _SC_MQ_OPEN_MAX,

    _SC_MQ_PRIO_MAX,

    _SC_VERSION,

    _SC_PAGESIZE,


    _SC_RTSIG_MAX,

    _SC_SEM_NSEMS_MAX,

    _SC_SEM_VALUE_MAX,

    _SC_SIGQUEUE_MAX,

    _SC_TIMER_MAX,




    _SC_BC_BASE_MAX,

    _SC_BC_DIM_MAX,

    _SC_BC_SCALE_MAX,

    _SC_BC_STRING_MAX,

    _SC_COLL_WEIGHTS_MAX,

    _SC_EQUIV_CLASS_MAX,

    _SC_EXPR_NEST_MAX,

    _SC_LINE_MAX,

    _SC_RE_DUP_MAX,

    _SC_CHARCLASS_NAME_MAX,


    _SC_2_VERSION,

    _SC_2_C_BIND,

    _SC_2_C_DEV,

    _SC_2_FORT_DEV,

    _SC_2_FORT_RUN,

    _SC_2_SW_DEV,

    _SC_2_LOCALEDEF,


    _SC_PII,

    _SC_PII_XTI,

    _SC_PII_SOCKET,

    _SC_PII_INTERNET,

    _SC_PII_OSI,

    _SC_POLL,

    _SC_SELECT,

    _SC_UIO_MAXIOV,

    _SC_IOV_MAX = _SC_UIO_MAXIOV,

    _SC_PII_INTERNET_STREAM,

    _SC_PII_INTERNET_DGRAM,

    _SC_PII_OSI_COTS,

    _SC_PII_OSI_CLTS,

    _SC_PII_OSI_M,

    _SC_T_IOV_MAX,



    _SC_THREADS,

    _SC_THREAD_SAFE_FUNCTIONS,

    _SC_GETGR_R_SIZE_MAX,

    _SC_GETPW_R_SIZE_MAX,

    _SC_LOGIN_NAME_MAX,

    _SC_TTY_NAME_MAX,

    _SC_THREAD_DESTRUCTOR_ITERATIONS,

    _SC_THREAD_KEYS_MAX,

    _SC_THREAD_STACK_MIN,

    _SC_THREAD_THREADS_MAX,

    _SC_THREAD_ATTR_STACKADDR,

    _SC_THREAD_ATTR_STACKSIZE,

    _SC_THREAD_PRIORITY_SCHEDULING,

    _SC_THREAD_PRIO_INHERIT,

    _SC_THREAD_PRIO_PROTECT,

    _SC_THREAD_PROCESS_SHARED,


    _SC_NPROCESSORS_CONF,

    _SC_NPROCESSORS_ONLN,

    _SC_PHYS_PAGES,

    _SC_AVPHYS_PAGES,

    _SC_ATEXIT_MAX,

    _SC_PASS_MAX,


    _SC_XOPEN_VERSION,

    _SC_XOPEN_XCU_VERSION,

    _SC_XOPEN_UNIX,

    _SC_XOPEN_CRYPT,

    _SC_XOPEN_ENH_I18N,

    _SC_XOPEN_SHM,


    _SC_2_CHAR_TERM,

    _SC_2_C_VERSION,

    _SC_2_UPE,


    _SC_XOPEN_XPG2,

    _SC_XOPEN_XPG3,

    _SC_XOPEN_XPG4,


    _SC_CHAR_BIT,

    _SC_CHAR_MAX,

    _SC_CHAR_MIN,

    _SC_INT_MAX,

    _SC_INT_MIN,

    _SC_LONG_BIT,

    _SC_WORD_BIT,

    _SC_MB_LEN_MAX,

    _SC_NZERO,

    _SC_SSIZE_MAX,

    _SC_SCHAR_MAX,

    _SC_SCHAR_MIN,

    _SC_SHRT_MAX,

    _SC_SHRT_MIN,

    _SC_UCHAR_MAX,

    _SC_UINT_MAX,

    _SC_ULONG_MAX,

    _SC_USHRT_MAX,


    _SC_NL_ARGMAX,

    _SC_NL_LANGMAX,

    _SC_NL_MSGMAX,

    _SC_NL_NMAX,

    _SC_NL_SETMAX,

    _SC_NL_TEXTMAX,


    _SC_XBS5_ILP32_OFF32,

    _SC_XBS5_ILP32_OFFBIG,

    _SC_XBS5_LP64_OFF64,

    _SC_XBS5_LPBIG_OFFBIG,


    _SC_XOPEN_LEGACY,

    _SC_XOPEN_REALTIME,

    _SC_XOPEN_REALTIME_THREADS,


    _SC_ADVISORY_INFO,

    _SC_BARRIERS,

    _SC_BASE,

    _SC_C_LANG_SUPPORT,

    _SC_C_LANG_SUPPORT_R,

    _SC_CLOCK_SELECTION,

    _SC_CPUTIME,

    _SC_THREAD_CPUTIME,

    _SC_DEVICE_IO,

    _SC_DEVICE_SPECIFIC,

    _SC_DEVICE_SPECIFIC_R,

    _SC_FD_MGMT,

    _SC_FIFO,

    _SC_PIPE,

    _SC_FILE_ATTRIBUTES,

    _SC_FILE_LOCKING,

    _SC_FILE_SYSTEM,

    _SC_MONOTONIC_CLOCK,

    _SC_MULTI_PROCESS,

    _SC_SINGLE_PROCESS,

    _SC_NETWORKING,

    _SC_READER_WRITER_LOCKS,

    _SC_SPIN_LOCKS,

    _SC_REGEXP,

    _SC_REGEX_VERSION,

    _SC_SHELL,

    _SC_SIGNALS,

    _SC_SPAWN,

    _SC_SPORADIC_SERVER,

    _SC_THREAD_SPORADIC_SERVER,

    _SC_SYSTEM_DATABASE,

    _SC_SYSTEM_DATABASE_R,

    _SC_TIMEOUTS,

    _SC_TYPED_MEMORY_OBJECTS,

    _SC_USER_GROUPS,

    _SC_USER_GROUPS_R,

    _SC_2_PBS,

    _SC_2_PBS_ACCOUNTING,

    _SC_2_PBS_LOCATE,

    _SC_2_PBS_MESSAGE,

    _SC_2_PBS_TRACK,

    _SC_SYMLOOP_MAX,

    _SC_STREAMS,

    _SC_2_PBS_CHECKPOINT,


    _SC_V6_ILP32_OFF32,

    _SC_V6_ILP32_OFFBIG,

    _SC_V6_LP64_OFF64,

    _SC_V6_LPBIG_OFFBIG,


    _SC_HOST_NAME_MAX,

    _SC_TRACE,

    _SC_TRACE_EVENT_FILTER,

    _SC_TRACE_INHERIT,

    _SC_TRACE_LOG,


    _SC_LEVEL1_ICACHE_SIZE,

    _SC_LEVEL1_ICACHE_ASSOC,

    _SC_LEVEL1_ICACHE_LINESIZE,

    _SC_LEVEL1_DCACHE_SIZE,

    _SC_LEVEL1_DCACHE_ASSOC,

    _SC_LEVEL1_DCACHE_LINESIZE,

    _SC_LEVEL2_CACHE_SIZE,

    _SC_LEVEL2_CACHE_ASSOC,

    _SC_LEVEL2_CACHE_LINESIZE,

    _SC_LEVEL3_CACHE_SIZE,

    _SC_LEVEL3_CACHE_ASSOC,

    _SC_LEVEL3_CACHE_LINESIZE,

    _SC_LEVEL4_CACHE_SIZE,

    _SC_LEVEL4_CACHE_ASSOC,

    _SC_LEVEL4_CACHE_LINESIZE,



    _SC_IPV6 = _SC_LEVEL1_ICACHE_SIZE + 50,

    _SC_RAW_SOCKETS,


    _SC_V7_ILP32_OFF32,

    _SC_V7_ILP32_OFFBIG,

    _SC_V7_LP64_OFF64,

    _SC_V7_LPBIG_OFFBIG,


    _SC_SS_REPL_MAX,


    _SC_TRACE_EVENT_NAME_MAX,

    _SC_TRACE_NAME_MAX,

    _SC_TRACE_SYS_MAX,

    _SC_TRACE_USER_EVENT_MAX,


    _SC_XOPEN_STREAMS,


    _SC_THREAD_ROBUST_PRIO_INHERIT,

    _SC_THREAD_ROBUST_PRIO_PROTECT

  };


enum
  {
    _CS_PATH,


    _CS_V6_WIDTH_RESTRICTED_ENVS,



    _CS_GNU_LIBC_VERSION,

    _CS_GNU_LIBPTHREAD_VERSION,


    _CS_V5_WIDTH_RESTRICTED_ENVS,



    _CS_V7_WIDTH_RESTRICTED_ENVS,



    _CS_LFS_CFLAGS = 1000,

    _CS_LFS_LDFLAGS,

    _CS_LFS_LIBS,

    _CS_LFS_LINTFLAGS,

    _CS_LFS64_CFLAGS,

    _CS_LFS64_LDFLAGS,

    _CS_LFS64_LIBS,

    _CS_LFS64_LINTFLAGS,


    _CS_XBS5_ILP32_OFF32_CFLAGS = 1100,

    _CS_XBS5_ILP32_OFF32_LDFLAGS,

    _CS_XBS5_ILP32_OFF32_LIBS,

    _CS_XBS5_ILP32_OFF32_LINTFLAGS,

    _CS_XBS5_ILP32_OFFBIG_CFLAGS,

    _CS_XBS5_ILP32_OFFBIG_LDFLAGS,

    _CS_XBS5_ILP32_OFFBIG_LIBS,

    _CS_XBS5_ILP32_OFFBIG_LINTFLAGS,

    _CS_XBS5_LP64_OFF64_CFLAGS,

    _CS_XBS5_LP64_OFF64_LDFLAGS,

    _CS_XBS5_LP64_OFF64_LIBS,

    _CS_XBS5_LP64_OFF64_LINTFLAGS,

    _CS_XBS5_LPBIG_OFFBIG_CFLAGS,

    _CS_XBS5_LPBIG_OFFBIG_LDFLAGS,

    _CS_XBS5_LPBIG_OFFBIG_LIBS,

    _CS_XBS5_LPBIG_OFFBIG_LINTFLAGS,


    _CS_POSIX_V6_ILP32_OFF32_CFLAGS,

    _CS_POSIX_V6_ILP32_OFF32_LDFLAGS,

    _CS_POSIX_V6_ILP32_OFF32_LIBS,

    _CS_POSIX_V6_ILP32_OFF32_LINTFLAGS,

    _CS_POSIX_V6_ILP32_OFFBIG_CFLAGS,

    _CS_POSIX_V6_ILP32_OFFBIG_LDFLAGS,

    _CS_POSIX_V6_ILP32_OFFBIG_LIBS,

    _CS_POSIX_V6_ILP32_OFFBIG_LINTFLAGS,

    _CS_POSIX_V6_LP64_OFF64_CFLAGS,

    _CS_POSIX_V6_LP64_OFF64_LDFLAGS,

    _CS_POSIX_V6_LP64_OFF64_LIBS,

    _CS_POSIX_V6_LP64_OFF64_LINTFLAGS,

    _CS_POSIX_V6_LPBIG_OFFBIG_CFLAGS,

    _CS_POSIX_V6_LPBIG_OFFBIG_LDFLAGS,

    _CS_POSIX_V6_LPBIG_OFFBIG_LIBS,

    _CS_POSIX_V6_LPBIG_OFFBIG_LINTFLAGS,


    _CS_POSIX_V7_ILP32_OFF32_CFLAGS,

    _CS_POSIX_V7_ILP32_OFF32_LDFLAGS,

    _CS_POSIX_V7_ILP32_OFF32_LIBS,

    _CS_POSIX_V7_ILP32_OFF32_LINTFLAGS,

    _CS_POSIX_V7_ILP32_OFFBIG_CFLAGS,

    _CS_POSIX_V7_ILP32_OFFBIG_LDFLAGS,

    _CS_POSIX_V7_ILP32_OFFBIG_LIBS,

    _CS_POSIX_V7_ILP32_OFFBIG_LINTFLAGS,

    _CS_POSIX_V7_LP64_OFF64_CFLAGS,

    _CS_POSIX_V7_LP64_OFF64_LDFLAGS,

    _CS_POSIX_V7_LP64_OFF64_LIBS,

    _CS_POSIX_V7_LP64_OFF64_LINTFLAGS,

    _CS_POSIX_V7_LPBIG_OFFBIG_CFLAGS,

    _CS_POSIX_V7_LPBIG_OFFBIG_LDFLAGS,

    _CS_POSIX_V7_LPBIG_OFFBIG_LIBS,

    _CS_POSIX_V7_LPBIG_OFFBIG_LINTFLAGS,


    _CS_V6_ENV,

    _CS_V7_ENV

  };
# 613 "/usr/include/unistd.h" 2 3 4


extern long int pathconf (const char *__path, int __name)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern long int fpathconf (int __fd, int __name) __attribute__ ((__nothrow__ , __leaf__));


extern long int sysconf (int __name) __attribute__ ((__nothrow__ , __leaf__));



extern size_t confstr (int __name, char *__buf, size_t __len) __attribute__ ((__nothrow__ , __leaf__));




extern __pid_t getpid (void) __attribute__ ((__nothrow__ , __leaf__));


extern __pid_t getppid (void) __attribute__ ((__nothrow__ , __leaf__));


extern __pid_t getpgrp (void) __attribute__ ((__nothrow__ , __leaf__));


extern __pid_t __getpgid (__pid_t __pid) __attribute__ ((__nothrow__ , __leaf__));

extern __pid_t getpgid (__pid_t __pid) __attribute__ ((__nothrow__ , __leaf__));






extern int setpgid (__pid_t __pid, __pid_t __pgid) __attribute__ ((__nothrow__ , __leaf__));
# 663 "/usr/include/unistd.h" 3 4
extern int setpgrp (void) __attribute__ ((__nothrow__ , __leaf__));






extern __pid_t setsid (void) __attribute__ ((__nothrow__ , __leaf__));



extern __pid_t getsid (__pid_t __pid) __attribute__ ((__nothrow__ , __leaf__));



extern __uid_t getuid (void) __attribute__ ((__nothrow__ , __leaf__));


extern __uid_t geteuid (void) __attribute__ ((__nothrow__ , __leaf__));


extern __gid_t getgid (void) __attribute__ ((__nothrow__ , __leaf__));


extern __gid_t getegid (void) __attribute__ ((__nothrow__ , __leaf__));




extern int getgroups (int __size, __gid_t __list[]) __attribute__ ((__nothrow__ , __leaf__)) ;
# 703 "/usr/include/unistd.h" 3 4
extern int setuid (__uid_t __uid) __attribute__ ((__nothrow__ , __leaf__)) ;




extern int setreuid (__uid_t __ruid, __uid_t __euid) __attribute__ ((__nothrow__ , __leaf__)) ;




extern int seteuid (__uid_t __uid) __attribute__ ((__nothrow__ , __leaf__)) ;






extern int setgid (__gid_t __gid) __attribute__ ((__nothrow__ , __leaf__)) ;




extern int setregid (__gid_t __rgid, __gid_t __egid) __attribute__ ((__nothrow__ , __leaf__)) ;




extern int setegid (__gid_t __gid) __attribute__ ((__nothrow__ , __leaf__)) ;
# 759 "/usr/include/unistd.h" 3 4
extern __pid_t fork (void) __attribute__ ((__nothrow__));







extern __pid_t vfork (void) __attribute__ ((__nothrow__ , __leaf__));





extern char *ttyname (int __fd) __attribute__ ((__nothrow__ , __leaf__));



extern int ttyname_r (int __fd, char *__buf, size_t __buflen)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2))) ;



extern int isatty (int __fd) __attribute__ ((__nothrow__ , __leaf__));





extern int ttyslot (void) __attribute__ ((__nothrow__ , __leaf__));




extern int link (const char *__from, const char *__to)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2))) ;




extern int linkat (int __fromfd, const char *__from, int __tofd,
     const char *__to, int __flags)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 4))) ;




extern int symlink (const char *__from, const char *__to)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2))) ;




extern ssize_t readlink (const char *__restrict __path,
    char *__restrict __buf, size_t __len)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2))) ;




extern int symlinkat (const char *__from, int __tofd,
        const char *__to) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 3))) ;


extern ssize_t readlinkat (int __fd, const char *__restrict __path,
      char *__restrict __buf, size_t __len)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3))) ;



extern int unlink (const char *__name) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



extern int unlinkat (int __fd, const char *__name, int __flag)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));



extern int rmdir (const char *__path) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



extern __pid_t tcgetpgrp (int __fd) __attribute__ ((__nothrow__ , __leaf__));


extern int tcsetpgrp (int __fd, __pid_t __pgrp_id) __attribute__ ((__nothrow__ , __leaf__));






extern char *getlogin (void);







extern int getlogin_r (char *__name, size_t __name_len) __attribute__ ((__nonnull__ (1)));




extern int setlogin (const char *__name) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
# 874 "/usr/include/unistd.h" 3 4
# 1 "/usr/include/getopt.h" 1 3 4
# 57 "/usr/include/getopt.h" 3 4
extern char *optarg;
# 71 "/usr/include/getopt.h" 3 4
extern int optind;




extern int opterr;



extern int optopt;
# 150 "/usr/include/getopt.h" 3 4
extern int getopt (int ___argc, char *const *___argv, const char *__shortopts)
       __attribute__ ((__nothrow__ , __leaf__));
# 875 "/usr/include/unistd.h" 2 3 4







extern int gethostname (char *__name, size_t __len) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));






extern int sethostname (const char *__name, size_t __len)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;



extern int sethostid (long int __id) __attribute__ ((__nothrow__ , __leaf__)) ;





extern int getdomainname (char *__name, size_t __len)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;
extern int setdomainname (const char *__name, size_t __len)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;





extern int vhangup (void) __attribute__ ((__nothrow__ , __leaf__));


extern int revoke (const char *__file) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;







extern int profil (unsigned short int *__sample_buffer, size_t __size,
     size_t __offset, unsigned int __scale)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));





extern int acct (const char *__name) __attribute__ ((__nothrow__ , __leaf__));



extern char *getusershell (void) __attribute__ ((__nothrow__ , __leaf__));
extern void endusershell (void) __attribute__ ((__nothrow__ , __leaf__));
extern void setusershell (void) __attribute__ ((__nothrow__ , __leaf__));





extern int daemon (int __nochdir, int __noclose) __attribute__ ((__nothrow__ , __leaf__)) ;






extern int chroot (const char *__path) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;



extern char *getpass (const char *__prompt) __attribute__ ((__nonnull__ (1)));







extern int fsync (int __fd);
# 972 "/usr/include/unistd.h" 3 4
extern long int gethostid (void);


extern void sync (void) __attribute__ ((__nothrow__ , __leaf__));





extern int getpagesize (void) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));




extern int getdtablesize (void) __attribute__ ((__nothrow__ , __leaf__));
# 996 "/usr/include/unistd.h" 3 4
extern int truncate (const char *__file, __off_t __length)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;
# 1019 "/usr/include/unistd.h" 3 4
extern int ftruncate (int __fd, __off_t __length) __attribute__ ((__nothrow__ , __leaf__)) ;
# 1040 "/usr/include/unistd.h" 3 4
extern int brk (void *__addr) __attribute__ ((__nothrow__ , __leaf__)) ;





extern void *sbrk (intptr_t __delta) __attribute__ ((__nothrow__ , __leaf__));
# 1061 "/usr/include/unistd.h" 3 4
extern long int syscall (long int __sysno, ...) __attribute__ ((__nothrow__ , __leaf__));
# 1084 "/usr/include/unistd.h" 3 4
extern int lockf (int __fd, int __cmd, __off_t __len) ;
# 1115 "/usr/include/unistd.h" 3 4
extern int fdatasync (int __fildes);
# 1154 "/usr/include/unistd.h" 3 4

# 4 "queue.h" 2
# 1 "tclfbp_def.h" 1




# 4 "tclfbp_def.h"
typedef unsigned char uint8_t;
typedef unsigned short int uint16_t;
typedef unsigned int uint32_t;
# 5 "queue.h" 2

void queue_init(void);

void stub_init(char *p_key, uint32_t len, uint32_t size);
void stub_clear(char *p_key, uint32_t len, uint32_t size);
void stub_cleanup(char *p_key);

uint32_t sv_csr_write_wrapper(char *p_key, void *p_data);

uint32_t sv_csr_read_wrapper(char *p_key, void *p_data);

uint32_t sv_csr_peek_wrapper(char *p_key, void *p_data);

uint32_t sv_csr_qlen_wrapper(char *p_key);
# 1677 "test_wrap.c" 2
# 1 "test_helper.h" 1



# 1 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stdbool.h" 1 3 4
# 5 "test_helper.h" 2


typedef struct node {
    struct node *p_next;
    char *p_port;
    char *p_buffer;
    int size;
} node_t;

void port_mgr_init (void);
void port_mgr_reset(void);
void port_mgr_add(char *p_port, int size);

# 17 "test_helper.h" 3 4
_Bool 
# 17 "test_helper.h"
    port_mgr_delete(char *p_port);
void *port_mgr_get_msg(char *p_port);
int port_mgr_get_size(char *p_port);

# 20 "test_helper.h" 3 4
_Bool 
# 20 "test_helper.h"
    port_mgr_check(char *p_port);
void port_mgr_dump(void);

void port_mgr_msg_set(char *p_port, char *p_data, int offset);
char *port_mgr_msg_get(char *p_port, int offset);
# 1678 "test_wrap.c" 2
# 1 "sock_helper.h" 1






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

# 18 "sock_helper.h" 3 4
_Bool 
# 18 "sock_helper.h"
    key_mgr_delete(char *p_key);
void *key_mgr_get_msg(char *p_key);
int key_mgr_get_size(char *p_key);

# 21 "sock_helper.h" 3 4
_Bool 
# 21 "sock_helper.h"
    key_mgr_check(char *p_key);
void key_mgr_dump(void);

char *key_mgr_bcd_get(char *p_key);
int key_mgr_bcd_set(char *p_key, char *p_bcd);

void test_bcd(char *p_key);
void key_mgr_set_buff(char *p_key, void *p_src);
# 1679 "test_wrap.c" 2


static __attribute__ ((__unused__)) int
SWIG_AsCharPtrAndSize(Tcl_Obj *obj, char** cptr, size_t* psize, int *alloc)
{
  int len = 0;
  char *cstr = Tcl_GetStringFromObj(obj, &len);
  if (cstr) {
    if (cptr) *cptr = cstr;
    if (psize) *psize = len + 1;
    if (alloc) *alloc = ((0));
    return (0);
  }
  return -5;
}





# 1 "/usr/lib/gcc/x86_64-linux-gnu/5/include-fixed/limits.h" 1 3 4
# 34 "/usr/lib/gcc/x86_64-linux-gnu/5/include-fixed/limits.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/5/include-fixed/syslimits.h" 1 3 4






# 1 "/usr/lib/gcc/x86_64-linux-gnu/5/include-fixed/limits.h" 1 3 4
# 168 "/usr/lib/gcc/x86_64-linux-gnu/5/include-fixed/limits.h" 3 4
# 1 "/usr/include/limits.h" 1 3 4
# 143 "/usr/include/limits.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/posix1_lim.h" 1 3 4
# 160 "/usr/include/x86_64-linux-gnu/bits/posix1_lim.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/local_lim.h" 1 3 4
# 38 "/usr/include/x86_64-linux-gnu/bits/local_lim.h" 3 4
# 1 "/usr/include/linux/limits.h" 1 3 4
# 39 "/usr/include/x86_64-linux-gnu/bits/local_lim.h" 2 3 4
# 161 "/usr/include/x86_64-linux-gnu/bits/posix1_lim.h" 2 3 4
# 144 "/usr/include/limits.h" 2 3 4



# 1 "/usr/include/x86_64-linux-gnu/bits/posix2_lim.h" 1 3 4
# 148 "/usr/include/limits.h" 2 3 4
# 169 "/usr/lib/gcc/x86_64-linux-gnu/5/include-fixed/limits.h" 2 3 4
# 8 "/usr/lib/gcc/x86_64-linux-gnu/5/include-fixed/syslimits.h" 2 3 4
# 35 "/usr/lib/gcc/x86_64-linux-gnu/5/include-fixed/limits.h" 2 3 4
# 1700 "test_wrap.c" 2
# 1709 "test_wrap.c"
static __attribute__ ((__unused__)) int
SWIG_AsVal_unsigned_SS_long (Tcl_Interp *interp __attribute__ ((__unused__)), Tcl_Obj *obj, unsigned long *val) {
  long v;
  if (Tcl_GetLongFromObj(0,obj, &v) == 0) {
    if (v >= 0) {
      if (val) *val = (unsigned long) v;
      return (0);
    }



  }
  {
    int len = 0;
    const char *nptr = Tcl_GetStringFromObj(obj, &len);
    if (nptr && len > 0) {
      char *endptr;
      unsigned long v;
      if (*nptr == '-') return -7;
      
# 1728 "test_wrap.c" 3 4
     (*__errno_location ()) 
# 1728 "test_wrap.c"
           = 0;
      v = strtoul(nptr, &endptr,0);
      if (nptr[0] == '\0' || *endptr != '\0')
 return -5;
      if (v == 
# 1732 "test_wrap.c" 3 4
              (0x7fffffffffffffffL * 2UL + 1UL) 
# 1732 "test_wrap.c"
                        && 
# 1732 "test_wrap.c" 3 4
                           (*__errno_location ()) 
# 1732 "test_wrap.c"
                                 == 
# 1732 "test_wrap.c" 3 4
                                    34
# 1732 "test_wrap.c"
                                          ) {
 
# 1733 "test_wrap.c" 3 4
(*__errno_location ()) 
# 1733 "test_wrap.c"
      = 0;
 return -7;
      } else {
 if (*endptr == '\0') {
   if (val) *val = v;
   return (0);
 }
      }
    }
  }

  return -5;
}


static __attribute__ ((__unused__)) int
SWIG_AsVal_unsigned_SS_int (Tcl_Interp *interp __attribute__ ((__unused__)), Tcl_Obj * obj, unsigned int *val)
{
  unsigned long v;
  int res = SWIG_AsVal_unsigned_SS_long (interp, obj, &v);
  if ((res >= 0)) {
    if ((v > 
# 1754 "test_wrap.c" 3 4
            (0x7fffffff * 2U + 1U)
# 1754 "test_wrap.c"
                    )) {
      return -7;
    } else {
      if (val) *val = (unsigned int)(v);
    }
  }
  return res;
}


static __attribute__ ((__unused__)) inline Tcl_Obj*
SWIG_From_long (long value)
{
  if (((long) 
# 1767 "test_wrap.c" 3 4
             (-0x7fffffff - 1) 
# 1767 "test_wrap.c"
                     <= value) && (value <= (long) 0x7fffffff)) {
    return Tcl_NewIntObj((int)(value));
  } else {
    return Tcl_NewLongObj(value);
  }
}
# 1783 "test_wrap.c"
static __attribute__ ((__unused__)) inline Tcl_Obj*
SWIG_From_unsigned_SS_long (unsigned long value)
{
  if (value < (unsigned long) 0x7fffffffffffffffL) {
    return SWIG_From_long ((long)(value));
  } else {
    char temp[256];
    sprintf(temp, "%lu", value);
    return Tcl_NewStringObj(temp,-1);
  }
}


static __attribute__ ((__unused__)) inline Tcl_Obj *
SWIG_From_unsigned_SS_int (unsigned int value)
{
  return SWIG_From_unsigned_SS_long (value);
}


static __attribute__ ((__unused__)) inline Tcl_Obj *
SWIG_FromCharPtrAndSize(const char* carray, size_t size)
{
  return (size < 0x7fffffff) ? Tcl_NewStringObj(carray, (int)(size)) : 
# 1806 "test_wrap.c" 3 4
                                                                   ((void *)0)
# 1806 "test_wrap.c"
                                                                       ;
}


static __attribute__ ((__unused__)) inline Tcl_Obj *
SWIG_FromCharPtr(const char *cptr)
{
  return SWIG_FromCharPtrAndSize(cptr, (cptr ? strlen(cptr) : 0));
}


static __attribute__ ((__unused__)) int
SWIG_AsVal_long (Tcl_Interp *interp __attribute__ ((__unused__)), Tcl_Obj *obj, long* val)
{
  long v;
  if (Tcl_GetLongFromObj(0,obj, &v) == 0) {
    if (val) *val = (long) v;
    return (0);
  }
  return -5;
}


static __attribute__ ((__unused__)) int
SWIG_AsVal_int (Tcl_Interp *interp __attribute__ ((__unused__)), Tcl_Obj * obj, int *val)
{
  long v;
  int res = SWIG_AsVal_long (interp, obj, &v);
  if ((res >= 0)) {
    if ((v < 
# 1835 "test_wrap.c" 3 4
            (-0x7fffffff - 1) 
# 1835 "test_wrap.c"
                    || v > 0x7fffffff)) {
      return -7;
    } else {
      if (val) *val = (int)(v);
    }
  }
  return res;
}


static __attribute__ ((__unused__)) inline Tcl_Obj *
SWIG_From_int (int value)
{
  return SWIG_From_long (value);
}







static __attribute__ ((__unused__)) int
_wrap_queue_init(ClientData clientData __attribute__ ((__unused__)), Tcl_Interp *interp, int objc, Tcl_Obj *const objv[]) {
  if (SWIG_Tcl_GetArgs(interp, objc, objv,":queue_init ") == 1) goto fail;
  queue_init();

  return 0;
fail:
  return 1;
}


static __attribute__ ((__unused__)) int
_wrap_stub_init(ClientData clientData __attribute__ ((__unused__)), Tcl_Interp *interp, int objc, Tcl_Obj *const objv[]) {
  char *arg1 = (char *) 0 ;
  uint32_t arg2 ;
  uint32_t arg3 ;
  int res1 ;
  char *buf1 = 0 ;
  int alloc1 = 0 ;
  unsigned int val2 ;
  int ecode2 = 0 ;
  unsigned int val3 ;
  int ecode3 = 0 ;

  if (SWIG_Tcl_GetArgs(interp, objc, objv,"ooo:stub_init p_key len size ",(void *)0,(void *)0,(void *)0) == 1) goto fail;
  res1 = SWIG_AsCharPtrAndSize(objv[1], &buf1, 
# 1882 "test_wrap.c" 3 4
                                              ((void *)0)
# 1882 "test_wrap.c"
                                                  , &alloc1);
  if (!(res1 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((res1 != (-1)) ? res1 : -5)), "in method '" "stub_init" "', argument " "1"" of type '" "char *""'"); goto fail; } while(0);
  }
  arg1 = (char *)(buf1);
  ecode2 = SWIG_AsVal_unsigned_SS_int (interp, objv[2], &val2);
  if (!(ecode2 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((ecode2 != (-1)) ? ecode2 : -5)), "in method '" "stub_init" "', argument " "2"" of type '" "uint32_t""'"); goto fail; } while(0);
  }
  arg2 = (uint32_t)(val2);
  ecode3 = SWIG_AsVal_unsigned_SS_int (interp, objv[3], &val3);
  if (!(ecode3 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((ecode3 != (-1)) ? ecode3 : -5)), "in method '" "stub_init" "', argument " "3"" of type '" "uint32_t""'"); goto fail; } while(0);
  }
  arg3 = (uint32_t)(val3);
  stub_init(arg1,arg2,arg3);

  if (alloc1 == ((0) | ((1 << 8) << 1))) free((char*)buf1);
  return 0;
fail:
  if (alloc1 == ((0) | ((1 << 8) << 1))) free((char*)buf1);
  return 1;
}


static __attribute__ ((__unused__)) int
_wrap_stub_clear(ClientData clientData __attribute__ ((__unused__)), Tcl_Interp *interp, int objc, Tcl_Obj *const objv[]) {
  char *arg1 = (char *) 0 ;
  uint32_t arg2 ;
  uint32_t arg3 ;
  int res1 ;
  char *buf1 = 0 ;
  int alloc1 = 0 ;
  unsigned int val2 ;
  int ecode2 = 0 ;
  unsigned int val3 ;
  int ecode3 = 0 ;

  if (SWIG_Tcl_GetArgs(interp, objc, objv,"ooo:stub_clear p_key len size ",(void *)0,(void *)0,(void *)0) == 1) goto fail;
  res1 = SWIG_AsCharPtrAndSize(objv[1], &buf1, 
# 1921 "test_wrap.c" 3 4
                                              ((void *)0)
# 1921 "test_wrap.c"
                                                  , &alloc1);
  if (!(res1 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((res1 != (-1)) ? res1 : -5)), "in method '" "stub_clear" "', argument " "1"" of type '" "char *""'"); goto fail; } while(0);
  }
  arg1 = (char *)(buf1);
  ecode2 = SWIG_AsVal_unsigned_SS_int (interp, objv[2], &val2);
  if (!(ecode2 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((ecode2 != (-1)) ? ecode2 : -5)), "in method '" "stub_clear" "', argument " "2"" of type '" "uint32_t""'"); goto fail; } while(0);
  }
  arg2 = (uint32_t)(val2);
  ecode3 = SWIG_AsVal_unsigned_SS_int (interp, objv[3], &val3);
  if (!(ecode3 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((ecode3 != (-1)) ? ecode3 : -5)), "in method '" "stub_clear" "', argument " "3"" of type '" "uint32_t""'"); goto fail; } while(0);
  }
  arg3 = (uint32_t)(val3);
  stub_clear(arg1,arg2,arg3);

  if (alloc1 == ((0) | ((1 << 8) << 1))) free((char*)buf1);
  return 0;
fail:
  if (alloc1 == ((0) | ((1 << 8) << 1))) free((char*)buf1);
  return 1;
}


static __attribute__ ((__unused__)) int
_wrap_stub_cleanup(ClientData clientData __attribute__ ((__unused__)), Tcl_Interp *interp, int objc, Tcl_Obj *const objv[]) {
  char *arg1 = (char *) 0 ;
  int res1 ;
  char *buf1 = 0 ;
  int alloc1 = 0 ;

  if (SWIG_Tcl_GetArgs(interp, objc, objv,"o:stub_cleanup p_key ",(void *)0) == 1) goto fail;
  res1 = SWIG_AsCharPtrAndSize(objv[1], &buf1, 
# 1954 "test_wrap.c" 3 4
                                              ((void *)0)
# 1954 "test_wrap.c"
                                                  , &alloc1);
  if (!(res1 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((res1 != (-1)) ? res1 : -5)), "in method '" "stub_cleanup" "', argument " "1"" of type '" "char *""'"); goto fail; } while(0);
  }
  arg1 = (char *)(buf1);
  stub_cleanup(arg1);

  if (alloc1 == ((0) | ((1 << 8) << 1))) free((char*)buf1);
  return 0;
fail:
  if (alloc1 == ((0) | ((1 << 8) << 1))) free((char*)buf1);
  return 1;
}


static __attribute__ ((__unused__)) int
_wrap_sv_csr_write_wrapper(ClientData clientData __attribute__ ((__unused__)), Tcl_Interp *interp, int objc, Tcl_Obj *const objv[]) {
  char *arg1 = (char *) 0 ;
  void *arg2 = (void *) 0 ;
  int res1 ;
  char *buf1 = 0 ;
  int alloc1 = 0 ;
  int res2 ;
  uint32_t result;

  if (SWIG_Tcl_GetArgs(interp, objc, objv,"oo:sv_csr_write_wrapper p_key p_data ",(void *)0,(void *)0) == 1) goto fail;
  res1 = SWIG_AsCharPtrAndSize(objv[1], &buf1, 
# 1980 "test_wrap.c" 3 4
                                              ((void *)0)
# 1980 "test_wrap.c"
                                                  , &alloc1);
  if (!(res1 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((res1 != (-1)) ? res1 : -5)), "in method '" "sv_csr_write_wrapper" "', argument " "1"" of type '" "char *""'"); goto fail; } while(0);
  }
  arg1 = (char *)(buf1);
  res2 = SWIG_Tcl_ConvertPtr(interp, objv[2], ((void)(void *)((const void *)(*&arg2)),(void**)(&arg2)), 0, 0);
  if (!(res2 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((res2 != (-1)) ? res2 : -5)), "in method '" "sv_csr_write_wrapper" "', argument " "2"" of type '" "void *""'"); goto fail; } while(0);
  }
  result = (uint32_t)sv_csr_write_wrapper(arg1,arg2);
  Tcl_SetObjResult(interp,SWIG_From_unsigned_SS_int((unsigned int)(result)));
  if (alloc1 == ((0) | ((1 << 8) << 1))) free((char*)buf1);
  return 0;
fail:
  if (alloc1 == ((0) | ((1 << 8) << 1))) free((char*)buf1);
  return 1;
}


static __attribute__ ((__unused__)) int
_wrap_sv_csr_read_wrapper(ClientData clientData __attribute__ ((__unused__)), Tcl_Interp *interp, int objc, Tcl_Obj *const objv[]) {
  char *arg1 = (char *) 0 ;
  void *arg2 = (void *) 0 ;
  int res1 ;
  char *buf1 = 0 ;
  int alloc1 = 0 ;
  int res2 ;
  uint32_t result;

  if (SWIG_Tcl_GetArgs(interp, objc, objv,"oo:sv_csr_read_wrapper p_key p_data ",(void *)0,(void *)0) == 1) goto fail;
  res1 = SWIG_AsCharPtrAndSize(objv[1], &buf1, 
# 2010 "test_wrap.c" 3 4
                                              ((void *)0)
# 2010 "test_wrap.c"
                                                  , &alloc1);
  if (!(res1 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((res1 != (-1)) ? res1 : -5)), "in method '" "sv_csr_read_wrapper" "', argument " "1"" of type '" "char *""'"); goto fail; } while(0);
  }
  arg1 = (char *)(buf1);
  res2 = SWIG_Tcl_ConvertPtr(interp, objv[2], ((void)(void *)((const void *)(*&arg2)),(void**)(&arg2)), 0, 0);
  if (!(res2 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((res2 != (-1)) ? res2 : -5)), "in method '" "sv_csr_read_wrapper" "', argument " "2"" of type '" "void *""'"); goto fail; } while(0);
  }
  result = (uint32_t)sv_csr_read_wrapper(arg1,arg2);
  Tcl_SetObjResult(interp,SWIG_From_unsigned_SS_int((unsigned int)(result)));
  if (alloc1 == ((0) | ((1 << 8) << 1))) free((char*)buf1);
  return 0;
fail:
  if (alloc1 == ((0) | ((1 << 8) << 1))) free((char*)buf1);
  return 1;
}


static __attribute__ ((__unused__)) int
_wrap_sv_csr_peek_wrapper(ClientData clientData __attribute__ ((__unused__)), Tcl_Interp *interp, int objc, Tcl_Obj *const objv[]) {
  char *arg1 = (char *) 0 ;
  void *arg2 = (void *) 0 ;
  int res1 ;
  char *buf1 = 0 ;
  int alloc1 = 0 ;
  int res2 ;
  uint32_t result;

  if (SWIG_Tcl_GetArgs(interp, objc, objv,"oo:sv_csr_peek_wrapper p_key p_data ",(void *)0,(void *)0) == 1) goto fail;
  res1 = SWIG_AsCharPtrAndSize(objv[1], &buf1, 
# 2040 "test_wrap.c" 3 4
                                              ((void *)0)
# 2040 "test_wrap.c"
                                                  , &alloc1);
  if (!(res1 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((res1 != (-1)) ? res1 : -5)), "in method '" "sv_csr_peek_wrapper" "', argument " "1"" of type '" "char *""'"); goto fail; } while(0);
  }
  arg1 = (char *)(buf1);
  res2 = SWIG_Tcl_ConvertPtr(interp, objv[2], ((void)(void *)((const void *)(*&arg2)),(void**)(&arg2)), 0, 0);
  if (!(res2 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((res2 != (-1)) ? res2 : -5)), "in method '" "sv_csr_peek_wrapper" "', argument " "2"" of type '" "void *""'"); goto fail; } while(0);
  }
  result = (uint32_t)sv_csr_peek_wrapper(arg1,arg2);
  Tcl_SetObjResult(interp,SWIG_From_unsigned_SS_int((unsigned int)(result)));
  if (alloc1 == ((0) | ((1 << 8) << 1))) free((char*)buf1);
  return 0;
fail:
  if (alloc1 == ((0) | ((1 << 8) << 1))) free((char*)buf1);
  return 1;
}


static __attribute__ ((__unused__)) int
_wrap_sv_csr_qlen_wrapper(ClientData clientData __attribute__ ((__unused__)), Tcl_Interp *interp, int objc, Tcl_Obj *const objv[]) {
  char *arg1 = (char *) 0 ;
  int res1 ;
  char *buf1 = 0 ;
  int alloc1 = 0 ;
  uint32_t result;

  if (SWIG_Tcl_GetArgs(interp, objc, objv,"o:sv_csr_qlen_wrapper p_key ",(void *)0) == 1) goto fail;
  res1 = SWIG_AsCharPtrAndSize(objv[1], &buf1, 
# 2068 "test_wrap.c" 3 4
                                              ((void *)0)
# 2068 "test_wrap.c"
                                                  , &alloc1);
  if (!(res1 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((res1 != (-1)) ? res1 : -5)), "in method '" "sv_csr_qlen_wrapper" "', argument " "1"" of type '" "char *""'"); goto fail; } while(0);
  }
  arg1 = (char *)(buf1);
  result = (uint32_t)sv_csr_qlen_wrapper(arg1);
  Tcl_SetObjResult(interp,SWIG_From_unsigned_SS_int((unsigned int)(result)));
  if (alloc1 == ((0) | ((1 << 8) << 1))) free((char*)buf1);
  return 0;
fail:
  if (alloc1 == ((0) | ((1 << 8) << 1))) free((char*)buf1);
  return 1;
}


static __attribute__ ((__unused__)) int
_wrap_node_t_p_next_set(ClientData clientData __attribute__ ((__unused__)), Tcl_Interp *interp, int objc, Tcl_Obj *const objv[]) {
  struct node *arg1 = (struct node *) 0 ;
  struct node *arg2 = (struct node *) 0 ;
  void *argp1 = 0 ;
  int res1 = 0 ;
  void *argp2 = 0 ;
  int res2 = 0 ;

  if (SWIG_Tcl_GetArgs(interp, objc, objv,"oo:node_t_p_next_set self p_next ",(void *)0,(void *)0) == 1) goto fail;
  res1 = SWIG_Tcl_ConvertPtr(interp, objv[1], &argp1, swig_types[2], 0 | 0);
  if (!(res1 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((res1 != (-1)) ? res1 : -5)), "in method '" "node_t_p_next_set" "', argument " "1"" of type '" "struct node *""'"); goto fail; } while(0);
  }
  arg1 = (struct node *)(argp1);
  res2 = SWIG_Tcl_ConvertPtr(interp, objv[2], &argp2, swig_types[2], 0x1 | 0);
  if (!(res2 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((res2 != (-1)) ? res2 : -5)), "in method '" "node_t_p_next_set" "', argument " "2"" of type '" "struct node *""'"); goto fail; } while(0);
  }
  arg2 = (struct node *)(argp2);
  if (arg1) (arg1)->p_next = arg2;

  return 0;
fail:
  return 1;
}


static __attribute__ ((__unused__)) int
_wrap_node_t_p_next_get(ClientData clientData __attribute__ ((__unused__)), Tcl_Interp *interp, int objc, Tcl_Obj *const objv[]) {
  struct node *arg1 = (struct node *) 0 ;
  void *argp1 = 0 ;
  int res1 = 0 ;
  struct node *result = 0 ;

  if (SWIG_Tcl_GetArgs(interp, objc, objv,"o:node_t_p_next_get self ",(void *)0) == 1) goto fail;
  res1 = SWIG_Tcl_ConvertPtr(interp, objv[1], &argp1, swig_types[2], 0 | 0);
  if (!(res1 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((res1 != (-1)) ? res1 : -5)), "in method '" "node_t_p_next_get" "', argument " "1"" of type '" "struct node *""'"); goto fail; } while(0);
  }
  arg1 = (struct node *)(argp1);
  result = (struct node *) ((arg1)->p_next);
  Tcl_SetObjResult(interp, SWIG_Tcl_NewInstanceObj(interp, (void *)((const void *)(result)), swig_types[2], 0));
  return 0;
fail:
  return 1;
}


static __attribute__ ((__unused__)) int
_wrap_node_t_p_port_set(ClientData clientData __attribute__ ((__unused__)), Tcl_Interp *interp, int objc, Tcl_Obj *const objv[]) {
  struct node *arg1 = (struct node *) 0 ;
  char *arg2 = (char *) 0 ;
  void *argp1 = 0 ;
  int res1 = 0 ;
  int res2 ;
  char *buf2 = 0 ;
  int alloc2 = 0 ;

  if (SWIG_Tcl_GetArgs(interp, objc, objv,"oo:node_t_p_port_set self p_port ",(void *)0,(void *)0) == 1) goto fail;
  res1 = SWIG_Tcl_ConvertPtr(interp, objv[1], &argp1, swig_types[2], 0 | 0);
  if (!(res1 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((res1 != (-1)) ? res1 : -5)), "in method '" "node_t_p_port_set" "', argument " "1"" of type '" "struct node *""'"); goto fail; } while(0);
  }
  arg1 = (struct node *)(argp1);
  res2 = SWIG_AsCharPtrAndSize(objv[2], &buf2, 
# 2148 "test_wrap.c" 3 4
                                              ((void *)0)
# 2148 "test_wrap.c"
                                                  , &alloc2);
  if (!(res2 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((res2 != (-1)) ? res2 : -5)), "in method '" "node_t_p_port_set" "', argument " "2"" of type '" "char *""'"); goto fail; } while(0);
  }
  arg2 = (char *)(buf2);
  if (arg1->p_port) free((char*)arg1->p_port);
  if (arg2) {
    size_t size = strlen((const char *)(arg2)) + 1;
    arg1->p_port = (char *)(char *)memcpy(malloc((size)*sizeof(char)), (const char *)(arg2), sizeof(char)*(size));
  } else {
    arg1->p_port = 0;
  }

  if (alloc2 == ((0) | ((1 << 8) << 1))) free((char*)buf2);
  return 0;
fail:
  if (alloc2 == ((0) | ((1 << 8) << 1))) free((char*)buf2);
  return 1;
}


static __attribute__ ((__unused__)) int
_wrap_node_t_p_port_get(ClientData clientData __attribute__ ((__unused__)), Tcl_Interp *interp, int objc, Tcl_Obj *const objv[]) {
  struct node *arg1 = (struct node *) 0 ;
  void *argp1 = 0 ;
  int res1 = 0 ;
  char *result = 0 ;

  if (SWIG_Tcl_GetArgs(interp, objc, objv,"o:node_t_p_port_get self ",(void *)0) == 1) goto fail;
  res1 = SWIG_Tcl_ConvertPtr(interp, objv[1], &argp1, swig_types[2], 0 | 0);
  if (!(res1 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((res1 != (-1)) ? res1 : -5)), "in method '" "node_t_p_port_get" "', argument " "1"" of type '" "struct node *""'"); goto fail; } while(0);
  }
  arg1 = (struct node *)(argp1);
  result = (char *) ((arg1)->p_port);
  Tcl_SetObjResult(interp,SWIG_FromCharPtr((const char *)result));
  return 0;
fail:
  return 1;
}


static __attribute__ ((__unused__)) int
_wrap_node_t_p_buffer_set(ClientData clientData __attribute__ ((__unused__)), Tcl_Interp *interp, int objc, Tcl_Obj *const objv[]) {
  struct node *arg1 = (struct node *) 0 ;
  char *arg2 = (char *) 0 ;
  void *argp1 = 0 ;
  int res1 = 0 ;
  int res2 ;
  char *buf2 = 0 ;
  int alloc2 = 0 ;

  if (SWIG_Tcl_GetArgs(interp, objc, objv,"oo:node_t_p_buffer_set self p_buffer ",(void *)0,(void *)0) == 1) goto fail;
  res1 = SWIG_Tcl_ConvertPtr(interp, objv[1], &argp1, swig_types[2], 0 | 0);
  if (!(res1 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((res1 != (-1)) ? res1 : -5)), "in method '" "node_t_p_buffer_set" "', argument " "1"" of type '" "struct node *""'"); goto fail; } while(0);
  }
  arg1 = (struct node *)(argp1);
  res2 = SWIG_AsCharPtrAndSize(objv[2], &buf2, 
# 2206 "test_wrap.c" 3 4
                                              ((void *)0)
# 2206 "test_wrap.c"
                                                  , &alloc2);
  if (!(res2 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((res2 != (-1)) ? res2 : -5)), "in method '" "node_t_p_buffer_set" "', argument " "2"" of type '" "char *""'"); goto fail; } while(0);
  }
  arg2 = (char *)(buf2);
  if (arg1->p_buffer) free((char*)arg1->p_buffer);
  if (arg2) {
    size_t size = strlen((const char *)(arg2)) + 1;
    arg1->p_buffer = (char *)(char *)memcpy(malloc((size)*sizeof(char)), (const char *)(arg2), sizeof(char)*(size));
  } else {
    arg1->p_buffer = 0;
  }

  if (alloc2 == ((0) | ((1 << 8) << 1))) free((char*)buf2);
  return 0;
fail:
  if (alloc2 == ((0) | ((1 << 8) << 1))) free((char*)buf2);
  return 1;
}


static __attribute__ ((__unused__)) int
_wrap_node_t_p_buffer_get(ClientData clientData __attribute__ ((__unused__)), Tcl_Interp *interp, int objc, Tcl_Obj *const objv[]) {
  struct node *arg1 = (struct node *) 0 ;
  void *argp1 = 0 ;
  int res1 = 0 ;
  char *result = 0 ;

  if (SWIG_Tcl_GetArgs(interp, objc, objv,"o:node_t_p_buffer_get self ",(void *)0) == 1) goto fail;
  res1 = SWIG_Tcl_ConvertPtr(interp, objv[1], &argp1, swig_types[2], 0 | 0);
  if (!(res1 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((res1 != (-1)) ? res1 : -5)), "in method '" "node_t_p_buffer_get" "', argument " "1"" of type '" "struct node *""'"); goto fail; } while(0);
  }
  arg1 = (struct node *)(argp1);
  result = (char *) ((arg1)->p_buffer);
  Tcl_SetObjResult(interp,SWIG_FromCharPtr((const char *)result));
  return 0;
fail:
  return 1;
}


static __attribute__ ((__unused__)) int
_wrap_node_t_size_set(ClientData clientData __attribute__ ((__unused__)), Tcl_Interp *interp, int objc, Tcl_Obj *const objv[]) {
  struct node *arg1 = (struct node *) 0 ;
  int arg2 ;
  void *argp1 = 0 ;
  int res1 = 0 ;
  int val2 ;
  int ecode2 = 0 ;

  if (SWIG_Tcl_GetArgs(interp, objc, objv,"oo:node_t_size_set self size ",(void *)0,(void *)0) == 1) goto fail;
  res1 = SWIG_Tcl_ConvertPtr(interp, objv[1], &argp1, swig_types[2], 0 | 0);
  if (!(res1 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((res1 != (-1)) ? res1 : -5)), "in method '" "node_t_size_set" "', argument " "1"" of type '" "struct node *""'"); goto fail; } while(0);
  }
  arg1 = (struct node *)(argp1);
  ecode2 = SWIG_AsVal_int (interp, objv[2], &val2);
  if (!(ecode2 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((ecode2 != (-1)) ? ecode2 : -5)), "in method '" "node_t_size_set" "', argument " "2"" of type '" "int""'"); goto fail; } while(0);
  }
  arg2 = (int)(val2);
  if (arg1) (arg1)->size = arg2;

  return 0;
fail:
  return 1;
}


static __attribute__ ((__unused__)) int
_wrap_node_t_size_get(ClientData clientData __attribute__ ((__unused__)), Tcl_Interp *interp, int objc, Tcl_Obj *const objv[]) {
  struct node *arg1 = (struct node *) 0 ;
  void *argp1 = 0 ;
  int res1 = 0 ;
  int result;

  if (SWIG_Tcl_GetArgs(interp, objc, objv,"o:node_t_size_get self ",(void *)0) == 1) goto fail;
  res1 = SWIG_Tcl_ConvertPtr(interp, objv[1], &argp1, swig_types[2], 0 | 0);
  if (!(res1 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((res1 != (-1)) ? res1 : -5)), "in method '" "node_t_size_get" "', argument " "1"" of type '" "struct node *""'"); goto fail; } while(0);
  }
  arg1 = (struct node *)(argp1);
  result = (int) ((arg1)->size);
  Tcl_SetObjResult(interp,SWIG_From_int((int)(result)));
  return 0;
fail:
  return 1;
}


static __attribute__ ((__unused__)) int
_wrap_new_node_t(ClientData clientData __attribute__ ((__unused__)), Tcl_Interp *interp, int objc, Tcl_Obj *const objv[]) {
  struct node *result = 0 ;

  if (SWIG_Tcl_GetArgs(interp, objc, objv,":new_node_t ") == 1) goto fail;
  result = (struct node *)calloc(1, sizeof(struct node));
  Tcl_SetObjResult(interp, SWIG_Tcl_NewInstanceObj(interp, (void *)((const void *)(result)), swig_types[2], 0));
  return 0;
fail:
  return 1;
}


static __attribute__ ((__unused__)) int
_wrap_delete_node_t(ClientData clientData __attribute__ ((__unused__)), Tcl_Interp *interp, int objc, Tcl_Obj *const objv[]) {
  struct node *arg1 = (struct node *) 0 ;
  void *argp1 = 0 ;
  int res1 = 0 ;

  if (SWIG_Tcl_GetArgs(interp, objc, objv,"o:delete_node_t self ",(void *)0) == 1) goto fail;
  res1 = SWIG_Tcl_ConvertPtr(interp, objv[1], &argp1, swig_types[2], 0x1 | 0);
  if (!(res1 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((res1 != (-1)) ? res1 : -5)), "in method '" "delete_node_t" "', argument " "1"" of type '" "struct node *""'"); goto fail; } while(0);
  }
  arg1 = (struct node *)(argp1);
  free((char *) arg1);

  return 0;
fail:
  return 1;
}


static __attribute__ ((__unused__)) void swig_delete_node_t(void *obj) {
struct node *arg1 = (struct node *) obj;
free((char *) arg1);
}
static swig_method swig_node_methods[] = {
    {0,0}
};
static swig_attribute swig_node_attributes[] = {
    { "-p_next",_wrap_node_t_p_next_get, _wrap_node_t_p_next_set},
    { "-p_port",_wrap_node_t_p_port_get, _wrap_node_t_p_port_set},
    { "-p_buffer",_wrap_node_t_p_buffer_get, _wrap_node_t_p_buffer_set},
    { "-size",_wrap_node_t_size_get, _wrap_node_t_size_set},
    {0,0,0}
};
static swig_class *swig_node_bases[] = {0};
static const char * swig_node_base_names[] = {0};
static swig_class _wrap_class_node = { "node_t", &swig_types[2],_wrap_new_node_t, swig_delete_node_t, swig_node_methods, swig_node_attributes, swig_node_bases,swig_node_base_names, &swig_module, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0} };
static __attribute__ ((__unused__)) int
_wrap_port_mgr_init(ClientData clientData __attribute__ ((__unused__)), Tcl_Interp *interp, int objc, Tcl_Obj *const objv[]) {
  if (SWIG_Tcl_GetArgs(interp, objc, objv,":port_mgr_init ") == 1) goto fail;
  port_mgr_init();

  return 0;
fail:
  return 1;
}


static __attribute__ ((__unused__)) int
_wrap_port_mgr_reset(ClientData clientData __attribute__ ((__unused__)), Tcl_Interp *interp, int objc, Tcl_Obj *const objv[]) {
  if (SWIG_Tcl_GetArgs(interp, objc, objv,":port_mgr_reset ") == 1) goto fail;
  port_mgr_reset();

  return 0;
fail:
  return 1;
}


static __attribute__ ((__unused__)) int
_wrap_port_mgr_add(ClientData clientData __attribute__ ((__unused__)), Tcl_Interp *interp, int objc, Tcl_Obj *const objv[]) {
  char *arg1 = (char *) 0 ;
  int arg2 ;
  int res1 ;
  char *buf1 = 0 ;
  int alloc1 = 0 ;
  int val2 ;
  int ecode2 = 0 ;

  if (SWIG_Tcl_GetArgs(interp, objc, objv,"oo:port_mgr_add p_port size ",(void *)0,(void *)0) == 1) goto fail;
  res1 = SWIG_AsCharPtrAndSize(objv[1], &buf1, 
# 2380 "test_wrap.c" 3 4
                                              ((void *)0)
# 2380 "test_wrap.c"
                                                  , &alloc1);
  if (!(res1 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((res1 != (-1)) ? res1 : -5)), "in method '" "port_mgr_add" "', argument " "1"" of type '" "char *""'"); goto fail; } while(0);
  }
  arg1 = (char *)(buf1);
  ecode2 = SWIG_AsVal_int (interp, objv[2], &val2);
  if (!(ecode2 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((ecode2 != (-1)) ? ecode2 : -5)), "in method '" "port_mgr_add" "', argument " "2"" of type '" "int""'"); goto fail; } while(0);
  }
  arg2 = (int)(val2);
  port_mgr_add(arg1,arg2);

  if (alloc1 == ((0) | ((1 << 8) << 1))) free((char*)buf1);
  return 0;
fail:
  if (alloc1 == ((0) | ((1 << 8) << 1))) free((char*)buf1);
  return 1;
}


static __attribute__ ((__unused__)) int
_wrap_port_mgr_delete(ClientData clientData __attribute__ ((__unused__)), Tcl_Interp *interp, int objc, Tcl_Obj *const objv[]) {
  char *arg1 = (char *) 0 ;
  int res1 ;
  char *buf1 = 0 ;
  int alloc1 = 0 ;
  
# 2406 "test_wrap.c" 3 4
 _Bool 
# 2406 "test_wrap.c"
      result;

  if (SWIG_Tcl_GetArgs(interp, objc, objv,"o:port_mgr_delete p_port ",(void *)0) == 1) goto fail;
  res1 = SWIG_AsCharPtrAndSize(objv[1], &buf1, 
# 2409 "test_wrap.c" 3 4
                                              ((void *)0)
# 2409 "test_wrap.c"
                                                  , &alloc1);
  if (!(res1 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((res1 != (-1)) ? res1 : -5)), "in method '" "port_mgr_delete" "', argument " "1"" of type '" "char *""'"); goto fail; } while(0);
  }
  arg1 = (char *)(buf1);
  result = (
# 2414 "test_wrap.c" 3 4
           _Bool
# 2414 "test_wrap.c"
               )port_mgr_delete(arg1);
  Tcl_SetObjResult(interp,Tcl_NewIntObj(((
# 2415 "test_wrap.c" 3 4
                         _Bool
# 2415 "test_wrap.c"
                         )(result))!=0));
  if (alloc1 == ((0) | ((1 << 8) << 1))) free((char*)buf1);
  return 0;
fail:
  if (alloc1 == ((0) | ((1 << 8) << 1))) free((char*)buf1);
  return 1;
}


static __attribute__ ((__unused__)) int
_wrap_port_mgr_get_msg(ClientData clientData __attribute__ ((__unused__)), Tcl_Interp *interp, int objc, Tcl_Obj *const objv[]) {
  char *arg1 = (char *) 0 ;
  int res1 ;
  char *buf1 = 0 ;
  int alloc1 = 0 ;
  void *result = 0 ;

  if (SWIG_Tcl_GetArgs(interp, objc, objv,"o:port_mgr_get_msg p_port ",(void *)0) == 1) goto fail;
  res1 = SWIG_AsCharPtrAndSize(objv[1], &buf1, 
# 2433 "test_wrap.c" 3 4
                                              ((void *)0)
# 2433 "test_wrap.c"
                                                  , &alloc1);
  if (!(res1 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((res1 != (-1)) ? res1 : -5)), "in method '" "port_mgr_get_msg" "', argument " "1"" of type '" "char *""'"); goto fail; } while(0);
  }
  arg1 = (char *)(buf1);
  result = (void *)port_mgr_get_msg(arg1);
  Tcl_SetObjResult(interp, SWIG_Tcl_NewInstanceObj(interp, (void *)((const void *)(result)), swig_types[6], 0));
  if (alloc1 == ((0) | ((1 << 8) << 1))) free((char*)buf1);
  return 0;
fail:
  if (alloc1 == ((0) | ((1 << 8) << 1))) free((char*)buf1);
  return 1;
}


static __attribute__ ((__unused__)) int
_wrap_port_mgr_get_size(ClientData clientData __attribute__ ((__unused__)), Tcl_Interp *interp, int objc, Tcl_Obj *const objv[]) {
  char *arg1 = (char *) 0 ;
  int res1 ;
  char *buf1 = 0 ;
  int alloc1 = 0 ;
  int result;

  if (SWIG_Tcl_GetArgs(interp, objc, objv,"o:port_mgr_get_size p_port ",(void *)0) == 1) goto fail;
  res1 = SWIG_AsCharPtrAndSize(objv[1], &buf1, 
# 2457 "test_wrap.c" 3 4
                                              ((void *)0)
# 2457 "test_wrap.c"
                                                  , &alloc1);
  if (!(res1 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((res1 != (-1)) ? res1 : -5)), "in method '" "port_mgr_get_size" "', argument " "1"" of type '" "char *""'"); goto fail; } while(0);
  }
  arg1 = (char *)(buf1);
  result = (int)port_mgr_get_size(arg1);
  Tcl_SetObjResult(interp,SWIG_From_int((int)(result)));
  if (alloc1 == ((0) | ((1 << 8) << 1))) free((char*)buf1);
  return 0;
fail:
  if (alloc1 == ((0) | ((1 << 8) << 1))) free((char*)buf1);
  return 1;
}


static __attribute__ ((__unused__)) int
_wrap_port_mgr_check(ClientData clientData __attribute__ ((__unused__)), Tcl_Interp *interp, int objc, Tcl_Obj *const objv[]) {
  char *arg1 = (char *) 0 ;
  int res1 ;
  char *buf1 = 0 ;
  int alloc1 = 0 ;
  
# 2478 "test_wrap.c" 3 4
 _Bool 
# 2478 "test_wrap.c"
      result;

  if (SWIG_Tcl_GetArgs(interp, objc, objv,"o:port_mgr_check p_port ",(void *)0) == 1) goto fail;
  res1 = SWIG_AsCharPtrAndSize(objv[1], &buf1, 
# 2481 "test_wrap.c" 3 4
                                              ((void *)0)
# 2481 "test_wrap.c"
                                                  , &alloc1);
  if (!(res1 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((res1 != (-1)) ? res1 : -5)), "in method '" "port_mgr_check" "', argument " "1"" of type '" "char *""'"); goto fail; } while(0);
  }
  arg1 = (char *)(buf1);
  result = (
# 2486 "test_wrap.c" 3 4
           _Bool
# 2486 "test_wrap.c"
               )port_mgr_check(arg1);
  Tcl_SetObjResult(interp,Tcl_NewIntObj(((
# 2487 "test_wrap.c" 3 4
                         _Bool
# 2487 "test_wrap.c"
                         )(result))!=0));
  if (alloc1 == ((0) | ((1 << 8) << 1))) free((char*)buf1);
  return 0;
fail:
  if (alloc1 == ((0) | ((1 << 8) << 1))) free((char*)buf1);
  return 1;
}


static __attribute__ ((__unused__)) int
_wrap_port_mgr_dump(ClientData clientData __attribute__ ((__unused__)), Tcl_Interp *interp, int objc, Tcl_Obj *const objv[]) {
  if (SWIG_Tcl_GetArgs(interp, objc, objv,":port_mgr_dump ") == 1) goto fail;
  port_mgr_dump();

  return 0;
fail:
  return 1;
}


static __attribute__ ((__unused__)) int
_wrap_port_mgr_msg_set(ClientData clientData __attribute__ ((__unused__)), Tcl_Interp *interp, int objc, Tcl_Obj *const objv[]) {
  char *arg1 = (char *) 0 ;
  char *arg2 = (char *) 0 ;
  int arg3 ;
  int res1 ;
  char *buf1 = 0 ;
  int alloc1 = 0 ;
  int res2 ;
  char *buf2 = 0 ;
  int alloc2 = 0 ;
  int val3 ;
  int ecode3 = 0 ;

  if (SWIG_Tcl_GetArgs(interp, objc, objv,"ooo:port_mgr_msg_set p_port p_data offset ",(void *)0,(void *)0,(void *)0) == 1) goto fail;
  res1 = SWIG_AsCharPtrAndSize(objv[1], &buf1, 
# 2522 "test_wrap.c" 3 4
                                              ((void *)0)
# 2522 "test_wrap.c"
                                                  , &alloc1);
  if (!(res1 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((res1 != (-1)) ? res1 : -5)), "in method '" "port_mgr_msg_set" "', argument " "1"" of type '" "char *""'"); goto fail; } while(0);
  }
  arg1 = (char *)(buf1);
  res2 = SWIG_AsCharPtrAndSize(objv[2], &buf2, 
# 2527 "test_wrap.c" 3 4
                                              ((void *)0)
# 2527 "test_wrap.c"
                                                  , &alloc2);
  if (!(res2 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((res2 != (-1)) ? res2 : -5)), "in method '" "port_mgr_msg_set" "', argument " "2"" of type '" "char *""'"); goto fail; } while(0);
  }
  arg2 = (char *)(buf2);
  ecode3 = SWIG_AsVal_int (interp, objv[3], &val3);
  if (!(ecode3 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((ecode3 != (-1)) ? ecode3 : -5)), "in method '" "port_mgr_msg_set" "', argument " "3"" of type '" "int""'"); goto fail; } while(0);
  }
  arg3 = (int)(val3);
  port_mgr_msg_set(arg1,arg2,arg3);

  if (alloc1 == ((0) | ((1 << 8) << 1))) free((char*)buf1);
  if (alloc2 == ((0) | ((1 << 8) << 1))) free((char*)buf2);
  return 0;
fail:
  if (alloc1 == ((0) | ((1 << 8) << 1))) free((char*)buf1);
  if (alloc2 == ((0) | ((1 << 8) << 1))) free((char*)buf2);
  return 1;
}


static __attribute__ ((__unused__)) int
_wrap_port_mgr_msg_get(ClientData clientData __attribute__ ((__unused__)), Tcl_Interp *interp, int objc, Tcl_Obj *const objv[]) {
  char *arg1 = (char *) 0 ;
  int arg2 ;
  int res1 ;
  char *buf1 = 0 ;
  int alloc1 = 0 ;
  int val2 ;
  int ecode2 = 0 ;
  char *result = 0 ;

  if (SWIG_Tcl_GetArgs(interp, objc, objv,"oo:port_mgr_msg_get p_port offset ",(void *)0,(void *)0) == 1) goto fail;
  res1 = SWIG_AsCharPtrAndSize(objv[1], &buf1, 
# 2561 "test_wrap.c" 3 4
                                              ((void *)0)
# 2561 "test_wrap.c"
                                                  , &alloc1);
  if (!(res1 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((res1 != (-1)) ? res1 : -5)), "in method '" "port_mgr_msg_get" "', argument " "1"" of type '" "char *""'"); goto fail; } while(0);
  }
  arg1 = (char *)(buf1);
  ecode2 = SWIG_AsVal_int (interp, objv[2], &val2);
  if (!(ecode2 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((ecode2 != (-1)) ? ecode2 : -5)), "in method '" "port_mgr_msg_get" "', argument " "2"" of type '" "int""'"); goto fail; } while(0);
  }
  arg2 = (int)(val2);
  result = (char *)port_mgr_msg_get(arg1,arg2);
  Tcl_SetObjResult(interp,SWIG_FromCharPtr((const char *)result));
  if (alloc1 == ((0) | ((1 << 8) << 1))) free((char*)buf1);
  return 0;
fail:
  if (alloc1 == ((0) | ((1 << 8) << 1))) free((char*)buf1);
  return 1;
}


static __attribute__ ((__unused__)) int
_wrap_keynode_t_p_next_set(ClientData clientData __attribute__ ((__unused__)), Tcl_Interp *interp, int objc, Tcl_Obj *const objv[]) {
  struct keynode *arg1 = (struct keynode *) 0 ;
  struct keynode *arg2 = (struct keynode *) 0 ;
  void *argp1 = 0 ;
  int res1 = 0 ;
  void *argp2 = 0 ;
  int res2 = 0 ;

  if (SWIG_Tcl_GetArgs(interp, objc, objv,"oo:keynode_t_p_next_set self p_next ",(void *)0,(void *)0) == 1) goto fail;
  res1 = SWIG_Tcl_ConvertPtr(interp, objv[1], &argp1, swig_types[1], 0 | 0);
  if (!(res1 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((res1 != (-1)) ? res1 : -5)), "in method '" "keynode_t_p_next_set" "', argument " "1"" of type '" "struct keynode *""'"); goto fail; } while(0);
  }
  arg1 = (struct keynode *)(argp1);
  res2 = SWIG_Tcl_ConvertPtr(interp, objv[2], &argp2, swig_types[1], 0x1 | 0);
  if (!(res2 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((res2 != (-1)) ? res2 : -5)), "in method '" "keynode_t_p_next_set" "', argument " "2"" of type '" "struct keynode *""'"); goto fail; } while(0);
  }
  arg2 = (struct keynode *)(argp2);
  if (arg1) (arg1)->p_next = arg2;

  return 0;
fail:
  return 1;
}


static __attribute__ ((__unused__)) int
_wrap_keynode_t_p_next_get(ClientData clientData __attribute__ ((__unused__)), Tcl_Interp *interp, int objc, Tcl_Obj *const objv[]) {
  struct keynode *arg1 = (struct keynode *) 0 ;
  void *argp1 = 0 ;
  int res1 = 0 ;
  struct keynode *result = 0 ;

  if (SWIG_Tcl_GetArgs(interp, objc, objv,"o:keynode_t_p_next_get self ",(void *)0) == 1) goto fail;
  res1 = SWIG_Tcl_ConvertPtr(interp, objv[1], &argp1, swig_types[1], 0 | 0);
  if (!(res1 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((res1 != (-1)) ? res1 : -5)), "in method '" "keynode_t_p_next_get" "', argument " "1"" of type '" "struct keynode *""'"); goto fail; } while(0);
  }
  arg1 = (struct keynode *)(argp1);
  result = (struct keynode *) ((arg1)->p_next);
  Tcl_SetObjResult(interp, SWIG_Tcl_NewInstanceObj(interp, (void *)((const void *)(result)), swig_types[1], 0));
  return 0;
fail:
  return 1;
}


static __attribute__ ((__unused__)) int
_wrap_keynode_t_p_key_set(ClientData clientData __attribute__ ((__unused__)), Tcl_Interp *interp, int objc, Tcl_Obj *const objv[]) {
  struct keynode *arg1 = (struct keynode *) 0 ;
  char *arg2 = (char *) 0 ;
  void *argp1 = 0 ;
  int res1 = 0 ;
  int res2 ;
  char *buf2 = 0 ;
  int alloc2 = 0 ;

  if (SWIG_Tcl_GetArgs(interp, objc, objv,"oo:keynode_t_p_key_set self p_key ",(void *)0,(void *)0) == 1) goto fail;
  res1 = SWIG_Tcl_ConvertPtr(interp, objv[1], &argp1, swig_types[1], 0 | 0);
  if (!(res1 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((res1 != (-1)) ? res1 : -5)), "in method '" "keynode_t_p_key_set" "', argument " "1"" of type '" "struct keynode *""'"); goto fail; } while(0);
  }
  arg1 = (struct keynode *)(argp1);
  res2 = SWIG_AsCharPtrAndSize(objv[2], &buf2, 
# 2646 "test_wrap.c" 3 4
                                              ((void *)0)
# 2646 "test_wrap.c"
                                                  , &alloc2);
  if (!(res2 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((res2 != (-1)) ? res2 : -5)), "in method '" "keynode_t_p_key_set" "', argument " "2"" of type '" "char *""'"); goto fail; } while(0);
  }
  arg2 = (char *)(buf2);
  if (arg1->p_key) free((char*)arg1->p_key);
  if (arg2) {
    size_t size = strlen((const char *)(arg2)) + 1;
    arg1->p_key = (char *)(char *)memcpy(malloc((size)*sizeof(char)), (const char *)(arg2), sizeof(char)*(size));
  } else {
    arg1->p_key = 0;
  }

  if (alloc2 == ((0) | ((1 << 8) << 1))) free((char*)buf2);
  return 0;
fail:
  if (alloc2 == ((0) | ((1 << 8) << 1))) free((char*)buf2);
  return 1;
}


static __attribute__ ((__unused__)) int
_wrap_keynode_t_p_key_get(ClientData clientData __attribute__ ((__unused__)), Tcl_Interp *interp, int objc, Tcl_Obj *const objv[]) {
  struct keynode *arg1 = (struct keynode *) 0 ;
  void *argp1 = 0 ;
  int res1 = 0 ;
  char *result = 0 ;

  if (SWIG_Tcl_GetArgs(interp, objc, objv,"o:keynode_t_p_key_get self ",(void *)0) == 1) goto fail;
  res1 = SWIG_Tcl_ConvertPtr(interp, objv[1], &argp1, swig_types[1], 0 | 0);
  if (!(res1 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((res1 != (-1)) ? res1 : -5)), "in method '" "keynode_t_p_key_get" "', argument " "1"" of type '" "struct keynode *""'"); goto fail; } while(0);
  }
  arg1 = (struct keynode *)(argp1);
  result = (char *) ((arg1)->p_key);
  Tcl_SetObjResult(interp,SWIG_FromCharPtr((const char *)result));
  return 0;
fail:
  return 1;
}


static __attribute__ ((__unused__)) int
_wrap_keynode_t_p_buffer_set(ClientData clientData __attribute__ ((__unused__)), Tcl_Interp *interp, int objc, Tcl_Obj *const objv[]) {
  struct keynode *arg1 = (struct keynode *) 0 ;
  char *arg2 = (char *) 0 ;
  void *argp1 = 0 ;
  int res1 = 0 ;
  int res2 ;
  char *buf2 = 0 ;
  int alloc2 = 0 ;

  if (SWIG_Tcl_GetArgs(interp, objc, objv,"oo:keynode_t_p_buffer_set self p_buffer ",(void *)0,(void *)0) == 1) goto fail;
  res1 = SWIG_Tcl_ConvertPtr(interp, objv[1], &argp1, swig_types[1], 0 | 0);
  if (!(res1 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((res1 != (-1)) ? res1 : -5)), "in method '" "keynode_t_p_buffer_set" "', argument " "1"" of type '" "struct keynode *""'"); goto fail; } while(0);
  }
  arg1 = (struct keynode *)(argp1);
  res2 = SWIG_AsCharPtrAndSize(objv[2], &buf2, 
# 2704 "test_wrap.c" 3 4
                                              ((void *)0)
# 2704 "test_wrap.c"
                                                  , &alloc2);
  if (!(res2 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((res2 != (-1)) ? res2 : -5)), "in method '" "keynode_t_p_buffer_set" "', argument " "2"" of type '" "char *""'"); goto fail; } while(0);
  }
  arg2 = (char *)(buf2);
  if (arg1->p_buffer) free((char*)arg1->p_buffer);
  if (arg2) {
    size_t size = strlen((const char *)(arg2)) + 1;
    arg1->p_buffer = (char *)(char *)memcpy(malloc((size)*sizeof(char)), (const char *)(arg2), sizeof(char)*(size));
  } else {
    arg1->p_buffer = 0;
  }

  if (alloc2 == ((0) | ((1 << 8) << 1))) free((char*)buf2);
  return 0;
fail:
  if (alloc2 == ((0) | ((1 << 8) << 1))) free((char*)buf2);
  return 1;
}


static __attribute__ ((__unused__)) int
_wrap_keynode_t_p_buffer_get(ClientData clientData __attribute__ ((__unused__)), Tcl_Interp *interp, int objc, Tcl_Obj *const objv[]) {
  struct keynode *arg1 = (struct keynode *) 0 ;
  void *argp1 = 0 ;
  int res1 = 0 ;
  char *result = 0 ;

  if (SWIG_Tcl_GetArgs(interp, objc, objv,"o:keynode_t_p_buffer_get self ",(void *)0) == 1) goto fail;
  res1 = SWIG_Tcl_ConvertPtr(interp, objv[1], &argp1, swig_types[1], 0 | 0);
  if (!(res1 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((res1 != (-1)) ? res1 : -5)), "in method '" "keynode_t_p_buffer_get" "', argument " "1"" of type '" "struct keynode *""'"); goto fail; } while(0);
  }
  arg1 = (struct keynode *)(argp1);
  result = (char *) ((arg1)->p_buffer);
  Tcl_SetObjResult(interp,SWIG_FromCharPtr((const char *)result));
  return 0;
fail:
  return 1;
}


static __attribute__ ((__unused__)) int
_wrap_keynode_t_p_bcd_buffer_set(ClientData clientData __attribute__ ((__unused__)), Tcl_Interp *interp, int objc, Tcl_Obj *const objv[]) {
  struct keynode *arg1 = (struct keynode *) 0 ;
  char *arg2 = (char *) 0 ;
  void *argp1 = 0 ;
  int res1 = 0 ;
  int res2 ;
  char *buf2 = 0 ;
  int alloc2 = 0 ;

  if (SWIG_Tcl_GetArgs(interp, objc, objv,"oo:keynode_t_p_bcd_buffer_set self p_bcd_buffer ",(void *)0,(void *)0) == 1) goto fail;
  res1 = SWIG_Tcl_ConvertPtr(interp, objv[1], &argp1, swig_types[1], 0 | 0);
  if (!(res1 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((res1 != (-1)) ? res1 : -5)), "in method '" "keynode_t_p_bcd_buffer_set" "', argument " "1"" of type '" "struct keynode *""'"); goto fail; } while(0);
  }
  arg1 = (struct keynode *)(argp1);
  res2 = SWIG_AsCharPtrAndSize(objv[2], &buf2, 
# 2762 "test_wrap.c" 3 4
                                              ((void *)0)
# 2762 "test_wrap.c"
                                                  , &alloc2);
  if (!(res2 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((res2 != (-1)) ? res2 : -5)), "in method '" "keynode_t_p_bcd_buffer_set" "', argument " "2"" of type '" "char *""'"); goto fail; } while(0);
  }
  arg2 = (char *)(buf2);
  if (arg1->p_bcd_buffer) free((char*)arg1->p_bcd_buffer);
  if (arg2) {
    size_t size = strlen((const char *)(arg2)) + 1;
    arg1->p_bcd_buffer = (char *)(char *)memcpy(malloc((size)*sizeof(char)), (const char *)(arg2), sizeof(char)*(size));
  } else {
    arg1->p_bcd_buffer = 0;
  }

  if (alloc2 == ((0) | ((1 << 8) << 1))) free((char*)buf2);
  return 0;
fail:
  if (alloc2 == ((0) | ((1 << 8) << 1))) free((char*)buf2);
  return 1;
}


static __attribute__ ((__unused__)) int
_wrap_keynode_t_p_bcd_buffer_get(ClientData clientData __attribute__ ((__unused__)), Tcl_Interp *interp, int objc, Tcl_Obj *const objv[]) {
  struct keynode *arg1 = (struct keynode *) 0 ;
  void *argp1 = 0 ;
  int res1 = 0 ;
  char *result = 0 ;

  if (SWIG_Tcl_GetArgs(interp, objc, objv,"o:keynode_t_p_bcd_buffer_get self ",(void *)0) == 1) goto fail;
  res1 = SWIG_Tcl_ConvertPtr(interp, objv[1], &argp1, swig_types[1], 0 | 0);
  if (!(res1 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((res1 != (-1)) ? res1 : -5)), "in method '" "keynode_t_p_bcd_buffer_get" "', argument " "1"" of type '" "struct keynode *""'"); goto fail; } while(0);
  }
  arg1 = (struct keynode *)(argp1);
  result = (char *) ((arg1)->p_bcd_buffer);
  Tcl_SetObjResult(interp,SWIG_FromCharPtr((const char *)result));
  return 0;
fail:
  return 1;
}


static __attribute__ ((__unused__)) int
_wrap_keynode_t_size_set(ClientData clientData __attribute__ ((__unused__)), Tcl_Interp *interp, int objc, Tcl_Obj *const objv[]) {
  struct keynode *arg1 = (struct keynode *) 0 ;
  int arg2 ;
  void *argp1 = 0 ;
  int res1 = 0 ;
  int val2 ;
  int ecode2 = 0 ;

  if (SWIG_Tcl_GetArgs(interp, objc, objv,"oo:keynode_t_size_set self size ",(void *)0,(void *)0) == 1) goto fail;
  res1 = SWIG_Tcl_ConvertPtr(interp, objv[1], &argp1, swig_types[1], 0 | 0);
  if (!(res1 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((res1 != (-1)) ? res1 : -5)), "in method '" "keynode_t_size_set" "', argument " "1"" of type '" "struct keynode *""'"); goto fail; } while(0);
  }
  arg1 = (struct keynode *)(argp1);
  ecode2 = SWIG_AsVal_int (interp, objv[2], &val2);
  if (!(ecode2 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((ecode2 != (-1)) ? ecode2 : -5)), "in method '" "keynode_t_size_set" "', argument " "2"" of type '" "int""'"); goto fail; } while(0);
  }
  arg2 = (int)(val2);
  if (arg1) (arg1)->size = arg2;

  return 0;
fail:
  return 1;
}


static __attribute__ ((__unused__)) int
_wrap_keynode_t_size_get(ClientData clientData __attribute__ ((__unused__)), Tcl_Interp *interp, int objc, Tcl_Obj *const objv[]) {
  struct keynode *arg1 = (struct keynode *) 0 ;
  void *argp1 = 0 ;
  int res1 = 0 ;
  int result;

  if (SWIG_Tcl_GetArgs(interp, objc, objv,"o:keynode_t_size_get self ",(void *)0) == 1) goto fail;
  res1 = SWIG_Tcl_ConvertPtr(interp, objv[1], &argp1, swig_types[1], 0 | 0);
  if (!(res1 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((res1 != (-1)) ? res1 : -5)), "in method '" "keynode_t_size_get" "', argument " "1"" of type '" "struct keynode *""'"); goto fail; } while(0);
  }
  arg1 = (struct keynode *)(argp1);
  result = (int) ((arg1)->size);
  Tcl_SetObjResult(interp,SWIG_From_int((int)(result)));
  return 0;
fail:
  return 1;
}


static __attribute__ ((__unused__)) int
_wrap_new_keynode_t(ClientData clientData __attribute__ ((__unused__)), Tcl_Interp *interp, int objc, Tcl_Obj *const objv[]) {
  struct keynode *result = 0 ;

  if (SWIG_Tcl_GetArgs(interp, objc, objv,":new_keynode_t ") == 1) goto fail;
  result = (struct keynode *)calloc(1, sizeof(struct keynode));
  Tcl_SetObjResult(interp, SWIG_Tcl_NewInstanceObj(interp, (void *)((const void *)(result)), swig_types[1], 0));
  return 0;
fail:
  return 1;
}


static __attribute__ ((__unused__)) int
_wrap_delete_keynode_t(ClientData clientData __attribute__ ((__unused__)), Tcl_Interp *interp, int objc, Tcl_Obj *const objv[]) {
  struct keynode *arg1 = (struct keynode *) 0 ;
  void *argp1 = 0 ;
  int res1 = 0 ;

  if (SWIG_Tcl_GetArgs(interp, objc, objv,"o:delete_keynode_t self ",(void *)0) == 1) goto fail;
  res1 = SWIG_Tcl_ConvertPtr(interp, objv[1], &argp1, swig_types[1], 0x1 | 0);
  if (!(res1 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((res1 != (-1)) ? res1 : -5)), "in method '" "delete_keynode_t" "', argument " "1"" of type '" "struct keynode *""'"); goto fail; } while(0);
  }
  arg1 = (struct keynode *)(argp1);
  free((char *) arg1);

  return 0;
fail:
  return 1;
}


static __attribute__ ((__unused__)) void swig_delete_keynode_t(void *obj) {
struct keynode *arg1 = (struct keynode *) obj;
free((char *) arg1);
}
static swig_method swig_keynode_methods[] = {
    {0,0}
};
static swig_attribute swig_keynode_attributes[] = {
    { "-p_next",_wrap_keynode_t_p_next_get, _wrap_keynode_t_p_next_set},
    { "-p_key",_wrap_keynode_t_p_key_get, _wrap_keynode_t_p_key_set},
    { "-p_buffer",_wrap_keynode_t_p_buffer_get, _wrap_keynode_t_p_buffer_set},
    { "-p_bcd_buffer",_wrap_keynode_t_p_bcd_buffer_get, _wrap_keynode_t_p_bcd_buffer_set},
    { "-size",_wrap_keynode_t_size_get, _wrap_keynode_t_size_set},
    {0,0,0}
};
static swig_class *swig_keynode_bases[] = {0};
static const char * swig_keynode_base_names[] = {0};
static swig_class _wrap_class_keynode = { "keynode_t", &swig_types[1],_wrap_new_keynode_t, swig_delete_keynode_t, swig_keynode_methods, swig_keynode_attributes, swig_keynode_bases,swig_keynode_base_names, &swig_module, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0} };
static __attribute__ ((__unused__)) int
_wrap_key_mgr_init(ClientData clientData __attribute__ ((__unused__)), Tcl_Interp *interp, int objc, Tcl_Obj *const objv[]) {
  if (SWIG_Tcl_GetArgs(interp, objc, objv,":key_mgr_init ") == 1) goto fail;
  key_mgr_init();

  return 0;
fail:
  return 1;
}


static __attribute__ ((__unused__)) int
_wrap_key_mgr_reset(ClientData clientData __attribute__ ((__unused__)), Tcl_Interp *interp, int objc, Tcl_Obj *const objv[]) {
  if (SWIG_Tcl_GetArgs(interp, objc, objv,":key_mgr_reset ") == 1) goto fail;
  key_mgr_reset();

  return 0;
fail:
  return 1;
}


static __attribute__ ((__unused__)) int
_wrap_key_mgr_add(ClientData clientData __attribute__ ((__unused__)), Tcl_Interp *interp, int objc, Tcl_Obj *const objv[]) {
  char *arg1 = (char *) 0 ;
  int arg2 ;
  int res1 ;
  char *buf1 = 0 ;
  int alloc1 = 0 ;
  int val2 ;
  int ecode2 = 0 ;

  if (SWIG_Tcl_GetArgs(interp, objc, objv,"oo:key_mgr_add p_key size ",(void *)0,(void *)0) == 1) goto fail;
  res1 = SWIG_AsCharPtrAndSize(objv[1], &buf1, 
# 2937 "test_wrap.c" 3 4
                                              ((void *)0)
# 2937 "test_wrap.c"
                                                  , &alloc1);
  if (!(res1 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((res1 != (-1)) ? res1 : -5)), "in method '" "key_mgr_add" "', argument " "1"" of type '" "char *""'"); goto fail; } while(0);
  }
  arg1 = (char *)(buf1);
  ecode2 = SWIG_AsVal_int (interp, objv[2], &val2);
  if (!(ecode2 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((ecode2 != (-1)) ? ecode2 : -5)), "in method '" "key_mgr_add" "', argument " "2"" of type '" "int""'"); goto fail; } while(0);
  }
  arg2 = (int)(val2);
  key_mgr_add(arg1,arg2);

  if (alloc1 == ((0) | ((1 << 8) << 1))) free((char*)buf1);
  return 0;
fail:
  if (alloc1 == ((0) | ((1 << 8) << 1))) free((char*)buf1);
  return 1;
}


static __attribute__ ((__unused__)) int
_wrap_key_mgr_delete(ClientData clientData __attribute__ ((__unused__)), Tcl_Interp *interp, int objc, Tcl_Obj *const objv[]) {
  char *arg1 = (char *) 0 ;
  int res1 ;
  char *buf1 = 0 ;
  int alloc1 = 0 ;
  
# 2963 "test_wrap.c" 3 4
 _Bool 
# 2963 "test_wrap.c"
      result;

  if (SWIG_Tcl_GetArgs(interp, objc, objv,"o:key_mgr_delete p_key ",(void *)0) == 1) goto fail;
  res1 = SWIG_AsCharPtrAndSize(objv[1], &buf1, 
# 2966 "test_wrap.c" 3 4
                                              ((void *)0)
# 2966 "test_wrap.c"
                                                  , &alloc1);
  if (!(res1 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((res1 != (-1)) ? res1 : -5)), "in method '" "key_mgr_delete" "', argument " "1"" of type '" "char *""'"); goto fail; } while(0);
  }
  arg1 = (char *)(buf1);
  result = (
# 2971 "test_wrap.c" 3 4
           _Bool
# 2971 "test_wrap.c"
               )key_mgr_delete(arg1);
  Tcl_SetObjResult(interp,Tcl_NewIntObj(((
# 2972 "test_wrap.c" 3 4
                         _Bool
# 2972 "test_wrap.c"
                         )(result))!=0));
  if (alloc1 == ((0) | ((1 << 8) << 1))) free((char*)buf1);
  return 0;
fail:
  if (alloc1 == ((0) | ((1 << 8) << 1))) free((char*)buf1);
  return 1;
}


static __attribute__ ((__unused__)) int
_wrap_key_mgr_get_msg(ClientData clientData __attribute__ ((__unused__)), Tcl_Interp *interp, int objc, Tcl_Obj *const objv[]) {
  char *arg1 = (char *) 0 ;
  int res1 ;
  char *buf1 = 0 ;
  int alloc1 = 0 ;
  void *result = 0 ;

  if (SWIG_Tcl_GetArgs(interp, objc, objv,"o:key_mgr_get_msg p_key ",(void *)0) == 1) goto fail;
  res1 = SWIG_AsCharPtrAndSize(objv[1], &buf1, 
# 2990 "test_wrap.c" 3 4
                                              ((void *)0)
# 2990 "test_wrap.c"
                                                  , &alloc1);
  if (!(res1 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((res1 != (-1)) ? res1 : -5)), "in method '" "key_mgr_get_msg" "', argument " "1"" of type '" "char *""'"); goto fail; } while(0);
  }
  arg1 = (char *)(buf1);
  result = (void *)key_mgr_get_msg(arg1);
  Tcl_SetObjResult(interp, SWIG_Tcl_NewInstanceObj(interp, (void *)((const void *)(result)), swig_types[6], 0));
  if (alloc1 == ((0) | ((1 << 8) << 1))) free((char*)buf1);
  return 0;
fail:
  if (alloc1 == ((0) | ((1 << 8) << 1))) free((char*)buf1);
  return 1;
}


static __attribute__ ((__unused__)) int
_wrap_key_mgr_get_size(ClientData clientData __attribute__ ((__unused__)), Tcl_Interp *interp, int objc, Tcl_Obj *const objv[]) {
  char *arg1 = (char *) 0 ;
  int res1 ;
  char *buf1 = 0 ;
  int alloc1 = 0 ;
  int result;

  if (SWIG_Tcl_GetArgs(interp, objc, objv,"o:key_mgr_get_size p_key ",(void *)0) == 1) goto fail;
  res1 = SWIG_AsCharPtrAndSize(objv[1], &buf1, 
# 3014 "test_wrap.c" 3 4
                                              ((void *)0)
# 3014 "test_wrap.c"
                                                  , &alloc1);
  if (!(res1 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((res1 != (-1)) ? res1 : -5)), "in method '" "key_mgr_get_size" "', argument " "1"" of type '" "char *""'"); goto fail; } while(0);
  }
  arg1 = (char *)(buf1);
  result = (int)key_mgr_get_size(arg1);
  Tcl_SetObjResult(interp,SWIG_From_int((int)(result)));
  if (alloc1 == ((0) | ((1 << 8) << 1))) free((char*)buf1);
  return 0;
fail:
  if (alloc1 == ((0) | ((1 << 8) << 1))) free((char*)buf1);
  return 1;
}


static __attribute__ ((__unused__)) int
_wrap_key_mgr_check(ClientData clientData __attribute__ ((__unused__)), Tcl_Interp *interp, int objc, Tcl_Obj *const objv[]) {
  char *arg1 = (char *) 0 ;
  int res1 ;
  char *buf1 = 0 ;
  int alloc1 = 0 ;
  
# 3035 "test_wrap.c" 3 4
 _Bool 
# 3035 "test_wrap.c"
      result;

  if (SWIG_Tcl_GetArgs(interp, objc, objv,"o:key_mgr_check p_key ",(void *)0) == 1) goto fail;
  res1 = SWIG_AsCharPtrAndSize(objv[1], &buf1, 
# 3038 "test_wrap.c" 3 4
                                              ((void *)0)
# 3038 "test_wrap.c"
                                                  , &alloc1);
  if (!(res1 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((res1 != (-1)) ? res1 : -5)), "in method '" "key_mgr_check" "', argument " "1"" of type '" "char *""'"); goto fail; } while(0);
  }
  arg1 = (char *)(buf1);
  result = (
# 3043 "test_wrap.c" 3 4
           _Bool
# 3043 "test_wrap.c"
               )key_mgr_check(arg1);
  Tcl_SetObjResult(interp,Tcl_NewIntObj(((
# 3044 "test_wrap.c" 3 4
                         _Bool
# 3044 "test_wrap.c"
                         )(result))!=0));
  if (alloc1 == ((0) | ((1 << 8) << 1))) free((char*)buf1);
  return 0;
fail:
  if (alloc1 == ((0) | ((1 << 8) << 1))) free((char*)buf1);
  return 1;
}


static __attribute__ ((__unused__)) int
_wrap_key_mgr_dump(ClientData clientData __attribute__ ((__unused__)), Tcl_Interp *interp, int objc, Tcl_Obj *const objv[]) {
  if (SWIG_Tcl_GetArgs(interp, objc, objv,":key_mgr_dump ") == 1) goto fail;
  key_mgr_dump();

  return 0;
fail:
  return 1;
}


static __attribute__ ((__unused__)) int
_wrap_key_mgr_bcd_get(ClientData clientData __attribute__ ((__unused__)), Tcl_Interp *interp, int objc, Tcl_Obj *const objv[]) {
  char *arg1 = (char *) 0 ;
  int res1 ;
  char *buf1 = 0 ;
  int alloc1 = 0 ;
  char *result = 0 ;

  if (SWIG_Tcl_GetArgs(interp, objc, objv,"o:key_mgr_bcd_get p_key ",(void *)0) == 1) goto fail;
  res1 = SWIG_AsCharPtrAndSize(objv[1], &buf1, 
# 3073 "test_wrap.c" 3 4
                                              ((void *)0)
# 3073 "test_wrap.c"
                                                  , &alloc1);
  if (!(res1 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((res1 != (-1)) ? res1 : -5)), "in method '" "key_mgr_bcd_get" "', argument " "1"" of type '" "char *""'"); goto fail; } while(0);
  }
  arg1 = (char *)(buf1);
  result = (char *)key_mgr_bcd_get(arg1);
  Tcl_SetObjResult(interp,SWIG_FromCharPtr((const char *)result));
  if (alloc1 == ((0) | ((1 << 8) << 1))) free((char*)buf1);
  return 0;
fail:
  if (alloc1 == ((0) | ((1 << 8) << 1))) free((char*)buf1);
  return 1;
}


static __attribute__ ((__unused__)) int
_wrap_key_mgr_bcd_set(ClientData clientData __attribute__ ((__unused__)), Tcl_Interp *interp, int objc, Tcl_Obj *const objv[]) {
  char *arg1 = (char *) 0 ;
  char *arg2 = (char *) 0 ;
  int res1 ;
  char *buf1 = 0 ;
  int alloc1 = 0 ;
  int res2 ;
  char *buf2 = 0 ;
  int alloc2 = 0 ;
  int result;

  if (SWIG_Tcl_GetArgs(interp, objc, objv,"oo:key_mgr_bcd_set p_key p_bcd ",(void *)0,(void *)0) == 1) goto fail;
  res1 = SWIG_AsCharPtrAndSize(objv[1], &buf1, 
# 3101 "test_wrap.c" 3 4
                                              ((void *)0)
# 3101 "test_wrap.c"
                                                  , &alloc1);
  if (!(res1 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((res1 != (-1)) ? res1 : -5)), "in method '" "key_mgr_bcd_set" "', argument " "1"" of type '" "char *""'"); goto fail; } while(0);
  }
  arg1 = (char *)(buf1);
  res2 = SWIG_AsCharPtrAndSize(objv[2], &buf2, 
# 3106 "test_wrap.c" 3 4
                                              ((void *)0)
# 3106 "test_wrap.c"
                                                  , &alloc2);
  if (!(res2 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((res2 != (-1)) ? res2 : -5)), "in method '" "key_mgr_bcd_set" "', argument " "2"" of type '" "char *""'"); goto fail; } while(0);
  }
  arg2 = (char *)(buf2);
  result = (int)key_mgr_bcd_set(arg1,arg2);
  Tcl_SetObjResult(interp,SWIG_From_int((int)(result)));
  if (alloc1 == ((0) | ((1 << 8) << 1))) free((char*)buf1);
  if (alloc2 == ((0) | ((1 << 8) << 1))) free((char*)buf2);
  return 0;
fail:
  if (alloc1 == ((0) | ((1 << 8) << 1))) free((char*)buf1);
  if (alloc2 == ((0) | ((1 << 8) << 1))) free((char*)buf2);
  return 1;
}


static __attribute__ ((__unused__)) int
_wrap_test_bcd(ClientData clientData __attribute__ ((__unused__)), Tcl_Interp *interp, int objc, Tcl_Obj *const objv[]) {
  char *arg1 = (char *) 0 ;
  int res1 ;
  char *buf1 = 0 ;
  int alloc1 = 0 ;

  if (SWIG_Tcl_GetArgs(interp, objc, objv,"o:test_bcd p_key ",(void *)0) == 1) goto fail;
  res1 = SWIG_AsCharPtrAndSize(objv[1], &buf1, 
# 3131 "test_wrap.c" 3 4
                                              ((void *)0)
# 3131 "test_wrap.c"
                                                  , &alloc1);
  if (!(res1 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((res1 != (-1)) ? res1 : -5)), "in method '" "test_bcd" "', argument " "1"" of type '" "char *""'"); goto fail; } while(0);
  }
  arg1 = (char *)(buf1);
  test_bcd(arg1);

  if (alloc1 == ((0) | ((1 << 8) << 1))) free((char*)buf1);
  return 0;
fail:
  if (alloc1 == ((0) | ((1 << 8) << 1))) free((char*)buf1);
  return 1;
}


static __attribute__ ((__unused__)) int
_wrap_key_mgr_set_buff(ClientData clientData __attribute__ ((__unused__)), Tcl_Interp *interp, int objc, Tcl_Obj *const objv[]) {
  char *arg1 = (char *) 0 ;
  void *arg2 = (void *) 0 ;
  int res1 ;
  char *buf1 = 0 ;
  int alloc1 = 0 ;
  int res2 ;

  if (SWIG_Tcl_GetArgs(interp, objc, objv,"oo:key_mgr_set_buff p_key p_src ",(void *)0,(void *)0) == 1) goto fail;
  res1 = SWIG_AsCharPtrAndSize(objv[1], &buf1, 
# 3156 "test_wrap.c" 3 4
                                              ((void *)0)
# 3156 "test_wrap.c"
                                                  , &alloc1);
  if (!(res1 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((res1 != (-1)) ? res1 : -5)), "in method '" "key_mgr_set_buff" "', argument " "1"" of type '" "char *""'"); goto fail; } while(0);
  }
  arg1 = (char *)(buf1);
  res2 = SWIG_Tcl_ConvertPtr(interp, objv[2], ((void)(void *)((const void *)(*&arg2)),(void**)(&arg2)), 0, 0);
  if (!(res2 >= 0)) {
    do { SWIG_Tcl_SetErrorMsg(interp, SWIG_Tcl_ErrorType(((res2 != (-1)) ? res2 : -5)), "in method '" "key_mgr_set_buff" "', argument " "2"" of type '" "void *""'"); goto fail; } while(0);
  }
  key_mgr_set_buff(arg1,arg2);

  if (alloc1 == ((0) | ((1 << 8) << 1))) free((char*)buf1);
  return 0;
fail:
  if (alloc1 == ((0) | ((1 << 8) << 1))) free((char*)buf1);
  return 1;
}



static swig_command_info swig_commands[] = {
    { "" "queue_init", (swig_wrapper_func) _wrap_queue_init, 
# 3177 "test_wrap.c" 3 4
                                                                     ((void *)0)
# 3177 "test_wrap.c"
                                                                         },
    { "" "stub_init", (swig_wrapper_func) _wrap_stub_init, 
# 3178 "test_wrap.c" 3 4
                                                                   ((void *)0)
# 3178 "test_wrap.c"
                                                                       },
    { "" "stub_clear", (swig_wrapper_func) _wrap_stub_clear, 
# 3179 "test_wrap.c" 3 4
                                                                     ((void *)0)
# 3179 "test_wrap.c"
                                                                         },
    { "" "stub_cleanup", (swig_wrapper_func) _wrap_stub_cleanup, 
# 3180 "test_wrap.c" 3 4
                                                                         ((void *)0)
# 3180 "test_wrap.c"
                                                                             },
    { "" "sv_csr_write_wrapper", (swig_wrapper_func) _wrap_sv_csr_write_wrapper, 
# 3181 "test_wrap.c" 3 4
                                                                                         ((void *)0)
# 3181 "test_wrap.c"
                                                                                             },
    { "" "sv_csr_read_wrapper", (swig_wrapper_func) _wrap_sv_csr_read_wrapper, 
# 3182 "test_wrap.c" 3 4
                                                                                       ((void *)0)
# 3182 "test_wrap.c"
                                                                                           },
    { "" "sv_csr_peek_wrapper", (swig_wrapper_func) _wrap_sv_csr_peek_wrapper, 
# 3183 "test_wrap.c" 3 4
                                                                                       ((void *)0)
# 3183 "test_wrap.c"
                                                                                           },
    { "" "sv_csr_qlen_wrapper", (swig_wrapper_func) _wrap_sv_csr_qlen_wrapper, 
# 3184 "test_wrap.c" 3 4
                                                                                       ((void *)0)
# 3184 "test_wrap.c"
                                                                                           },
    { "" "node_t_p_next_set", (swig_wrapper_func) _wrap_node_t_p_next_set, 
# 3185 "test_wrap.c" 3 4
                                                                                   ((void *)0)
# 3185 "test_wrap.c"
                                                                                       },
    { "" "node_t_p_next_get", (swig_wrapper_func) _wrap_node_t_p_next_get, 
# 3186 "test_wrap.c" 3 4
                                                                                   ((void *)0)
# 3186 "test_wrap.c"
                                                                                       },
    { "" "node_t_p_port_set", (swig_wrapper_func) _wrap_node_t_p_port_set, 
# 3187 "test_wrap.c" 3 4
                                                                                   ((void *)0)
# 3187 "test_wrap.c"
                                                                                       },
    { "" "node_t_p_port_get", (swig_wrapper_func) _wrap_node_t_p_port_get, 
# 3188 "test_wrap.c" 3 4
                                                                                   ((void *)0)
# 3188 "test_wrap.c"
                                                                                       },
    { "" "node_t_p_buffer_set", (swig_wrapper_func) _wrap_node_t_p_buffer_set, 
# 3189 "test_wrap.c" 3 4
                                                                                       ((void *)0)
# 3189 "test_wrap.c"
                                                                                           },
    { "" "node_t_p_buffer_get", (swig_wrapper_func) _wrap_node_t_p_buffer_get, 
# 3190 "test_wrap.c" 3 4
                                                                                       ((void *)0)
# 3190 "test_wrap.c"
                                                                                           },
    { "" "node_t_size_set", (swig_wrapper_func) _wrap_node_t_size_set, 
# 3191 "test_wrap.c" 3 4
                                                                               ((void *)0)
# 3191 "test_wrap.c"
                                                                                   },
    { "" "node_t_size_get", (swig_wrapper_func) _wrap_node_t_size_get, 
# 3192 "test_wrap.c" 3 4
                                                                               ((void *)0)
# 3192 "test_wrap.c"
                                                                                   },
    { "" "new_node_t", (swig_wrapper_func) _wrap_new_node_t, 
# 3193 "test_wrap.c" 3 4
                                                                     ((void *)0)
# 3193 "test_wrap.c"
                                                                         },
    { "" "delete_node_t", (swig_wrapper_func) _wrap_delete_node_t, 
# 3194 "test_wrap.c" 3 4
                                                                           ((void *)0)
# 3194 "test_wrap.c"
                                                                               },
    { "" "node_t", (swig_wrapper_func) SWIG_Tcl_ObjectConstructor, (ClientData)&_wrap_class_node},
    { "" "port_mgr_init", (swig_wrapper_func) _wrap_port_mgr_init, 
# 3196 "test_wrap.c" 3 4
                                                                           ((void *)0)
# 3196 "test_wrap.c"
                                                                               },
    { "" "port_mgr_reset", (swig_wrapper_func) _wrap_port_mgr_reset, 
# 3197 "test_wrap.c" 3 4
                                                                             ((void *)0)
# 3197 "test_wrap.c"
                                                                                 },
    { "" "port_mgr_add", (swig_wrapper_func) _wrap_port_mgr_add, 
# 3198 "test_wrap.c" 3 4
                                                                         ((void *)0)
# 3198 "test_wrap.c"
                                                                             },
    { "" "port_mgr_delete", (swig_wrapper_func) _wrap_port_mgr_delete, 
# 3199 "test_wrap.c" 3 4
                                                                               ((void *)0)
# 3199 "test_wrap.c"
                                                                                   },
    { "" "port_mgr_get_msg", (swig_wrapper_func) _wrap_port_mgr_get_msg, 
# 3200 "test_wrap.c" 3 4
                                                                                 ((void *)0)
# 3200 "test_wrap.c"
                                                                                     },
    { "" "port_mgr_get_size", (swig_wrapper_func) _wrap_port_mgr_get_size, 
# 3201 "test_wrap.c" 3 4
                                                                                   ((void *)0)
# 3201 "test_wrap.c"
                                                                                       },
    { "" "port_mgr_check", (swig_wrapper_func) _wrap_port_mgr_check, 
# 3202 "test_wrap.c" 3 4
                                                                             ((void *)0)
# 3202 "test_wrap.c"
                                                                                 },
    { "" "port_mgr_dump", (swig_wrapper_func) _wrap_port_mgr_dump, 
# 3203 "test_wrap.c" 3 4
                                                                           ((void *)0)
# 3203 "test_wrap.c"
                                                                               },
    { "" "port_mgr_msg_set", (swig_wrapper_func) _wrap_port_mgr_msg_set, 
# 3204 "test_wrap.c" 3 4
                                                                                 ((void *)0)
# 3204 "test_wrap.c"
                                                                                     },
    { "" "port_mgr_msg_get", (swig_wrapper_func) _wrap_port_mgr_msg_get, 
# 3205 "test_wrap.c" 3 4
                                                                                 ((void *)0)
# 3205 "test_wrap.c"
                                                                                     },
    { "" "keynode_t_p_next_set", (swig_wrapper_func) _wrap_keynode_t_p_next_set, 
# 3206 "test_wrap.c" 3 4
                                                                                         ((void *)0)
# 3206 "test_wrap.c"
                                                                                             },
    { "" "keynode_t_p_next_get", (swig_wrapper_func) _wrap_keynode_t_p_next_get, 
# 3207 "test_wrap.c" 3 4
                                                                                         ((void *)0)
# 3207 "test_wrap.c"
                                                                                             },
    { "" "keynode_t_p_key_set", (swig_wrapper_func) _wrap_keynode_t_p_key_set, 
# 3208 "test_wrap.c" 3 4
                                                                                       ((void *)0)
# 3208 "test_wrap.c"
                                                                                           },
    { "" "keynode_t_p_key_get", (swig_wrapper_func) _wrap_keynode_t_p_key_get, 
# 3209 "test_wrap.c" 3 4
                                                                                       ((void *)0)
# 3209 "test_wrap.c"
                                                                                           },
    { "" "keynode_t_p_buffer_set", (swig_wrapper_func) _wrap_keynode_t_p_buffer_set, 
# 3210 "test_wrap.c" 3 4
                                                                                             ((void *)0)
# 3210 "test_wrap.c"
                                                                                                 },
    { "" "keynode_t_p_buffer_get", (swig_wrapper_func) _wrap_keynode_t_p_buffer_get, 
# 3211 "test_wrap.c" 3 4
                                                                                             ((void *)0)
# 3211 "test_wrap.c"
                                                                                                 },
    { "" "keynode_t_p_bcd_buffer_set", (swig_wrapper_func) _wrap_keynode_t_p_bcd_buffer_set, 
# 3212 "test_wrap.c" 3 4
                                                                                                     ((void *)0)
# 3212 "test_wrap.c"
                                                                                                         },
    { "" "keynode_t_p_bcd_buffer_get", (swig_wrapper_func) _wrap_keynode_t_p_bcd_buffer_get, 
# 3213 "test_wrap.c" 3 4
                                                                                                     ((void *)0)
# 3213 "test_wrap.c"
                                                                                                         },
    { "" "keynode_t_size_set", (swig_wrapper_func) _wrap_keynode_t_size_set, 
# 3214 "test_wrap.c" 3 4
                                                                                     ((void *)0)
# 3214 "test_wrap.c"
                                                                                         },
    { "" "keynode_t_size_get", (swig_wrapper_func) _wrap_keynode_t_size_get, 
# 3215 "test_wrap.c" 3 4
                                                                                     ((void *)0)
# 3215 "test_wrap.c"
                                                                                         },
    { "" "new_keynode_t", (swig_wrapper_func) _wrap_new_keynode_t, 
# 3216 "test_wrap.c" 3 4
                                                                           ((void *)0)
# 3216 "test_wrap.c"
                                                                               },
    { "" "delete_keynode_t", (swig_wrapper_func) _wrap_delete_keynode_t, 
# 3217 "test_wrap.c" 3 4
                                                                                 ((void *)0)
# 3217 "test_wrap.c"
                                                                                     },
    { "" "keynode_t", (swig_wrapper_func) SWIG_Tcl_ObjectConstructor, (ClientData)&_wrap_class_keynode},
    { "" "key_mgr_init", (swig_wrapper_func) _wrap_key_mgr_init, 
# 3219 "test_wrap.c" 3 4
                                                                         ((void *)0)
# 3219 "test_wrap.c"
                                                                             },
    { "" "key_mgr_reset", (swig_wrapper_func) _wrap_key_mgr_reset, 
# 3220 "test_wrap.c" 3 4
                                                                           ((void *)0)
# 3220 "test_wrap.c"
                                                                               },
    { "" "key_mgr_add", (swig_wrapper_func) _wrap_key_mgr_add, 
# 3221 "test_wrap.c" 3 4
                                                                       ((void *)0)
# 3221 "test_wrap.c"
                                                                           },
    { "" "key_mgr_delete", (swig_wrapper_func) _wrap_key_mgr_delete, 
# 3222 "test_wrap.c" 3 4
                                                                             ((void *)0)
# 3222 "test_wrap.c"
                                                                                 },
    { "" "key_mgr_get_msg", (swig_wrapper_func) _wrap_key_mgr_get_msg, 
# 3223 "test_wrap.c" 3 4
                                                                               ((void *)0)
# 3223 "test_wrap.c"
                                                                                   },
    { "" "key_mgr_get_size", (swig_wrapper_func) _wrap_key_mgr_get_size, 
# 3224 "test_wrap.c" 3 4
                                                                                 ((void *)0)
# 3224 "test_wrap.c"
                                                                                     },
    { "" "key_mgr_check", (swig_wrapper_func) _wrap_key_mgr_check, 
# 3225 "test_wrap.c" 3 4
                                                                           ((void *)0)
# 3225 "test_wrap.c"
                                                                               },
    { "" "key_mgr_dump", (swig_wrapper_func) _wrap_key_mgr_dump, 
# 3226 "test_wrap.c" 3 4
                                                                         ((void *)0)
# 3226 "test_wrap.c"
                                                                             },
    { "" "key_mgr_bcd_get", (swig_wrapper_func) _wrap_key_mgr_bcd_get, 
# 3227 "test_wrap.c" 3 4
                                                                               ((void *)0)
# 3227 "test_wrap.c"
                                                                                   },
    { "" "key_mgr_bcd_set", (swig_wrapper_func) _wrap_key_mgr_bcd_set, 
# 3228 "test_wrap.c" 3 4
                                                                               ((void *)0)
# 3228 "test_wrap.c"
                                                                                   },
    { "" "test_bcd", (swig_wrapper_func) _wrap_test_bcd, 
# 3229 "test_wrap.c" 3 4
                                                                 ((void *)0)
# 3229 "test_wrap.c"
                                                                     },
    { "" "key_mgr_set_buff", (swig_wrapper_func) _wrap_key_mgr_set_buff, 
# 3230 "test_wrap.c" 3 4
                                                                                 ((void *)0)
# 3230 "test_wrap.c"
                                                                                     },
    {0, 0, 0}
};

static swig_var_info swig_variables[] = {
    {0,0,0,0}
};

static swig_const_info swig_constants[] = {
    {0,0,0,0,0,0}
};



static swig_type_info _swigt__p_char = {"_p_char", "char *", 0, 0, (void*)0, 0};
static swig_type_info _swigt__p_keynode = {"_p_keynode", "struct keynode *|keynode_t *|keynode *", 0, 0, (void*)&_wrap_class_keynode, 0};
static swig_type_info _swigt__p_node = {"_p_node", "struct node *|node *|node_t *", 0, 0, (void*)&_wrap_class_node, 0};
static swig_type_info _swigt__p_unsigned_char = {"_p_unsigned_char", "unsigned char *|uint8_t *", 0, 0, (void*)0, 0};
static swig_type_info _swigt__p_unsigned_int = {"_p_unsigned_int", "uint32_t *|unsigned int *", 0, 0, (void*)0, 0};
static swig_type_info _swigt__p_unsigned_short = {"_p_unsigned_short", "unsigned short *|uint16_t *", 0, 0, (void*)0, 0};
static swig_type_info _swigt__p_void = {"_p_void", "void *", 0, 0, (void*)0, 0};

static swig_type_info *swig_type_initial[] = {
  &_swigt__p_char,
  &_swigt__p_keynode,
  &_swigt__p_node,
  &_swigt__p_unsigned_char,
  &_swigt__p_unsigned_int,
  &_swigt__p_unsigned_short,
  &_swigt__p_void,
};

static swig_cast_info _swigc__p_char[] = { {&_swigt__p_char, 0, 0, 0},{0, 0, 0, 0}};
static swig_cast_info _swigc__p_keynode[] = { {&_swigt__p_keynode, 0, 0, 0},{0, 0, 0, 0}};
static swig_cast_info _swigc__p_node[] = { {&_swigt__p_node, 0, 0, 0},{0, 0, 0, 0}};
static swig_cast_info _swigc__p_unsigned_char[] = { {&_swigt__p_unsigned_char, 0, 0, 0},{0, 0, 0, 0}};
static swig_cast_info _swigc__p_unsigned_int[] = { {&_swigt__p_unsigned_int, 0, 0, 0},{0, 0, 0, 0}};
static swig_cast_info _swigc__p_unsigned_short[] = { {&_swigt__p_unsigned_short, 0, 0, 0},{0, 0, 0, 0}};
static swig_cast_info _swigc__p_void[] = { {&_swigt__p_void, 0, 0, 0},{0, 0, 0, 0}};

static swig_cast_info *swig_cast_initial[] = {
  _swigc__p_char,
  _swigc__p_keynode,
  _swigc__p_node,
  _swigc__p_unsigned_char,
  _swigc__p_unsigned_int,
  _swigc__p_unsigned_short,
  _swigc__p_void,
};
# 3339 "test_wrap.c"
static __attribute__ ((__unused__)) void
SWIG_InitializeModule(void *clientdata) {
  size_t i;
  swig_module_info *module_head, *iter;
  int init;


  if (swig_module.next==0) {

    swig_module.type_initial = swig_type_initial;
    swig_module.cast_initial = swig_cast_initial;
    swig_module.next = &swig_module;
    init = 1;
  } else {
    init = 0;
  }


  module_head = SWIG_Tcl_GetModule((Tcl_Interp *) (clientdata));
  if (!module_head) {


    SWIG_Tcl_SetModule((Tcl_Interp *) (clientdata), &swig_module);
  } else {

    iter=module_head;
    do {
      if (iter==&swig_module) {

        return;
      }
      iter=iter->next;
    } while (iter!= module_head);


    swig_module.next = module_head->next;
    module_head->next = &swig_module;
  }





  if (init == 0) return;





  for (i = 0; i < swig_module.size; ++i) {
    swig_type_info *type = 0;
    swig_type_info *ret;
    swig_cast_info *cast;






    if (swig_module.next != &swig_module) {
      type = SWIG_MangledTypeQueryModule(swig_module.next, &swig_module, swig_module.type_initial[i]->name);
    }
    if (type) {




      if (swig_module.type_initial[i]->clientdata) {
        type->clientdata = swig_module.type_initial[i]->clientdata;



      }
    } else {
      type = swig_module.type_initial[i];
    }


    cast = swig_module.cast_initial[i];
    while (cast->type) {

      ret = 0;



      if (swig_module.next != &swig_module) {
        ret = SWIG_MangledTypeQueryModule(swig_module.next, &swig_module, cast->type->name);



      }
      if (ret) {
        if (type == swig_module.type_initial[i]) {



          cast->type = ret;
          ret = 0;
        } else {

          swig_cast_info *ocast = SWIG_TypeCheck(ret->name, type);



          if (!ocast) ret = 0;
        }
      }

      if (!ret) {



        if (type->cast) {
          type->cast->prev = cast;
          cast->next = type->cast;
        }
        type->cast = cast;
      }
      cast++;
    }

    swig_module.types[i] = type;
  }
  swig_module.types[i] = 0;
# 3479 "test_wrap.c"
}






static __attribute__ ((__unused__)) void
SWIG_PropagateClientData(void) {
  size_t i;
  swig_cast_info *equiv;
  static int init_run = 0;

  if (init_run) return;
  init_run = 1;

  for (i = 0; i < swig_module.size; i++) {
    if (swig_module.types[i]->clientdata) {
      equiv = swig_module.types[i]->cast;
      while (equiv) {
        if (!equiv->converter) {
          if (equiv->type && !equiv->type->clientdata)
          SWIG_TypeClientData(equiv->type, swig_module.types[i]->clientdata);
        }
        equiv = equiv->next;
      }
    }
  }
}
# 3528 "test_wrap.c"
  static __attribute__ ((__unused__)) void
  SWIG_Tcl_InstallConstants(Tcl_Interp *interp, swig_const_info constants[]) {
    size_t i;
    Tcl_Obj *obj;

    if (!swigconstTableinit) {
      Tcl_InitHashTable(&swigconstTable, (0));
      swigconstTableinit = 1;
    }
    for (i = 0; constants[i].type; i++) {
      switch(constants[i].type) {
      case 4:
        obj = SWIG_Tcl_NewPointerObj(constants[i].pvalue, *(constants[i]).ptype, 0);
        break;
      case 5:
        obj = SWIG_Tcl_NewPackedObj(constants[i].pvalue, constants[i].lvalue, *(constants[i].ptype));
        break;
      default:
        obj = 0;
        break;
      }
      if (obj) {
        SWIG_Tcl_SetConstantObj(interp, constants[i].name, obj);
      }
    }
  }



  static __attribute__ ((__unused__)) void
  SWIG_Tcl_InstallMethodLookupTables(void) {
    size_t i;

    for (i = 0; i < swig_module.size; ++i) {
      swig_type_info *type = swig_module.type_initial[i];
      if (type->clientdata) {
        swig_class* klass = (swig_class*) type->clientdata;
        swig_method* meth;
        Tcl_InitHashTable(&(klass->hashtable), (0));
        for (meth = klass->methods; meth && meth->name; ++meth) {
          int newEntry;
          Tcl_HashEntry* hashentry = (*((&(klass->hashtable))->createProc))(&(klass->hashtable), (const char *)(meth->name), &newEntry);
          ((hashentry)->clientData = (ClientData) ((ClientData)meth->method));
        }
      }
    }
  }
# 3584 "test_wrap.c"
__attribute__ ((visibility("default"))) int Tclsharedmem_Init(Tcl_Interp *interp) {
  size_t i;
  if (interp == 0) return 1;
# 3600 "test_wrap.c"
  Tcl_PkgProvideEx(interp, (char*)"tclsharedmem", (char*)"0.0", 
# 3600 "test_wrap.c" 3 4
 ((void *)0)
# 3600 "test_wrap.c"
 );





  SWIG_InitializeModule((void *) interp);
  SWIG_PropagateClientData();

  for (i = 0; swig_commands[i].name; i++) {
    Tcl_CreateObjCommand(interp, (char *) swig_commands[i].name, (swig_wrapper_func) swig_commands[i].wrapper,
      swig_commands[i].clientdata, 
# 3611 "test_wrap.c" 3 4
                                  ((void *)0)
# 3611 "test_wrap.c"
                                      );
  }
  for (i = 0; swig_variables[i].name; i++) {
    Tcl_SetVar2(interp, (char *) swig_variables[i].name, 
# 3614 "test_wrap.c" 3 4
   ((void *)0)
# 3614 "test_wrap.c"
   , (char *) "", 1);
    Tcl_TraceVar2(interp, (char *) swig_variables[i].name, 
# 3615 "test_wrap.c" 3 4
   ((void *)0)
# 3615 "test_wrap.c"
   , 0x10 | 1, (Tcl_VarTraceProc *) swig_variables[i].get, (ClientData) swig_variables[i].addr)
                                                                                      ;
    Tcl_TraceVar2(interp, (char *) swig_variables[i].name, 
# 3617 "test_wrap.c" 3 4
   ((void *)0)
# 3617 "test_wrap.c"
   , 0x20 | 1, (Tcl_VarTraceProc *) swig_variables[i].set, (ClientData) swig_variables[i].addr)
                                                                                      ;
  }

  SWIG_Tcl_InstallConstants(interp, swig_constants);
  SWIG_Tcl_InstallMethodLookupTables();


  return 0;
}
__attribute__ ((visibility("default"))) int Tclsharedmem_SafeInit(Tcl_Interp *interp) {
  return Tclsharedmem_Init(interp);
}
