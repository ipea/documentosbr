#' Validar Título de Eleitor
#'
#' @description
#' Verifica se um número de Título de Eleitor é válido utilizando o algoritmo 
#' de dígito verificador baseado em pesos e restos de divisão (módulo 11).
#'
#' @param entrada Um \code{character}, \code{numeric} ou \code{integer} representando 
#' o número do título. Caracteres não numéricos são removidos automaticamente.
#' @param log \code{logical}. Se \code{TRUE}, permite o rastreio do processo (atualmente não implementado no corpo da função).
#'
#' @return Retorna um valor lógico: \code{TRUE} se o título for válido, 
#' \code{FALSE} caso contrário.
#' 
#' @export
#'
#' @examples
#' # Exemplo com título válido (formato string)
#' verificar_titulo_eleitor("293116340175")
#' 
#' # Exemplo com título válido (formato numérico)
#' verificar_titulo_eleitor(293116340175)
#' 
#' # Exemplo com título inválido
#' verificar_titulo_eleitor("123456789012")

verificar_titulo_eleitor <- function(entrada, log = FALSE){
  if(is.integer(entrada) | is.numeric(entrada)){
    entrada <- as.character(entrada)
  }
  entrada<- gsub("[^0-9]", "", entrada)
  entrada <- as.numeric(unlist(strsplit(entrada, "")))
  tamanho_entrada <- length(entrada)
  vetor_de_validacao_sequencial <- c(seq(14 - tamanho_entrada, 9), rep(0,4))
  digito_verificador <- entrada[tamanho_entrada - 1]
  resultado <- sum(entrada * vetor_de_validacao_sequencial) %% 11
  if(resultado == 10) resultado <- 0
  if(resultado == digito_verificador){
    saida <- TRUE
  }else{
    saida <- FALSE
  }
  if(saida == TRUE){
    vetor_de_validacao_sequencial <- c(rep(0,tamanho_entrada-4), 7:9, 0)
    digito_verificador <- entrada[tamanho_entrada]
    resultado <- sum(entrada * vetor_de_validacao_sequencial) %% 11
    if(resultado == 10) resultado <- 0
    if(resultado == digito_verificador){
      saida <- TRUE
    }else{
      saida <- FALSE
    }
  }
  saida
}
