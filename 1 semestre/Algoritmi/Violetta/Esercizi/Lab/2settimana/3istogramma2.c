#include <stdio.h>
#include <ctype.h>

int main(void){
    char ch = ' ';
    int occorrenze[26] = {};

    while(ch != '.'){
        ch = getchar();
        ch = toupper(ch);
        occorrenze[ch - 'A']++;
    }

    for(int i=0; i<26; i++){
        if(occorrenze[i] != 0){
            printf("%c ", 'A'+i);
            for(int j=0; j<occorrenze[i]; j++){
                printf("-");
            }
            printf("\n");
        }
    }
}