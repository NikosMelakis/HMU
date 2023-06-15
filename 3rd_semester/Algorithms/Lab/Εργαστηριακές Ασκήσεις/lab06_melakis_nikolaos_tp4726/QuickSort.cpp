#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define N 50000

float quickSort(int *, int, int);
int  partition(int *, int , int);

int main()
{
	int i, pin[N];
	int min=1, max=1000;
	srand(time(NULL));
	printf("Initial array:\n");
	for(i=0;i<N;i++)
	{
		pin[i]=min+rand()%(max+1-min);
//		printf("%d\t",pin[i]);
	}
	float time=quickSort(pin, 0, N-1);
	printf("\n\nSorted array in descending order: \n");
//	for(i=0;i<N;i++)
//		printf("%d\t",pin[i]);
	printf("\n\nTime for sorting the algorithm is %f seconds",time);
	return 0;
}

float quickSort(int pin[], int low, int high)
{
	clock_t start_t;
    int pi;
    float time;
    start_t=clock();
	if (low < high)
    {
        pi = partition(pin, low, high);
        quickSort(pin, low, pi-1);
        quickSort(pin, pi+1, high);
    }
	start_t=clock() - start_t;
	return (float)(start_t)/CLOCKS_PER_SEC;
    
}

int partition (int pin[], int low, int high)
{
    int pivot, i, j, tmp;

	pivot = pin[high];
    i = (low - 1);
    for (j=low; j<=high-1; j++)
    {
        if (pin[j] >= pivot)
        {
            i++;
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
