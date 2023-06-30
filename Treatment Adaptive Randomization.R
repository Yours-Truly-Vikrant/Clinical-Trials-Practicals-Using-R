rm(list=ls(all=T))
#Treatment Adaptive Randomization
n=30
p=0.5
sub=1:n
drug=c("T","R")
control=rep(0,n)
control[1]=sample(drug,1,prob=c(p,1-p))
for(i in 2:(n+1)){
  ifelse(control[i-1]=="T",p-0.01,p+0.01)
  control[i-1]=sample(drug,1,prob=c(p,1-p))
}
out=data.frame('subject'=sub,'treat'=control);
out

#Assign two treatments A and B to 10 subjects using treatment adaptive randomization and calculate sample fraction.
n=10; #No of Subjects
treat=c("A","B") #Types of Treatments
p=0.5 # Probability for treatments
Drug=rep(0,n);Drug #Creating a null vector
Drug[1]=sample(treat,1,prob=c(p,1-p)); #Assigning treatment to first patient randomly
for(i in 2:(n+1)){
  ifelse(Drug[i-1]=="A",p-0.01,p+0.01)
  Drug[i-1]=sample(treat,1,prob=c(p,1-p))
};
out=data.frame('Subject'=1:n,"Treatments"=Drug)
out










