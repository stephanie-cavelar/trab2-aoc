#include <stdio.h>


int main() {
//armazena os elementos do vetor na memória
int vetor [] = {2,3,4,5,6};

// realiza as chamadas das funções
multiplicar_por_oito(vetor); 
dividir_por_quatro(vetor);
comparacao_e_ou(vetor);

//depois das operaçoes realizadas nos elementos do vetor
//printamos esses valores para verificação dos resultados.
//Em assembly basta olharmos os valores diretamente na memória, 
//portanto essa parte do código não é necessária em assembly.
  for (int i=0;i<5;i++)
  {
    printf("%d ",vetor[i]);
  }
  
    return 0;
}
//função que multiplica todos os elementos do vetor por 8
void multiplicar_por_oito (int vetor[5]) {
  for (int i=0; i<5; i++){
  vetor[i]= vetor[i]<<3;}
  }
// função que divide todos os elementos do vetor por 4
void dividir_por_quatro(int vetor[5]){
  for (int i=0; i<5; i++){
  vetor[i]= vetor[i]>>2;}
}
// função que realiza duas operações bitwise com os elementos do vetor
void comparacao_e_ou(int vetor[5]){
    int s_6 = 25;
    int s_7 = 7;
    for (int i=0;i<5;i++){
        vetor[i]=vetor[i]|s_6;
        vetor[i]=vetor[i]&s_7;
    }
}