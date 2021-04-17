# For - Apply - Map 


## For Dongusu

b <- seq(1,10, 1)
for (i in b){
  # Kare Alma
  print(i**2)
}

### kategorik deg. icin for
a <- data.frame("erkek","kadın","erkek","kadın")
a <- factor(a)
for (i in a){
  print(i)
}

## Apply Metodu
v1 <- c(3.4,9.5)
v2 <- c(3.6,7.4)
v3 <- c(6.9,5.4)
v4 <- c(5.2,6.8)
data <- cbind(v1,v2,v3,v4)

data

#### sutun bazli ortalama icin 2, satir bazli ortalama icin ise 1 degerini girmek gerekir 
apply(data,2,mean)

#### sutun bazli toplama icin 2, satir bazli toplama icin ise 1 degerini girmek gerekir 
apply(data, 2, sum)


## Map Metodu
library(tidyverse)
mtcars 
mtcars %>% 
  split(.$cyl) %>%
  map(~ lm(mpg~ wt, data = .)) %>%
  map(summary) %>%
  map_dbl("r.squared")
