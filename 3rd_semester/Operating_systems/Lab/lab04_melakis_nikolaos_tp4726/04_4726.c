//run gcc filenma.c -lpthread -D_GNU_SOURCE
// Example with Posix Threads
// Use "gcc filename.c -lpthread" to compile and "./a.out" to run
//
//gcc "-D _GNU_SOURCE" hello.c

#define _GNU_SOURCE             /* See feature_test_macros(7) */
#include <pthread.h>	// use Posix threads
#include <unistd.h> 
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <math.h>
#include <sys/times.h> // timers
#include <time.h>
#include <sched.h>
#include <errno.h>

#define print_error_then_terminate(en, msg) \
  do { errno = en; perror(msg); exit(EXIT_FAILURE); } while (0)
#define print_perror_then_terminate(msg) \
  do { perror(msg); exit(EXIT_FAILURE); } while (0)

#define BILLION  1000000000E0;
#define NO_ITERATIONS 200	 // use many runs for better timing accuracy
#define MAX_NUMBER 10			// matrix with random integers (0 to 9)
#define N	 30					// matrix size
#define NPROC 3					// number of threads (there is no parent)


#define SUCCESS_MSG "Successfully set thread %lu to affinity to CPU %d\n"
#define FAILURE_MSG "Failed to set thread %lu to affinity to CPU %d\n"

pthread_t matrixThread[NPROC]; // create NPROC threads with pthread_create
void *MatrixProduct (void *);  // each pthread will run function MatrixProduct which has one argument

struct whatever{
		int A[N][N];
		int X[N];
		int B[N];
}*myvars;

	
// function that stores random integers from 0 to MAX_NUMBER-1 in an array
int readmat(int mat[N][N],int n)
{
	long i,j;

	for (i=0;i<n;i++)
		for (j=0;j<n;j++) {
			mat[i][j]= rand() % 3; //MAX_NUMBER;
	}
	return(0);
}

// function that stores random integers from 0 to MAX_NUMBER-1 in an array
int readvec(int mat[N],int n)
{
	long i;

	for (i=0;i<n;i++)
			mat[i]= rand() % 3; //MAX_NUMBER;
	return(0);
}


// main program
int main(int argc,char *argv[])
{

	int myid=0,memid; // myid and index to segment
	int i,j,k,x,y,l,no_runs;
	int sum=0;

	// timing variables
	struct timespec start, stop;
	double accum;

	// thread attributes structure
	pthread_attr_t attr;

	srand(1L); 

	//for (no_runs=0; no_runs<NO_ITERATIONS; no_runs++)
	//{	

		// allocate shared memory with malloc
		myvars = (struct whatever*)malloc (sizeof(struct whatever));
		
		if(readmat(myvars->A,N)<0)
			  exit(1+printf("File has negative arguments.\n"));

		if(readvec(myvars->X,N)<0)
			  exit(1+printf("File has negative arguments.\n"));

		pthread_attr_init(&attr);

		clock_gettime(CLOCK_REALTIME, &start);//2 - start timing for the parallel part

		for(i=myid;i<NPROC;i++){
			// create NPROC processes that will run function MatrixProduct with argument i
			//printf("in pthread_create myid:%d \n", i);
			pthread_create(&matrixThread[i],&attr,MatrixProduct,(void *)(intptr_t) i);
		}

		// wait until all threads terminate
		for(i=myid;i<NPROC;i++)
		{
			pthread_join(matrixThread[i],NULL);
		}

		clock_gettime(CLOCK_REALTIME, &stop); //2 - end timing for the parallel part
		printf("nsec1:%ld, nsec2:%ld \n", start.tv_nsec, stop.tv_nsec);
		accum = ( stop.tv_sec - start.tv_sec ) + ((float) stop.tv_nsec - (float) start.tv_nsec ) / BILLION;
        	printf("Total time: %lf\n", accum );


	//}
	// optional printing of results
	for (i=0; i< N; i++) {

		if (i==0)
			printf("      A ");
		else
			printf("	");
		for (j=0; j< N; j++)
			printf("%d ", myvars->A[i][j]);

		if (i==0)
			printf("  	      X ");
		else
			printf("		");
			printf("%d ", myvars->X[i]);

		if (i==0)
			printf("    B ");
		else
			printf("	");
			printf("%d ", myvars->B[i]);

		printf("\n");
	}

	free (myvars);
	pthread_exit(NULL);
}
	 

// function called by all threads
void *MatrixProduct (void *arg)
{

	// local variables, different for each thread
	int id = (intptr_t) arg;
	int i, j, k, sum;
	
	//extra
	const pthread_t pid = pthread_self();
	static int core_id = 0;
	
	// cpu_set_t: This data set is a bitset where each bit represents a CPU.
	cpu_set_t cpuset;
	// CPU_ZERO: This macro initializes the CPU set set to be the empty set.
	CPU_ZERO(&cpuset);
	// CPU_SET: This macro adds cpu to the CPU set set.
	CPU_SET(core_id, &cpuset);
	//CPU_SET(0, &cpuset);
	
	// pthread_setaffinity_np: The pthread_setaffinity_np() function sets the CPU affinity mask of the thread thread to the CPU set pointed to by cpuset. If the call is successful, and the thread is not currently running on one of the CPUs in cpuset, then it is migrated to one of those CPUs.
	const int set_result = pthread_setaffinity_np(pid, sizeof(cpu_set_t), &cpuset);
	if (set_result != 0) {
		print_error_then_terminate(set_result, "pthread_setaffinity_np");
	}
	printf("THE SET RESULT IS: %d\n", set_result);

	core_id++;

	// Check what is the actual affinity mask that was assigned to the thread.
	// pthread_getaffinity_np: The pthread_getaffinity_np() function returns the CPU affinity mask of the thread thread in the buffer pointed to by cpuset.
	const int get_affinity = pthread_getaffinity_np(pid, sizeof(cpu_set_t), &cpuset);
	if (get_affinity != 0) {
		print_error_then_terminate(get_affinity, "pthread_getaffinity_np");
	}
	
	printf("THE GET AFFINITY IS: %d\n", get_affinity);
	
	char *buffer;
	// CPU_ISSET: This macro returns a nonzero value (true) if cpu is a member of the CPU set set, and zero (false) otherwise. 
	if (CPU_ISSET(core_id, &cpuset)) {
		const size_t needed = snprintf(NULL, 0, SUCCESS_MSG, pid, core_id);
		buffer = malloc(needed);
		snprintf(buffer, needed, SUCCESS_MSG, pid, core_id);
	} else {
		const size_t needed = snprintf(NULL, 0, FAILURE_MSG, pid, core_id);
		buffer = malloc(needed);
		snprintf(buffer, needed, FAILURE_MSG, pid, core_id);
	}
	
	printf("THE BUFFER IS: %s\n", buffer);

	// calculating vector B
	for (i=id;i<N;i+=NPROC) {
		//for (j=0;j<N;j++) {
			sum=0;
			for (k=0;k<N;k++) {
				// sum is a local variable, so no lock is necessary
				// A and X are read so no lock is necessary 
	 			sum += (myvars->A[i][k])*(myvars->X[k]); 
				//printf("thread:%d A[%d[[%d] x X[%d] -> sum \n", id, i, k, k);
				//fflush(stdout);
			}
			// Since a different thread writes each B[i][j] for any i, j
			// and only a single write occurs, there is no need for lock
			myvars->B[i] = sum;
			printf("thread:%d 	-> B[%d] \n", id, i);
			fflush(stdout);
		//}
		printf("PTHREAD_%d completed row:%d \n", id, i);
		fflush(stdout);
 	}
}


