%require "3.2"
%code top {
    int yylex (void);
    void yyerror (char const *);
}
%code requires {
    #include <string>
    #include "node.h"
}

%union {
    int num;
    char * var;
    node * expr;
}

%token <num> NUMBER
%token <var> VAR
%left LPAREN RPAREN
%type <expr> EXPR

%%
EXPR: LPAREN EXPR RPAREN  {
          $$ = $2; }      
    |   NUMBER {
        $$ = new number_node($1);}
    |   VAR{
        $$ = new var_node($1);}
%%

int main(){
    yyparse();
    return 0;
}

void yyerror(const char* s)
{
  fprintf (stderr, "%s\n", s);
}
