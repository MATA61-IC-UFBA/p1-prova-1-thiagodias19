%{
#include "prova1.tab.h"
#include <stdlib.h>
#include <string.h>
%}

%option noyywrap

%%

"//".*\n          { return EOL; }

[ \t]+            { }

\r?\n             { return EOL; }

"+"               { return PLUS; }
"-"               { return MINUS; }
"*"               { return TIMES; }
"/"               { return DIV; }
"="               { return ASSIGN; }
"("               { return LPAREN; }
")"               { return RPAREN; }
","               { return COMMA; }

"print"           { return PRINT; }
"concat"          { return CONCAT; }
"length"          { return LENGTH; }

[0-9]+            { return NUM; }

\"[^\"]*\"        { return STRING; }

[a-zA-Z_][a-zA-Z0-9_]* { return IDENT; }

. {  }

%%
