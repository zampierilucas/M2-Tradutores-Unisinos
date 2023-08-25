/* Atividade M2 da disciplina Tradutores | Aluno: Igor Bartmann e Lucas Zampieri | Data: 22/08/2023 */

%option noyywrap

%{

#include <math.h>
#include <stdbool.h>

#define TOKEN_LIMIT 99

char token_ids[TOKEN_LIMIT][TOKEN_LIMIT] = {};
int currentId = 1;

void tokenize() {
	bool found = false;

	for (int i = 0; i <= TOKEN_LIMIT; i++) {
		if (strcmp(&yytext[0], token_ids[i]) == 0) {
			printf("[id, %d] ", i);
			found = true;
		}
	}
	if (found == false) {
		strcpy(token_ids[currentId], &yytext[0]);
		printf("[id, %d] ", currentId);
		currentId++;
	}
}

%}

DIGIT 		[0-9]
ID			[a-z][a-z0-9]*
STRING		(\"(\\.|[^\\"])*\")
COMENTARIO_UMA_LINHA	("//"[^\n]*)
COMENTARIO_MULTIPLAS_LINHA	("/*"([^*]|\*+[^*/])*\*+"/")
ARITH_OPERATION	([0-9\' '][\+\-\/\*][0-9\' '])
RESERVED (if|else|then|begin|procedure|function|end|int|float|double|String|string|bool|do|while|for|break|switch|case|return|null|char|auto|const|continue|default|enum|extern|goto|inline|long|register|restrict|short|signed|sizeof|static|struct|typedef|union|unsigned|void|volatile)

%%

{DIGIT}+ { printf("[num, %s]", yytext); }

{DIGIT}+"."{DIGIT}+ { printf("[num, %s]", yytext); }

{STRING}+ { printf("[string_literal, %s]", yytext); tokenize();}

{COMENTARIO_UMA_LINHA}|{COMENTARIO_MULTIPLAS_LINHA} {printf("[comment_detected, %s]", yytext);}

{RESERVED} { printf("[reserved_word, %s]", yytext); tokenize();}

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