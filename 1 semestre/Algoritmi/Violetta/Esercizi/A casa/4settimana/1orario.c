#include <stdio.h>

void split_time ( long int tot_sec, int *h, int *m, int *s );

int main(void){
    int h,m,s,tot_sec;
    scanf("%d", &tot_sec);
    split_time(tot_sec, &h, &m, &s);
    printf("%d sono %d h %d m %d s\n", tot_sec,h,m,s);
}

void split_time ( long int tot_sec, int *h, int *m, int *s ){
    *h = tot_sec/3600;
    *m = (tot_sec-(*h * 3600))/60;
    *s = tot_sec-(*h * 3600) -(*m * 60);
}