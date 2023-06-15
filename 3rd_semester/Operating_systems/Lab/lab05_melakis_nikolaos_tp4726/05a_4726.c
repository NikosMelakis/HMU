#define N 5 // shared memory size
#define MIDSIZE 5 // elements to be inserted

#define MAX_NUMBER   100

#define MUTEX_S1 "/lock_S1"
#define SHMEM_S1 "/shmem_S1"
#define MUTEX_S2 "/lock_S2"
#define SHMEM_S2 "/shmem_S2"

#include <sys/ipc.h>    // interprocess communication header
#include <unistd.h>     // fork()
#include <sys/wait.h>   // wait(0)
#include <sys/shm.h>    // shared memory
#include <math.h>

#include <pthread.h>    // posix threads for locks

#include <sys/mman.h>
#include <sys/stat.h>        /* For mode constants */
#include <fcntl.h>           /* For O_* constants */

#include <errno.h>

#include <sys/types.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>


int lastIndex=0;

// insert is called from two processes to insert a single number to shared memory
// if no other number has similar absolute value, else that number is erased
void insert(int *ptr, int number) {

	bool found = false;
	int insert_idx;
	int i;

	found = false;
	insert_idx = -1;
	for(i=0;i<N;i++) {
		printf("Compare number:%d <-> shmptr[%d]:%d by process pid:%d \n", number, i, ptr[i], getpid());
		fflush(stdout);
		//if (abs(ptr[i])==abs(a[i]) && (ptr[i]!=0))
		if (abs(number) == abs(ptr[i])) {
			ptr[i] = 0;
			printf("-> Erase Shared Memory ptr[%d]:%d -> 0 by process pid:%d \n", i, ptr[i], getpid());
			fflush(stdout);
			found = true;
			break;
		}
		else if ((insert_idx == -1) && (ptr[i] == 0)) { // remember first place to insert
			insert_idx = i;
			printf("-> insert_idx:%d by process pid:%d \n", insert_idx, getpid());
			fflush(stdout);
		}
	}

	if (!found) { // insert  at right place, if number is not erased
		ptr[insert_idx]=number;
		printf("-> Write shmptr[%d]:%d by process pid:%d \n", insert_idx, ptr[insert_idx], getpid());
		fflush(stdout);
	}

	printf("\n--\n");

}

int main()
{
	// pinakas gia ajroisma
	int a[MIDSIZE];
	int rand_no;
	int i, j;
	int parent_count_S1, parent_count_S2 = 0, child_count_S1 = 0, child_count_S2 = 0;
	int myid, segment_shmem_S1, segment_shmem_S2;
	int *ptr_S1, *ptr_S2;

	int segment_mutex_S1, segment_mutex_S2;
	pthread_mutex_t *lock_S1, *lock_S2;

	int mode = S_IRWXU | S_IRWXG;

	// initialize shared memory S1
	segment_mutex_S1 = shm_open(MUTEX_S1, O_CREAT | O_RDWR | O_TRUNC, mode);
	segment_shmem_S1 = shm_open(SHMEM_S1, O_CREAT | O_RDWR | O_TRUNC, mode);

	if ((segment_mutex_S1 < 0) || (segment_shmem_S1 < 0 ))
	{
		perror("failure on shm_open on mutex and/or shared memory segment");
		exit(1);
	}
	
	if (ftruncate(segment_mutex_S1, sizeof(pthread_mutex_t)) == -1)
	{
		perror("Error on S1 - ftruncate to sizeof pthread_mutex_t\n");
		exit(-1);
	}

	if (ftruncate(segment_shmem_S1, N*sizeof(int)) == -1)
	{
		perror("Error on S2 - ftruncate to sizeof shmem \n");
		exit(-1);
	}

	lock_S1 = (pthread_mutex_t*) mmap(NULL, sizeof(pthread_mutex_t),
		PROT_READ | PROT_WRITE, MAP_SHARED, segment_mutex_S1, 0);

	ptr_S1 = (int *) mmap(NULL, N*sizeof(int), 
		PROT_READ | PROT_WRITE, MAP_SHARED, segment_shmem_S1, 0);

	if ((lock_S1 == MAP_FAILED ) || (ptr_S1 == MAP_FAILED))
	{
		perror("Error on mmap on mutex and/or shared memory \n");
		exit(1);
	}

	pthread_mutexattr_t attr;
	pthread_mutexattr_init(&attr);//initialize the pthread_mutex_attr_t structure1(with default mutex attr)
	pthread_mutexattr_setpshared(&attr, PTHREAD_PROCESS_SHARED); // change the process-shareds tructure attribute
	pthread_mutex_init(lock_S1, &attr);

	// initialize shared memory S2
	segment_mutex_S2 = shm_open(MUTEX_S2, O_CREAT | O_RDWR | O_TRUNC, mode);
	segment_shmem_S2 = shm_open(SHMEM_S2, O_CREAT | O_RDWR | O_TRUNC, mode);

	if ((segment_mutex_S2 < 0) || (segment_shmem_S2 < 0 ))
	{
		perror("failure on shm_open on mutex and/or shared memory segment");
		exit(1);
	}
	
	if (ftruncate(segment_mutex_S2, sizeof(pthread_mutex_t)) == -1)
	{
		perror("Error on S2 - ftruncate to sizeof pthread_mutex_t\n");
		exit(-1);
	}

	if (ftruncate(segment_shmem_S2, N*sizeof(int)) == -1)
	{
		perror("Error on S2 - ftruncate to sizeof shmem \n");
		exit(-1);
	}

	lock_S2 = (pthread_mutex_t*) mmap(NULL, sizeof(pthread_mutex_t),
		PROT_READ | PROT_WRITE, MAP_SHARED, segment_mutex_S2, 0);

	ptr_S2 = (int *) mmap(NULL, N*sizeof(int), 
		PROT_READ | PROT_WRITE, MAP_SHARED, segment_shmem_S2, 0);

	if ((lock_S2 == MAP_FAILED ) || (ptr_S2 == MAP_FAILED))
	{
		perror("Error on mmap on mutex and/or shared memory \n");
		exit(1);
	}


        struct stat buf; // obtain size through fstat
        int size_shmem_S1, size_shmem_S2; // size of shared memory

        fstat(segment_shmem_S1, &buf);
        size_shmem_S1 = buf.st_size;
        printf("size_S1: %d\n", size_shmem_S1);
        printf("INODE_S1: %u\n", (unsigned int) (buf.st_ino));

        fstat(segment_shmem_S2, &buf);
        size_shmem_S2 = buf.st_size;
        printf("size_S2: %d\n", size_shmem_S2);
        printf("INODE_S2: %u\n", (unsigned int) (buf.st_ino));

	pthread_mutex_init(lock_S2, &attr);

        srand(1L);

	// create a child
	myid=fork();
	
	// parent & child call insert with different values
        if(myid>0) {
		printf("Parent %d  \n",getpid());
		fflush(stdout);
		a[0]=1;
		a[1]=3;
		a[2]=4;
		a[3]=9;
		a[4]=8;
		for(i=5; i<MIDSIZE; i++) { // positive values
			a[i]= (rand() % MAX_NUMBER) + 1;
			rand_no = rand() % 2;
			if (!rand_no)
				a[i]= -a[i];
		}
		for (i=0; i< MIDSIZE; i++) {
			pthread_mutex_lock(lock_S1); // lock
				if ((a[i]%2) == 0) {
					parent_count_S1++;
					insert(ptr_S1, a[i]);
				} else {
					parent_count_S2++;
					insert(ptr_S2, a[i]);
				}
        		pthread_mutex_unlock(lock_S1); // unlock
		}
		wait(0);
		printf("Parent_count_S1:%d \n",parent_count_S1);
		printf("Parent_count_S2:%d \n",parent_count_S2);
	} else if(myid==0) {
		printf("Child %d  \n",getpid());
		fflush(stdout);
		a[0]=3;
		a[1]=-2;
		a[2]=-4;
		a[3]=6;
		a[4]=8;
		for(i=5; i<MIDSIZE; i++) { // fill in positive & negative values from 1 to 99 (50-50)
			a[i]= (rand() % MAX_NUMBER) + 1;
			rand_no = rand() % 2;
			if (!rand_no)
				a[i]= -a[i];
			a[i]= (rand() % MAX_NUMBER) + 1;
		}
		for (i=0; i< MIDSIZE; i++) {
			pthread_mutex_lock(lock_S2); // unlock
				if ((a[i]%2) == 0) {
					child_count_S1++;
					insert(ptr_S1, a[i]);
				} else {
					child_count_S2++;
					insert(ptr_S2, a[i]);
				}
        		pthread_mutex_unlock(lock_S2); // unlock
		}
		printf("Child_count_S1:%d \n", child_count_S1);
		printf("Child_count_S2:%d \n", child_count_S2);
		exit(0);
	}

       if (pthread_mutexattr_destroy(&attr) == -1) {
                printf("Destroy of mutexattr failed: %s\n", strerror(errno));
                exit(1);
        }

       if (pthread_mutex_destroy(lock_S1) == -1) {
                printf("Destroy of mutex failed: %s\n", strerror(errno));
                exit(1);
        }
	

       if (munmap(lock_S1, sizeof(pthread_mutex_t)) == -1) {
                printf("Unmap of mutex failed: %s\n", strerror(errno));
                exit(1);
        }

        if (munmap(ptr_S1, sizeof(pthread_mutex_t)) == -1) {
                printf("Unmap of shared memory failed: %s\n", strerror(errno));
                exit(1);
        }

        /* close the shared memory mutex as if it was a file */
        if (close(segment_mutex_S1) == -1) {
                printf("segment of mutex: close failed: %s\n", strerror(errno));
                exit(1);
        }

        /* close the shared memory segment as if it was a file */
        if (close(segment_shmem_S1) == -1) {
                printf("segment of shared memory: close failed: %s\n", strerror(errno));
                exit(1);
        }

       if (pthread_mutex_destroy(lock_S2) == -1) {
                printf("Destroy of mutex failed: %s\n", strerror(errno));
                exit(1);
        }
	

       if (munmap(lock_S2, sizeof(pthread_mutex_t)) == -1) {
                printf("Unmap of mutex failed: %s\n", strerror(errno));
                exit(1);
        }

        if (munmap(ptr_S2, sizeof(pthread_mutex_t)) == -1) {
                printf("Unmap of shared memory failed: %s\n", strerror(errno));
                exit(1);
        }

        /* close the shared memory mutex as if it was a file */
        if (close(segment_mutex_S2) == -1) {
                printf("segment of mutex: close failed: %s\n", strerror(errno));
                exit(1);
        }

        /* close the shared memory segment as if it was a file */
        if (close(segment_shmem_S2) == -1) {
                printf("segment of shared memory: close failed: %s\n", strerror(errno));
                exit(1);
        }


       /* delete the shared memory mutex S1 as if it was a file */
        if (shm_unlink(MUTEX_S1) == -1) {
                printf("segment of mutex: unlink failed: %s\n", strerror(errno));
                exit(1);
        }

       /* delete the shared memory mutex S2 as if it was a file */
        if (shm_unlink(MUTEX_S2) == -1) {
                printf("segment of mutex: unlink failed: %s\n", strerror(errno));
                exit(1);
        }




	return 0;
}

