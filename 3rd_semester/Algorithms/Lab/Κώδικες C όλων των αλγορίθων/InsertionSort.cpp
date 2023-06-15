#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define N 20
 
int main()
{
    int pin[N],i,j,n,pos,tmp,min;
    
    /* Initialize array */
 	srand(time(NULL));
    printf("Initial array\n");
	for(i=0;i<N;i++)
    {
        pin[i]=rand()%50;
        printf("%d ",pin[i]);
    }
 
    for(i=1;i<=N-1;i++)
    {
        tmp=pin[i];
        j=i-1;
 
        while((tmp<pin[j])&&(j>=0))
        {
            pin[j+1]=pin[j];    //move element forward
            j=j-1;
        }
 
        pin[j+1]=tmp;    //insert element in correct position
    }
 
    printf("\nSorted array\n");
    for(i=0;i<N;i++)
    {
        printf("%d ",pin[i]);
    }
 
    return 0;
}
