%{
#include<stdio.h>
int w = 0, s = 0, ws = 0, l =0;
%}
%option noyywrap
%%
"."|"?"|"!"         {s++;}
"\n"                {l++;}
" "                 {ws++;}
([a-zA-Z0-9]|"'")*  {w++;}
.                   {}
%%

int main(void){
    FILE *fp;
    fp = fopen("test.txt", "r");
    yyin = fp;
    yylex();
    printf("Count of words : %d\n",w);
    printf("Count of sentences : %d\n",s);
    printf("Count of white spaces : %d\n",ws);
    printf("Count of lines : %d\n", (w==0)? 0 : l+1);
    fclose(yyin);
    return 0;
}