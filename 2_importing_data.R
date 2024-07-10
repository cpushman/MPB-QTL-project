#library(qtl)

#imported offspring data and formatted
qtl=read.table ("/Users/cpushman/Documents/MPBQTL/offspring_calls.txt", sep="", header=TRUE)#as.character(qtl)
rad_new = as.data.frame(sapply(qtl,function(x) gsub("A/C|A/T|A/G|C/A|C/G|C/T|G/A|G/C|G/T|T/A|T/C|T/G","H",x)))
rad_new1 = as.data.frame(sapply(rad_new,function(x) gsub("A/A","A",x)))
rad_new2 = as.data.frame(sapply(rad_new1,function(x) gsub("C/C","C",x)))
rad_new3 = as.data.frame(sapply(rad_new2,function(x) gsub("G/G","G",x)))
rad_new4 = as.data.frame(sapply(rad_new3,function(x) gsub("T/T","T",x)))
ddRADstest= as.data.frame(sapply(rad_new4,function(x) gsub("./.","NA",x)))
ddRADs <- data.frame(lapply(rad_new4, as.character), stringsAsFactors=FALSE)
correct_orientation_for_RQTL = t(ddRADstest)
write.table(correct_orientation_for_RQTL, "/Users/cpushman/Documents/MPBQTL/RQTL_data.txt", sep="\t")

#did same thing with the parent (1000_10) 
parent1positions2 = as.data.frame(sapply(parent1positions1,function(x) gsub("A/A","A",x)))
parent1positions3 = as.data.frame(sapply(parent1positions2,function(x) gsub("C/C","C",x)))
parent1positions4 = as.data.frame(sapply(parent1positions3,function(x) gsub("G/G","G",x)))
parent1positions5 = as.data.frame(sapply(parent1positions4,function(x) gsub("T/T","T",x)))
write.csv(parent1positions5, "parent1_correct.csv")

#joined them in excel (imported as offspring_and_parent1_data)
#replaced a/c/g/t with p1, p2, or mis
for(i in 1:nrow(offspring_and_parent1_data)){
  for(j in 2:ncol(offspring_and_parent1_data)){
    if(offspring_and_parent1_data$parent1[i]!=offspring_and_parent1_data[i,j] & offspring_and_parent1_data [i,j] != "H" & offspring_and_parent1_data[i,j]!="mis"){
      offspring_and_parent1_data[i,j]<-"P2"
    }
    if(offspring_and_parent1_data$parent1[i]==offspring_and_parent1_data[i,j]){
      offspring_and_parent1_data[i,j]<-"P1"
    }
  }
}
#try w new file
for(i in 1:nrow(opd1)){
  for(j in 2:ncol(opd1)){
    if(opd1$parent1[i]!=opd1[i,j] & opd1 [i,j] != "H" & opd1[i,j]!="mis"){
      opd1[i,j]<-"P2"
    }
    if(opd1$parent1[i]==opd1[i,j]){
      opd1[i,j]<-"P1"
    }
  }
}

#replace p1, p2, and mis with a, b, and na respectively
opd1[opd1=="mis"] = "NA"
opd1[opd1=="P1"] = "A"
opd1[opd1=="P2"] = "B"

correct_orientation_QTL = t(opd1)
write.csv(correct_orientation_QTL, "\\Users\\cpushman\\Documents\\MPBQTL\\RQTL_ready.csv")