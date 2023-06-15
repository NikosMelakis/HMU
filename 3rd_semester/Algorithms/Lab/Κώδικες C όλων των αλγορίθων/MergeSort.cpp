#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define N 20

void mergesort(int pin[],int i,int j);
void merge(int pin[],int i1,int j1,int i2,int j2);

int main()
{
    int pin[N],i;

    /* Initialize array */
 	srand(time(NULL));
    printf("Initial array:\n");
	for(i=0;i<N;i++)
    {
        pin[i]=rand()%50;
        printf("%d ",pin[i]);
    }

    mergesort(pin,0,N-1);

    printf("\nSorted array:\n");
    for(i=0;i<N;i++)
        printf("%d ",pin[i]);

    return 0;
}

void mergesort(int pin[],int i,int j)
{
    int mid;

    if(i<j)
    {
        mid=(i+j)/2;
        mergesort(pin,i,mid);        //left recursion
        mergesort(pin,mid+1,j);      //right recursion
        merge(pin,i,mid,mid+1,j);    //merge the two sorted parts of the array
    }
}

void merge(int pin[],int i1,int j1,int i2,int j2)
{
    int tmp[N];    //array used for merging
    int i,j,k;
    i=i1;          //beginning of the first list
    j=i2;          //beginning of the second list
    k=0;

    while(i<=j1 && j<=j2)    //while there are elements in both lists
    {
        if(pin[i]<pin[j])
            tmp[k++]=pin[i++];
        else
            tmp[k++]=pin[j++];
    }

    while(i<=j1)    //copy remaining elements of the first list
        tmp[k++]=pin[i++];

    while(j<=j2)    //copy remaining elements of the second list
        tmp[k++]=pin[j++];

    //Transfer elements from tmp[] back to array pin[]
    for(i=i1,j=0;i<=j2;i++,j++)
        pin[i]=tmp[j];
}
