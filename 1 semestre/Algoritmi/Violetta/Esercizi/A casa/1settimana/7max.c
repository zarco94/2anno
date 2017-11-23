#include <stdio.h>

int main(void){
    int a,b;

    //Immissione
    printf("a: ");
    scanf("%d", &a);
    printf("b: ");
    scanf("%d", &b);
    
    //Calcolo
    a>b ? printf("%d è il più grande", a) : printf("%d è il più grande", b);
}