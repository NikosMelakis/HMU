// Program with inconsistent behavior (data race)
// Create 3 threads with pthread_create kai pthread_join

//LAB:
// 1) Compare mumber of data races when pthread_yield() is used
// n=1000; while [ $n -ge 0 ] ; do ./a.out ; let n=$n-1; done | grep "x:" | grep -v 300 | wc -l
//
// Can we always get rid of data races, using sleep?
// (what happens when lots of data are accessed, e.g. 100 -> 10000)


#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <pthread.h>

int x = 0; // global
//pthread_mutex_t L = PTHREAD_MUTEX_INITIALIZER;
pthread_barrier_t B;
pthread_barrierattr_t attr;

void *addtoX(void *);  /* the two threads */

void *addtoX(void *arg) {
	int temp;
	int i, j;
	//int id = (intptr_t) arg;
	int id = *((int *)arg);
	printf("hi from tid: %d \n", id);

	if (id == 0) {
		for(i = 0; i < 1000; i++ ) {
			pthread_barrier_wait(&B);
			for(j = 0; j < 100; j++)
				x=x+1;
			printf("id:%d - x:%d \n", id, x);
			fflush(stdout);
			for(j = 0; j < 100; j++)
				x=x+1;
			printf("id:%d - x:%d \n", id, x);
			fflush(stdout);
			pthread_barrier_wait(&B);
		}
	} else {
		for(i = 0; i < 1000; i++ ) {
			for(j = 0; j < 100; j++)
				x=x+1;
			printf("id:%d - x:%d \n", id, x);
			fflush(stdout);
			pthread_barrier_wait(&B);
			pthread_barrier_wait(&B);
			for(j = 0; j < 100; j++)
				x=x+1;
			printf("id:%d - x:%d \n", id, x);
			fflush(stdout);
		}
	}


		//pthread_mutex_lock(&L);
			//temp = x;
			//temp++;
			//pthread_yield(); // yield to other threads
			//x = temp;

			//x=x+1;
			//printf("x:%d \n", x);
			//fflush(stdout);
		//pthread_mutex_unlock(&L);
	return 0;
}

int main() {

	pthread_t tid[3];
	int i;
	int id[3];

	pthread_barrier_init(&B, &attr, 2);

	for (i=0; i<2; i++) {
		id[i] = i;
		pthread_create(&tid[i], NULL, addtoX, (void *) &(id[i]));
	}

	// wait for all three threads to terminate
	for (i=0; i<3; i++)
		pthread_join(tid[i], NULL); 

	printf("x:%d \n", x);
	fflush(stdout);

	return 0;
}

