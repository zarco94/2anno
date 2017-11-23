#include <stdio.h>

int main(void){
    int x;
    int somma = 0;
    do{
        printf("n: ");
        scanf("%d", &x);
        somma += x; 
    }while(x!=0);
    printf("somma: %d", somma);
}