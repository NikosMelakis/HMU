#include<stdio.h>
#include<string.h>

#define N 20

char *strsrch(char *, char *, int);
main()
{
	int k;
	char *n;
	printf("Give an integer: ");
	scanf("%d",&k);
	char symb[N], syn[N];
	printf("Give a string: ");
	scanf("%s",&symb);
	printf("Give a string: ");
	scanf("%s",&syn);
	n=strsrch(symb, syn, k);
	if(n==NULL)
		printf("\nNULL");
	else
		printf("\nThe pointer points at %c",*n);	
}
char *strsrch(char *symb, char *syn, int k)
{
	int m;
	m=strlen(syn);
	if((k-1)+m<N)
		strcpy(symb+k,syn);
	printf("%s",symb);
	return symb+k;	
}
