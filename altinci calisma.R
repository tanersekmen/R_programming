#install.packages("tidyverse")
#install.packages("magrittr") 
#install.packages("dplyr")  
library(magrittr) 
library(dplyr)
library(tidyverse)

# ORT - MED - STD SAPMA



a <- c(28,40,39,25,33,32,64,15,17)
b <- c(14,19,25,28,22,38,47,43,58)
c <- c(13,20,39,26,24,49,42,35,31)
d <- c(16,18,22,21,33,37,44,48,51)


a <- data.frame(SURE = a, GRUP ='a')
b <- data.frame(SURE = b, GRUP ='b')
c <- data.frame(SURE = c, GRUP ='c')
d <- data.frame(SURE = d, GRUP ='d')


veri <- rbind(a,b)
veri <- rbind(veri,c)
veri <- rbind(veri,d)


## veri icerisinde olan sutun degerlerini baz alarak
## her bir sutun bazında ortalama medyan ve standart sapma 
## degerlerini verdi.


veri %>% 
  group_by(GRUP) %>%
  summarise(mean(SURE), median(SURE), sd(SURE))


veri


#----------------------#
library(ggplot2)

## Anova ilk yontem

df <- mpg
df

## aov icerisine ( ilk_degisken ~ ikinci_degisken, data = verinin ismi)
aov(df$displ ~ df$cty, data = df )

## verdigi otuput ;
##                 df$cty Residuals 
## Sum of Squares  247.9872  140.9266
## Deg. of Freedom        1       232
## Residual standard error: 0.7793859
## Estimated effects may be unbalanced


## bir diger hesaplama yolu ise

df$class <- factor(df$class)
#install.packages("inferr")

library(inferr)
infer_oneway_anova(df, displ, class)
## Verdigi output ise;

## Sum of                                            
## Squares    DF     Mean Square      F        Sig.  
#--------------------------------------------------------------------
##   Between Groups    223.088     6       37.181       50.863    0.0000 
## Within Groups     165.826    227       0.731                        
## Total             388.914    233             
