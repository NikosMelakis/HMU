// Ajroisma pinaka, me System V threads (fork/wait)
// Dwste "gcc sum_test.c" -> compile kai "./a.out" -> run
// An jelete na diavasete perissotera deite p.q.
// http://www.yolinux.com/TUTORIALS/ForkExecProcesses.html
// Plhrhs alla poluplokh perigrafh se stul manual: Richard Stevens, Unix Network
// Programming, Volume II (p.q. selides 352-356 gia shm)
// (To Volume I afora sockets -- top epishs)
// eite to kefalaio 15.9 apo W. Richard Stevens and Stephan A. Rago, 
// "Advanced Programming in the Unix Environment", Addison Wesley, 2014, 3rd edition 

// ASKHSH1: Epekteinete ton kwdika wste na trexei me perissotera apo ena thread
// ASKHSH2: Deite ta statistika sth domh apo to trito orisma ths shmctl (struct shmid_ds)
//          (see also man shmctl)

#define MAX_NUMBER 10	// random numbers in [0 .. MAX_NUMBER-1]
#define N 10000		// array size

#include <sys/ipc.h>    // interprocess communication header
#include <unistd.h>     // nees diergasies me thn fork()
#include <sys/wait.h>   // wait(0) - gia na stamathsei h ektelesh ths diergasias-gonea mexri 
                        //   na termatisei opoiodhpote apo ta paidia-diergasies
#include <sys/shm.h>    // koinh mnhmh
#include <sys/types.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>    // time conversion

/* Function to print shmem stats at removal
   */
void print_shm_stats(int shmid, struct shmid_ds *buf)
{
struct tm * tminfo;
time_t temp_time;
  	printf("segment ID: %d \n", shmid);
  	printf("uid: %d \n", buf->shm_perm.uid);  
  	printf("gid: %d \n", buf->shm_perm.gid);  
  	printf("cuid: %d \n", buf->shm_perm.cuid);  
  	printf("cgid: %d \n", buf->shm_perm.cgid);  
  	printf("Mode: %d \n", buf->shm_perm.mode);
  	printf("Size: %zu \n", buf->shm_segsz);
  	printf("Pid of last shmop: %d \n", (int)buf->shm_lpid);
  	printf("Pid of creator: %d \n", (int)buf->shm_cpid);
  	printf("No. of attaches: %d \n", (int)buf->shm_nattch);
  	printf("The last shmat time: %ld \n", (int)buf->shm_atime);
  	printf("The last shmdt time: %ld \n", (int)buf->shm_dtime);
  	printf("The last change time: %ld \n", (int)buf->shm_ctime);
	temp_time = buf->shm_ctime;
 	tminfo = localtime ( &temp_time);
  	printf ( "Current date and time are: %s", asctime (tminfo) );
}

/* Function that fills array a[] with integer random numbers
   */
int readmat(int a[],int n)
{
	long i;

	if (n > 0) {
		for (i=0;i<n;i++)
			a[i]= rand() % MAX_NUMBER;
		return(0);
	}
	return(-1);
}

/* Function that prints array a[]
   */
int writemat(int a[],int n)
{
	long i;

	if (n > 0) {
		for (i=0;i<n;i++)
			printf(" a[%d] = %d \n", i, a[i]);
		return(0);
	}
	return(-1);
}

int main()
{
	// pinakas gia ajroisma
	int a[N];
	int sum=0, i;
	int *ptr;
	int myid, shmid;
	struct shmid_ds buf;
	//buf = NULL; //&shmid_ds; // NULL
	time_t buf_ctime_ptr;

	int pfork(int);
	void pjoin(int ,int);


	srand(1L);
     	if(readmat(a, N) < 0) {
		printf("Array size is negative \n");
		exit(1);
	}

	//writemat(a, N);

	// allocate a memory segment (pointer to physical memory
	// check with ipcs command
	shmid=shmget(IPC_PRIVATE,4,IPC_CREAT|0666);
	if(shmid < 0)
		printf("ERROR\n");
	else
	printf("Shmid Is %d\n",shmid);
    
	// attach memory segment to address space to get virtual address pointer
	ptr=shmat(shmid,0,0);

	// initialize value of virtual address pointer
	*ptr=0;    

	// dhmiourgia enos paidiou
	myid=pfork(1);

	if(myid==0) { // gonios
		// sum every two terms starting from zero array element
		for(i=0;i<N;i+=2)
		{
			sum=sum+a[i];
		}
		printf("Sum in parent is %d\n",sum);
	}
	else if(myid==1) { // paidi me myid 1
		// sum every two terms starting from first array element
		for(i=1;i<N;i+=2)
		{
				*ptr=*ptr+a[i];
		}
		printf("Sum in child is %d\n",*ptr);
	}

	sum=sum+*ptr;

	shmctl(shmid, IPC_STAT, &buf);
	buf_ctime_ptr = buf.shm_ctime;
  	printf("Parent (pid:%d) modified shared memory at time:%s \n", (int)buf.shm_lpid, asctime (localtime(&buf_ctime_ptr)));
	fflush(stdout);

	system("sleep 20");
	//shmctl(shmid, IPC_RMID, NULL);
	if(shmctl(shmid, IPC_STAT, &buf) == -1){
		perror("shmctl");
		exit(EXIT_FAILURE);
	}

	print_shm_stats(shmid, &buf);

        shmctl(shmid, IPC_RMID, NULL);

	printf("Total sum is %d\n",sum);
	return 0;
}

int pfork(int x)
{
	int j;

	for (j=1;j<=x;j++) {
		if(fork()==0)
			return j;
	}
	return 0;
}

void pjoin(int x,int id)
{
int j;

	if (id==0) {
		for(j=1;j<=x;j++) {
			wait(0);
		}    
	}
	else {
		exit(0);
	}
}
