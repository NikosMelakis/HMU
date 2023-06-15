#include<stdio.h>
#define N 5
int *swap(int *, int *);
main()
{
	int i, pin[N], mat[N];
	int *ptr;
	printf("Give %d elements for pin: ", N);
	for(i=0;i<N;i++)
		scanf("%d", pin+i);
	printf("Give %d elements for mat: ", N);
	for(i=0;i<N;i++)
		scanf("%d", mat+i);	
	ptr=swap(pin, mat);
	if(ptr=='\x0')
		printf("NULL");
	else
		printf("The pointer points at %d",*ptr);
}
int *swap(int *pin, int *mat)
{
	int j;
	for(j=0;j<N;j++)
		pin[j]=mat[j];
	for(j=0;j<N;j++)
		if(pin[j]<0)
			return pin+j;
	return NULL;
}
