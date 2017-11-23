#include <stdio.h>

void hanoi(int n, int from, int temp, int to);

int main(void){
    int n;

    printf("n: ");
    scanf("%d", &n);
    hanoi(n,0,1,2);
}

void hanoi(int nFrom, int from, int temp, int to){
    int nTemp=0;
    int nTo=0; //

    if(nFrom!=0){
        hanoi(nFrom-1,from,to,temp);
        printf("%d -> %d\n", from,to);
        //nFrom--;
        nTemp++;
    }
    else if(nTemp!=0){
        hanoi(nTemp-1, temp,from,to);
        printf("%d -> %d\n", temp,to);
        //nTemp--;
        nTo++;
    }
    /*else if(nTo!=0){
        hanoi(nTo-1, to,from,temp);
        printf("%d -> %d\n", temp,to);
        nTemp--;
        nFrom++;
    }*/
}