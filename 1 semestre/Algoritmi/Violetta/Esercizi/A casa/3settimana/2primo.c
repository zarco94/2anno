#include <stdio.h>

int primo(int n);

int main(void){
    int n;
    scanf("%d", &n);

    if(primo(n) == 1){
        printf("è primo");
    }
    else{
        printf("NON è primo");
    }
}

int primo(int n){
    int boolean = 1; //1 vuol dire che è primo
    for(int i=2; i<n && boolean==1; i++){
        if(n%i == 0){
            boolean = 0; // 0 vuol dire che non è primo
        }
    }
    return boolean;    
}