#include<stdio.h>
#include<conio.h>
#include<string.h>

#define N 10

int one(int);

main()

{
	int lim;
	char ch;
	printf("Give integer lim: ");
	scanf("%d",&lim);
	printf("Give char ch: ");
	ch=getche();
	int count=one(lim);
	printf("%d strings started with letter 'A'.",count);
	
}

one(int lim)
{
	int count=0, i;
	char pin[N];
	int m=0;
	int met=0;
	printf("\nGive a string:");
	scanf("%s",pin);
	m=strlen(pin);
	while(m>5)
	{
		if(pin[0]=='A')
		{
			count++;
			if(count>lim)
			{
				printf("--THE END--\n");
				break;
			}
		}
		for(i=0;i<m;i++)
			{
				if(pin[i]>='A'&&pin[i]<='Z')
				{
					printf("%c",pin[i]);
					met++;
				}

			}
		
		printf("\n%d letters were written on screen",met);
		printf("\nGive a string:");
		scanf("%s",pin);
		m=strlen(pin);
	}
	
	return count;
}
