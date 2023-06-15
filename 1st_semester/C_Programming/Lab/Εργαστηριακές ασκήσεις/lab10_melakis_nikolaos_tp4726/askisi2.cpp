#include<stdio.h>
void test();
void test2();
main()
{
	test();
	test();
	test();
	test2();
	test2();
	test2();
}

void test() 
{ 
	static int a=1; 
	a++; 
	printf("a=%d \n", a); 
} 
void test2() 
{ 
	static int a; 
	a=1; 
	a++; 
	printf("a=%d \n", a); 
}
