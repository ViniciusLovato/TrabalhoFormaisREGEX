
%{
#include <stdio.h>
#include <stdlib.h>
%}


/* f_number e number nao funcionam */
DIGIT [0-9]|f_number|number
f_number "uma"|"duas"
number "um"|"dois"|"tres"|"quatro"|"cinco"|"seis"|"sete"|"oito"|"nove"|"dez"|"onze"

%%
([Ee]"m "[A-Z][a-z]+?(" "[A-Z][a-z]+))|([Nn]"o "[A-Z][a-z]+?(" ")[A-Z][a-z]+)	{
	// Identificando local 
	printf("\nLugar: %s\n", yytext);
}


({DIGIT}+" mortos")|({DIGIT}+" foram mortos")|({DIGIT}+" pessoas foram mortas")|({DIGIT}+"morreram") {
	// Identificando numero de mortos
	printf("\nNumero de mortos: %s\n", yytext);
}

({DIGIT}+" feridos")|({DIGIT}+" foram feridos")|({DIGIT}+" pessoas ficaram feridas")|({DIGIT}+" ficaram feridas") {
	// Identificando numero de mortos
	printf("\nNumero de feridos: %s\n", yytext);
}

((f_number)" bomba"?s) {
	// Identificando numero de bombas
	printf("\nNumero de bombas: %s\n", yytext);
}
%%

main()
{
	yylex();
}

