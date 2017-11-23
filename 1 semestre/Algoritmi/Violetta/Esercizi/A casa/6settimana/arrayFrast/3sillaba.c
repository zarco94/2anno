#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]){
    for(int i=0; argv[1][i]!='\0'; i++){
        
        if(i==0){
            printf("%c", argv[1][i]);
        }
        else if(argv[1][i]>=argv[1][i-1]){
            printf("%c", argv[1][i]);
        }
        else{
            printf("-%c", argv[1][i]);
        }
    }
}