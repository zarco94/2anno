#include <stdio.h>
#include <ctype.h>

int main(void){
    int k;
    char ch;
    
    printf("chiave: ");
    scanf("%d", &k);
    k %= 26;

    while((ch = getchar()) != '.'){
        if(islower(ch)){
            printf("%c", (((ch-'a')+k)%26)+'a');
        }
        else if(isupper(ch)){
            printf("%c", (((ch-'A')+k)%26)+'A');
        }
        else{
            printf("%c", ch);
        }
    }
}