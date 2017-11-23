#include <stdio.h>
#include <ctype.h>

int main(void){
    char ch = ' ';
    int occorrenzeA[26] = {};
    int occorrenzeB[26] = {};
    int verifica = 1;

    while(ch != ','){
        occorrenzeA[ch - 'A']++;
        ch = getchar();
        ch = toupper(ch);
    }

    /*for(int i=0; i<26;i++)
        printf("occ[%c] = %d\n", 'A'+i,occorrenzeA[i]);*/

    while(ch != '.'){
        occorrenzeB[ch - 'A']++;
        ch = getchar();
        ch = toupper(ch);
    }
    
    /*for(int i=0; i<26;i++)
        printf("occ[%c] = %d\n", 'A'+i,occorrenzeB[i]);*/

    for(int i=0; i<26; i++){
        if(occorrenzeA[i] != occorrenzeB[i]){
            verifica = 0;
            
        }
    }
    if(verifica == 1){
        printf("sono anagrammi");
    }
    else{
        printf("non sono anagrammi");
    }
}