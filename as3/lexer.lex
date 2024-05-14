%{
  #include"y.tab.h"
  void yyerror (char *s);
  int yylex();
%}
%option noyywrap



%%

"int"|"float"|"char"|"double"|"short int"|"unsigned int"|"long int"|"long long int" { return TYPE; }
[a-zA-Z][a-zA-Z0-9]* { return ID; }
";" { return SEMI_COLON; }
"," { return COMMA; }
[ \t\n]     ; // Skip whitespace
.       { yyerror("Invalid character"); }
%%

