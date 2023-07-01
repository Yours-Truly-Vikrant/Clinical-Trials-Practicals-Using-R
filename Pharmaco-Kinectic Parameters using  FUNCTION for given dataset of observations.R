#pk parameter function for given dataset of observation
data=read.csv("C:/Users/vikra/Downloads/BABEData.csv",header=F); #Reading the CSV file
data1=data[,5:20]; #Selecting the columns with time and concentration observations only
ti=unlist(data1[1,]);
ci=unlist(data1[2,]);
pkpara=function(ti,ci){
  n=length(ci);
  cmax=max(ci);
  a=which.max(ci);
  tmax=ti[a];
  AUCt=sum((ci[2:n]+ci[1:(n-1)])*(ti[2:n]-ti[1:(n-1)]))/2;
  ke=-2.303*coefficients(lm(log10(ci[(a+1):n])~ti[(a+1):n]))[2];
  thalf=0.693/ke;
  aucinf=AUCt+ci[n]/ke;
  df=data.frame("Cmax"=cmax,"tmax"=tmax,"thalf"=thalf,"aucinf"=aucinf,"AUC_t"=AUCt)
  return(df)
}
pkpara(ti,ci)

df=data.frame("Cmax"=0,"tmax"=0,"thalf"=0,"aucinf"=0,"AUC_t"=0)
for(i in 2:49){
  df=rbind(df,pkpara(unlist(data1[1,]),unlist(data1[i,])))
  
}
df
