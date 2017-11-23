#include <stdio.h>

int main(void){
    int x;
    int somma = 0;
    int i=0;

    do{
        printf("n: ");
        scanf("%d", &x);
        somma += x; 
        i++;
    }while(x!=0);
    printf("media: %d", somma/(i-1));
}