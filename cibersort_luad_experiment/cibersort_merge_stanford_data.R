#### ----------------------------------------------------------------------------------- ####
########################### MCP-Counter Abundance Analysis ##################################
#### ----------------------------------------------------------------------------------- ####

mypackages <- c("GSVA", "GSEABase", "Biobase", "genefilter",
                "limma", "RColorBrewer", "scales", "dplyr")
lapply(mypackages, library, character.only = T)



### Abundance Analysis ###

# Import CIBERSORT Export Data
setwd("C:/Users/rbuch/DataShare/cibersort_luad_experiment/Output/RSEM/Raw")
df <- read.csv("CIBERSORT.Output_1000_permutations_rsem.csv", header = T)
setwd("C:/Users/rbuch/DataShare/mutations_for_alignment/")
detailed_mt <- read.csv("KRAS_STK11_plus_dbl_tidy_vs_other.csv", header = T)

# Re-name First column and Merge
colnames(df)[colnames(df)=="Input.Sample"] <- "Patient.ID"
output_merged <- merge(df, detailed_mt)

output_arranged <- arrange(output_merged, as.character(Mutation_Status))

setwd("C:/Users/rbuch/DataShare/cibersort_luad_experiment/Output/RSEM/")
write.csv(output_arranged, "cibersort_1000_permutations_output_merged.csv", row.names = F)

