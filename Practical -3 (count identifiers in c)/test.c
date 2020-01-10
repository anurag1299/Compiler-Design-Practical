#include<stdio.h>

int myfunction(int a,int b){
    int c = a+b;
    return c;
}

void main(){
    int a = 1;
    int b = 2;
    char ch;
    float f;
    double d;
    printf("%d",myfunction(a,b));
}
@