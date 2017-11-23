#include <stdio.h>

int main(void){
    typedef struct{
        char nome[50] ;
        char cognome[50];
    }Persona;

    typedef struct{
        Persona p;
        char numero[15];
    }Contatto;

    Contatto rubrica[100]={};
    for(int i=0; i<100; i++){
        
    }
    
    int selettore;
    int posizione = 0;

    do{
        printf("Inserire il numero del menu da aprire: \n");
        printf("\t0. mostra elenco contatti\n");
        printf("\t1. aggiungi contatto\n");
        printf("\t9. esci dalla rubrica\n");
        printf("\nmenu: ");
        scanf("%d", &selettore);
    
        switch(selettore){
            case 0:
                for(int i=0; i<posizione; i++){
                    printf("%d. %s %s\n", i,rubrica[i].p.nome,rubrica[i].p.cognome);
                    printf("\t%s\n", rubrica[i].numero);
                }
                break;
            case 1:
                printf("\nnome: ");
                scanf("%s", rubrica[posizione].p.nome);
                printf("cognome: ");
                scanf("%s", rubrica[posizione].p.cognome);
                printf("numero: ");
                scanf("%s", rubrica[posizione].numero);
                posizione++;
                break;   
        }
        printf("\n\n\n");

    }while(selettore != 9);

    


}