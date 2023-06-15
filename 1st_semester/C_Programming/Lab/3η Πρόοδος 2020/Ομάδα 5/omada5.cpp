#include<stdio.h>
#include<string.h>
#define N 20
char *four(char *, char *, int);
main()
{
	char dest[N], src[N], *ch;
	int num, size;
	printf("Give string dest: ");
	gets(dest);
	printf("Give string src: ");
	gets(src);
	printf("Give num: ");
	scanf("%d",&num);
	ch=four(dest, src, num);
	if(ch==NULL)
		printf("NULL");
	else
	{
		printf("Pointers address is %p and points at %c\n",ch, *ch);
		puts(ch);
		size=strlen(dest);
		printf("%d",size);
	}
}
char *four(char *dest, char *src, int num)
{
	int i, j;
	if(dest[0]==src[0])
		return NULL;
	else
	{
		for(i=0;i<N;i++)
			dest[num+i]=src[i];
		for(i=0;i<N;i++)
			if(dest[i]=='A')
				{
					j=i;
					dest[j]='a';
				}
		
	}
	return dest+j;
}
