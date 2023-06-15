#include<stdio.h>
#include<stdlib.h>
#include<string.h>

struct stype
{
	int j;
	char ch[30];
	float fp;
};

main()
{
	struct stype str1, str2;
	struct stype temp;
	
	printf("Give str1.j: ");
	scanf("%d",&str1.j);
	printf("Give str2.j: ");
	scanf("%d",&str2.j);
	
	printf("Give str1.ch: ");
	scanf("%s",str1.ch);
	printf("Give str2.ch: ");
	scanf("%s",str2.ch);
	
	printf("Give str1.fp: ");
	scanf("%f",&str1.fp);
	printf("Give str2.fp: ");
	scanf("%f",&str2.fp);
	
	printf("--BEFORE THE SWITCH--\n");
	
	printf("str1.j=%d\n",str1.j);
	printf("str1.ch=");
	puts(str1.ch);
	printf("str1.fp=%.2f\n",str1.fp);
	
	printf("str2.j=%d\n",str2.j);
	printf("str2.ch=");
	puts(str2.ch);
	printf("2.fp=%.2f\n",str2.fp);
	
	temp=str1;
	str1=str2;
	str2=temp;

	printf("--AFTER THE SWITCH--\n");
	
	
	printf("str1.j=%d\n",str1.j);
	printf("str1.ch=");
	puts(str1.ch);
	printf("str1.fp=%.2f\n",str1.fp);
	
	printf("str2.j=%d\n",str2.j);
	printf("str2.ch=");
	puts(str2.ch);
	printf("2.fp=%.2f\n",str2.fp);
	system("pause");		
}
