%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yylex();
void yyerror(const char *msg);
%}

%union {
    int ival;
    char *sval;
}

%token <ival> NUM
%token <sval> IDENT STRING
%token PLUS MINUS TIMES DIV ASSIGN
%token LPAREN RPAREN COMMA EOL
%token PRINT CONCAT LENGTH
%token ERROR

%left PLUS MINUS
%left TIMES DIV

%start program

%%

program
    : stmt_list
    ;

stmt_list
    : stmt EOL

    | stmt_list stmt EOL
    | stmt_list EOL
    ;

stmt
    : IDENT ASSIGN expr

    | PRINT LPAREN expr RPAREN
    | expr
    ;

expr:
      expr PLUS expr

    | expr MINUS expr
    | expr TIMES expr
    | expr DIV expr

    | LPAREN expr RPAREN
    | CONCAT LPAREN concat_list RPAREN 
    | LENGTH LPAREN expr RPAREN

    | NUM
    | STRING
    | IDENT
    ;

concat_list
    : expr
    | concat_list COMMA expr
    ;

%%
