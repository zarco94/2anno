#include <stdio.h>
#include <ctype.h>

int main(void){
    char c;

    scanf("%c", &c);
    c = tolower(c);
    printf("%d\n", c);

    if(c=='a' || c=='e' || c=='i' || c=='o' || c=='u'){
        printf("%c è una VOCALE", c);
    }else if(c>'a' && c<='z'){
        printf("%c è una CONSONANTE", c);
    }else{
        printf("%c non è una lettera", c);
    }
}