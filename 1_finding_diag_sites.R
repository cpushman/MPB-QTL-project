#wax = read.table ("no_hets_no_missing_parents.tab", sep="", header=T, na.strings="./.")
# largest mean depth: 1000_10, V5
#largest mean depth: 2000_4, V46

#get just highest mean coverage parents- I figured out what columns were wat parents by looking at parent VCF and manually counting/double checked by comparing reads (not fun)
#parentsdata <- no_hets_no_missing_parents[c("V1","V2","V3","V5", "V46")]
#get rid of columns with na sites
#just_positions<-na.omit(parentsdata)
#get rid of columns where parent 1 = parent 2
#just_positions_no_matching<-subset(just_positions, V5 != V46)
#remove parent genome- just need cfirst and second column for vcf
#just_positions_forVCF <- just_positions_no_matching[c("V1","V2")]
#write.csv(just_positions_forVCF, "just_positions_forVCF.csv")

#Then turn csv to tab delim and use
#THIS WAS WRONG! REDID WRITE.CSV WITH just_positions_no_matching
#write.csv(just_positions_no_matching, "parent_positions.csv")

#still not working- remove reference (this ended up working)
#parentpositions<-just_positions_no_matching[,c('V1','V2','V5','V46')]
#write.csv (parentpositions, "parentpositions2.csv")

#stuff for testing 1000_10 vs 14
#just_positionstest10vcf <- parentsdata[c("V1","V2", "V3", "V5")]
#just_positions_no_matchingtest14_1 <- no_hets_no_missing_parents[c("V1","V2","V3","V6")]
                                      