%{
  #include<stdio.h>
  #include<stdlib.h>
  #include<ctype.h>
%}
%union {
 int num;
}

%token <num> NUMBER
%start calc
%type <num> calc
%type <num> expr
%%
  calc : expr ';' { printf("\nResult : %d",$1); }
       | calc expr ';' {  printf("\nResult : %d",$2);  }
       ;
  expr : expr '+' expr { $$ = $1 + $3; }
       | expr '-' expr { $$ = $1 - $3; }
       | expr '*' expr { $$ = $1 * $3; }
       | expr '/' expr { $$ = $1 / $3; }
       | '(' expr ')' { $$ = $2; }
       | NUMBER { $$ = $1; }
       ;
%%
int main() {
    yyparse();
    return 0;
}

int yyerror(const char *msg) {
    fprintf(stderr, "Syntax Error: %s\n", msg);
    return 1;
}

