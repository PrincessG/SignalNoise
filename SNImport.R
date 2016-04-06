### Hello!!!! This script reads in each signal/noise output file from a given directory (the mathematica script creates these) and exports all signal/noise/polytomy in one text file.   
#Load the appropiate package
library(plyr)
setwd("~/PSG/OneLocusComp/MathematicaOutputFiles/")
ListOfFiles<-list.files(full.names=TRUE)
ReadSNFiles<-function(x){
  FileToProcess<-read.table(x)
  names(FileToProcess)[1]<-x  
  return (FileToProcess)
}
EasyFiles<-sapply(ListOfFiles, FUN=ReadSNFiles) #use sapply instead of lapply so that each entry will have the UCE name

EasyFrame<-as.data.frame(EasyFiles)

TransposeEasy<-t(EasyFrame)
Etrans<-as.data.frame(TransposeEasy)

names(Etrans)[1]<-"Noise"
names(Etrans)[2]<-"Poly"
names(Etrans)[3]<-"Signal"

write.table(Etrans,file="~/PSG/Signal_Noise_Output.txt", row.names=T)

