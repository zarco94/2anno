#include <stdio.h>

int main(void){
    int x;
    int i = 0;
    int divisore = 0;

    printf("x: ");
    scanf("%d", &x);
    printf("0");

    while(i<10){
        printf("1");
        divisore = 0;
        if(x%divisore == 0){
            printf("2");
            printf("%d", x/divisore);
            i++;
        }
        divisore += 1;    
    }
}