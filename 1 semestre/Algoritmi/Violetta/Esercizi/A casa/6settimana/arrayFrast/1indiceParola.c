#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int smallest_word_index(char *s[], int n);

int main(void){
    char *dict[] = {"ciao", "mondo", "tutto", "bene", "?"};
    int lung = 5;
    int pos = smallest_word_index(dict, lung);
    printf("La parola minima si trova nella posizione: %d", pos);
}

int smallest_word_index(char *s[], int n){
    int pos = 0;
    for(int i=0; i<n; i++){
        if(strcmp(s[i],s[pos])<0){
            /*printf("i: %d\n", i);
            printf("strcmp: %d\n", strcmp(s[i],s[pos]));
            printf("%s \n", s[i] );
            printf("%s \n\n", s[pos] );
            pos = i;*/
    }
    return pos;
}