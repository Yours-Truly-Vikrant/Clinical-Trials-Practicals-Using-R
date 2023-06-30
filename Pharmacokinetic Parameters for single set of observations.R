#Estimation of Pharmacokinetic Parameters; PK parameters
#t is time point
#c is concentration at time point t
rm(list = ls(all=TRUE))
ti=c(0,0.5,1,1.5,2,3,4,6,8,12,16,24,32);
ci=c(0,0,2.8,4.4,4.4,4.7,4.1,4,3.6,3,2.5,2,1.6);
plot(ti,ci,main='drug conc',type='l')
n=length(ci);
c_max=max(ci);
a=which.max(ci);
t_max=ti[a];
AUCt=sum((ci[2:n]+ci[1:(n-1)])*(ti[2:n]-ti[1:(n-1)]))/2;
ke=-2.303*coefficients(lm(log10(ci[(a+1):n])~ti[(a+1):n]))[2];
thalf=0.693/ke;
aucinf=AUCt+ci[n]/ke;
df=data.frame("max_con"=c_max,"max_time"=t_max,"AUC_tk"=AUCt,"KE"=ke,"AUC_inf"=aucinf,"t_half"=thalf);
df


