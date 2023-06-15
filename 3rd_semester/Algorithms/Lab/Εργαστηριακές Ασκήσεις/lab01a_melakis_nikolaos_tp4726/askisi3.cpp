#include <stdio.h>

#define N 20   

int main()
{
    int arr[N];
    int i, max, min, size;

   
    printf("Enter size of the array: ");
    scanf("%d", &size);

   
    printf("Enter integers in the array: ");
    for(i=0; i<size; i++)
    {
        scanf("%d", &arr[i]);
    }

    max = arr[0];
    min = arr[0];

    for(i=1; i<size; i++)
    {
      
        if(arr[i] > max)
        {
            max = arr[i];
        }

        
        if(arr[i] < min)
        {
            min = arr[i];
        }
    }

   
    printf("Maximum integer = %d\n", max);
    printf("Minimum integer = %d", min);

    return 0;
}
