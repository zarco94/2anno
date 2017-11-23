#include <stdio.h>
#import <stdlib.h>

char *read_line(void);
char *read_word(void);


int main(void){
    //non posso allocare lo spazio esatto? perchè devo moltiplicare per 2???
    char *s;
    s = read_line();
    for(int i=0; s[i]!='\0'; i++){
        printf("%c", s[i]);
    }
}


char *read_line(void){
    int size = sizeof(char);
    int i=0;
    char c;
    char *p,*temp;

    p = malloc(size);
    

    while((c = getchar())!='\n'){
        if(i>=size){
            size*=2;
            temp = realloc(p, size);
            if(temp != NULL){
                p = temp;
            }
            else{
                printf("non c'è abbastanza spazio per la realloc\n");
            }
        }
        p[i] = c;
        i++;
    }
    p[i] = '\0';
    return p;
}
char *read_word(void){
    int size = sizeof(char);
    int i=0;
    char c;
    char *p,*temp;

    p = malloc(size);
    

    while(!isalpha(c = getchar())){
        if(i>=size){
            size*=2;
            temp = realloc(p, size);
            if(temp != NULL){
                p = temp;
            }
            else{
                printf("non c'è abbastanza spazio per la realloc\n");
            }
        }
        p[i] = c;
        i++;
    }
    p[i] = '\0';
    return p;
}