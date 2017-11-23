#include <stdio.h>
#include <stdlib.h>

void stampa(int a[], int lung);
void scambia(int a[], int i, int j);
void selectionsort( int a[], int n );
void mergesort1( int a[], int sx, int dx );
void merge(int a[], int n, int mezzo);

int main(void){
    int arr[100];
    int i=-1;
    do{
        i++;
        scanf("%d", &arr[i]);
    }while(arr[i]!=0);

    stampa(arr,i);
    printf("\nSelectionSort\n\n");
    selectionsort(arr,i);
    stampa(arr,i);
    printf("\n");

    printf("\nMergeSort\n\n");
    mergesort1(arr,0,i);
    stampa(arr,i);
    printf("\n");

}

void stampa(int a[], int lung){
    for(int i=0; i<lung; i++){
        printf("%d ",a[i]);
    }
}
void scambia(int a[], int i, int j){
    int temp;
    temp = a[i];
    a[i] = a[j];
    a[j] = temp;
}
void selectionsort( int a[], int n ){
    int temp;
    int max;
    int pos;

    if(n>1){
        max = a[0];
        pos = 0;
        /*printf("prima del for\n");
        stampa(a,n);
        printf("\n");*/
        for(int i=0; i<n; i++){
            if(a[i]>max){
                max = a[i];
                pos = i;
            }   
        }
        temp = a[n-1];
        a[n-1] = a[pos];
        a[pos] = temp;

        /*printf("dopo for\n");
        stampa(a,n);
        printf("\n");*/
        selectionsort(a,n-1);
    }

    
}
void mergesort1( int a[], int sx, int dx ){

    int n = (sx+dx)/2;

    if((dx-sx)>1){
        //printf("nsx: %d\n", n);
        mergesort1(a, sx, n);
        //printf("ndx: %d\n", n);
        mergesort1(a, n+1, dx);
        //printf("prima del merge");
        merge(a, dx, n);
    }
    
    
}
void merge(int a[], int n, int mezzo){
    int i=0;
    int j=mezzo;
    int k=0;
    int p[n];

    while(i<mezzo && j<=n){
        if(a[i]<a[j]){
            p[k] = a[i];
            i++;
        }
        else{
            p[k] = a[j];
            j++;
        }
    }
    
    if(i<mezzo){
        while(i<mezzo){
            p[k] = a[i];
            i++;
        }
    }
    else{
        while(j<=n){
            p[k] = a[j];
            j++;
        }
    }
}