#include <stdio.h> // thema ksezonaki 2007 domes
#include <stdlib.h>
# define N 5

struct rest
{
char classs[10];
int apousies;
float mo;
};

struct student
{
char name[40];
int year;
struct rest stoixeia;
};

main()
{
struct student pin[N];
int i;
for (i=0 ; i < N ; i++)
{
printf("\n\n Diabazete foithths %d  \n",i);
printf("name --> ");
gets(pin[i].name);
printf("year --> ");
scanf("%d",&pin[i].year);
getchar();
printf("class --> ");
gets(pin[i].stoixeia.classs);
printf("apousies --> ");
scanf("%d",&pin[i].stoixeia.apousies);
printf("mesos oros --> ");
scanf("%f",&pin[i].stoixeia.mo);
getchar();
}


system("pause");
}
