#include<stdio.h>

int praxeis(int *,int *);

main(void)

{
	int x,y;
	printf("Give an integer for x,y:");
	scanf("%d%d",&x,&y);
	printf("You typed x=%d, y=%d.",x,y);
	
	int mult=praxeis(&x, &y);
	
	printf("\n\nThe result of the multiplication is=%d.",mult);
	printf("\nAfter the exchange x=%d, y=%d.",x,y);
}

int praxeis(int *x, int *y)

{
	int sum, sub, mult;
	sum=*x+*y;
	sub=*x-*y;
	mult=*x**y;
	*x=sum;
	*y=sub;
	
	return mult;
}


