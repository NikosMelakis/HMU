#include<stdio.h>
#include<stdlib.h>
#define N 100  
 
     
int G[N][N], visited[N], n, m ;
void BFS(int v);
 
int queue[N], front = -1, rear = -1;
void enqueue(int v);
int dequeue();
int isemptyqueue();
 
int main()
{
    int i, j, v1, v2;
    
	printf("Enter number of vertices: ");
    scanf("%d", &n);
 
    printf("\nEnter number of edges: ");
    scanf("%d", &m);
    
    //Initialize adjecency graph
	for (i=0; i<n; i++)
		for (j=0; j<n; j++)
			G[i][j] = 0;
			
	printf("\nEnter graph edges:\n");
    for(i=0; i<m; i++) {
       scanf("%d %d", &v1, &v2);
		G[v1][v2] = 1;
		G[v2][v1] = 1;
		} 
	
	printf("Adjecency graph:\n");
	for (i=0; i<n; i++) {
		for (j=0; j<n; j++)
			printf("%d ", G[i][j]);
		printf("\n");
	}
	printf("\n");
			
   //Initialize visited to zero
   for(i=0; i<n; i++)
        visited[i] = 0;
 	printf("BFS \n");
    BFS(0);
} 
 
 
void BFS(int v)
{
    int w;
    
    visited[v]=1;
	enqueue(v);
    
    while(!isemptyqueue())
    {
        v = dequeue( );
        printf("%d ",v);
        
        for(w=0; w<n; w++)
        {
            if(G[v][w] == 1 && visited[w] == 0) 
            {
                visited[w] = 1;
                enqueue(w);
            }
        }
    }
    printf("\n");
}
 
void enqueue(int v)
{
    if(rear == N-1)
        printf("Queue Overflow\n");
    else
    {
        if(front == -1) 
            front = 0;
        rear = rear+1;
        queue[rear] = v;
    }
}
 
int isemptyqueue()
{
    if(front == -1 || front > rear)
        return 1;
    else
        return 0;
}
 
int dequeue()
{
    int delete_item;
    if(front == -1 || front > rear)
    {
        printf("Queue Underflow\n");
        exit(1);
    }
    
    delete_item = queue[front];
    front = front+1;
    return delete_item;
}
 
