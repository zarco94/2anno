//Scrivete un programma che legga due lettere maiuscole e stampi la loro distanza nell’ordine alfabetico. Ad esempio, su ingresso A C, il programma deve stampare 3, su ingresso F B, il programma deve stampare 5. Ricordate che i caratteri (char) in C sono rappresentati come (piccoli) interi e osservate che, secondo la codifica ASCII, non c’è soluzione di continuità e non ci sono altri caratteri tra la A e la Z (cosa di cui potete convincervi con il comando man ascii).


#include <stdio.h>
#include <ctype.h>

int main(void){
    char a,b;

    printf("a: ");
    scanf(" %c", &a);
    printf("b: ");
    scanf(" %c", &b);
    //printf("B::%d\n", a);

    a = toupper(a);
    b = toupper(b);
    
    //printf("%c",a);
    printf("\n%c: %d\n", a,a);
    printf("%c: %d\n\n", b,b);

    if(a>=b){
        printf("Distanza: %d", a-b);
    }
    else{
        printf("distanza: %d", b-a);
    }
}