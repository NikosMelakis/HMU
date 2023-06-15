#include<stdio.h>
#define N 5
float avg(float *);
main()
{
	float c[N];
	int i;
	float ptr;
	printf("Give %d floats for c: ",N);
	for(i=0;i<N;i++)
		scanf("%f",c+i);
	ptr=avg(c);
	printf("The AVG is : %.2f",ptr);
}
float avg(float *c)
{
	int j;
	float sum, MO;
	for(j=0;j<N;j++)
		sum+=*(c+j);
	MO=sum/N;
	return MO;
}
