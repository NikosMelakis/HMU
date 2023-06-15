#include<stdio.h>
#include<string.h>

main(void)


{
	char mat[10],pin[10];
	int m,n;
	
	printf("Enter your firstname: ");
	scanf("%s",mat);
	
	printf("Enter your surname: ");
	scanf("%s",pin);
	
	m=strlen(mat);
	n=strlen(pin);
	
	printf("%s %s",mat,pin);
	printf("\n%*d %*d",m,m,n,n);	
	
	printf("\n%s %s",mat,pin);
	printf("\n%d %*d",m,m,n);


}
