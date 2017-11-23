#include <stdio.h>

int lungh_stringa(char *s);

int main(void){
    char stringa[100];
    scanf("%s", stringa);
    printf("%d", lungh_stringa(stringa));
}

int lungh_stringa(char *s){
    int i=0;
    int lunghezza=0;

    do{
        lunghezza++;
        i++;
    }while(*(s+i-1)!='\0');

    return lunghezza-1;
}