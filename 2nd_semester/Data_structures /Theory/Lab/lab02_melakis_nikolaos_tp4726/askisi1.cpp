#include<stdio.h>
#define N 2

void better(int grades[N][N], int *max){
	int k, l, temp;
	for(k=0;k<N;k++)
		for(l=1;l<N;l++){
			temp=grades[k][l];
			k++;
			if(grades[k][l]>temp)
				*max=grades[k][l];
			else
				*max=temp;
		}
}
int main(){
	int  i, j, max, grades[N][N];
	for(i=0;i<N;i++)
		for(j=0;j<N;j++){
			printf("Enter id: ");
			scanf("%d",&grades[i][j]);
			j++;
			printf("Enter grade: ");
			scanf("%d", &grades[i][j]);
		}
	for(i=0;i<N;i++)
		for(j=0;j<N;j++){
			printf("ID:%d, ",grades[i][j]);
			j++;
			printf("Grade:%d",grades[i][j]);
			if(j==1)
				printf("\n");
		}
	better(grades, &max);
	printf("The best grade is: %d", max);
	return 0;
}


