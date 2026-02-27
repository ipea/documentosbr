#' Check Brazilian documents.
#'
#' \code{valida_doc} returns true or false if the number of document is correct.
#'
#'
#' @param entrada Character or numeric of the document that will be validated.
#' @param type Character, it could be CPF, CNPJ, PIS e titulo de eleitor.
#' @param log Output errs found on entrada
#'
#' @importFrom Rcpp sourceCpp
#' @import data.table
#' @return True or False. if log is giving return a data frame.
#'
#' @examples
#'  valida_doc("529.982.247-25", type = "cpf")
#'  valida_doc("529.982.247-25", type = "pis")
#'  valida_doc("529.982.247-25", type = "cnes")
#'  valida_doc("60.149.443/0001-70", type = "cnpj")
#' @export
#'
valida_doc <- function(entrada, type = "cpf", log = FALSE){
  erros <- NULL
  if(type == "tituloeleitor"){
    if(log == FALSE){
      result <- verificar_titulo_eleitor(entrada)
    }else{
      result <- verificar_titulo_eleitor(entrada, log = TRUE)
    }
  }else{
    result <- valida_ra(entrada, type, log)
    if(log == TRUE){
      data.table::setDT(result)
      t <- data.table("Corretos"=0,"Primeiro digito errado"=1,"Segundo Digito errado"=2,"Todos os digitos iguais"=3)
      result[, erros:=names(t)[match(erros, t)]]
    }
  }
  result
}

#' Check Brazilian documents.
#'
#' \code{valida_doc_df} returns true or false if the number of document is correct.
#'
#'
#' @param data Data frame with data to be validate.
#' @param column Column of data that will be evaluated.
#' @param type Character, it could be CPF, CNPJ, PIS e titulo de eleitor.
#' @param log Output errs found on entrada
#'
#' @return True or False. if log is giving return a data frame.
#'
#' @export
#'
valida_doc_df <- function(data, column, type = "cpf", log = FALSE){
  arguments <- as.list(match.call())
  column = eval(arguments$column, data)
  valida_doc(column, type = type, log = log)
}

