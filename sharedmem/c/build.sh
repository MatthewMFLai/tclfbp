swig -tcl test.i
gcc -c -fpic test_wrap.c queue.c shm.c sem.c ringbuff.c test_helper.c -I. -I/usr/local/include -I/opt/ActiveTcl-8.6/include -save-temps
gcc -shared test_wrap.o queue.o shm.o sem.o ringbuff.o test_helper.o -lrt -o tclsharedmem.so