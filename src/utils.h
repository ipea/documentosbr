#include "libraries.h"

Ra * factoryRa(const char *q){
  Ra *ra;
  std::string t(q);
  std::transform(t.begin(), t.end(), t.begin(), ::tolower);
  if(t == "pis"){
    //std::cout << "Entrou aqui" << std::endl;
    ra = new Pis();
  }else if(t == "cpf"){
    ra = new Cpf();
  }else if(t == "cnpj"){
    ra = new Cnpj();
  }else if(t == "cns"){
    ra = new CNS();
  }else if(t == "cei"){ // <-- ADICIONADO: Regra para instanciar CEI
    ra = new Cei();
  }else{
    ra = new Cpf();
  }
  return ra;
}



