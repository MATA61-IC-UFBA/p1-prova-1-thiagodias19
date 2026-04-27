%{
#include "prova1.tab.h"
#include <stdlib.h>
#include <string.h>

void yyerror(const char *msg);
%}

%option noyywrap

%%

[ \t\r]+        {  }

"\\"            { int c; while((c=input()) != '\n' && c != EOF); } 

\n              { return EOL; }

"+"             { return PLUS; }
"-"             { return MINUS; }
"*"             { return TIMES; }
"/"             { return DIV; }
"="             { return ASSIGN; }
"("             { return LPAREN; }
")"             { return RPAREN; }
","             { return COMMA; }

"print"         { return PRINT; }
"concat"        { return CONCAT; }
"length"        { return LENGTH; }

[0-9]+          { yylval.ival = atoi(yytext); return NUM; }
\"[^\"]*\"      { yylval.sval = strdup(yytext); return STRING; }
[a-zA-Z_][a-zA-Z0-9_]* { yylval.sval = strdup(yytext); return IDENT; }

.               { return ERROR; }

%%
