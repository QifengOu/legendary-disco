######### Chi Squared CIBERSORT ############
library(gplots)
library(graphics)
setwd("C:/Users/rbuch/DataShare/cibersort_luad_experiment/Output/RSEM/Chi_squared_analysis")

# Data Import
phenotype_summary_raw <- read.csv("cibersort_parts_of_a_whole_summary_phenotype.csv", row.names = 1, header =  T)
phenotype_total_raw <- read.csv("cibersort_parts_of_a_whole_phenotypes.csv", row.names = 1, header = T)

# Convert to Table
summary_table <- as.table(as.matrix(phenotype_summary_raw))
total_table <- as.table(as.matrix(phenotype_total_raw))

# Balloon Plots
summary_balloon <- balloonplot(t(summary_table), main = "Immune Abundance By Mutational Subtype of NSCLC",
                               xlab = "", ylab = "", label = F, show.margins = F) 

total_balloon <- balloonplot(t(total_table), main = "Immune Abundance By Mutational Subtype of NSCLC",
                               xlab = "", ylab = "", label = F, show.margins = F)
# Mosaic Plots
summary_mosaic <- mosaicplot(summary_table, shade = T, las = 2, main = "Immune Abundance By Mutational Subtype of NSCLC")

total_mosaic <- mosaicplot(total_table, shade = T, las = 2, "Immune Abundance By Mutational Subtype of NSCLC")

# Chi Squared
summary_chi <- chisq.test(phenotype_summary_raw)
total_chi <- chisq.test(phenotype_total_raw)

summary_chi
total_chi

####### RESULT: NO DIFFERENCE IN THE DISTRIUBTION OF GROUPS #########