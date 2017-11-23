#include <stdio.h>

int contatore=0;
int fibonacci(int x);

int main(void){
    int x;
    scanf("%d", &x);

    printf("%d \n", fibonacci(x));
    printf("numero di risocrsioni: %d ", contatore);
}

int fibonacci(int x){
    contatore++;
    if(x<=2){
        return 1;
    }
    else{
        return fibonacci(x-1) + fibonacci(x-2);
    }
}