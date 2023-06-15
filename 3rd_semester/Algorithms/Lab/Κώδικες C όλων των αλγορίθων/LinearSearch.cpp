#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define N 20
 
int main()
{
    int pin[N], i, num, pos=-1;
    
    /* Initialize array */
 	srand(time(NULL));
    printf("Initial array\n");
	for(i=0; i<N; i++)
	{
        pin[i] = rand()%50;
    	printf("%d ", pin[i]);
	}  
 
    printf("\nGive element to search: ");
    scanf("%d",&num);
    
    for (i=0; i<N; i++)
		if (pin[i] == num) {
			pos = i;
			break;
		}
    
    if(pos != -1)
        printf("Element found at position %d",pos);
    else
        printf("Element not found");
 
    return 0;
}

