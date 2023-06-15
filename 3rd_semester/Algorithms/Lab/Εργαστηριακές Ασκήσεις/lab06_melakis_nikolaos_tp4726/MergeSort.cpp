#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define N 50000

float mergeSort( int *pin, int low, int high);
void mergeSortArray( int *pin, int llow, int lhigh, int rlow, int rhigh);

main(void)
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
	float time=mergeSort(pin, 0, N-1);
	printf("\n\nSorted array in descending order: \n");
//	for(i=0;i<N;i++)
//		printf("%d\t",pin[i]);
	printf("\n\nTime for sorting the algorithm is %f seconds",time);
	return 0;
}
float mergeSort( int *pin, int low, int high)
{
	clock_t start_t;
	int mid;
	float time;
	start_t=clock();
	if(low<high)
	{
		mid=(low+high)/2;
		mergeSort(pin, low, mid);
		mergeSort(pin, mid+1, high);
		mergeSortArray(pin, low, mid, mid+1, high);
	}
	start_t=clock() - start_t;
	return (float)(start_t)/CLOCKS_PER_SEC;

}

void mergeSortArray( int *pin, int llow, int lhigh, int rlow, int rhigh)
{
	int pa=llow, pb=rlow, pt=llow, tmp[N];
	while(pa<=lhigh&&pb<=rhigh)
	{
		if(pin[pa]>pin[pb])
			tmp[pt++]=pin[pa++];
		else
			tmp[pt++]=pin[pb++];
	}
	if(pa>lhigh)
		while(pb<=rhigh)
			tmp[pt++]=pin[pb++];
	else
		while(pa<=lhigh)
			tmp[pt++]=pin[pa++];

	for(pt=llow;pt<=rhigh;pt++)
		pin[pt]=tmp[pt];
}
