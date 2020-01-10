%{
#include<stdio.h>
int id = 0, flag =0, paramFlag = 0;
int yylex(void);    
%}
%%

"int"|"float"|"char"|"double"|"void" {flag=1; printf("%s",yytext);}
";"                              {flag=0; printf("%s",yytext);}
"="                                {if(flag!=0) {flag=0;} printf("%s",yytext);}
"("                              {paramFlag = 1; printf("%s",yytext);}
")"                               {paramFlag = 0; printf("%s",yytext);}
","                                {if(paramFlag!=0){flag=0;} printf("%s",yytext);}
[_a-zA-Z][_a-zA-Z0-9]*        {if(flag!=0)id++;printf("%s",yytext);}
@                             return 0;

%%


int main(void){
    FILE *fp;
    fp = fopen("test.c", "r");
    yyin=fp;
    yylex();
    printf("Count of Identifiers: %d\n",id);
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