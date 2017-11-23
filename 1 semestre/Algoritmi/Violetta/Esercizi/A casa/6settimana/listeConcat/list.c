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
        printf("c:%c", c);     //////   DEBUG BISOGNA SEMPRE METTERE \n -> perchè svuota il buffer
        switch(c){             /////    il buffer delle cose calcolate viene mandato non instantaneamente a schermo se non c'è  
            case '+':          /////    \n -> quindi "c" viene inserito nel buffer ma prima che mi venga stampato a schermo trova un segmentation Fault -> stampa solo il segFault 
                scanf("%d", &n); //     quindi quando si fanno delle stampe di debug bisogna mettere la \n -> quando trova la \n svuota il buffer, lo stampa a schermo e continua con il programma, altrimenti fa tutto insieme senza svuotare il buffer e se trova segFault non stampa nulla del buffer 
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
   
}


// FUNZIONI
Element* insert(int n, Element* h){
    //printf("%d ", n);
    Element e = {n, h};
    h = &e;
    return h;
}
void printlist(Element* h){
    printf("%p ", h->next);
    while(h->next != NULL){
        printf("%d ", h->info);
        printlist(h->next);
    }
    //printf("%d\n", h->info);
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