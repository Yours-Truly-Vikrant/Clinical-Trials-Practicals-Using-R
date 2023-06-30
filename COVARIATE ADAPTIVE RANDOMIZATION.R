#A clinical study is conducted on 20 patients, assign two drugs (Active Drug and placebo) to a all patients using co-variate adaptive randomization
Patient=c(1:20)
Gender=c('M','M','F','M','F','F','F','M','M','F','F','M','M','M','F','M','F','M','M','M')
Smoker=c('N','Y','Y','N','N','Y','N','N','N','Y','Y','Y','N','Y','N','Y','N','Y','Y','N')

FS=Patient[Gender=="F"&Smoker=="Y"];nFS=length(FS); #Female smoker
FN=Patient[Gender=="F"&Smoker=="N"];nFN=length(FN); #Female Non smoker
MS=Patient[Gender=="M"&Smoker=="Y"];nMS=length(MS); #Male Smoker
MN=Patient[Gender=="M"&Smoker=="N"];nMN=length(MN); #Male Non smoker

dFS=sample(rep(c("T","R"),nFS/2),nFS,replace = F) # T is test drug or Active Drug and R is reference drug or Placebo
dFN=sample(rep(c("T","R"),nFN/2),nFN,replace = F)
dMS=sample(rep(c("T","R"),nMS/2),nMS,replace = F)
dMN=sample(rep(c("T","R"),nMN/2),nMN,replace = F)


DF=data.frame("Patient"=c(FS,FN,MS,MN),"Group"=c(dFS,dFN,dMS,dMN))
View(DF)
