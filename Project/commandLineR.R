#!/usr/bin/env Rscript
library(quantmod)
library(plyr)
library(fBasics)
library(xts)
library(nnet)
library(stats)
library(mclust)
library(vars)



main <- function() {
  args <- commandArgs(trailingOnly = TRUE)
  print(args[1])
  print(args[2])
  print(args[3])
  symbols <- c(args[1],args[2],args[3])
  symb <- symbols[1]
  start <- symbols[2]
  end <- symbols[3]
  
  Stock <- getSymbols(symb, from = start, to = end, src = 'yahoo', auto.assign = FALSE)
  data.xts <- xts(Stock)
  plot(as.zoo(Stock))
  
  #1
  l_ply(symbols, function(sym) try(getSymbols(sym)))
  symbols <- symbols[symbols %in% ls()]
  
  #2
  sym.list <- llply(symbols,get)
  
  #3
  data <- xts()
  for(i in seq_along(symbols)){
    symbol <- symbols[i]
    data <- merge(data,get(symbol)[,paste(symbol, "Close", sep=".")])
  }
}

main()

