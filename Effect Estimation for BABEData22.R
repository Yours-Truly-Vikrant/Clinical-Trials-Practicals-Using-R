df=read.csv("C:/Users/vikra/Downloads/BABEData22.csv")
df
Y11=df[df$Per==1&df$Seq==1,1];  n1=length(Y11);
Y12=df[df$Per==1&df$Seq==2,1];  n2=length(Y12);
Y21=df[df$Per==2&df$Seq==1,1]
Y22=df[df$Per==2&df$Seq==2,1]

U1=Y11+Y21;U1
U2=Y12+Y22;U2
D1=(Y21-Y11)/2;D1
D2=(Y22-Y12)/2;D2
O1=D1; O2=-D2;
Sig2u=((n1-1)*var(U1)+(n2-1)*var(U2))/(n1+n2-2);Sig2u
Sig2d=((n1-1)*var(D1)+(n2-1)*var(D2))/(n1+n2-2);Sig2d

#Carrryover Effect
Chat=mean(U2)-mean(U1);Chat
VChat=Sig2u*(1/n1+1/n2);VChat
Fhat=mean(D1)-mean(D2); VFhat=Sig2d*(1/n1+1/n2);
Phat=mean(O1)-mean(O2);

Effect=c("Carry","Drug","period")
MVUE=c(Chat,Fhat,Phat)
Vhat=c(VChat,VFhat,VFhat)
tst=MVUE/sqrt(Vhat)
pv=2*(1-pt(abs(tst),n1+n2-2))
df2=data.frame(Effect,MVUE,Vhat,tst,pv)
df2


