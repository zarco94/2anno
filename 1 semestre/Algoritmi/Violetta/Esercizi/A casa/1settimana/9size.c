#include <stdio.h>

int main(void){
    int i;
    short int si;
    long int li;

    float f;
    double d;
    long double ld;

    char c;

    printf("\nshort int  : %lu\n", sizeof(si)); 
    printf("int        : %lu\n", sizeof(i));               
    printf("long int   : %lu\n\n", sizeof(li));
    printf("float      : %lu\n", sizeof(f));
    printf("double     : %lu\n", sizeof(d));
    printf("long double: %lu\n\n", sizeof(ld));
    printf("char       : %lu\n", sizeof(c));

}