#!/bin/bash

flex -o Exercicio_M2.c Exercicio_M2.lex; gcc Exercicio_M2.c -o Exercicio_M2; cat input.c;  ./Exercicio_M2 input.c | grep "string_literal\|$"