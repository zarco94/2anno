#include <stdio.h>
#include "libpsgraph.h"

void curvaKoch(int ordine, int lunghezza);
void fioccoKoch(int ordine, int lunghezza);

int main(void){
    int i,l,selettore;
    printf("ordine: ");
    scanf("%d", &i);
    printf("lunghezza: ");
    scanf("%d", &l);
    printf("0.curva 1.fiocco: ");
    scanf("%d", &selettore);

    switch(selettore){
        case 0:
            start("curvaKoch.ps");
            curvaKoch(i,l);
            end();
            break;
        case 1:
            start("fioccoKoch.ps");
            fioccoKoch(i,l);
            end();
    }
    
}

void curvaKoch(int ordine, int lunghezza){
    if(ordine == 0){
        draw(lunghezza);
    }
    else{
        curvaKoch(ordine-1,lunghezza/3);
        turn(-60);
        curvaKoch(ordine-1,lunghezza/3);
        turn(120);
        curvaKoch(ordine-1,lunghezza/3);
        turn(-60);
        curvaKoch(ordine-1,lunghezza/3); 
    }
}

void fioccoKoch(int ordine, int lunghezza){
    curvaKoch(ordine,lunghezza);
    turn(120);
    curvaKoch(ordine,lunghezza);
    turn(120);
    curvaKoch(ordine,lunghezza);
    
}