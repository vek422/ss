%{
  #include<stdio.h>
  int cnt_line = 0;
  int cnt_word = 0;
  int cnt_char = 0;
%}
%option noyywrap

%%
[\n] { cnt_line++; cnt_char++; }
[a-zA-Z0-9_]* { cnt_word++; cnt_char+=yyleng; }
[ ] { cnt_char++; }
%%


int main(){
  yyin = fopen("sample.txt","r");
  yylex();
  printf("\nTotal Number of \nWords : %d\nChar : %d \nLine : %d",cnt_word,cnt_char,cnt_line);
  return 1;
}
