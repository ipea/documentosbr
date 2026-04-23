#ifndef CNPJ_H
#define CNPJ_H
#include "Ra.hpp"

class Cnpj: public Ra {
public:
  Cnpj(int *digits_value, unsigned int size): Ra(digits_value, size){ size_ra = 14; };
  Cnpj() : Ra() { size_ra = 14; };
  
  unsigned int sizeRaValidate(){
    return size_ra - 2; // Valida a base de 12 caracteres
  }
  
  unsigned int sizeRaGenerateLastDigit(){
    return size_ra - 2; 
  }
  
  // Algoritmo unificado para calcular qualquer DV do CNPJ
  // N é a quantidade de caracteres a avaliar (12 para o DV1, 13 para o DV2)
  int calc_dv(int N) {
    int soma = 0;
    
    // Calcula os pesos dinamicamente (2 a 9 da direita para a esquerda)
    for(int i = 0; i < N; i++) {
      int peso = 2 + ((N - 1 - i) % 8);
      soma += digits[i] * peso;
    }
    
    int resto = soma % 11;
    if(resto < 2) {
      return 0;
    } else {
      return 11 - resto;
    }
  }
  
  int generate_last_digit(){
    // Gera o primeiro DV (posição 12, índice 12)
    int dv1 = calc_dv(12);
    digits[12] = dv1;
    size = 13;
    
    // Gera o segundo DV (posição 13, índice 13)
    int dv2 = calc_dv(13);
    digits[13] = dv2;
    size = 14;
    
    return dv2;
  }
  
  int validate(){
    // Verifica primeiro o DV1
    int expected_dv1 = calc_dv(12);
    int r = validate_digit(expected_dv1, 12, 1);
    
    // Se o DV1 estiver correto, verifica o DV2
    if(r == 1) {
      int expected_dv2 = calc_dv(13);
      r = validate_digit(expected_dv2, 13, 2);
    }
    
    return r;
  }
};

#endif