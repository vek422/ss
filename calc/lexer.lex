%{
  #include"y.tab.h"
  void yyerror(char*s);

%}

%option noyywrap

%%
[0-9]* { yylval.num = atoi(yytext); return NUMBER; }
[-+/*;] { return yytext[0]; }
[ \t\n] { }
. { ECHO; yyerror("unexpected characters"); }
%%
