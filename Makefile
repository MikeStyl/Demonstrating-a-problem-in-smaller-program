CC=g++
CCFLAGS= -std=c++2a
FLEX=flex
YFLAGS= -d -t -y
YACC= bison

output: y.tab.o lex.yy.o
	$(CC) $(CCFLAGS) lex.yy.o y.tab.o -o output

y.tab.o: grammar.yacc
	${YACC} ${YFLAGS} grammar.yacc
	${CC} ${CCFLAGS} y.tab.c -c

lex.yy.o: lexer.l
	${FLEX} lexer.l
	${CC} $(CCFLAGS) lex.yy.c -c

clean:
	/bin/rm -f lex.yy.* *.o output lexer_out.txt a.out  y.tab.* *.cacc