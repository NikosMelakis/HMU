#include<stdio.h>
#include<string.h>


main(void)

{
	char wrd[30];
	int m=0, i=0;
	printf("Give a string: ");
	scanf("%s",&wrd);
	while(wrd[i]!='\x0')
	{
		i++;
		m++;
	}
	
	printf("The string lenght is %d\n",m);
}
