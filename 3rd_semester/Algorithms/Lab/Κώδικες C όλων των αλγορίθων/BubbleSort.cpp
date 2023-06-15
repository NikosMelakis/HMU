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
 
    for(i=1;i<N;++i)
        for(j=0;j<N-i;++j)
            if(pin[j]>pin[j+1])
            {
                tmp=pin[j];
                pin[j]=pin[j+1];
                pin[j+1]=tmp;
            }
 
    printf("\nSorted array\n");
    for(i=0;i<N;i++)
    {
        printf("%d ",pin[i]);
    }
 
    return 0;
}
