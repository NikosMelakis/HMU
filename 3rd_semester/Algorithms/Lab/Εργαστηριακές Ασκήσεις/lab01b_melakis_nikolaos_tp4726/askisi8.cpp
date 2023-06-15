#include<stdio.h>
#include<string.h>

main(void)

{
	char mat[30],pin[30];
	int m,n;
	printf("Give string no1: ");
	scanf("%s",&mat);
	printf("Give string no2: ");
	scanf("%s",&pin);
	printf("Strint no1:%s \nString no2:%s\n",mat,pin);
	m=strlen(mat);
	n=strlen(pin);
	printf("--Atfer the copypaste--");
	if(m>n)
	{	
		printf("\n%s",mat);
		strcpy(mat,pin);
		printf(" %s",pin);
	}
	if(m<n)
	{
		printf("\n%s",pin);
		strcpy(pin,mat);
		printf(" %s",mat);
	}
}
