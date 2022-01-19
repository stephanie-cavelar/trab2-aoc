#include <stdio.h>


int main() {

int vetor [] = {8,8,8,8,8};


multiplicar_por_oito(vetor);
dividir_por_quatro(vetor);
comparacao_e_ou(vetor);

  for (int i=0;i<5;i++)
  {
    printf("%d ",vetor[i]);
  }
  
    return 0;
}

void multiplicar_por_oito (int vetor[5]) {
  for (int i=0; i<5; i++){
  vetor[i]= vetor[i]<<3;}
  }
 
void dividir_por_quatro(int vetor[5]){
  for (int i=0; i<5; i++){
  vetor[i]= vetor[i]>>2;}
}

void comparacao_e_ou(int vetor[5]){
    int s_6 = 25;
    int s_7 = 10;
    for (int i=0;i<5;i++){
        vetor[i]=vetor[i]|s_6;
        vetor[i]=vetor[i]&s_7;
    }
}