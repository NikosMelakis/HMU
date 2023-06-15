#include<stdio.h>

void antalagi(int *,int *);

main(void)

{
	int x,y;
	printf("Give an integer for x,y: ");
	scanf("%d%d",&x,&y);
	printf("\nYou typed x=%d, y=%d.",x,y);
	antalagi(&x,&y);	
	printf("\n\nAfter the exchange, x=%d, y=%d.",x,y);
}
void antalagi(int *x, int *y)
{
	int temp;
	temp=*x;
	*x=*y;
	*y=temp;
}


