%{
#include <iostream>
#include <fstream>
#include <string>
#include "grammar.tab.h"

std::ofstream myfile ("lexer_out.txt");
%}

whitespace          [ \t]+
opening_Parenthesis "("
closing_Parenthesis ")"


/*when bison files finishes updethem to token*/
/*Testing lambda to figure out why greek one matches twice*/
%%
{opening_Parenthesis}             {return LPAREN;}
{closing_Parenthesis}             {return RPAREN;}
[a-zA-Z]+                         {yylval.var = yytext; return VAR;}
[0-9]+                            {yylval.num = atof(yytext); return NUMBER;}
{whitespace}                      {};
.                                 {std::cout<<yytext<<" unmatched string"<<std::endl;}
%%

int yywrap() {return 0;}

// int main(int argc, char* argv[]){
//
//    FILE *fp;
//    fp = fopen("test.txt","r");
//    yyin = fp;
//    yylex();
//    fclose(fp);
//    myfile.close();
//    return 0;
// }
