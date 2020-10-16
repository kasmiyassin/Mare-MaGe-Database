##########################
#13 april 2020
#first step of NCBI data fitltration
#########################
#upload data and save
#merge table
library(dplyr)
#  union two dataframes  without duplicates
#NCBI_unnion <- union(NCBI_001,NCBI_002,NCBI_003,NCBI_004,NCBI_005,NCBI_006,NCBI_007,NCBI_008,NCBI_009,NCBI_010,NCBI_011)
# merge tables vertically without fitlration
NCBI_bind_rows <- bind_rows(NCBI_001,NCBI_002,NCBI_003,NCBI_004,NCBI_005,NCBI_006,NCBI_007,NCBI_008,NCBI_009,NCBI_010,NCBI_011)

#remove duplicate from NCBI_bind_rows
library(tidyverse)

# to identifiy duplicate
#duplicated(x) # it will allaw you to know diplucate
#you can remove duplicated elements, use !duplicated(), where ! is a logical negation:
NCBI_Duplicated <- NCBI_bind_rows[!duplicated(NCBI_bind_rows$TSeq_accver), ]

# Remove duplicated rows based on Sepal.Length and Petal.Width
#NCBI_distinct <- NCBI_bind_rows %>% distinct(TSeq_accver, .keep_all = TRUE)

# keep only main data
NCBI_data_raw <- NCBI_Duplicated[, 3:8]

#duplicate accession version
NCBI_data_raw$accession_version = NCBI_data_raw$TSeq_accver

#rename column 
NCBI_data_raw <-NCBI_data_raw %>% 
  rename(
    accession = TSeq_accver,
    idtaxa = TSeq_taxid,
    organism = TSeq_orgname,
    info = TSeq_defline,
    seqlength = TSeq_length,
    sequence = TSeq_sequence
  )

# separate accesion by Char(.)#####
#require(reshape)
#df = transform(NCBI_data_raw, accession = colsplit(accession, split = "\\.", names = c('a', 'b')))
df = separate(data = NCBI_data_raw, col = accession, into = c("accession", "version_code"), sep = "\\.")

#remove version
NCBI_data_raw_df <- df[,-2]
head(NCBI_data_raw_df)

#convert all to CSV
write.csv(NCBI_data_raw_df,"NCBI_data_raw_df.csv")


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
