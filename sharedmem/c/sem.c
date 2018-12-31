#include "sem.h"
#include <errno.h>
#include <unistd.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/sem.h>

union semun {
    int val;
    /* used for SETVAL only */
    struct semid_ds *buf; /* for IPC_STAT and IPC_SET */
    ushort *array;
    /* used for GETALL and SETALL */
};

static int m_semid;
static struct sembuf m_sb = {0, -1, 0};

int my_sem_init(char *p_key)
{
    key_t key;
    union semun arg;
    
    if ((key = ftok(p_key, 'J')) == -1) {
        printf("ftok failure\n");
        return(-1);
    }
    /* create a semaphore set with 1 semaphore: */
    if ((m_semid = semget(key, 1, 0666 | IPC_CREAT)) == -1) {
        printf("semget failure\n");
        return(-1);
    }
    /* initialize semaphore #0 to 1: */
    arg.val = 1;
    if (semctl(m_semid, 0, SETVAL, arg) == -1) {
        printf("semctl failure\n");
        return(-1);
    }
    return (0);
}

int sem_lock (void)
{
    m_sb.sem_op = -1; /* free resource */
    if (semop(m_semid, &m_sb, 1) == -1) {
        printf("semop lock failure\n");
        return(-3);
    }
    return (0);
}

int sem_unlock (void)
{
    m_sb.sem_op = 1; /* free resource */
    if (semop(m_semid, &m_sb, 1) == -1) {
        printf("semop unlock failure\n");
        return(-4);
    }
    return (0);
}

int sem_remove(void)
{
    union semun arg;

    /* remove it: */
    if (semctl(m_semid, 0, IPC_RMID, arg) == -1) {
        printf("sem remove failure\n");
        return(-1);
    }
    return (0);
}
