#include<stdio.h>
#include<stdlib.h>
#include<time.h>
#include<math.h>

#define N 5000
  

int interpolationSearch(int *, int , int , int *);


int main() 
{ 
    
    int arr[N], i, x, count;
    int n = sizeof(arr)/sizeof(arr[0]);
    srand(time(NULL));
    printf("Initial sorted array\n");
	arr[0] = rand()%100;
	for(i=1;i<N;i++)
    {
        arr[i] = arr[i-1] + rand()%10;
        printf("%d ", arr[i]);
    }
 
    printf("\n\nGive element to search: ");
    scanf("%d",&x);
    
    
    
    int index = interpolationSearch(arr, n, x, &count); 
  
 
    if (index != -1) 
    {
	    printf("\nElement found at position %d.", index); 
        printf("\nIt took %d step(s) to find element",count);
    }
	else
        printf("\nElement not found."); 
    return 0; 
}

int interpolationSearch( int arr[], int n, int x, int *count)
{

	
    
    int lo = 0, hi = (n - 1); 
    
    while (lo <= hi && x >= arr[lo] && x <= arr[hi]) 
    {
    	*count=*count+1;
        if (lo == hi){ 
            if (arr[lo] == x) return lo; 
            return -1; 
        } 
         
         
        int pos = lo + (((double)(hi-lo) / 
              (arr[hi]-arr[lo]))*(x - arr[lo])); 
  
        
        if (arr[pos] == x) 
            return pos; 
  
        
        if (arr[pos] < x) 
            lo = pos + 1; 
  
        
        else
            hi = pos - 1; 
            
    
    } 
    return -1; 
}
  
 

