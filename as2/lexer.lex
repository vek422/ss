%{
  #include<stdio.h>
%}
%option noyywrap

%%


"return" { printf("\nReturn Statement"); }
"#include<"[a-zA-Z]+".h>" { printf("%s is header file declaration\n",yytext); }
"#"[a-zA-Z]+ { printf("%s is preprocessor",yytext); }
","|";"|"("|")"|"<"|">"|"{"|"}" { printf("%s is puctuation\n",yytext); }
"//".*"\n" { printf("%s is Single line comment",yytext); }
"int"|"float"|"char"|"bool" { printf("%s is Type Definition\n",yytext); }
"if"|"else"|"do"|"while"|"for"|"goto"  { printf("%s is Flow Control Statement\n",yytext); } 
"/""*"(.|\n)*"*""/" { printf("Multiline Comment\n"); }
[a-zA-Z0-9_]* { printf("%s doesnt match with any reservered keyword in subset of c\n",yytext); }



%%

int main(){
  yyin = fopen("sample.txt","r");
  yylex();
  return 0;
}

