ncbi_fish_Gn  <-ncbi_raw[(ncbi_raw$Gn %in% dbfish_name$Genus),]
ena_fish_Gn  <-ena_raw[(ena_raw$Genus16 %in% dbfish_name$Genus),]

fullena_fish_Gn <- fullena[(fullena$ENA_Gn%in% dbfish_name$Genus),]


# Load the package required to read XML files.
library("XML")

# Also load the other required package.
library("methods")

# Give the input file name to the function.
result <- xmlParse(file = "C:/Users/kasmi/Desktop/testxml.xml")

View()# Print the result.
print(result)
sup1000 <- xmlToDataFrame("C:/Users/kasmi/Desktop/testxml.xml")
print(xmldataframe)

nnanimal <- xmlParse("C:/Users/kasmi/Downloads/ena/ena (4).xml")
unanumal <-   xmlEventParse(
  file = "C:/Users/kasmi/Downloads/", 
  handlers =  NULL, 
  branches = list(MedlineCitation = MedlineCitation)
)


xmldoc <- xmlParse("C:/Users/kasmi/Downloads/nonanimal-xml.xml")
rootNode <- xmlRoot(xmldoc)
rootNode[1]



Test <- xmlEventParse(
  file = "C:/Users/kasmi/Downloads/nonanimal-xml.xml", 
  handlers = NULL, 
  branches = list(MedlineCitation = MedlineCitation)
  
  
  
  
  B %>% 
    dplyr::semi_join(A)
  
   
  
  df1$test <- DB_12S_NCBI_modi$INSDSeq_organism %in% data$Species
  Df3  <- [(DB_12S_NCBI_modi$INSDSeq_organism %in% data$Species),]

##########################
#13 april 2020
#first step of ENA data fitltration
##########################
#upload data and save
#Select main column
library(dplyr)
ENA_001_1 <- ENA_001 %>%
  select(.attrs.accession,feature.qualifier.value, description, .attrs.sequenceLength, sequence, reference.author)


#This can also be written without the %>% pipe as:
#select(df1, A, B, E)
#merge table
library(dplyr)
#  union two dataframes  without duplicates
#NCBI_unnion <- union(NCBI_001,NCBI_002,NCBI_003,NCBI_004,NCBI_005,NCBI_006,NCBI_007,NCBI_008,NCBI_009,NCBI_010,NCBI_011)
# merge tables vertically without fitlration
ENA_bind_rows <- bind_rows(ENA_001,ENA_002,ENA_003,ENA_004,ENA_005,ENA_006,ENA_007,ENA_008,ENA_009,ENA_010,ENA_011,ENA_012)

#remove duplicate from NCBI_bind_rows
library(tidyverse)

# to identifiy duplicate
#duplicated(x) # it will allaw you to know diplucate
#you can remove duplicated elements, use !duplicated(), where ! is a logical negation:
ENA_Duplicated <- ENA_bind_rows[!duplicated(ENA_bind_rows$.attrs.accession), ]

# Remove duplicated rows based on Sepal.Length and Petal.Width
#NCBI_distinct <- NCBI_bind_rows %>% distinct(TSeq_accver, .keep_all = TRUE)

# keep only main data
ENA_data_raw <- ENA_Duplicated[, 2:6]

#rename column 
ENA_data_raw <-ENA_data_raw %>% 
    rename(
    accession = .attrs.accession,
    organism = feature.qualifier.value,
    info = description,
    seqlength = .attrs.sequenceLength,
    sequence = sequence
  )

head(NCBI_data_raw)
#convert all to CSV
write.csv(ENA_data_raw,"ENA_data_raw_df.csv")



#1# filtration fish by Genus
ncbi_fish_Gn  <-ncbi_raw[(ncbi_raw$Gn %in% dbfish_name$Genus),]
ena_fish_Gn  <-ena_raw[(ena_raw$Genus16 %in% dbfish_name$Genus),]
fullena_fish_Gn <- fullena[(fullena$ENA_Gn%in% dbfish_name$Genus),]


#2# statisitic
##2-a# selon especs
sum_fullena_sp <- table(fullena_fish_Gn$ENA_Sp)
sum_ncbi_sp <- table(ncbi_fish_Gn$Sp)
sum_ena_sp <- table(ena_fish_Gn$GenreSp)

##2-2# Selon genre
sum_fullena_Gn <- table(fullena_fish_Gn$ENA_Gn)
sum_ncbi_Gn <- table(ncbi_fish_Gn$Gn)
sum_ena_Gn <- table(ena_fish_Gn$Genus16)
View(sum_ena_Gn)
View(sum_ena_sp)

##2-3# Selon fishDB
sum_fishdb_Gn <- table(dbfish_name$Genus)
sum_fishdb_sp <- table(dbfish_name$Species)

##transfer ena_fish_Gn$`Attribute:sequenceLength` to numeric
ena_fish_Gn$`Attribute:sequenceLength` <- as.numeric(as.character(ena_fish_Gn$`Attribute:sequenceLength`))

#3# unic speceis in 
##3-1# NCBI
unic_fullena_ena <- fullena_fish_Gn[!(fullena_fish_Gn$ENA_Sp %in% ena_fish_Gn$GenreSp),]
sum_unic_fullena_ena <- table(unic_fullena_ena$ENA_Gn)

unic_ncb_ena <- ncbi_fish_Gn[!(ncbi_fish_Gn$Sp %in% ena_fish_Gn$GenreSp),]
sum_unic_ncbi_ena_Sp <- table(unic_ncb_ena$Sp)
sum_unic_ncbi_ena_Gn <- table(unic_ncb_ena$Gn)

unic_fullena_unicNCBI <- unic_fullena_ena[!(unic_fullena_ena$ENA_Sp %in% unic_ncb_ena$Sp),]
sum_unic_fullena_unicNCBI_Gn <- table(unic_fullena_unicNCBI$ENA_Gn)
sum_unic_fullena_unicNCBI_Sp <- table(unic_fullena_unicNCBI$ENA_Sp)

#4#♦ to download
#1# filtration fish by Genus
Download_ncbi_sp  <-ncbi_raw[(ncbi_raw$Sp %in% unic_ncb_ena$Sp),]
Download_fullena_sp <- fullena[(fullena$ENA_Sp %in% unic_fullena_unicNCBI$ENA_Sp),]

write.csv(Download_ncbi_sp, "accession_ncbi.csv")
write.csv(Download_fullena_sp, "accession_ena.csv")

#5#♣ Taxonomy preparatioon
library(tidyverse)
# Remove duplicates based on Sepal.Width columns
taxonomy_ncbi <- ncbi_fish_Gn[!duplicated(ncbi_fish_Gn$Sp),]
sum_taxonomy_ncbiGn <- table(taxonomy_ncbi$Gn)
sum_taxonomy_ncbiSp <- table(taxonomy_ncbi$Sp)

write.csv(taxonomy_ncbi, "taxon.csv")



  