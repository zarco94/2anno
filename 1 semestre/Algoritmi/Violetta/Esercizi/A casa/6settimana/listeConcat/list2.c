#include <stdio.h>
#include <stdlib.h>

//  STRUTTURA
struct Element{
    int info; //valore dell'elemento
    struct Element *next;
};
typedef struct Element Element;


// PROTOTIPI FUNZIONI
Element* insert(int n, Element* h);
void printlist(Element* h);
int isMember(int n, Element* h);
Element* delete(int n, Element* h);
void destroy(Element* h);
int* listToArray(Element* h, int n);
void printInv(Element* h);


// MAIN
int main(void){
    char c;
    int n;
    Element *head = NULL;

    while((c=getchar())!='f'){   
        printf("c:%c\n", c);     
        switch(c){
            case '+':
                scanf("%d", &n);
                head = insert(n, head);
                break;
            case '-':
                break;
            case '?':
                break;
            case 'c':
                break;
            case 'p':
               printlist(head);
                break;
            case 'o':
                break;
            case 'd':
                break;
            case 'f':
                break;

        }

    }
    // la lista può essere cancellata??
}


// FUNZIONI
Element* insert(int n, Element* h){
    Element *e = malloc(sizeof(Element));
    e -> info = n;
    e -> next = h ;
    h=e;
    return h;
}
void printlist(Element* h){
    printf("%p ", h->next);
    while(h->next != NULL){
        printf("%d ", h->info);
        printlist(h->next);
    }
    //printf("%d\n", h -> info);
}
int isMember(int n, Element* h){
    return 0;
}
Element* delete(int n, Element* h){
    return 0;
}
void destroy(Element* h){
    
}
int* listToArray(Element* h, int n){
    return 0;
}
void printInv(Element* h){
    
}