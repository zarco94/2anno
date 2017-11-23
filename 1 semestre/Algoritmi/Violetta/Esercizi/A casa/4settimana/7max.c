#include <stdio.h>

void max_secondmax ( int a[], int n, int *max, int *second_max );

int main(void){
    int a,b;
    int max, second_max;
    scanf("%d %d", a,b);
    max_secondmax()
    printf("max: %d", max,second_max);

}

void max_secondmax ( int a[], int n, int *max, int *second_max ){
    *max = 0;
    *second_max = 0;

    for(int i=0; i<n; i++){
        if(a[i]>*max){
            *max = a[i];
        }
        else if(a[i]>*second_max){
            *second_max = a[i];
        }
    }
}