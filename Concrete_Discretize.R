library(arules)
fp = "/home/admin123/homals_analysis/Concrete_Data.csv"
col.names = c("Cement_Comp_1", "Blast_Furnace_Slag_Comp2",
              "Fly_Ash_Comp_3", "Water_Comp_4",
              "Superplasticizer_Comp_5",
              "Coarse_Aggregate_Comp_6",
              "Fine_Aggregate_Comp_7",
              "Age (day)",
              "Concrete_CS") 

cdf = read.csv(fp)
names(cdf) = col.names
# We don't want the "Age" attribute because it is a count 
cdf = cdf[,-8]
col.names = col.names[-8]
d.col.names = vector()
for (i in seq(1:8)) {
  
  prefix = col.names[i]
  suffix = seq(1:5)
  the.labels = paste(prefix, suffix, sep="#")
  new.name.for.col = paste(col.names[i],"D", sep="_")
  the.col.vals = cdf[,i]
  cdf[,new.name.for.col] = discretize(the.col.vals,method="interval", categories = 5,
                                 labels = the.labels)
  d.col.names <<- c(d.col.names, new.name.for.col)
  
  
}
cdf = cdf[d.col.names]
fp2 = "/home/admin123/homals_analysis/Concrete_Data_Discretized.csv"
write.table(cdf, fp2, sep = ",", col.names = TRUE, row.names = FALSE)
fp3 = "/home/admin123/homals_analysis/Concrete_Data_Discretized_RN.csv"
write.table(d.col.names, fp3, sep = ",", col.names = TRUE, row.names = FALSE)