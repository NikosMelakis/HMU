#include<stdio.h>
#define N 10
int five_a(int *, int *, int *);
int five_b(int *, int *, int);
main()
{
	int pin[N], mik, meg, a, b;
	int i=0, ak;
	printf("Give integers: ");
	while(i<N)
	{
		scanf("%d",&ak);
		if(ak==0)
			break;
		else
			pin[i]=ak;
		a=five_a(&ak, &mik, &meg);
		printf("mik=%d, meg=%d, mo=%d",mik, meg, a);
		b=five_b(&mik, &meg, a);
		i++;
	}
}
int five_a(int *ak, int *mik, int *meg)
{
	int i, num, sum=0, mo;
	for(i=0;i<*ak;i++)
	{
		printf("Give integer:");
		scanf("%d",&num);
		sum+=num;
		if(num>*ak)
			*meg=*meg+1;
		if(num<*ak);
			*mik=*mik+1;
	}
	mo=sum/i;
	return mo;
}
int five_b(int *mik, int *meg, int a)
{
	*mik=0;
	*meg=0;
	a=0;
	return a;
}


