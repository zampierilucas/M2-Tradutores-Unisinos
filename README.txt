*** COMO USAR A FERRAMENTE ***
1) Abra o CMD no caminho desta pasta.
2) Digite flex_c.exe <arquivo origem.extensão>
3) Ao precionar enter, será gerado um arquivo lex.yy.c com a linguagem destino.
[
Exemplo:
i) cd C:\Users\igorb\OneDrive\Área de Trabalho\Faculdade\Tradutores\Flex - GnuWin32\bin
ii) flex_c.exe pascaltoy.lex
]
4) Copie o código gerado na linguagem alvo.
5) Acesse um compilador de C online.
[
https://www.onlinegdb.com/online_c_compiler
]
6) Adicione um input a ser verificado, como:
[
int main() {
  int v[] = {5, 10, 15, 3, 10, 76, 5, 13, 33, 45};
  int *pt;
  int i;
  pt = v; // Atribui o endereço do vetor
  AlterarVetor(v, 10);
  for (int i = 0; i < 10; i++) {
    printf("V[%i] = %i\r\n", i, *(pt + i));
  }
  CalculoMedia();
  VerificaNumero();
  return 0;
}
]
7) Execute e verifique a saída (stdout) com os detalhes encontrados.
