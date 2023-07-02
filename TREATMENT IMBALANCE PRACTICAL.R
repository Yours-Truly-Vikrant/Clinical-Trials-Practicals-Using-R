patients=seq(1,100)
patients
D=c('A','B')
Treat=sample(D,10,replace=T)
df=data.frame(patients,Treat)
df
n=100
db=dbinom(n/2,n,0.5)
db
sam.fra=1-db
sam.fra
plot(n,sam.fra)
pb=1-(pbinom(n*0.55,n,0.5)-pbinom(n*0.45,n,0.5))

n=seq(10,1000,10)
imbalance=1-(pbinom(n*0.55,n,0.5)-pbinom(n*0.45,n,0.5))
plot(n,imbalance)

