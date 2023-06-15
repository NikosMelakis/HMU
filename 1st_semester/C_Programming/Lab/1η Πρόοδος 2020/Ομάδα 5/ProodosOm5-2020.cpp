#include<stdio.h>
#include<conio.h>
#include<string.h>
#define N 40
int five(int, char);
main()
{
	int lim;
	char ch;
	printf("Give int lim:");
	scanf("%d",&lim);
	printf("Give char ch:");
	ch=getche();
	int count=five(lim, ch);
	printf("\n%d strings had last letter %c",count,ch);
}
five(int lim, char ch)
{
	char pin[N];
	int count=0, i;
	int met=0, m=0;
	printf("\nGive a string:");
	scanf("%s",pin);
	m=strlen(pin);
	while(m>5&&m<30)
	{
		if(pin[m-1]==ch)
		{
			count++;
			if(count>lim)
			{
				printf("THE END");
				break;
			}
		}
		for(i=0;i<m;i++)
		{
			if(pin[i]>='A'&&pin[i]<='Z')
			{
				met++;
				printf("%c",pin[i]+1);
			}
		}
		printf("\n%d letters were written on screen",met);
		printf("\nGive a string:");
		scanf("%s",pin);
		m=strlen(pin);
		met=0;
	}
	
	return count;
	}
