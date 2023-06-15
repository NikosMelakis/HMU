#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<conio.h>
#define MAX 3
#define NUM 8
main()
{
char temp[NUM],ch;
char *pin[MAX];
int k=0,i;
puts("dwse onomata");

while( k < MAX)
{
gets(temp);
if (temp[0]!='\x0') {
pin[k]=(char *)malloc(strlen(temp)+1);
strcpy(pin[k],temp);
k++;
}



}
printf("\n");
puts("dwse pali");
for(i=0;i<k;i++)
{
puts(pin[i]);
}

}
