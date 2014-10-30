
%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int number_d = 0;
int wounded = 0;
int rvalue = 0;
int nbombs = 0;
char *place;

%}

DIGIT [0-9]
SDIGIT  um | uma | dois | duas | tres | quatro | cinco | seis | sete | oito | nove | dez | onze
%x searching searching_place
 
%%

{DIGIT}+ {
	rvalue = atoi(yytext); 
	BEGIN(searching);	
}

<searching>([Ee]"m "|[Nn]"o ")[A-Z][a-z]+([A-Z][a-z]+)?("da"?"do"?"de"?[A-Z][a-z]+)? {
	place = malloc(yyleng);
	place = yytext;
	BEGIN(INITIAL);
}

<searching>{DIGIT}+ {
	rvalue = atoi(yytext); 
	BEGIN(searching);	
}
<searching>."mortos"|"morreram" {
	number_d += rvalue;
    BEGIN(INITIAL);	
}
<searching>."feridas"|"feridos" {
	wounded += rvalue;
}
<searching>"bombas"|"misseis" {
	nbombs += rvalue;
}

%%
void main(){
	yylex();
	printf("=================================\n");
	printf("Resultado:\n");
	printf("=================================\n");
	printf("Numero de mortos: %d\n", number_d);
	printf("Numero de feridos: %d\n", wounded);
	printf("Numero de bombas: %d\n", nbombs);
	printf("Local: %s\n", place);
}
