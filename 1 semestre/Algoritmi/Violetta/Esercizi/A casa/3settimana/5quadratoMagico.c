#include <stdio.h>

void quadratoMaGGico(int x);

int main(void){
    //printf("%d", (-2)%3);
    //printf("%d",-2147483645%4);
    //int m[2][3] = {{0}};

    int x;
    scanf("%d",&x);
    quadratoMaGGico(x);
    
}

void quadratoMaGGico(int x){
    // x deve essere dispari
    int matrice[x][x];
    int num = 1;
    int posR;
    int posC;

    for(int r=0; r<x; r++){
        for(int c=0; c<x; c++){
            matrice[r][c] = 0;
        }
    }
    
    matrice[0][x/2] = num;
    posC = (x/2);

    while(num != x*x){
    
        if(matrice[(posR-1+x)%x][(posC+1)%x] == 0){
            num ++;
            matrice[(posR-1+x)%x][(posC+1)%x] = num; 
            posR = (posR-1+x)%x;
            posC = (posC+1)%x;
        }
        else{
            num ++;
            matrice[posR+1][posC] = num;
            posR = posR+1;
        }
    }

    for(int r=0; r<x; r++){
        for(int c=0; c<x; c++){
            printf("%d\t",matrice[r][c]);
        }
        printf("\n");
    }
}