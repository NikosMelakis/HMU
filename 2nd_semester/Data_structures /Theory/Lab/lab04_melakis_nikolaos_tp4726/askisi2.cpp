#include<stdio.h>
#include<stdlib.h>
#define N 20

int main(){
	char pin[N], mat[N];
	char *ptr;
	printf("Type a string no1: ");
	gets(pin);
	ptr=(char*)malloc(pin[N]*sizeof(char));
	if(ptr=NULL){
		printf("Memory not allocated!!");
		exit(0);
	}
	else{
		printf("Memory successfully allocated!\n");	
		printf("Type a string no2: ");
		gets(mat);
		ptr=(char*)realloc(ptr, mat[N]*sizeof(char));
		puts(pin);
	}
	return 0;
}
