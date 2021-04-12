# TREEMAP

library(tidyverse)
#install.packages('treemap')
library(treemap)

df <- data.frame(gruplar = c("grup_1", "grup_2", "grup_3"),
                 degerler = c(10,90,60))

# Parcalama ve verdigi degerler bazinda grafik uzerinde ayrilma degerleri gorulecektir.
treemap(df, index = 'gruplar', vSize = 'degerler', type = 'index')



#-------------------------------------------------------------------------------
# Buradan sonrasinda tamamen tek bir veri kumesi olusturup devam edecegim


# Tek Orneklem T Testi


## Problem
###  Hipotez 
# H0: M>=170,    H1: M<170

## Veri
veri <- c(17, 160, 234, 143,100, 143, 198,
          152, 183, 172, 166, 170, 142, 145, 155,
          80, 92, 110,   125, 186, 201, 214, 291)

summary(veri)


## Varsayim Testi

# : veri dagilimina goz atmak istedigimiz dogrultu
hist(veri)

# Quantiles plot 
#install.packages("ggpubr")
library(ggpubr)

# : veriyi lineer bir cizelge icerisinde tutar
ggqqplot(veri)


# : Shapiro ile p value degerine erismek icin
shapiro.test(veri)
# : ciktida p degeri eger alfa olarak belirlenen degerden buyukse H0 reddedilemez
# : aksi durumda H0 reddedilir


# T Testi
# : mu olan deger hipotez kurarken girdigimiz deger
# : alternative degeri ise H1 < old. icin kucuktur isareti = less
t.test(veri, mu = 170, alternative = "less", conf.level = 0.95)


# Alternatif Fonk.
# :  Daha detayli bir sekilde bilgi almak isterseniz
#install.packages("infer")
library(inferr)
df <- data.frame(veri)
infer_os_t_test(df, veri, mu = 170, type = all)


