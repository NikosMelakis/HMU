#include<stdio.h>
#include<stdlib.h>
#define N 2

struct funds{
	char name[20];
	float poson;
	};
	
void athroisma(struct funds *pin, char ch, int *cnt){
	if(ch==pin[0].name[0]);
		*cnt=*cnt+1;
	if(ch==pin[1].name[0]);
		*cnt=*cnt+1;
	
}


	
int main(){
	struct funds pin[N];
	int i, *cnt=0;
	char ch;
	for(i=0;i<N;i++){
	printf("Give a name(pin[%d].name): ",i);
	scanf("%s",&pin[i].name);
	printf("Give a float(pin[%d].poson): ",i);
	scanf("%f",&pin[i].poson);
	}
	printf("Give a char: ");
	scanf("%c",&ch);
	athroisma(pin, ch, cnt);
	
	printf("%d names started with %c",*cnt, ch);
	system("pause"); 
	return 0;	
	}
