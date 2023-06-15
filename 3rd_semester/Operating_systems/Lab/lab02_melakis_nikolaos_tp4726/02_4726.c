#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>

#define N 10

int X[]={1,2,3,4,5,6,7,8,9,10}, i, sum=0, product=1;
pid_t n1, n2, n3;

int main(void) {


	n1 = fork();
	if (n1 == -1) {
		  fprintf(stderr,"problem creating a process \n");
	}
	else if (n1==0){ // child B process (first child process of A parent process)
		n3 = fork();
		if (n3==0){ // child D  process (first child process of B parent Process)
			for (i=0;i<N;i++) //D process sums all elements
				sum += X[i];
			printf("A process %d completed the average %f \n", getpid(), (float)sum/(float)N);
			exit(0);
		}
		else { // child B and also parent  of child D  process (this proc is child of parent A and also  parent of child D)
			for (i=0;i<N;i++) //B process multiples all elements
				product *= X[i];
			printf("C process %d completed the product %d \n", getpid(), product);
			wait(0);
			exit(0);
		}
	}
	else if (n1 > 0) { // parent process (Parent A)

		n2 = fork();
		if (n2==0){ // childC  process (second child process of parent A) 
			for (i=0;i<N;i++) //C process adds all elements
				sum += X[i];
			printf("D process %d completed sum %d \n", getpid(), sum);
			exit(0);
		}
		else { // parent process A
		wait(0);
		wait(0);
		}
	}
 
	return 0;
}


