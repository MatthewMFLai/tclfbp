#ifndef SHM_H 
#define SHM_H

char *shm_init(size_t memsize, char *p_key);
void shm_remove(void);

#endif /* SHM_H */
