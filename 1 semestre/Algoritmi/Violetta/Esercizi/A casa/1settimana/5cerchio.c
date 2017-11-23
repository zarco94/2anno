#include <stdio.h>
#include <math.h>

int main(void){
    float r, area;

    scanf("%f", &r);

    area = M_PI*r*r;

    printf("area: %f", area);
}