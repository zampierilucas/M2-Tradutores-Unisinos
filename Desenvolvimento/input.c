/// A test coment long long long long
//Comentário 1 int
/* Comentário 2 int */

int main() {
  int v[] = {5, 10, 15, 3, 10, 76, 5, 13, 33, 45};
  float *pt;
  int i;
  char *m;
  pt = v; // Atribui o endereço do vetor
  AlterarVetor(v, 10);
  for (int i = 0; i < 10; i++) {
    printf("V[%i] = %i\r\n", i, *(pt + i));
  }

  int a = 12.2 / 23.4;
  int b = 10.5;
  chat mess[] = ""
  char message[] = "hello world";
  if ( a <= b || a !=b) {
    printf(message)
  }
  CalculoMedia();
  VerificaNumero();
  return 0;
}
