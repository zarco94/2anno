// devo spostare gli n-1 dischi da from a temp, poi sposto l'n-esimo disco a to. Quindi sposto tutti gli n-1 da temp a to
//blind delegation
#include <stdio.h>

int nMosse = 0;
void hanoi(int n, int from, int temp, int to);

int main(void){
    int n;
    scanf("%d",&n);
    hanoi(n,1,2,3);
    printf("\n%d\n",nMosse);
}

void hanoi(int n, int from, int temp, int to){
    
    if(n==1){
        printf("%d->%d\n", from,to);
        nMosse++;
        return;
    }

    hanoi(n-1,from,to,temp);
    printf("%d->%d\n", from,to);
    nMosse++;
    hanoi(n-1,temp,from,to);
  
}