#include <stdio.h>
#include <stdlib.h>

void *my_malloc(int b);

int main(void){
    //long spazio = 6000000000;
    long spazio = 6442450000;
    void *p;
    while(1){
        p = my_malloc(spazio); 
        printf("%ld\n", spazio);
        spazio += 1;
        free(p);
    }
}

void *my_malloc(int b){
    void *p;                            // che tipo dare?

    p=malloc(b);
    if(!p){
        printf("\nerrore durante l'allocazione dinamica\n");
        printf("%d", b);
        exit(EXIT_FAILURE);             // EXIT_FAILURE ???
    }
    else{
        return p;               
    }
}                                       // spazio dove viene allocato? Ram o ssd? perchè 6442450943 max?