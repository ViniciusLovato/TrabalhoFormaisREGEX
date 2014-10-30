
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
CIDADE ([A-Z][a-z]+(\ [A-Z][a-z]+)?(\ da\ ?\ de\ ?\ do\ ?[A-Z][a-z]+)?)
%x searching get_number_d get_number_w
 
%%
. {
	BEGIN(searching);
}

<searching>"cidade de "{CIDADE}|(([Ee]"m "|[Nn]"o "){CIDADE}) {
	place = malloc(yyleng+1);
	strcpy(place, yytext);
	BEGIN(INITIAL);
}

<searching>{DIGIT}+ {
	rvalue = atoi(yytext); 
	BEGIN(searching);	
}

<searching>"mort"[ao][s]?|"morreram" {
	number_d += rvalue;
    BEGIN(INITIAL);	
}

<searching>"matou "|"mataram "|"mata " {
	BEGIN(get_number_d);
}

<searching>"ferida"[s]?|"ferido"[s]? {
	wounded += rvalue;
}

<searching>"feriu"|"feriram" {
	BEGIN(get_number_w);
}

<searching>"bomba"[s]?|"misseis" {
	nbombs += rvalue;
}

<get_number_d>{DIGIT}+ {
	number_d += atoi(yytext);
	BEGIN(searching);
}

<get_number_w>{DIGIT}+ {
	wounded += atoi(yytext);
	BEGIN(searching);
}

%%
void main(){
	yylex();
	printf("\n=================================\n");
	printf("Resultado:\n");
	printf("=================================\n");
	printf("Local: %s\n", place);
	printf("Numero de mortos: %d\n", number_d);
	printf("Numero de feridos: %d\n", wounded);
	printf("Numero de bombas: %d\n", nbombs);
}
