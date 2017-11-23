#include <stdio.h>

int main(void){
    int r, rTemp, c;
    int verifica;

    printf("r: ");
    scanf("%d", &r);
    printf("c: ");
    scanf("%d", &c);

    char matrice[r][c];

    for(int i=0; i<r; i++){
        for(int j=0; j<c; j++){
            printf("M(%d,%d)= ", i,j);
            scanf(" %c", &matrice[i][j]);
        }
    }

    printf("\n");
    for(int i=0; i<r; i++){
        for(int j=0; j<c; j++){
            printf("%c ", matrice[i][j]);
        }
        printf("\n\n\n");
    }

    for(int j=0; j<c; j++){
        verifica = 0;
        for(int i=r-1; i>=0; i--){
            if(matrice[i][j] != '*'){
                rTemp = r;
                while(verifica == 0){
                    if(matrice[rTemp][j] == '*'){
                        matrice[rTemp][j] = matrice[i][j];
                        matrice[i][j] = '*';
                        verifica = 1;
                    }
                    else{
                        rTemp--;
                    }

                    printf("\n(%d,%d)\n", i,j);
                    for(int i=0; i<r; i++){
                        for(int j=0; j<c; j++){
                            printf("%c ", matrice[i][j]);
                        }
                        printf("\n");
                    }
                }
                
            }
        }
    }

    printf("\n\nFINALE\n");
    for(int i=0; i<r; i++){
        for(int j=0; j<c; j++){
            printf("%c ", matrice[i][j]);
        }
        printf("\n");
    }


}