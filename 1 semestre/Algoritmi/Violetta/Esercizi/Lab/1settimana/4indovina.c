#include <stdio.h>

int main(void){
    char rispUtente;
    int valutazione;
    int estremoSup = 1000;
    int estremoInf = 0;

    

    printf("Scegliere un numero da 0 a 1000\n\n");
    do{
        valutazione = (estremoSup+estremoInf)/2;

        printf("il numero è %d: ", valutazione);
        scanf(" %c", &rispUtente);
 
        if(rispUtente == '<'){
            estremoSup = valutazione - 1;
        }
        else if(rispUtente == '>'){
            estremoInf = valutazione + 1;
        }
    }while(rispUtente != '=');
}