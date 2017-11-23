#include <stdio.h>
#include <ctype.h>

char *maiuscolo(char *stringa);

int main(void){
    char s[100];

    int i=0;
    
    /*for(int i=0; *(s+i)!='\0'; i++){
        *(s+i) = getchar();
        lunghezza++;
    }*/
    
    do{
        *(s+i) = getchar();  
        //printf("%c", *(s+i));
        i++;
    }while(*(s+i-1)!='\n');

    //printf("uscito\n");
    maiuscolo(s);

    /*for(int i=0; *(s+i)!='\0' ; i++){
        printf("%c", *(s+i));
    }*/
    
    printf("%s", s);

}

char *maiuscolo(char *stringa){
    char *p;
    for(p = stringa; *p!='\0'; p++){                       //100    *p!='\0'    p<stringa+100
        *p = toupper(*p);
    }
    return stringa;
}