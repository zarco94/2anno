#include <stdio.h>

int main(void){
    int x;
    int somma = 0;
    int i = 0;
    
    do{
        printf("n: ");
        scanf("%d", &x);

        if(x==0){
            continue;
        }
        else{
            somma += x;
            i++;
        }
    }while(i<10);

    printf("somma: %d", somma);
}