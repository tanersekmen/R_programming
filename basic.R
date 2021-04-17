

v1 <- c(10,3,5,9)
v2 <- c(6,3,4,7)
v3 <- c(9,6,4,5)
v4 <- c(2,5,8,6)


# v1,v2,v3,v4 vektörlerini matris değişkenine atıyorum
matris <- cbind(v1,v2,v3,v4)
matris


# python'da df.shape ile aynı işleve sahip.
dim(matris)


# matris değerlerinin kolon ve satırlarının boyutlarını belirtip isimlendirme yapılma kısmı.
# yapılan değişiklikleri veri adı altına atadım.
veri <- matrix(matris, nrow=4, ncol=4, dimnames = list(c('ilk_satir','ikinci_satir','ucuncu_satir','dorduncu_satir'),
                                       c('ilk_kolon','ikinci_kolon','ucuncu_kolon','dorduncu_kolon')))


# matrisin 1 satır 1.kolon değerini ve 3.satır 4.kolonu verir. 
veri[1,1]
veri[3,4]


# matris içindeki değerleri veren for döngüsü
for (i in veri){
  print(i)
}


## if - else if

deneme <- 10
if (deneme>5){
  print("buyuk")
} else if(deneme<5){
  print("kucuk")
}

  
## fonksiyon yapısı 
kare_alip_carpma <- function(x,y){
  x^2 * y
}

kare_alip_carpma(8,3) 
