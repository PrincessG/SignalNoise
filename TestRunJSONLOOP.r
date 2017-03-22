#Hi! This script takes a JSON file and parses it and prints the rate, base pair switches, and base pair frequencies to an individual file. 


#The following section runs a function reads in each file in the directory of your choice. This folder cannot include anything but the rate files when you start. 
#setwd("~/Documents/Research/Aves/SignalNoise/Analyses/SignalNoise_TESTFOLDER/R_Terminal_Test")
#Set for 988 UCES
ListOfJSONFiles<-list.files(full.names=TRUE)

ReadJSONFile<-function(x){
  require(jsonlite)
  FileToProcess<-fromJSON(x)
  return (FileToProcess)
}
InterpretedJSONFiles3<-sapply(ListOfJSONFiles, FUN=ReadJSONFile) #use sapply instead of lapply so that each entry will have the UCE name
#lapply(InterpredJSONFiles,FUN=SubstitutionMatrixPull)


#SubstitutionMatrixFileCreation<-function(ListOfJSONFiles){
 # JSON.i<-ListOfJSONFiles
  #JSON.i<-"./1043_oryLat2.nex.rates"
  #UniqueJSONFilename<-paste(JSON.i,".switches.txt",sep="")
  #NewFiles<-file.create(UniqueJSONFilename)
  #return(NewFiles)
#}
#Create the new empty files
#lapply(ListOfJSONFiles,FUN=SubstitutionMatrixFileCreation)



#findMatrix<-function (FileList) {
 # Matrix.i<-x[[1]]$subs_matrix
#  rCA<-cat("rCA=",Matrix.i$AC,"\n")
#  rTG<-cat("rTG=",Matrix.i$GT,"\n")
#  rAG<-cat("rAG=",Matrix.i$AG,"\n")
#  rCG<-cat("rCG=",Matrix.i$CG,"\n")
#  rAT<-cat("rAT=",Matrix.i$AT,"\n")
 # rCT<-cat("rCT=",Matrix.i$CT,"\n") 
#}
#testpsg<-findMatrix(FileList=InterpretedJSONFiles3)
#anothertestpsg<-lapply(InterpretedJSONFiles3,FUN=findMatrix)
#################################################################  Substitution Matrix ####################################################
for (i in 1:988) {
  CurrentFileName <-names(InterpretedJSONFiles3)
  EachEntryName<-names(InterpretedJSONFiles3[names(InterpretedJSONFiles3)==CurrentFileName][])
  #CurrentFileName.i<-EachEntryName #Gets mad here
  #File2BCreated<-paste(CurrentFileName.i,".switches.txt", sep="")  
  File2BCreated<-paste(EachEntryName,".switches.txt", sep="")
  file.create(File2BCreated)
}

for (i in 1:988){
  EachEntry<-InterpretedJSONFiles3[names(InterpretedJSONFiles3)==CurrentFileName][]
  #Matrix.i<-EachEntry[[1]]$subs_matrix
  #file.append(file=File2BCreated[i], append=T)
  sink(file=File2BCreated[i])
  rCA<-cat("rCA=",EachEntry[[i]]$subs_matrix$AC,"\n")
  rTG<-cat("rTG=",EachEntry[[i]]$subs_matrix$GT,"\n")
  rAG<-cat("rAG=",EachEntry[[i]]$subs_matrix$AG,"\n")
  rCG<-cat("rCG=",EachEntry[[i]]$subs_matrix$CG,"\n")
  rAT<-cat("rAT=",EachEntry[[i]]$subs_matrix$AT,"\n")
  rCT<-cat("rCT=",EachEntry[[i]]$subs_matrix$CT,"\n")
  sink()
}
######################################################  Percents ###################################################################
for (i in 1:988) {
  CurrentFileName <-names(InterpretedJSONFiles3)
  EachEntryName<-names(InterpretedJSONFiles3[names(InterpretedJSONFiles3)==CurrentFileName][])
  #CurrentFileName.i<-EachEntryName #Gets mad here
  #File2BCreated<-paste(CurrentFileName.i,".switches.txt", sep="")  
  File2BCreated_Percents<-paste(EachEntryName,".Percents.txt", sep="")
  file.create(File2BCreated_Percents)
}

for (i in 1:988){
  EachEntry<-InterpretedJSONFiles3[names(InterpretedJSONFiles3)==CurrentFileName][]
  sink(file=File2BCreated_Percents[i])
  PiSymbolA<-cat("piA=",EachEntry[[i]]$freqs$A,"\n")
  PiSymbolC<-cat("piC=",EachEntry[[i]]$freqs$C,"\n")
  PiSymbolT<-cat("piT=",EachEntry[[i]]$freqs$T,"\n")
  sink()
}
################################################  Rates ################################################################################
for (i in 1:988) {
  CurrentFileName <-names(InterpretedJSONFiles3)
  EachEntryName<-names(InterpretedJSONFiles3[names(InterpretedJSONFiles3)==CurrentFileName][])
  #CurrentFileName.i<-EachEntryName #Gets mad here
  #File2BCreated<-paste(CurrentFileName.i,".switches.txt", sep="")  
  File2BCreated_Rates<-paste(EachEntryName,".Rates.txt", sep="")
  file.create(File2BCreated_Rates)
}

for (i in 1:988){
  EachEntry<-InterpretedJSONFiles3[names(InterpretedJSONFiles3)==CurrentFileName][]
  sink(file=File2BCreated_Rates[i])
  cat(EachEntry[[i]]$rates$rate,sep=",")
  sink()
}
