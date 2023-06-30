## Response Adaptive Randomization
n=30
sub=1:n
drug=c("T","R")
p=0.5
cont=rep(0,n)
res=rep(0,n)
pr=rep(0,n)
cont[1]=sample(drug,1,prob=c(p,1-p))
res[1]=rbinom(1,1,ifelse(cont[1]=="T",0.6,0.4))
pr[1]=p
for(i in 2:n)
{
  if((cont[i-1]=="T"&res[i-1]=="1"||res[i-1]=="0"&cont[i-1]=="R")){
    p=p-0.01
  }else(p=p+0.01)
  pr[i]=p
  cont[i]=sample(drug,1,prob = c(p,1-p))
  res[i]=rbinom(1,1,ifelse(cont[i]=="T",0.6,0.4))
}
out=data.frame("Subject"=sub,"Group"=cont,"Response"=res,"probability"=pr)
View(out)


rm(list=ls(all=T))
#Assign treatments "Placebo" and "Active Drug" to 20 subjects using response adaptive randomization. Assume response has Bernoulli distribution with parameter p=0.5 and 0 as negative response and 1 as positive response. Simulate the responses accordingly.
n=20; #Number of Subjects
Drug=c("Placebo","Active Drug"); #Types of Drugs
p=0.5 # Probability of assignment
Treat=rep(0,n) #Creating null vector for treatments
Resp=rep(0,n) #Creating null vector for response
prob=rep(0,n) #Creating null vector for adaptive probabilities
Treat[1]=sample(Drug,1,prob=c(p,1-p)) 
Resp[1]=rbinom(1,1,ifelse(Treat[1]=="Placebo",0.6,0.4))
prob[1]=p
for(i in 2:n){
  if((Treat[i-1]=="Placebo"&Resp[i-1]==1||Treat[i-1]=="Active Drug"&Resp[i-1]==0))
  {p=p-0.01}
  else(p=p+0.01)
  prob[i]=p
  Treat[i]=sample(Drug,1,prob=c(p,1-p))
  Resp[i]=rbinom(1,1,prob=c(p,1-p))
}
out=data.frame("Subjects"=1:n,"Treatments"=Treat,"Responses"=Resp,"Probabilities"=prob)
out
table(Treat,Resp)
