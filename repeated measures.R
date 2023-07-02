r_Data=read.csv("C:\\Users\\vikra\\Downloads\\DBP DATA.csv")
head(r_Data,3)
library(ggplot2)
boxplot(r_Data[,3:7],xlab="Visits",ylab="Blood Pressure",main='Comparisons of repeared measures of diastolic  blood pressure ')

r_Data$diff=rep(0,40)
r_Data$diff=r_Data$DBP5-r_Data$DBP1

r_Data$diff

t.test(diff~TRT,data=r_Data,var.equal=T)

#Welch T-test

t.test(diff~TRT,data=r_Data)
#install.packages("ggplot")
library("ggplot")
ggplot(r_Data,aes(diff,group=TRT))+geom_boxplot()














