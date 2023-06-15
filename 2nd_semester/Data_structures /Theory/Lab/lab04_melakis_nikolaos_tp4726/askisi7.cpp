#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct one {
int ak;
char pin[30];
};

struct two {
int data;
int mat[5];
struct one item;
struct one melos;
};

int main () {
struct one person, *ptr;
struct two memb, *dkt;
char temp[10];

ptr = &person;
dkt = &memb;

// Bullet 1
// gets(ptr->pin);
// puts(ptr->pin);

// Bullet 2
// strcpy(dkt->item.pin, ptr->pin);
// puts(dkt->item.pin);

// Bullet 3
// gets(temp); // A tropos diavasma
// dkt->data = atoi(temp);
// scanf("%d", &(dkt->data)); // B tropos diavasma
// fflush(stdin);
// printf("%d\n", dkt->data);

// Bullet 4
// gets(temp);
// dkt->mat[1] = atoi(temp);
// printf("%d", dkt->mat[1]);

// Bullet 5
// gets(temp);
// person.ak = atoi(temp);
// gets(person.pin);
// printf("%d, %s\n", ptr->ak, ptr->pin);

// Bullet 6
// run 5
// dkt->item = person;
// printf("%d, %s\n", dkt->item.ak, dkt->item.pin);

// Bullet 7
// run 5, 6
// dkt->melos = dkt->item;
// printf("%d, %s\n", dkt->melos.ak, dkt->melos.pin);

// Bullet 8
// gets(memb.melos.pin);
// printf("%d\n", strlen(dkt->melos.pin));

// Bullet 9
gets(person.pin);
gets(dkt->melos.pin);
strcat(person.pin, dkt->melos.pin);
puts(person.pin);

return 0;
}
