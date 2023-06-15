#include<stdio.h>
#define N 5
main()
{
	int i, pin[N];
	printf("Give %d integers for the array: ",N);
	for(i=0;i<N;i++)
		scanf("%d",pin+i);
	for(i=0;i<N;i++)
		printf("In address %p is the element %d\n",pin+i,*(pin+i));
		
	
}
