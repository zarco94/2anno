#include <stdio.h>

int main(void){
    long n;
    scanf(" %ld", &n);

    long fib[n-1];
    fib[0] = 1;
    fib[1] = 1;

    for(long i=2; i<n; i++){
        fib[i] = fib[i-1] + fib[i-2];
    }
    printf("F%ld: %s", n,fib[n-1]);
}