#include <stdio.h>
#include <math.h>

int main(void){
    int base;
    int numeroBaseB;
    int numeroBase10 = 0;
    int esp = 0;
    
    printf("inserire base 'spazio' numero da convertire: ");
    scanf("%d %d", &base,&numeroBaseB);

    while(numeroBaseB != 0){
        numeroBase10 += numeroBaseB%10 * pow(base, esp);
        numeroBaseB = numeroBaseB/10;
        esp++; 
    }


    printf("%d", numeroBase10);
}