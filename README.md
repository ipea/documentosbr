
<!-- README.md is generated from README.Rmd. Please edit that file -->

# documentosbr [![Build Status](https://travis-ci.org/ipea/documentosbr.svg?branch=master)](https://travis-ci.org/ipea/documentosbr) [![Cran](https://www.r-pkg.org/badges/version/documentosbr)](https://www.r-pkg.org/badges/version/documentosbr) [![Downloads](https://cranlogs.r-pkg.org/badges/grand-total/documentosbr)](https://cranlogs.r-pkg.org/badges/grand-total/documentosbr) [![Coverage Status](https://img.shields.io/codecov/c/github/IPEA/documentosbr/master.svg)](https://codecov.io/github/IPEA/documentosbr?branch=master)

## work in progress

### NEW:

- Fixed out of memory write errors in C++ code

### COMMING SOON:

- Validate ibge cities numbers
- Generate last digits for any RA document

## Description

This package contains functions to work with brazilian documents ids as
CPF, PIS, CNPJ and CNS. It can validate them, outputting the result on
different ways. Also, it can handle situations where the ids has just
its prefix(first ten digits, on cpf, for example) and the user needs to
generate the last one.

## Installation

After CRAN approval, it will be possible install documentosbr from
[CRAN](https://cran.r-project.org/web/packages/documentosbr/index.html):

``` r
install.packages("documentosbr")
```

The development version can be installed with remotes or devtools, as in
the following example:

``` r
install.packages("devtools") 
```

After that, it is possible install documentosbr from the github
repository using devtools:

``` r
devtools::install_github("ipea/documentosbr") 
```

NOTE: The package depends on C++ code that has to be compiled, so Rtools
must be installed. It can be found
[here](https://cran.r-project.org/bin/windows/Rtools/)

## Basic Usage

``` r
# Validanting cpf
result <- valida_doc(c("788.346.838-38"), type = "cpf")

# Validanting pis
result <- valida_doc(c("788.346.838-38"), type = "pis")
```
