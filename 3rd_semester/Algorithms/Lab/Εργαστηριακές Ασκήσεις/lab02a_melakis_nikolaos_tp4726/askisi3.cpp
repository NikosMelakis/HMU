#include<stdio.h>
#include<conio.h>

int fact(int);

main(void)

{
	int n, factorial=1;
	printf("Give an integer: ");
	scanf("%d",&n);
	factorial=fact(n);
	printf("Factorial of %d is %d",n,factorial);
	getch();
	return 0;
	
	
	
}
int fact( int n)
{
	int i,f=1;
	for(i=1;i<=n;i++)\
	f=f*i;
	return(f);
}


