#include <stdio.h>
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include "shm.h"

static int m_shmid;

char *shm_init(size_t memsize, char *p_key)
{
    key_t key;
    char *data;

    data = (char *)0xffffffff;
    /* make the key: */
    if ((key = ftok(p_key, 'R')) == -1) {
        printf("ftok failure\n");
        return (data);
    }

    /* connect to (and possibly create) the segment: */
    if ((m_shmid = shmget(key, memsize, 0644 | IPC_CREAT)) == -1) {
        printf("shmget failure\n");
        return (data);
    }

    /* attach to the segment to get a pointer to it: */
    data = shmat(m_shmid, (void *)0, 0);
    if (data == (char *)(-1)) {
        printf("shmat failure\n");
        return (data);
    }
    return (data);
}

void shm_remove(void)
{
    shmctl(m_shmid, IPC_RMID, NULL);
}
