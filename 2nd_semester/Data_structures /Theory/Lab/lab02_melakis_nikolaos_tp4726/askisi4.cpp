#include<stdio.h>
#include<string.h>

#define R 5
#define C 10
int main(){
	char pin[R][C];
	int size, cnt;
	while(size<R){
		printf("Type a string: ");
		gets(&(pin[R][C]));
		size=strlen(&(pin[R][C]));
		cnt+=size;
		if(pin[R][C]=='\x0')
			break;
	}
	printf("%d chars were typed", cnt-1);
	printf("\nThe logest string had %d chars", size);	
}
