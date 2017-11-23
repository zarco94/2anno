#include <stdio.h>

int main(void){
    int r, c;
    int k;

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

    printf("\n\nINIZIALE\n");
    for(int i=0; i<r; i++){
        for(int j=0; j<c; j++){
            printf("%c ", matrice[i][j]);
        }
        printf("\n");
    }
    printf("\n");

    for(int j=0; j<c; j++){
        k = r-1;
        for(int i=r; i>=0; i--){
            if(matrice[i][j]=='*'){
                //printf("%d", k);

                for(;matrice[k][j]=='*' && k>=0; k--){
                    //printf("%d: %d\n", j,k);

                }
                if(k>=0 && k<i){
                    printf("%d: k%d i%d\n", j,k,i);
                    matrice[i][j] = matrice[k][j];
                    matrice[k][j] = '*';    
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