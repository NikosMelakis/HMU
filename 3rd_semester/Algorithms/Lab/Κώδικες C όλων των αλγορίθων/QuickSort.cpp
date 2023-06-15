#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define N 20
 
void quicksort(int *, int, int);
int  partition(int *, int , int);
 
int main()
{
    int pin[N],i;
    
    /* Initialize array */
 	srand(time(NULL));
    printf("Initial array:\n");
	for(i=0;i<N;i++)
    {
        pin[i]=rand()%50;
        printf("%3d ",pin[i]);
    }
 
    quicksort(pin, 0, N-1);
    
    printf("\nSorted array:\n");
    for(i=0;i<N;i++)
        printf("%3d ",pin[i]);
        
    return 0;
}
 
void quicksort(int pin[], int low, int high)
{
    int pi;
	
	if (low < high)
    {
        /* pi is partitioning index, arr[pi] is now at right place */
        pi = partition(pin, low, high);
 
        // Separately sort elements before position pi and after position pi
        quicksort(pin, low, pi-1);
        quicksort(pin, pi+1, high);
    }
}
 
int partition (int pin[], int low, int high)
{
    int pivot, i, j, tmp;
	
	pivot = pin[high];    // pivot
    i = (low - 1);        // Index of smaller element
 
    for (j=low; j<=high-1; j++)
    {
        // If current element is smaller than or equal to pivot
        if (pin[j] <= pivot)
        {
            i++;    // increment index of smaller element
            tmp = pin[i];
			pin[i] = pin[j];
			pin[j] = tmp;
		}
    }
    
    tmp = pin[i+1];
	pin[i+1] = pin[high];
	pin[high] = tmp;

    
	return (i + 1);
}

	
		

		
		
		
		
