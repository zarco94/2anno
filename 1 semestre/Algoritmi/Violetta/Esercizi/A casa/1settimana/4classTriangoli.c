#include <stdio.h>

int main(void){
    int a,b,c;
    
    printf("l1: ");
    scanf("%d",&a);    
    printf("l2: ");
    scanf("%d",&b);
    printf("l3: ");
    scanf("%d",&c);

    if(a<b+c && b<a+c && c<a+b){
        if(a==b && b==c){
            printf("è un TRIANGOLO EQUILATERO\n");
        }
        else if(a==b || a==c || c==b){
            printf("è un TRIANGOLO ISOSCELE\n");
        }
        else{
            printf("è un TRIANGOLO SCALENO\n");
        }
    }
    else{
        printf("NON è un triangolo\n");
    }
}