swig -tcl test.i
gcc -c -fpic test_wrap.c queue.c shm.c shm_mgr.c ringbuff.c test_helper.c sock_helper.c -I. -I/usr/local/include -I/opt/ActiveTcl-8.6/include -I/usr/include/tcl8.6 -save-temps
gcc -shared test_wrap.o queue.o shm.o shm_mgr.o ringbuff.o test_helper.o sock_helper.o -lrt -o tclsharedmem.so
