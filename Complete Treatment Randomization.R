#Complete Treatment Randomization
rm(list=ls(all=T))
x=c(1,2,3,4); #Drugs_or_Treatments
P=c(0.2,0.2,0.35,0.25); #Probabilities
drug=sample(x,100,replace=T,prob=P) #Sample generating
drug
data.frame("Subject"=1:100,"Drug"=drug);
D_table=table(drug);D_table


#There are 30 patient involved in study. Assign two drugs(Active drug and Placebo) to all these patients using complete randomisation and calculate sample fraction.
x=c("Active Drug", "Placebo"); # Drugs or Treatments
P=c(0.5,0.5); #Probabilities of assignment
drug=sample(x,20,replace=T,prob=P); #Sample Generation or Drug assignment
drug
data.frame("Subject"=1:20,"Drug"=drug)
table(drug)
#We can also replace "Active Drug" with 1 and "Placebo" with 0 or vice-versa. 

#Sample Fraction for "Active Drug"
Fraction1=11/20;Fraction1
#Sample Fraction for "Placebo"
Fraction2=9/20;Fraction2

