#ifndef SEM_H 
#define SEM_H

int my_sem_init(char *p_key);
int sem_lock (void);
int sem_unlock (void);
int sem_remove(void);

#endif /* SEM_H */
