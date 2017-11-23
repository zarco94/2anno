#include <stdio.h>

int main(void){
    int x;
    int arrayOrdinato[100] = {};
    int posizione = 0;
    int contatore = 0;
    int controllo = 0;

    do{
        for(int k=0; k<20; k++){
            printf("%d ", arrayOrdinato[k]);
        }

        printf("\nx: ");
        scanf("%d",&x);
        contatore++;
        controllo = 0;

        for(int i=0; i<contatore && controllo!=1; i++){
            //printf("%d", arrayOrdinato[0]);
            
            if((x>arrayOrdinato[i] && x<=arrayOrdinato[i+1]) || x<arrayOrdinato[0]){
                //printf("1");
                for(int j=98; j>=i; j--){
                    //printf("j:%d i:%d\n",j,i);
                    /*for(int i=0; i<20; i++){
                        printf("%d ", arrayOrdinato[i]);
                    }*/
                    //printf("\n");
                    arrayOrdinato[j+1] = arrayOrdinato[j];
                }
                posizione = i;
                controllo = 1;
            }
            
            else{
                posizione = i+1;
            }
            
            
        }
        printf("pos:%d\n",posizione);
        if(arrayOrdinato[0]==0){
            arrayOrdinato[0]=x;
        }
        else{

            arrayOrdinato[posizione] = x;
        }
    }while(x!=0);

    for(int i=0; arrayOrdinato[i]!=0; i++){
        printf("\n\n\n%d ", arrayOrdinato[i]);
    }
}