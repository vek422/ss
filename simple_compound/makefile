all: lexer.lex parser.y
	lex lexer.lex
	yacc parser.y -d
	gcc y.tab.c lex.yy.c -o simple_compound
