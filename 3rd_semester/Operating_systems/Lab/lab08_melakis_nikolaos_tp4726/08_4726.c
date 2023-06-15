#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>
#include <unistd.h>

int pfork(int);
void pjoin(int ,int);

int main() {
	FILE *fpopen1;
	FILE *stream;
	char buffer[100];
	int myid;
	int p12[2];
	int p23[2];
	int count = 0;

	if (pipe(p12)) { // open pipe p12
		fprintf (stderr, "Pipe failed.\n");
		exit(-1);
	}
	if (pipe(p23)) { // open pipe p23
		fprintf (stderr, "Pipe failed.\n");
		exit(-1);
	}
	myid = pfork(2);

	if (myid == 0) {

		close(p12[0]); close(p23[0]); close(p23[1]);

		if ((fpopen1 = popen("/usr/bin/ps -ef", "r")) != NULL) {
		// if ((fpopen1 = popen("/usr/bin/ls -l", "r")) != NULL) {

        		while(fgets(buffer, 100, fpopen1)) { // if(!feof(fpopen1)) {
				//printf("\n %d_MAIN1_%d -> buffer:%s \n", getpid(), count, buffer);
				//fflush(stdout);
				count++;
	  			write(p12[1], buffer, strlen(buffer));
			}
		}
		pclose(fpopen1);
		close(p12[1]);

	} else if (myid == 1) {
		close(p12[1]); close(p23[0]);

		/*
  		stream = fdopen(p12[0], "r");
        	while(fgets(buffer, 100, stream)) {
			printf("\n %d_CHILD1_%d -> buffer:%s \n", getpid(), count, buffer);
			fflush(stdout);
			count++;
		}
		fclose(stream);
		*/

		close(STDIN_FILENO); dup2(p12[0], STDIN_FILENO);
		close(STDOUT_FILENO); dup2(p23[1], STDOUT_FILENO);
		char* arr[] = {"sort", "-n", "-k 5", NULL};
		execv("/bin/sort", arr);

		close(p12[0]); close(p23[1]); 


	} else if (myid == 2) {

		close(p12[1]); close(p12[0]);
		close(p23[1]);
		close(STDIN_FILENO); dup2(p23[0], STDIN_FILENO);

		/*
  		stream = fdopen(p23[0], "r");
        	while(fgets(buffer, 100, stream)) {
			printf("\n %d_CHILD:2_%d -> buffer:%s \n", getpid(), count, buffer);
			fflush(stdout);
			count++;
		}
		fclose(stream);
		*/

		char* arr[] = {"wc", "-l", NULL};
		execv("/usr/bin/wc", arr);

		close(p23[0]);

	}

	pjoin(2, myid);

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
