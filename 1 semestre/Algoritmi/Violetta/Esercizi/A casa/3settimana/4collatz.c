#include <stdio.h>

int collanzNext(int x);

int main(void){
    int x;
    scanf("%d", &x);

    while(x != 1){
        printf("%d ", x);
        x  = collanzNext(x);
    }
    printf("%d",x);
}

int collanzNext(int x){
    if(x%2 == 0){
        return x / 2;
    }
    else{
        return (x*3)+1;
    }
}