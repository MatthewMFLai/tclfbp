#ifndef SHM_H 
#define SHM_H

char *shm_init(size_t memsize, char *p_key, int *p_shmid);
void shm_remove(int shmid);

#endif /* SHM_H */
