%{
    #include <string>

    using namespace std;

    class node {};

    class number_node : public node{
        public:
            int number;
            number_node(int num){
                number = num;
            }                 
    };

    class var_node : public node{
        public:
            string var;
            var_node(string temp_var){
                var = temp_var;
            }            
    };

    int yylex();
    void yyerror(const char* s);

%}

%union {
    int num;
    char *var;
    node *nodes;
}

%token <num> NUMBER
%token <var> VAR
%left LPAREN RPAREN
%type <nodes> nodes

%%
nodes: LPAREN nodes RPAREN  {
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