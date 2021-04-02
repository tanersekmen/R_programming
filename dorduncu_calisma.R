## Gorsellestirme


# Library kurmak icin
# install.packages("kurulacak library adi")


library(d3Tree)
library(tidyverse)

# Dinamik Gorsellestirme 
# burada mpg verisinden araba markaları ekrana geliyor ve anlik tiklamalar sonucunda degisimleri gozlemek icin elverisli oluyor
df <- mpg
df
d3tree(list(root = df2tree(rootname="mpg" , struct = as.data.frame(mpg)),layout = "collapse"))

# Iki kategorik degiskene gore grafik
df <- diamonds
ggplot(df, aes(cut, fill = color)) +
  geom_bar(position = position_dodge()) +
  ggtitle("Kalite ve Fiyat Arasındaki İliski ") +
  xlab("Kalite") +
  ylab("Fiyat")


#Cizilen histograma yogunluk cizgisi eklemek icin;
ggplot(df, aes(price)) +
  geom_histogram(aes(y = ..density..)) +
  geom_density()


# Bagimli degiskene etki eden cut degiskeninin her seviyesindeki etkisini gormek icin;
ggplot(df, aes(price)  ) +
  geom_histogram() + 
  facet_grid(cut ~ . )


## Boxplot
library(ggplot2)
ggplot(df, aes(x=cut, y = price, fill=cut)) +
  geom_boxplot()


# Scatter Plot
df <- iris
ggplot(df, aes(Sepal.Length, Sepal.Width)) +
  geom_point(size = 2,
             shape = 25,
             color = "black",
             stroke = 1,
             fill = "orange")
# geom_point icerisinde
# shape = 25 olursa, sekiller ters ucgen olur.
# size, boyutunu belirler.
# stroke, belirgin seviyesini arttırır.   
# fill ekranda olusacak nesnenin icerisindeki rengi belirler.



# Korelasyon - Heatmap
#---------kutuphaneler---------
# library(tidyverse)
# library(ggplot2)
# genelde veriyi once matris yapip oyle calisiyoruz
df <- as.matrix(mtcars)
heatmap(df, scale = "column")
cor.test(df$mpg, df$drat)
ggcorr(df)