#include <stdio.h>

long fibonacci2(long x){
    if(x>0 && x<=2){
        return 1;
    }
    else if(x>2){
        return fibonacci2(x-1) +  fibonacci2(x-2);
    }
    else{
        printf("il numero deve essere > 0");
        return -100000;
    }
}

int main(void){
    long n;
    scanf("%ld", &n);

    printf("F%ld: %ld", n,fibonacci2(n));
}
