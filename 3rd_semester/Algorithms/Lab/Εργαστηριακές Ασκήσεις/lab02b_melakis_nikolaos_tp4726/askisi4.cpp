#include<stdio.h>

int FibonacciSequence(int,int,int,int);

main(void)

{


    int t1=0, t2=1, nextterm=0, n;

	printf("Give the limit for Fibonacci seqeunce: ");
	scanf("%d",&n);
	printf("Fibonacci Series: ",t1,t2);
    int num=FibonacciSequence(t1,t2,nextterm,n);
}
int FibonacciSequence(int t1, int t2, int nextterm, int n)

{
    while(nextterm <= n)
    {
		printf(", %d",nextterm);
        t1 = t2;
		t2 = nextterm;
        nextterm = t1 + t2;
    }
    
    return 0;
}

