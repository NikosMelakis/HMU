#include<stdio.h>
#include<conio.h>
#include<math.h>

float power(float,int);

main(void)
{
	int ak;
	float bs;
	printf("Give an integer: ");
	scanf("%d",&ak);
	printf("Give a float: ");
	scanf("%f",&bs);
	float num=power(bs,ak);
}

float power(float bs, int ak)

{
	float y=1;
	for(int x=1;x<=ak;x++)
		y=y*bs;
	printf("The result is: %.2f",y);
		
}
