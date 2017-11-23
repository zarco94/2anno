#include <stdio.h>
#include <stdlib.h>

void *my_malloc(int b);

int main(void){
    int spazio;
    scanf("%d", &spazio);
    my_malloc(spazio);
}

void *my_malloc(int b){
    void *p;                            // che tipo dare?

    p=malloc(b);
    if(!p){
        printf("\nerrore durante l'allocazione dinamica\n");
        exit(EXIT_FAILURE);             // EXIT_FAILURE ???
    }
    else{
        return p;               
    }
}                                       // spazio dove viene allocato? Ram o ssd? perchè 6000000000 max?