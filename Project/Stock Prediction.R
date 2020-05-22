install.packages("dplyr")
library(quantmod)
library(xts)
library(rvest)
library(tidyverse)
library(stringr)
library(forcats)
library(lubridate)
library(plotly)
library(dplyr)
library(PerformanceAnalytics)
library(nnet)
library(stats)
library(mclust)
library(vars)
library(plyr)
library(fBasics)
update.packages(ask = FALSE)




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

getSymbols("AMZN", from="2008-08-01",to="2018-08-17")
log_returns <-AMZN%>%Ad()%>%dailyReturn(type='log')
mu <- mean(log_returns)
sig <- sd(log_returns)
price <- rep(NA, 7)

for(i in 2:length(testsim)){
  price[i] <- price[i-1]*exp(rnorm(1,mu,sig))
}

random_data <- cbind(price, 1:7)
col_names(random_data) <- c("Price", "Day")
random_data <- as.data.frame(random-data)

random_data%>%ggplot(aes(Day,Price))+geom_line()+labs(title="Prediction")+theme_bw()








