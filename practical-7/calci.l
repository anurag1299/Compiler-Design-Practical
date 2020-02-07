%{
#include"y.tab.h"
#include<stdio.h>
void yyerror(char *);
%}

DIGIT [0-9]+\.?|[0-9]*\.[0-9]+

%option noyywrap

%%

[ ]
{DIGIT} { yylval=atof(yytext); return NUM;}
\n|. {return yytext[0];}

%%

