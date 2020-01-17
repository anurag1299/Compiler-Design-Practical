%{
#include<stdio.h>
int id = 0, flag =0, paramFlag = 0;
int yylex(void); 
int k=0;   
%}
TYPE  auto|break|case|const|continue|default|do|else|enum|extern|for|goto|if|long|register|return|short|signed|sizeof|static|struct|switch|typedef|union|unsigned|volatile|while
%%

"int"|"float"|"char"|"double"|"void"    {flag=1;k++; printf("%s",yytext);}
{TYPE}									{k++; printf("%s",yytext);}
";"                                     {flag=0; printf("%s",yytext);}
"="                                     {if(flag!=0) {flag=0;} printf("%s",yytext);}
"("                                     {paramFlag = 1; printf("%s",yytext);}
")"                                     {paramFlag = 0; printf("%s",yytext);}
","                                     {if(paramFlag!=0){flag=0;} printf("%s",yytext);}
[_a-zA-Z][_a-zA-Z0-9]*                  {if(flag!=0)id++;printf("%s",yytext);}
@                                       return 0;

%%


int main(void){
    FILE *fp;
    fp = fopen("test.c", "r");
    yyin=fp;
    yylex();
    printf("Count of Identifiers: %d\n",id);
    printf("Count of Keywords is: %d\n",k);
    fclose(yyin);
    return 0;
}
int yywrap(void){
    return 0;
}
int yyerror(void){
    printf("ERROR");
    return 1;
}