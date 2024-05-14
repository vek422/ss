%{
  #include<stdio.h>
  void yyerror (char *s);
  int yylex();
%}

%token TYPE ID  COMMA SEMI_COLON
%start program


%%
program : program declaration
        | declaration
        ;

declaration : TYPE identifier SEMI_COLON { printf("\nValid Syntax of Variable declaration\n"); }
            ; 

identifier : ID {;}
           | identifier COMMA identifier  {;}
           ;
%%


int main(){
  yyparse();
  return 0;
}


void yyerror (char *s) {fprintf (stderr, "%s\n", s);} 
