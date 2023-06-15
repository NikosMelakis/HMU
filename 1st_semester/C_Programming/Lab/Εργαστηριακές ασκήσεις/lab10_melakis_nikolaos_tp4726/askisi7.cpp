#include<stdio.h>
#include<string.h>
#define N 10
char *reverse(char *, char *);
main()
{
	char *d;
	char wrd[N], symb[N];
	printf("Give a string: ");
	scanf("%s",wrd);
	d=reverse(wrd, symb);
	printf("The reversed string is %s and the pointer points at %c",symb, *d);
}
char *reverse(char *wrd, char *symb)
{
	int m, i, j=1;
	m=strlen(wrd);
	for(i=0;i<N;i++)
	{
		symb[i]=wrd[m-j];
		j++;
	}
	return wrd+m;
}
