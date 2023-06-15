/* Ergastirio 6 Askisi 2 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h> 
#include <conio.h>

struct node { 
        char name[30]; 
        int am; 
        float poson; 
        struct node *next; 
};

void display (struct node *);
float ofeiles (struct node *, float *);

int main () {
        struct node *head, *curr, *ptr;
        int num;
        char temp[20];
        float sum, mo;
        
        // Dimiourgia - eisagwgh stoixeiwn
        head = (struct node*) malloc(sizeof(struct node));
        curr = ptr = head;
        curr->next = NULL;
        
        printf("DWSE AM: ");
        gets(temp);
        num = atoi(temp);
        while (num > 0) {
                printf("DWSE ONOMA: ");
                gets(curr->name);
                printf("DWSE POSO: ");
                gets(temp);
                curr->poson = atof(temp);
                curr->am = num;
                curr->next = (struct node*) malloc(sizeof(struct node));
                curr = curr->next;
                curr->next = NULL;
                
                printf("DWSE AM: ");
                gets(temp);
                num = atoi(temp);
        }
        // Svinw ton extra adeio komvo
        while (ptr->next != curr) {
                ptr = ptr->next;
        }
        ptr->next = NULL;
        free(curr);
        curr = NULL;
        
        display(head);
        
        sum = ofeiles(head, &mo);
        printf("sum: %f, mo = %f\n", sum, mo);
        
        return 0;
}

void display (struct node *head) {
        struct node *ptr;
        
        printf("LISTA\n");
        ptr = head;
        while (ptr != NULL) {
                printf("ONOMA: %s, am: %d, poso: %f\n", ptr->name, ptr->am, ptr->poson);
                ptr = ptr->next;
        }
}

float ofeiles (struct node *head, float *mo) {
        struct node *ptr;
        
        float sum = 0;
        int pl = 0;
        
        ptr = head;
        while (ptr != NULL) {
                sum += ptr->poson;
                pl++;
                
                ptr = ptr->next;
        }
        *mo = sum / pl;
        
        return sum;
}


