#include<stdio.h>
#include<stdlib.h>
#include<conio.h>
#include<math.h>
main(void)
{
	int x;
	float y=0,z=0,k=0;
	int N;
	printf("Give the limit: ");
	scanf("%d",&N);
	
	for(x=1;x<=N;x++)
	
	{	
		y+=1.0/x;
		
		if(x%2)
	{

			
		k+=1.0/x;
	}	
			
		else 
	{
	
		k-=1.0/x;
	}
	}

		
	
	printf("The result of the first equation is: %f\n",y);
	printf("The result of the second equazion ia: %f",k);	
}

