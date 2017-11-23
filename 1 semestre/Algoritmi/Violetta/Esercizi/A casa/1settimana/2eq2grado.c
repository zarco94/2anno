#include <stdio.h>
#include <math.h>

int main(void){
    int a,b,c;
    float x1, x2;

    //INSERIMENTO
    printf("a: ");
    scanf("%d",&a);
    printf("%dx^2 + bx+ c \n\n",a);
    printf("b: ");
    scanf("%d",&b);
    printf("%dx^2 + %dx + c\n\n",a,b);
    printf("c: ");
    scanf("%d",&c);
    printf("%dx^2 + %dx + %d\n\n\n",a,b,c);

    //CALCOLO
    x1 = (-b + sqrt(b*b - 4*a*c)) / (2*a);
    x2 = (-b - sqrt(b*b - 4*a*c)) / (2*a);

    printf("x1: %f\n", x1);
    printf("x2: %f\n", x2);
}
