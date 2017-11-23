#include <stdio.h>

void scambia( int *p, int *q );

int main(void){
    int a,b;
    scanf("%d %d", &a,&b);
    printf("a: %d\tb: %d\n", a,b);
    scambia(&a,&b);
    printf("SCAMBIO\na: %d\tb: %d", a,b);
}

void scambia( int *p, int *q ){
    int temp;
    temp = *p;
    *p = *q;
    *q = temp;
}