all : lexer.lex parser.y
	lex lexer.lex
	yacc parser.y -d
	gcc lex.yy.c y.tab.c -o parser
