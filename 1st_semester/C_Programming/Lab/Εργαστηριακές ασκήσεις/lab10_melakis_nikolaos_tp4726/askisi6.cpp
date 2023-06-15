#include<stdio.h>

#define N 5

int *comp(int *, int *);
main()
{
	int i, pin[N], mat[N], *d;
	printf("Give %d integers for array pin: ",N);
	for(i=0;i<N;i++)
		scanf("%d",pin+i);
		printf("Give %d integers for array mat: ",N);
	for(i=0;i<N;i++)
		scanf("%d",mat+i);
	d=comp(pin, mat);
	if(d==NULL)
		printf("\nNULL");
	else
		printf("\nThe pointers address is %p and points at %d ", d, *d);
		
}
int *comp( int *pin, int *mat)
{
	int i;
	for(i=0;i<N;i++)
	{
		if(pin[i]==mat[i])
			return pin+i;
		else
			mat[i]=0;
	}
	return mat;
}
