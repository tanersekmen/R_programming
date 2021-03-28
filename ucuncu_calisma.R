## Library, python'da olan import yapisina eşdegerdir.
library(tidyverse)
df <- mpg
df


# Gruplama yapip veride kac adet bu değerden varsa n olarak atama yapip
# ardindan cty degiskeni için ortalama aldirma islemi
df %>%
  group_by(displ) %>%
  summarise(n  = n(),
            mean(cty))


# NOT

# df.info() ile esdeger bir yapisi vardir.
str(df)


# df.head() yerine ise;
head(df)

# df.columns icin;
colnames(df)

# veriden ceyreklikler medyan vs gibi degerleri almak icin fonskiyon;
summary(df)

# Python'da olmayan ama burada bulunan bir diger ek ozellik ise,
# hem head hem tail degerlerini birlestirip vermesi bunun icin
psych::headTail(df)


# EDA and Data Vis.

df$class <- factor(df$class)

# Yeni degisken olusturup ona atama yapmak icin;
# Aynı zamanda displ degiskeni 2'den buyukse o veriye 1, degilse 0 ataması yap.
df$disp_yeni <- ifelse(df$displ>2, 1, 0)
df$disp_yeni <- factor(df$disp_yeni)


# Eger verileri belirli bir degiskene oranla sinirlandırmak istersek;
# breaks dedigimiz nokta kirilimlari temsil ediyor.
df$disp_iki <- cut(df$displ, breaks = c(0,2, max(df$displ)))


# Son haldeki verilere goz atmak istersek;
library(funModeling)
profiling_num(df)