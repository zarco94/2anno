#include <stdio.h>
#include <ctype.h>

int main(void){
    int k;
    char ch;
    FILE *fp;
    
    printf("chiave: ");
    scanf("%d", &k);
    k %= 26;

    fp = fopen(percorso, "r");
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