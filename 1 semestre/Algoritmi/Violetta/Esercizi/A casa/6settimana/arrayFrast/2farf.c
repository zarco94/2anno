#include <stdio.h>
#include <string.h>
#include <ctype.h>

int main(int argc, char *argv[]){
    for(int i=1; i<argc; i++){
        for(int j=0; j<strlen(argv[i]); j++){
           switch(argv[i][j]){
               case 'a':
               case 'e':
               case 'i':
               case 'o':
               case 'u':
                    printf("%cf%c", argv[i][j],argv[i][j]);
                    break;
               case 'A':
               case 'E':
               case 'I':
               case 'O':
               case 'U':
                    printf("%cf%c", argv[i][j],tolower(argv[i][j]));
                    break;
               default:
                    printf("%c", argv[i][j]); 
           }
        }
        printf(" ");
    }
}