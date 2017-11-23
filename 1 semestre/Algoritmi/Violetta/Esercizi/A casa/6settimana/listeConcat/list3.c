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
Element* delete1(int n, Element* h);
void destroy(Element* h);
int* listToArray(Element* h, int n);
void printInv(Element* h);


// MAIN
int main(void){
    char c;
    int n;
    Element *head = NULL;

    while((c=getchar())!='f'){      
        switch(c){
            case '+':
                scanf("%d", &n);
                if(head != NULL && isMember(n,head)==1){
                    printf("%d fa già parte della lista\n", n);
                }
                else{
                    head = insert(n, head);
                }
                break;
            case '-':
                scanf("%d", &n);
                if(isMember(n,head)==0){
                    printf("%d non fa parte della lista\n", n);
                }
                else{
                    head = delete1(n, head);
                }
                break;
            case '?':
                scanf("%d", &n);
                if(isMember(n, head)==1){
                    printf("%d è membro della lista\n", n);
                }
                else{
                    printf("%d NON è membro della lista\n", n);
                }
                
                break;
            case 'c':
                break;
            case 'p':
                printlist(head);
                printf("\n");
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
    Element *e = malloc(sizeof(Element));
    e -> info = n;
    e -> next = h ;
    h=e;
    return h;
}
void printlist(Element* h){
    if(h->next == NULL){
        printf("%d ",h->info);
    }
    else{
        printf("%d ",h->info);
        printlist(h->next);
    }
    
}
int isMember(int n, Element* h){
    Element *p;
    
    for(p=h; p->next!=NULL; p=p->next){
        if(p->info == n){
            return 1;
        }
    }
    return 0;
}
Element* delete1(int n, Element* h){
    Element *cur; 
    Element *prev;
    for(cur=h, prev=NULL; cur!=NULL && cur->info!=n; prev=cur, cur=cur->next);
    if(cur==NULL){
        return h;
    }
    if(prev==NULL){
        h=h->next;  
    }
    else{
        prev->next = cur->next;
    }
    free(cur);
    return h;
}
void destroy(Element* h){

}
int* listToArray(Element* h, int n){
    return 0;
}
void printInv(Element* h){
    
}