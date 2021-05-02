# Eksik Veri Analizi

## Amacmýz ilk adýmda eksik gözlemleri silmek olsun.
df <- data.frame(v1 = c(1, 3, 6, NA),
                 v2 = c(7, NA, 5, 9),
                 v3 = c(NA, 22, 5 ,6)) 


## burada .omit() fonksiyonu sayesinde bu islemi halletmis oluyoruz
na.omit(df)


## eksik verileri ortalama ile doldurmak icin ise;
df$v1[is.na(df$v1)] <- mean(df$v1, na.rm = TRUE)


## tum eksik verileri doldurmak ve tum eksik verileri gozlemlemek
sapply(df, function(x) ifelse(is.na(x), mean(x, na.rm = TRUE),x))
sum(is.na(df))


## Halihazirda olan verilerin yerine yeni deger atamak icin;
## df v3 icerisinde olan 22 degerinin yerine 3 degerini atama yapiyoruz
df$v3[df$v3=22] <- 3


## Hangi kolonda kac eksik var onu gormek istersek;
colSums(is.na(df))


# Eksik Veride Silme Yontemleri

## Tamamen silmek icin;
df$v1 <- NULL

## Medyan - Mod Deger ile Doldurma
df$v1 <- impute(df$v1, median)
df$v1 <- impute(df$v1, mode)

## Verideki eksik gozlemi 1 ile doldurma
df$v1 <- impute(df$v1, 1)

## Eksik veri indexi ogrenme
sapply(df, function(x) which(is.na(x)))


# KNN ile Eksik Deger Atama
#install.packages('DMwR')
library(DMwR)
## En yakininda olan 5 degere gore deger belirler.
knn_data <- knnImputation(df, k = 5)


# Random Forest ile EKsik Deger Atama
#install.packages('missForest')
library(missForest)
sum(is.na(df))
rf_data <- missForest(df, ntree = 7)
## Atamalar sonrasinda veriyi gozlemlemek;
rf_data 
