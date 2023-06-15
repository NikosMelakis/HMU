// Ajroisma pinaka, me process kai locks
// Dwste gcc sum_test.c - compile kai ./a.out
// Qrhsimopoioume lock (deite selides ...
// Melethste to 12.4.1 (sync attributes).
// Epishs Posix shared memory (Kef 13.1-3, selides
// 337-341 apo to vivlio Stevens kai memory mapped
// I/O 14.8 (mmap, munmap) apo to vivlio Stevens
// and Rago, selides 430-433

#define SHMEM_S1 "/shmem_S1"
#define SHMEM_S2 "/shmem_S2"

#include <sys/ipc.h>    // interprocess communication header
#include <unistd.h>     // nees diergasies me thn fork()
#include <sys/wait.h>   // wait(0) - gia na stamathsei h ektelesh ths diergasias-gonea mexri 
                        //   na termatisei opoiodhpote apo ta paidia-diergasies
#include <sys/shm.h>    // koinh mnhmh

#include <sys/mman.h>
#include <sys/stat.h>        /* For mode constants */
#include <fcntl.h>           /* For O_* constants */

#include <errno.h>

#include <sys/types.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>


// print nonzero elements and total sum
int averages(int *ptr_S1, int *ptr_S2, int size_shmem_S1, int size_shmem_S2) {

	int i, j, value;
	bool found = false;
	int sum_S1=0, sum_S2=0;
	int count_S1=0, count_S2=0;
	
	// print S1
	printf("S1: ");
	for (i=0; i<size_shmem_S1; i++) {
		if (ptr_S2[i] != 0) {
			printf("%d ", ptr_S1[i]);
			sum_S1+= ptr_S1[i];
			count_S1++;
		}
	}
	printf("\n");
	
	// print S2
	printf("S2: ");
	for (i=0; i<size_shmem_S1; i++) {
		if (ptr_S2[i] != 0) {
			printf("%d ", ptr_S2[i]);
			sum_S2+= ptr_S2[i];
			count_S2++;
		}
	}
	printf("\n");
	printf("Avg_S1:%f \n", (float) sum_S1/(float) count_S1);
	printf("Avg_S2:%f \n", (float) sum_S2/(float) count_S2);
	
	
	
	printf("\n");
	
	return 0;

}


int main()
{
	int i, j;
	int parent_count_S1, parent_count_S2 = 0, child_count_S1 = 0, child_count_S2 = 0;
	int myid, segment_shmem_S1, segment_shmem_S2;
	int *ptr_S1, *ptr_S2;
	
	struct stat buf; // obtain size through fstat
	int size_shmem_S1 = 0, size_shmem_S2 = 0; // size of shared memory
	
	int mode = S_IRWXU | S_IRWXG;
	
	// initialize shared memory S1
	segment_shmem_S1 = shm_open(SHMEM_S1, O_RDWR | O_EXCL, mode);
	if (segment_shmem_S1 < 0 )
        {
                perror("failure on shm_open on shared memory segment");
                exit(1);
        }

	fstat(segment_shmem_S1, &buf);
	size_shmem_S1 = buf.st_size;
	printf("size_S1: %d\n", size_shmem_S1);
	printf("INODE_S1: %u\n", (unsigned int) (buf.st_ino));
	
	if (ftruncate(segment_shmem_S1, size_shmem_S1) == -1)
	{
		perror("Error on S1 - ftruncate to sizeof shmem \n");
		exit(-1);
	}
	
	ptr_S1 = (int *) mmap(NULL, size_shmem_S1, PROT_READ | PROT_WRITE, MAP_SHARED, segment_shmem_S1, 0);
	if (ptr_S1 == MAP_FAILED)
	{
		perror("Error on mmap on shared memory \n");
		exit(1);
	}
	
	// initialize shared memory S2
	segment_shmem_S2 = shm_open(SHMEM_S2, O_RDWR | O_EXCL, mode);
	if (segment_shmem_S2 < 0 ) {
	                perror("failure on shm_open on shared memory segment");
	                exit(1);
	}
	
	fstat(segment_shmem_S2, &buf);
	size_shmem_S2 = buf.st_size;
	printf("size_S2: %d\n", size_shmem_S2);
	printf("INODE_S2: %u\n", (unsigned int) (buf.st_ino));
	
	
	if (ftruncate(segment_shmem_S2, size_shmem_S2) == -1)
	{
		perror("Error on S2 - ftruncate to sizeof shmem \n");
		exit(-1);
	}
	
	ptr_S2 = (int *) mmap(NULL, size_shmem_S2, PROT_READ | PROT_WRITE, MAP_SHARED, segment_shmem_S2, 0);
	if (ptr_S2 == MAP_FAILED)
	{
		perror("Error on mmap on shared memory \n");
		exit(1);
	}
	
	
	averages(ptr_S1, ptr_S2, size_shmem_S1, size_shmem_S2);
	
	if (munmap(ptr_S1, size_shmem_S1) == -1) {
		printf("Unmap of shared memory failed: %s\n", strerror(errno));
		exit(1);
	}
	
	if (close(segment_shmem_S1) == -1) {
		printf("segment of shared memory: close failed: %s\n", strerror(errno));
		exit(1);
	}
	
	/* close the shared memory shmem as if it was a file */
	if (shm_unlink(SHMEM_S1) == -1) {
		printf("segment of shmem: unlink failed: %s\n", strerror(errno));
		exit(1)	;
	}
	
	if (munmap(ptr_S2, size_shmem_S2) == -1) {
		printf("Unmap of shared memory failed: %s\n", strerror(errno));
		exit(1);
	}
	
	/* close the shared memory shmem as if it was a file */
	if (close(segment_shmem_S2) == -1) {
		printf("segment of shmem: close failed: %s\n", strerror(errno));
		exit(1);
	}
	
	/* close the shared memory mutex as if it was a file */
	if (shm_unlink(SHMEM_S2) == -1) {
		printf("segment of shmem: unlink failed: %s\n", strerror(errno));
		exit(1);
	}
	
	return 0;
}
