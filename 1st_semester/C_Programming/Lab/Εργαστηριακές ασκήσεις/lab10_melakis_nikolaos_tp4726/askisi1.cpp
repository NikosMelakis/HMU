#include<stdio.h>
int a=3;
float x;
void test();
void test2(int);
void test3();
main()
{
	printf ("a=%d, x=%f \n", a, x);
	test();
	printf ("a=%d \n", a);
	test2 (a);
	printf ("a=%d \n", a);
	test3();
	printf("a=%d, x=%f \n",++a,x); 
}

void test() 
{
	int a;
	a = 4; 
}

void test2(int a) 
{
	a = 5; 
}

void test3() 
{
	x=3.14;
	printf("a=%d, x=%f \n",++a,x);
	a=5; 
}
