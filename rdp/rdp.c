#include<stdio.h>
#include<stdlib.h>
#include<ctype.h>
int entry();
int term();
int factor();

char* input;
char lookahead;

void next(){
  lookahead = *input++;
}

void match(char expected){
  if(lookahead == expected){
    next();
  }else{
    printf("\nSyntax Error Unexpected character %c\n",expected);
  }
}

int expr(){
  int result = term();
  while(lookahead == '+' || lookahead == '-'){
      if(lookahead == '+'){
        match('+');
        result += term();
      }else if(lookahead == '-'){
        match('-');
        result-=term();
      }
  }
  return result;
}

int term(){
  int result = factor();
  while(lookahead == '*' || lookahead == '/'){
    if(lookahead == '*'){
      match('*');
      result *= factor();
    }else if(lookahead == '/'){
      match('/');
      int divisor = factor();
      if(divisor!=0){
        result /= divisor;
      }else{
        printf("\nDivide By Zero\n");
        exit(1);
      }
    }
  }
  return result;
}

int factor(){
  int result;
  if(isdigit(lookahead)){
    result = lookahead - '0';
    match(lookahead);
  }else if( lookahead == '('){
    match('(');
    result = expr();
    match(')');
  }else{
    printf("\nSyntax Error Character %c",lookahead);
    exit(1);
  }
  return result;
}

int main(){
    char* string;
    scanf("%s",string);
    input = string;
    next();
    int result = expr();
    printf("\nResult : %d",result);
}
