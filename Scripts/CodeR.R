####
# separate accesion by Char(.)#####
library(tidyverse)
df = separate(data = data, col = FullName, into = c("Genus", "Species", "ssp", "others"), sep = "\\ ")

#filtration  
data_fish  <-df[(df$Genus %in% fish$Genus),] 

#Statistic
df_table_Gn <- table(data_fish$Genus)
df_table_Sp <- table(data_fish$organism)
View(df_table_Gn)
# View(df_table_Sp)
# View(df)
# data_fish  <-df[(df$Genus %in% fish$Genus),] 
# df_table_Gn <- table(data_fish$Genus)
# df_table_Sp <- table(data_fish$organism)
# View(df_table_Gn)
View(df_table_Sp)
write.csv(df_table_Gn, "Genus_statistic.csv")
write.csv(df_table_Sp, "Species_statistic.csv")
write.csv(data_fish, "data_fish.csv")

##############################################################"""
##############################################################

merge_df <- merge(data_fish, code, by.x = "GN", by.y = "GN")

############################################################
#############################################################
# Taxonomy
###########################################
#Remove duplicate
taxa_df <- Taxon_df[!duplicated(Taxon_df$Genus), ]
##
fish_df <- Fish_df[,-(3:6)]
View(fish_df)
fish_df <- fish_df[,-(4:7)]
##
#merge Fish avec Taxa
Taxon_df <- merge(fish_df, taxa_df, by = "Genus", all.x = TRUE)
  
#Remove duplicate
Taxa_Family <- Taxa_Family[!duplicated(Taxa_Family$Genus), ]
#merge data taxa
Taxa_merge <- merge(data_fish, taxa_df, by = "Genus", all.x = TRUE)

# separate accesion by Char(.)#####
library(tidyverse)
df = separate(data = data, col = FullName, into = c("Genus", "Species", "ssp", "others"), sep = "\\ ")

#filtration  
data_fish  <-df[(df$Genus %in% fish$Genus),] 

#Statistic
df_table_Gn <- table(data_fish$Genus)
df_table_Sp <- table(data_fish$organism)
View(df_table_Gn)
# View(df_table_Sp)
# View(df)
# data_fish  <-df[(df$Genus %in% fish$Genus),] 
# df_table_Gn <- table(data_fish$Genus)
# df_table_Sp <- table(data_fish$organism)
# View(df_table_Gn)
 View(df_table_Sp)
 write.csv(df_table_Gn, "Genus_statistic.csv")
 write.csv(df_table_Sp, "Species_statistic.csv")
 write.csv(data_fish, "data_fish.csv")

