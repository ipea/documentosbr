
<!-- README.md is generated from README.Rmd. Please edit that file -->

# documentosbr

[![check](https://github.com/ipea/documentosbr/actions/workflows/check.yaml/badge.svg)](https://github.com/ipea/documentosbr/actions/workflows/check.yaml)
[![Cran](https://www.r-pkg.org/badges/version/validaRA)](https://www.r-pkg.org/badges/version/validaRA)
[![Downloads](https://cranlogs.r-pkg.org/badges/grand-total/validaRA)](https://cranlogs.r-pkg.org/badges/grand-total/validaRA)
[![Coverage
Status](https://codecov.io/gh/ipea/documentosbr/graph/badge.svg)](https://app.codecov.io/github/IPEA/documentosbr?branch=master)
[![CRAN/METACRAN Total
downloads](https://cranlogs.r-pkg.org/badges/grand-total/validaRA?color=blue)](https://CRAN.R-project.org/package=validaRA)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable)
[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)

<img align="right" src="man/figures/documentosbr.svg" alt="logo" width="140">
<img align="right" src="man/figures/documentosbrlight.svg" alt="logolight" width="140">

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

After CRAN approval, it will be possible to install documentosbr from
[CRAN](https://cran.r-project.org/package=documentosbr):

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
