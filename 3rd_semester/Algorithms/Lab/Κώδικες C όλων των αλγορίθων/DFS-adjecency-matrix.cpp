#include <stdio.h>
#include <stdlib.h>
#define N 20

void DFS(int);

//n is the number of vertices
int G[N][N], visited[N], n, m;    

 
main()
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
 	printf("DFS \n");
    DFS(0);
}
 
void DFS(int v)
{
    int i, u;
	printf("%d  \n", v);
    visited[v] = 1;
    
    //Print visited
   	for(i=0; i<n; i++)
        printf("%d ", visited[i]);
    printf("\n");
    
    for(u=0; u<n; u++)
     	if(G[v][u]==1 && !visited[u])
        	DFS(u);
}
