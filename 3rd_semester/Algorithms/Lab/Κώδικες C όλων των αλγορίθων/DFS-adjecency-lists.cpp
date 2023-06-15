#include<stdio.h>
#include<stdlib.h>
#define N 20
 
typedef struct node
{
    struct node *next;
    int vertex;
}node;
 
node *G[N];   
//heads of linked list
int visited[N];
int n;
void read_graph(); 
//create adjacency list
void insert(int,int);  
//insert an edge (vi,vj) in te adjacency list
void print_graph();
void DFS(int);
 
main()
{
    int i;
    read_graph();
    print_graph();
    //initialised visited to 0
   
    for(i=0;i<n;i++)
        visited[i]=0;
 
    DFS(0);
}
 
void DFS(int i)
{
    node *p;
   
    printf("\n%d",i);
    p=G[i];
    visited[i]=1;
    while(p!=NULL)
    {
       i=p->vertex;
       
       if(!visited[i])
            DFS(i);
        p=p->next;
    }
}
 
void read_graph()
{
    int i,j,vi,no_of_edges;
    printf("Enter number of graph vertices: ");
   
    scanf("%d",&n);
 
    //initialise G[] with a null
   
    for(i=0;i<n;i++)
    {
        G[i]=NULL;
        //read edges and insert them in G[]
       
        printf("Enter number of edges for node %d: ", i);
           scanf("%d",&no_of_edges);
 
           for(j=0;j<no_of_edges;j++)
        {
            printf("Enter a neighbor: ");
            scanf("%d",&vi);
            insert(i,vi);
        }
    }
}

void print_graph () {
	int i;
	node *p;
	
	for (i=0; i<n; i++) {
		printf("Node %d: ", i);
		p=G[i];
		while (p != NULL) {
			printf("%d ", p->vertex);
			p = p->next;
		}
		printf("\n");
	}
}
 
void insert(int vi,int vj)
{
    node *p,*q;
    
    //acquire memory for the new node
    q=(node*)malloc(sizeof(node));
    q->vertex=vj;
    q->next=NULL;
 
    //insert the node in the linked list number vi
    if(G[vi]==NULL)
        G[vi]=q;
    else
    {
        //go to end of the linked list
        p=G[vi];
       
        while(p->next!=NULL)
            p=p->next;
        p->next=q;
    }
}
