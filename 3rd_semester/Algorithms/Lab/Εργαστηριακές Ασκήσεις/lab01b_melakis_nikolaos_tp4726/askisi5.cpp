#include<stdio.h>
#include<stdlib.h>
#include<time.h>


main(void)
{
	int lower=0, upper=100, count=1;
	int  num, cnt=0, gs, y, x, z;
	
	srand(time(0));
	

	for (int i=0;i<count;i++);
	{
	num=(rand() &(upper - lower )) + lower;
	printf("----The correct answer is %d----",num);
	}
	
	printf("\n\n\n\n\n");
jmp:
	printf("\nGive an integer: ");
	scanf("%d",&gs);
	z++;
	
	if(gs>num)
	{
	printf("\nGive a lower integer.\n");
	
goto jmp;
	}
	else if (gs<num)
	{
	printf("\nGive a higher integer.\n");
	
goto jmp;	
	}
	else  {
	
	printf("\n\nCongratulations!! The number %d was the correct answer.", num);
	printf("\nThe number of tries it took: %d", z);
}
}

