%{
  #include"y.tab.h"
%}

%%

"if" { return IF; }
"else" { return ELSE; }
"{" { return LEFT_C; }
"}" { return RIGHT_C; } 

%%
