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
 
    for(i=0;i<N-1;i++)
    {
        min=pin[i];
        pos=i;
        for(j=i+1;j<N;j++)
        {
            if(min>pin[j])
            {
                min=pin[j];
                pos=j;
            }
        }
 
        tmp=pin[i];
        pin[i]=pin[pos];
        pin[pos]=tmp;
    }
 
    printf("\nSorted array\n");
    for(i=0;i<N;i++)
    {
        printf("%d ",pin[i]);
    }
 
    return 0;
}
