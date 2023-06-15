#include<stdio.h>
main(void)
{
	float fp,sum;
	int x,y;
	x=0;
	y=0;
	sum=0.0;
		for(y=0;y<=30;y++)
	{
		printf("Give a float: ");
		scanf("%f",&fp);
		
		if(fp>=0)
		{
		x++;
		sum=sum+fp;
		}
		else
		{
		
		y++;
		}
		}
	printf("%d",x);
	printf(" float(s) was(were) >0\n"); 
	printf("The sum of the positive floats is: ");
	printf("%f",sum);	

}
