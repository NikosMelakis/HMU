#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define N 20
 
int binarySearch(int *, int, int, int);
 
int main()
{
    int pin[N], i, num;
    
    /* Initialize array */
 	srand(time(NULL));
    printf("Initial sorted array\n");
	pin[0] = rand()%10;
	for(i=1;i<N;i++)
    {
        pin[i] = pin[i-1] + rand()%5;
        printf("%d ", pin[i]);
    }
 
    printf("\nGive element to search: ");
    scanf("%d",&num);
    
    i = binarySearch(pin, 0, N, num);
    
    if(0<i && i<N)
        printf("Element found at position %d",i-1);
    else
        printf("Element not found");
 
    return 0;
}


int binarySearch(int pin[], int l, int r, int num)
{
   int mid;
   
   if (r >= l)
   {
        mid = l + (r - l)/2;
 
        if (pin[mid] == num)  return mid;	// If element is present at the middle
        if (pin[mid] > num) return binarySearch(pin, l, mid-1, num);   	// If element is smaller than mid, then it may be only in left subarray
        else return binarySearch(pin, mid+1, r, num);	// Else the element may only be in right subarray
   }
 
   return -1;	 // We reach this point if element is not in the array
}
