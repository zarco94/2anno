#include <stdio.h>
#include <stdlib.h>

int main(void){
    int *p, *temp;
    int n;
    int i=0;
    int size = sizeof(int);

    p = malloc(size);

    do{
        scanf("%d", &n);
        p[i] = n;
        i++;


        /*for(int j=0; j<size/sizeof(int); j++){     //come faccio ad ottenere l'ultimo valore allocato??
            printf("%d ", p[j]);
        }*/
        printf("\n");

        if(i>=size/sizeof(int)){             //è giusto? o c'è un modo migliore?
            size *= 2;
            temp = realloc(p, size);       //i*sizeof(int)  mi dava segmentation fault???
            if(p){
                p = temp;
            }
            else{
                printf("puntatore nullo");
            }
        }  
        
    }while(n != 0);



    for(int j=0; p[j]!=0; j++){
        printf("%d ", p[j]);
    }
    printf("\n");

    for(int k=i-2; k>=0; k--){
        printf("%d ",p[k]);
    }
    
    
}