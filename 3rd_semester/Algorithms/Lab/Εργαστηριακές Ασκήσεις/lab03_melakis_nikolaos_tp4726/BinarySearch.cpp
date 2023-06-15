#include<stdio.h>
#include<stdlib.h>
#include<time.h>
#include<math.h>

#define N 5000
 
int binarySearch(int *, int, int, int, int *);
 
int main()
{
    int pin[N], i, num;
    int count=0;
    
    /* Initialize array */
 	srand(time(NULL));
    printf("Initial sorted array\n");
	pin[0] = rand()%100;
	for(i=1;i<N;i++)
    {
        pin[i] = pin[i-1] + rand()%10;
        printf("%d ", pin[i]);
    }
 
    printf("\n\nGive element to search: ");
    scanf("%d",&num);
    
    i = binarySearch(pin, 0, N, num, &count);
    
    if(0<i && i<N)
    {
	    printf("\nElement found at position %d.",i);
    	printf("\nIt tokk %d step(s) to find element.",count);
	}
		else
        printf("Element not found");
 
    return 0;
}


int binarySearch(int pin[], int l, int r, int num, int *count)
{
	int m;
		
  	while (l <= r)
  	{
    	*count=*count+1;
		m = l + (r-l)/2;
 
    if (pin[m] == num) // Check if x is present at mid
        return m;  
 
    if (pin[m] < num)  // If x greater, ignore left half  
        l = m + 1; 
    else			   // If x is smaller, ignore right half 
         r = m - 1; 
  }
 
  return -1; 	       // if we reach here, then element was not present
}
