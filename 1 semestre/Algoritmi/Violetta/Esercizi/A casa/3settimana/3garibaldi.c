#include <stdio.h>

char sostituisci(int sostituto, int daSostituire);

int main(void){
    char ch;
    char sostituto = getchar();
    int spazio = 0;

    while((ch = getchar())!='.'){
        if(spazio == 1){
            printf("%c", sostituisci(sostituto, ch));
        }
        if(ch == ' '){
            spazio = 1;
        }
        
        
    }
}

char sostituisci(int sostituto, int daSostituire){
    if(daSostituire == 'a' || daSostituire == 'e' || daSostituire == 'i' || daSostituire == 'o' || daSostituire == 'u'){
        return sostituto;
    }
    else{
        return daSostituire;
    }
}