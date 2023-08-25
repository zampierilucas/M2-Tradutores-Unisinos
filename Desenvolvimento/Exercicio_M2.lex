/* Atividade M2 da disciplina Tradutores | Aluno: Igor Bartmann e Lucas Zampieri | Data: 22/08/2023 */

%option noyywrap

%{

#include <math.h>

%}


DIGIT 		[0-9]
ID			[a-z][a-z0-9]*
STRING		(\"(\\.|[^\\"])*\")
COMENTARIO	("\/\/"|"\/\*"(.*)\n)
ARITH_OPERATION	([0-9\' '][\+\-\/\*][0-9\' '])

%%

{DIGIT}+ { printf("[num, %s]", yytext); }

{DIGIT}+"."{DIGIT}+ { printf("[num, %s]", yytext); }

if|else|then|begin|procedure|function|end|int|float|double|String|string|bool|do|while|for|break|switch|case|return|null { printf("[reserved_word, %s]", yytext); }

{STRING}+ { printf("[string_literal, %s]", yytext); }

{COMENTARIO}+ { printf("[comment_detected, %s]", yytext); }

{ID} { printf("[id, %s]", yytext); }

{ARITH_OPERATION}+ { printf("[Arith_Op, %s]", yytext); }

"=" { printf("[Equal_Op, %s]", yytext); }

"<"|"<="|"=="|"!="|">="|">" { printf("[Relational_Op, %s]", yytext); }

"&&"|"||" { printf("[logic_op, %s]", yytext); }

"(" { printf("[l_paren, %s]", yytext); }

")" { printf("[r_paren, %s]", yytext); }

"{" { printf("[l_bracket, %s]", yytext); }

"}" { printf("[r_bracket, %s]", yytext); }

"," { printf("[comma, %s]", yytext); }

";" { printf("[semicolon, %s]", yytext); }

"\n" { printf("\n"); }

[\t]+

.

%%

int main(int argc, char *argv[]){
	yyin = fopen(argv[1], "r");
	yylex();
	fclose(yyin);
	return 0;
}