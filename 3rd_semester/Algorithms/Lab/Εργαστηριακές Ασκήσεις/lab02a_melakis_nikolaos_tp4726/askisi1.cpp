#include<stdio.h>
#include<conio.h>

int computeraki(int,int,char);

main()

{
	int a,b;
	printf("Give an integer for a: ");
	scanf("%d",&a);
	
	printf("Give an integer for b: ");
	scanf("%d",&b);
	
	char ch;
		
	printf("Give a character: ");
	ch=getche();
	
	int num=computeraki(a,b,ch);
	
}

int computeraki(int a, int b, char ch)

{



	switch(ch)
	{
	
		case '+':
		printf("\nThe sum is: %d",a+b);
		break;
		
		case '-':
		printf("\nThe subtraction is: %d",a-b);
		break;
		
		case '*':
		printf("\nThe multiplication is: %d",a*b);
		break;
		
		case '/':
		printf("\nThe division is: %d",a/b);
		break;
		
		default:
		printf("\nNot maching the correct char!");
		break;
		
		return 0;
	}
}
