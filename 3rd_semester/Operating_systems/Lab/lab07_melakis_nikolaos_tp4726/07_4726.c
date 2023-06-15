//exercise 2 -  a distributed pipelined consumer/producer problem
//          (consumers are also producers for next stage
//
// Use in Linux:
//     gcc 08_prod_cons.c -lpthread -lrt
//     ./a.out

#define NO_ITEMS_PRODUCED 1000
#define BUFF1_SIZE 5
#define BUFF2_SIZE 3

#define MAX_RAND 1000

#include <pthread.h>
#include <semaphore.h>
#include <stdio.h>
#include <stdint.h>
#include <sched.h>
#include <stdlib.h>

/* #define SHARED 1  - for Solaris - shared between processes */ 
#define SHARED 0   /* for Linux - shared between threads but not between processes */

void *Producer(void *);  /* the two threads */
void *ConsProd(void *);
void *Consumer(void *);

int buff1[BUFF1_SIZE];       /* shared buffer */
int buff2[BUFF2_SIZE];       /* shared buffer */

/* global semaphores  & locks */

sem_t empty_buff1, full_buff1, empty_buff2, full_buff2;

// who has access to these? need locks?
long index_produced_buff1 = 0;
long index_consumed_buff1 = 0;
long index_produced_buff2 = 0;
long index_consumed_buff2 = 0;
pthread_mutex_t L_prod_buff1 = PTHREAD_MUTEX_INITIALIZER;
pthread_mutex_t L_cons_buff1 = PTHREAD_MUTEX_INITIALIZER;
pthread_mutex_t L_prod_buff2 = PTHREAD_MUTEX_INITIALIZER;
pthread_mutex_t L_cons_buff2 = PTHREAD_MUTEX_INITIALIZER;

/* main() -- read command line and create threads, then
             print result when the threads have quit */
int main(int argc, char *argv[]) {

	/* thread ids and attributes */
	pthread_t pid, cid, tid;  

	pthread_attr_t attr;
	pthread_attr_init(&attr);
	pthread_attr_setscope(&attr, PTHREAD_SCOPE_SYSTEM);

	sem_init(&empty_buff1, SHARED, 5); // producer1/consumer1 semaphore (stops after 5 elements)
	sem_init(&full_buff1, SHARED, 0);  // producer1/consumer1 semaphore (initially stopped)
	sem_init(&empty_buff2, SHARED, 3); // producer2/consumer2 semaphore (stops after 5 elements)
	sem_init(&full_buff2, SHARED, 0);  // producer2rconsumer2 semaphore (initially stopped)

	pthread_create(&pid, &attr, Producer, NULL);
	pthread_create(&tid, &attr, ConsProd, NULL);
	pthread_create(&cid, &attr, Consumer, NULL);

	pthread_join(pid, NULL);
	pthread_join(tid, NULL);
	pthread_join(cid, NULL);

	sem_destroy(&empty_buff1);
	sem_destroy(&full_buff1);
	sem_destroy(&empty_buff2);
	sem_destroy(&full_buff2);

	sem_close(&empty_buff1);
	sem_close(&full_buff1);
	sem_close(&empty_buff2);
	sem_close(&full_buff2);

}

void *Producer(void *arg) { // deposit elements to buff1
	int i = (intptr_t) arg;
	int element;
	int count_produced_buff1 = 0; // count no elements produced in buff1

	printf("Producer starts \n");

	srand(1U);
	while (count_produced_buff1 < NO_ITEMS_PRODUCED) {
		sem_wait(&empty_buff1);
		element = rand() % MAX_RAND;
		pthread_mutex_lock(&L_prod_buff1);
			buff1[index_produced_buff1] = element;
                        printf("Producer: inserted buff1[%d]:%ld (count_produced_buff1:%d) \n", index_produced_buff1, element, count_produced_buff1);
			fflush(stdout);
			index_produced_buff1 = (index_produced_buff1 + 1) % BUFF1_SIZE;
			count_produced_buff1 ++;
		pthread_mutex_unlock(&L_prod_buff1);
		sem_post(&full_buff1);

		if(lrand48()%2 == 1)  
			sched_yield(); /* random yield to another thread */ 
		//sleep(0.001);
	}
}

void *ConsProd(void *arg) { // remove elements from buff1 & deposit elements to buff2 (full? empty?)
        int i = (intptr_t) arg, x;
	int element;
	int count_consumed_buff1 = 0; // count no elements consumed from buff1
	int count_produced_buff2 = 0; // count no elements produced in buff2

        printf("ConsProd starts consuming and producing \n");

        while ((count_consumed_buff1 < NO_ITEMS_PRODUCED) || (count_produced_buff2 < NO_ITEMS_PRODUCED)) {
                sem_wait(&full_buff1);
		pthread_mutex_lock(&L_cons_buff1);

			element = buff1[index_consumed_buff1];
                        printf("		ConsProd: removed buff1[%d]:%ld (count_consumed_buff1:%d) \n", index_consumed_buff1, element, count_consumed_buff1);
                        fflush(stdout);
			index_consumed_buff1 = (index_consumed_buff1 + 1) % BUFF1_SIZE;
			count_consumed_buff1++;

		pthread_mutex_unlock(&L_cons_buff1);
		sem_post(&empty_buff1);

		//sleep(0.001);

                if(lrand48()%2 == 1) 
                        sched_yield(); /* random yield to another thread */

		sem_wait(&empty_buff2);
		pthread_mutex_lock(&L_prod_buff2);

			buff2[index_produced_buff2] = element; 
                        printf("		ConsProd: inserted buff2[%d]:%ld (count_produced_buff2:%d) \n", index_produced_buff2, element, count_produced_buff2);
                        fflush(stdout);
			index_produced_buff2 = (index_produced_buff2 + 1) % BUFF2_SIZE;
			count_produced_buff2 ++;

		pthread_mutex_unlock(&L_prod_buff2);
		sem_post(&full_buff2);

		if(lrand48()%2 == 1)  
			sched_yield(); /* random yield to another thread */ 

		//sleep(0.001);

        }
}

void *Consumer(void *arg) { // remove elements from buff2

	int i = (intptr_t) arg, x;
	int element;
	int count_consumed_buff2 = 0; // count no elements consumed from buff2

	printf("Consumer starts consuming \n");

	while (count_consumed_buff2 < NO_ITEMS_PRODUCED) {

                sem_wait(&full_buff2);
		pthread_mutex_lock(&L_cons_buff2);

				element = buff2[index_consumed_buff2];
                        	printf("				Consumer: removed buff2[%d]:%ld count_consumed_buff2:%d \n", index_consumed_buff2, element, count_consumed_buff2);
                        	fflush(stdout);
				index_consumed_buff2 = (index_consumed_buff2 + 1) % BUFF2_SIZE;
				count_consumed_buff2 ++;

		pthread_mutex_unlock(&L_cons_buff2);
		sem_post(&empty_buff2);

                if(lrand48()%2 == 1) 
                        sched_yield(); /* random yield to another thread */

		//sleep(0.001);
	}

}
