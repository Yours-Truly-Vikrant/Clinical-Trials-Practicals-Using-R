rm(list=ls(all=T))
#pk parameter function for given dataset APPLYing for loop and finding summary w.r.t different factors
data=read.csv("C:/Users/vikra/Downloads/BABEData.csv",header=F)
data
data1=data[,5:20]
ti=unlist(data1[1,])
ci=unlist(data1[2,])
pkpara=function(ci,ti){
  n=length(ci);
  c_max=max(ci);
  a=which.max(ci);
  t_max=ti[a];
  auctk=sum((ci[2:n]+ci[1:n-1])*(ti[2:n]-ti[1:(n-1)]))/2;
  ke=-2.303*coefficients(lm(log10(ci[(a+1):n])~ti[(a+1):n]))[2];
  thalf=0.693/ke;
  aucinf=auctk+ci[n]/ke;
  df=data.frame("max_con"=c_max,"max_time"=t_max,"AUC_tk"=auctk,"KE"=ke,"AUC_inf"=aucinf,"t_half"=thalf);
  return(df)
}
pkpara(ci,ti)



df=data.frame("max_con"=0,"max_time"=0,"AUC_tk"=0,"KE"=0,"AUC_inf"=0,"t_half"=0);
df
for(i in 2:49){
  df=rbind(df,pkpara(unlist(data1[i,]), unlist(data1[1,])))
}
df


df1=df[2:49,]
sapply(df1,summary)

y=data.frame(data[2:49,1:4],df[1:48,])
y

#summary corresponding to sequenc
s=data.frame(y[,2],y[,5:10])
s

#summary for sequence of 1
a1=s[2:24,2:7]
sapply(a1,summary)

#summary for sequence of 2
a2=s[25:48,2:7]
sapply(a2,summary)

#table for treatment
t=data.frame(y[,3],y[,5:10])
t



#summary for treatment 1
t1=t[c(13:24,37:48),2:7]
sapply(t1,summary)
#summary for treatment 2
t2=t[c(2:12,25:36),2:7]
sapply(t2,summary)







