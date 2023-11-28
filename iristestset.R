install.packages('tidyverse')
library(tidyverse)

data(iris)
summary(iris)
str(iris)
iris <- as_tibble(iris)
iris
print(iris,n=3,width = Inf)
summary(iris)
iris %>% summarize_if(is.numeric,mean)

install.packages('GGally')
library(GGally)

ggpairs(iris,aes(color=Species))
