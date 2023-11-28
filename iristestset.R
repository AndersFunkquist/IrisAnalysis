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

install.packages('sampling')
library(sampling)

id2 <- strata(iris,stratanames = 'Species',size = c(5,5,5), method = 'srswor')
id2

s2 <- iris %>% slice(id2$ID_unit)
ggpairs(s2,aes(color=Species))

#install.packages('dplyr')
library(dplyr)
install.packages('plotly')
library(plotly)

plotly::plot_ly(iris,x=~Sepal.Length,y=~Petal.Length,z=~Sepal.Width,
                size = ~Petal.Width, color = ~Species, type = 'scatter3d')

pc <- iris %>% select(-Species) %>% as.matrix() %>% prcomp()
summary(pc)
plot(pc,type='line')
str(pc)

iris_projected <- as_tibble(pc$x) %>% add_column(Species=iris$Species)
ggplot(iris_projected, aes(x=PC1,y=PC2,color=Species)) + geom_point()

ggplot(iris_projected,aes(x=PC1,y=0,color=Species)) + geom_point() +
  scale_y_continuous(expand = c(0,0)) + 
  theme(axis.text.y = element_blank(), axis.title.y = element_blank())

install.packages('factoextra')
library(factoextra)

fviz_pca(pc)
fviz_pca_var(pc)
