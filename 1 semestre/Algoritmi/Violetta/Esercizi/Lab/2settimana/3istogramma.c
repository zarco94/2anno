#include <stdio.h>
#include <ctype.h>

#define N 100

int main(void){
    char stringa[N];
    int occorrenze[26] = {};
        

    scanf("%s", stringa);
    printf("%s\n", stringa);
    for(int i=0; stringa[i]!='\0'; i++){
        stringa[i] = toupper(stringa[i]);
        //printf("sto esaminando <%c>\n", stringa[i]);
        occorrenze[stringa[i]-'A'] ++;
    }

    for(int i=0; i<26; i++){
        if(occorrenze[i] != 0){
            printf("%c", 'A'+i);
            for(int j=0; j<occorrenze[i]; j++){
                printf("*");
            }
            printf("\n");
        }
    }
}