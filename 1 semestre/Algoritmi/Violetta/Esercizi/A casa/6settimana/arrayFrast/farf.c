#include <stdio.h>
#include <string.h>
#include <ctype.h>

int main(void){
    char c;
    while((c = getchar()) != EOF){
        //printf("c");
        switch(c){
            case 'a':
            case 'e':
            case 'i':
            case 'o':
            case 'u':
                 printf("%cf%c", c,c);
                 break;
            case 'A':
            case 'E':
            case 'I':
            case 'O':
            case 'U':
                 printf("%cf%c", c,tolower(c));
                 break;
            default:
                 printf("%c", c);
                 break; 
        }
    }
}
    