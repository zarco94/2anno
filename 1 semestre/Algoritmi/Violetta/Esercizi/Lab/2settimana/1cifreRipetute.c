#include <stdio.h>

int main(void){
    int n = 0;
    short int controllo = 0;
    int occorrenze[10] = {} ;

    scanf("%d", &n);

    //printf("%d\n",  214%10);
    //printf("%d\n",  214/10);
    
    while(n != 0){
        occorrenze[n%10]++;
        n = n/10;
    }

    for(int i=0; i<10; i++){
        //printf("occ[%d]= %d\n", i,occorrenze[i]);

        if(occorrenze[i] > 1){
            controllo = 1;
            printf("%d si ripete %d volte\n", i,occorrenze[i]);
        }
    }
    if(controllo == 0){
        printf("non si ripete nessuna cifra");
    }
    
}