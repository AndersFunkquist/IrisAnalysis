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

clean.data <- iris %>% drop_na() %>% unique()
summary(clean.data)

iris %>% group_by(Species) %>% summarize_all(mean)
iris %>% group_by(Species) %>% summarize_all(median)

sample(c('A','B','C'), size = 10,replace = T)
take <- sample(seq(nrow(iris)),size = 15)
take
iris[take,]

set.seed(1000)

s <- iris %>% slice_sample(n=15)
ggpairs(s,aes(color=Species))
