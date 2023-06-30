#Assign tow drugs(Active drug and Placebo) to all these patients using permuted block randomization
n=30; #Number of patients
nb=3; #Number of blocks
bsz=n/nb; #block size
drug1=sample(rep(c("T","R"),bsz/2),bsz,replace = F) #T is test drug or Active drug and R is reference drug or Placebo
drug2=sample(rep(c("T","R"),bsz/2),bsz,replace = F)
drug3=sample(rep(c("T","R"),bsz/2),bsz,replace = F)
data.frame("Subject No"=1:n,"Drug"=c(drug1,drug2,drug3))

