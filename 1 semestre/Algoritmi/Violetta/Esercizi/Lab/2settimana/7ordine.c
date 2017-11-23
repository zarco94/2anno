#include <stdio.h>

int main(void){
    int x;
    int arrayOrdinato[100] ={};
    //int controllo = 0; // controlla se è stato inserito il primo valore e mi serve per non entrare più in quel if
    //int controlloFor = 0;

    do{
        for(int i=0; i<=20; i++){
            printf("%d ", arrayOrdinato[i]);
        }
        printf("\nx: ");
        scanf("%d", &x);

        /*if(arrayOrdinato[0]==0 && controllo==0){
            arrayOrdinato[0] = x;
            controllo = 1;
        }*/


        for(int i=0; arrayOrdinato[i]!=0 || arrayOrdinato[0]==0; i++){
            //printf("%d\n", arrayOrdinato[0]);
            //printf("\nx:%d ord[%d]:%d \n",x,i,arrayOrdinato[i]);
            if(x>=arrayOrdinato[i] && (x<arrayOrdinato[i+1] || arrayOrdinato[i+1]==0)){
                for(int j=99; j>i; j--){
                    arrayOrdinato[j+1] = arrayOrdinato[j];
                }
                if(arrayOrdinato[0]==0){
                    arrayOrdinato[0] = x;
                }
                else{
                    arrayOrdinato[i+1] = x;
                }
                //printf("1\n");
                //controlloFor = 1;
            }
            /*else if(x>arrayOrdinato[i] && arrayOrdinato[i+1] ==0){
                arrayOrdinato[i+1] = x;
                //controlloFor = 1;
                printf("2\n");
            }*/
            
        }

    }while(x!=0);
    
    for(int i=0; arrayOrdinato[i]!=0; i++){
        printf("%d ", arrayOrdinato[i]);
    }
}