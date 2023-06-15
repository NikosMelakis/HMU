#include<stdio.h>
#define N 5
void input(int *, int *);
void addarray(int *, int *, int *);
void display(int *);
main()
{
	int pin[N], mat[N], arr[N];
	input(pin, mat);
	addarray(pin, mat, arr);
	display(arr);
	return 0;
}
void input(int *pin, int *mat)
{
	int i;
	printf("Give %d integers for pin: ",N);
	for(i=0;i<N;i++)
		scanf("%d",pin+i);
	printf("Give %d integers for mat: ",N);
	for(i=0;i<N;i++)
		scanf("%d",mat+i);
}
void addarray(int *pin, int *mat, int *arr)
{
	int i=0;
	while(i<N)
	{
		arr[i]=pin[i]+mat[i];
		i++;
	}	
}
void display(int *arr)
{
	int i=0;
	printf("The result is: ");
	for(i=0;i<N;i++)
		printf("%d",*(arr+i));
}











