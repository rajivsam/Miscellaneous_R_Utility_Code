library(sampling)
fp = "/home/admin123/homals_analysis/Concrete_Data_Discretized.csv"
cdf = read.csv(fp, header=TRUE)
#duplicated elements
u = unique(cdf[duplicated(cdf),])
dr = unique(cdf)
attach(cdf)
a = aggregate(cdf, by = list(Cement_Comp_1_D, Blast_Furnace_Slag_Comp2_D), FUN = length)[, 1:3]
names(a) = c("Cement Component", "Blast Furnace Slag", "Counts")

