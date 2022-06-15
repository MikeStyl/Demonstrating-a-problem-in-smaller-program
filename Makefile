CC=g++
CCFLAGS= -std=c++2a
FLEX=flex
YFLAGS= --output=grammar.tab.c --header=grammar.tab.h -t
YACC=bison

output: lex.yy.o grammar.tab.o node.o
	$(CC) $(CCFLAGS) lex.yy.o grammar.tab.o node.o -o output

grammar.tab.o: grammar.tab.c
	$(CC) $(CCFLAGS) grammar.tab.c -c

grammar.tab.h grammar.tab.c: grammar.yacc node.h
	$(YACC) $(YFLAGS) grammar.yacc

lex.yy.o: lexer.l grammar.tab.h
	$(FLEX) lexer.l
	$(CC) $(CCFLAGS) lex.yy.c -c

node.o: node.h node.cpp
	$(CC) $(CCFLAGS) node.cpp -c

clean:
	/bin/rm -f lex.yy.* grammar.tab.* *.o output lexer_out.txt
