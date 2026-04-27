%{
#include <stdio.h>
#include <stdlib.h>

extern int yylex();
void yyerror(const char *msg);
%}

%union {
    int ival;
    char *sval;
}

%token NUM IDENT STRING
%token PLUS MINUS TIMES DIV ASSIGN
%token LPAREN RPAREN COMMA EOL
%token PRINT CONCAT LENGTH

%start program

%%

program
    : stmt_list
    ;

stmt_list
    : /* vazio */
    | stmt_list stmt EOL
    | stmt_list EOL
    | stmt
    ;

stmt
    : IDENT ASSIGN expr
    | PRINT LPAREN print_list RPAREN
    | expr
    ;

expr
    : expr PLUS term
    | expr MINUS term
    | term
    ;

term
    : term TIMES factor
    | term DIV factor
    | factor
    ;

factor
    : LPAREN expr RPAREN
    | CONCAT LPAREN concat_list RPAREN
    | LENGTH LPAREN expr RPAREN
    | NUM
    | STRING
    | IDENT
    ;

print_list
    : expr
    | print_list COMMA expr
    ;

concat_list
    : expr
    | concat_list COMMA expr
    ;

%%
