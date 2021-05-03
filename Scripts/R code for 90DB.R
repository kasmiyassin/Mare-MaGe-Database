
##little of stqtisitic
nb_sp <- length(unique(Taxom_data$Spieces))
nb_sp
length(sp_more10$species)*100/nb_sp

nb_gn <- length(unique(Taxom_data$Genus...15))
nb_gn
100*length(gn_more10$Genus)/nb_gn


#detemin nb des esp en function

sp_freq <- table(seq_data$Spieces2)
View(sp_freq)
sp_freq <- as.data.frame(sp_freq)
colnames(sp_freq) <- c("species", "frequency")
sp_freq$Freq
sp_more10 <- subset(sp_freq, sp_freq$frequency >= 10)
length(sp_more10$species)

#detemin nb des genre en function

gn_freq <- table(seq_data$Genus2)
View(gn_freq)
gn_freq <- as.data.frame(gn_freq)
colnames(gn_freq) <- c("Genus", "frequency")
gn_freq$frequency
gn_more10 <- subset(gn_freq, gn_freq$frequency >= 10)
View(gn_more10)
length(gn_more10$Genus)

#filltrate from Sp
sp90  <-seq_data[(seq_data$Spieces2 %in% sp_more10$species),]
gn90 <-seq_data[(seq_data$Genus2 %in% gn_more10$Genus),]
View(gn90)

### copy cell if it is in other

DF1$Z <- sapply(1:nrow(DF1), function(i) DF2$Z[DF2$X==DF1$X[i] & DF2$Y==DF1$Y[i]]) seems to be taking roughly a quarter of the time of your for loop.

df1$Z <- sapply(1:nrow(df1), function(i) codage$num[codage$`species unic`==df1$Spieces2[i]]) 



df1 = duplicate_sp_but_new_seq
df2 = accessionncbi_codes

df1$Z <- sapply(1:nrow(df1), function(i) df2$INSDSeq_length[df2$`INSDSeq_primary-accession`==df1$code]) 
df1$C <- sapply(1:nrow(df1), function(i) df2$INSDSeq_length[df2$`INSDSeq_accession-version`==df1$accession]) 
df

Taxonomy$Spieces
accession$species
taxonomy_merge <- merge(Taxonomy, accession, by.x = "Spieces", by.y = "species", all.y = TRUE)

C:\Users\kasmi\Desktop\12sDB_90\seq_all_90.fasta

data("C:/Users/kasmi/Desktop/12sDB_90/seq_all_90.fasta")
write.fasta(sequences = "C:/Users/kasmi/Desktop/12sDB_90/seq_all_90.fasta", names = names(PROTEIN.fasta), file.out = "C:/Users/kasmi/Desktop/12sDB_90/seq_all_90PROTEIN.fasta")

UploadFile("PROTEIN.fasta", filetype="FASTA-0")
Muscle("PROTEIN.fasta", aln.filetype="FASTA", job.name="muscleAAfasta")
filein <- "C:/Users/kasmi/Desktop/12sDB_90/seq_all_90.fasta"
align.muscle(filein , fileout = "C:/Users/kasmi/Desktop/12sDB_90/seq_all_9.fasta", gapopen = gapopen, maxiters = maxiters, gapextend = gapextend, call)


aln <- import.fasta(system.file("C:/Users/kasmi/Desktop/12sDB_90/seq_all_90.fasta", package = "Bios2cor"))
dnafile <- system.file("C:/Users/kasmi/Desktop/12sDB_90/seq_all_90.fasta", package = "seqinr")
dnafile <- read.fasta(file = "C:/Users/kasmi/Desktop/12sDB_90/seq_all_90.fasta", as.SeqFastadna() = TRUE)
"C:/Users/kasmi/Desktop/12sDB_90/seq_all_90.fasta"
read.fasta(file = dnafile, as.tring = TRUE)
read.fasta(file = dnafile)

library(muscle)
library(stringr)
library(Bios2cor)
library(Biostrings)
library(msa)
myseqs <- readDNAStringSet("C:/Users/kasmi/Desktop/12sDB_90/seq_all_90.fasta", "fasta")
myseqs
aln <- muscle(myseqs)


aln <- import.fasta(system.file("C:/Users/kasmi/Desktop/12sDB_90/seq_all_90.fasta", package = "Bios2cor"))






library(Biostrings)
myseqs <- readDNAStringSet("C:/Users/kasmi/Desktop/12sDB_90/seq_all_90.fasta", "fasta")
myseqs

aln <- muscle(myseqs)





filepath <- system.file("seq_all_90", "C:/Users/kasmi/Desktop/12sDB_90/seq_all_90.fasta", package="msa")
mySeqs <- readAAStringSet(filepath)

## call msaClustalW with default values
msaClustalW(myseqs)


northseafish_wikide <- taxa[(taxa$Genus %in% list_species_north_sea_in_12sDB$Acanthostracion),]


northseafish_species_wiki <- taxa[(taxa$Spieces %in% Mappe1$`Scientific name`),]
northseafish_species1 <- taxa[(taxa$Spieces %in% Taxonomy$Species),]

stat_genus <- table(northseafish_Genus$Genus)
stat_species <- table(northseafish_species$Spieces)
stat_species1 <- table(northseafish_wikide$Genus)
View(stat_species1)
write.csv(stat_genus,"genus north sea.csv")
write.csv(stat_species1,"northseawikipediade.csv")


ncbi_fish_Gn  <-ncbi_raw[(ncbi_raw$Gn %in% dbfish_name$Genus),]
ena_fish_Gn  <-ena_raw[(ena_raw$Genus16 %in% dbfish_name$Genus),]
fullena_fish_Gn <- fullena[(fullena$ENA_Gn%in% dbfish_name$Genus),]




F1R1_merge <- merge(taxa, F1R1, by.x = "Code_12sDB", by.y = "F1R1", all = FALSE)
F1R1_sp <- table(F1R1_merge$Spieces)
F1R1_gn <- table(F1R1_merge$Genus)


F1_merge <- merge(taxa, F1, by.x = "Code_12sDB", by.y = "F1", all = FALSE)
F1_sp <- table(F1_merge$Spieces)
F1_gn <- table(F1_merge$Genus)

F2_merge <- merge(taxa, F2, by.x = "Code_12sDB", by.y = "F2", all = FALSE)
F2_sp <- table(F2_merge$Spieces)
F2_gn <- table(F2_merge$Genus)


R1_merge <- merge(taxa, R1, by.x = "Code_12sDB", by.y = "R1", all = FALSE)
R1_sp <- table(R1_merge$Spieces)
R1_gn <- table(R1_merge$Genus)

F2R1_merge <- merge(taxa, F2R1, by.x = "Code_12sDB", by.y = "F2R1", all = FALSE)
F2R1_sp <- table(F2R1_merge$Spieces)
F2R1_gn <- table(F2R1_merge$Genus)

write.csv()

All_Gn <- rbind(data.frame(F1_gn), data.frame(F1R1_gn), data.frame(F2_gn), data.frame(F2R1_gn), data.frame(R1_gn))
All_Sp <- rbind(data.frame(F1_sp), data.frame(F1R1_sp), data.frame(F2_sp), data.frame(F2R1_sp), data.frame(R1_sp))

View(F1_gn)



f1 = duplicate_sp_but_new_seq
df2 = accessionncbi_codes

df1$Z <- sapply(1:nrow(df1), function(i) df2$INSDSeq_length[df2$`INSDSeq_primary-accession`==df1$code]) 
df1$C <- sapply(1:nrow(df1), function(i) df2$INSDSeq_length[df2$`INSDSeq_accession-version`==df1$accession]) 
df

Taxonomy$Spieces
accession$species
taxonomy_merge <- merge(Taxonomy, accession, by.x = "Spieces", by.y = "species", all.y = TRUE)

C:\Users\kasmi\Desktop\12sDB_90\seq_all_90.fasta

data("C:/Users/kasmi/Desktop/12sDB_90/seq_all_90.fasta")
write.fasta(sequences = "C:/Users/kasmi/Desktop/12sDB_90/seq_all_90.fasta", names = names(PROTEIN.fasta), file.out = "C:/Users/kasmi/Desktop/12sDB_90/seq_all_90PROTEIN.fasta")

UploadFile("PROTEIN.fasta", filetype="FASTA-0")
Muscle("PROTEIN.fasta", aln.filetype="FASTA", job.name="muscleAAfasta")
filein <- "C:/Users/kasmi/Desktop/12sDB_90/seq_all_90.fasta"
align.muscle(filein , fileout = "C:/Users/kasmi/Desktop/12sDB_90/seq_all_9.fasta", gapopen = gapopen, maxiters = maxiters, gapextend = gapextend, call)


aln <- import.fasta(system.file("C:/Users/kasmi/Desktop/12sDB_90/seq_all_90.fasta", package = "Bios2cor"))
dnafile <- system.file("C:/Users/kasmi/Desktop/12sDB_90/seq_all_90.fasta", package = "seqinr")
dnafile <- read.fasta(file = "C:/Users/kasmi/Desktop/12sDB_90/seq_all_90.fasta", as.SeqFastadna() = TRUE)
"C:/Users/kasmi/Desktop/12sDB_90/seq_all_90.fasta"
read.fasta(file = dnafile, as.tring = TRUE)
read.fasta(file = dnafile)

library(muscle)
library(stringr)
library(Bios2cor)
library(Biostrings)
library(msa)
myseqs <- readDNAStringSet("C:/Users/kasmi/Desktop/12sDB_90/seq_all_90.fasta", "fasta")
myseqs
aln <- muscle(myseqs)


aln <- import.fasta(system.file("C:/Users/kasmi/Desktop/12sDB_90/seq_all_90.fasta", package = "Bios2cor"))






library(Biostrings)
myseqs <- readDNAStringSet("C:/Users/kasmi/Desktop/12sDB_90/seq_all_90.fasta", "fasta")
myseqs

aln <- muscle(myseqs)





filepath <- system.file("seq_all_90", "C:/Users/kasmi/Desktop/12sDB_90/seq_all_90.fasta", package="msa")
mySeqs <- readAAStringSet(filepath)

## call msaClustalW with default values
msaClustalW(myseqs)


northseafish_wikide <- taxa[(taxa$Genus %in% list_species_north_sea_in_12sDB$Acanthostracion),]


northseafish_species_wiki <- taxa[(taxa$Spieces %in% Mappe1$`Scientific name`),]
northseafish_species1 <- taxa[(taxa$Spieces %in% Taxonomy$Species),]

stat_genus <- table(northseafish_Genus$Genus)
stat_species <- table(northseafish_species$Spieces)
stat_species1 <- table(northseafish_wikide$Genus)
View(stat_species1)
write.csv(stat_genus,"genus north sea.csv")
write.csv(stat_species1,"northseawikipediade.csv")


ncbi_fish_Gn  <-ncbi_raw[(ncbi_raw$Gn %in% dbfish_name$Genus),]
ena_fish_Gn  <-ena_raw[(ena_raw$Genus16 %in% dbfish_name$Genus),]
fullena_fish_Gn <- fullena[(fullena$ENA_Gn%in% dbfish_name$Genus),]








F1R1_merge <- merge(taxa, F1R1, by.x = "Code_12sDB", by.y = "F1R1", all = FALSE)
F1R1_sp <- table(F1R1_merge$Spieces)
F1R1_gn <- table(F1R1_merge$Genus)


F1_merge <- merge(taxa, F1, by.x = "Code_12sDB", by.y = "F1", all = FALSE)
F1_sp <- table(F1_merge$Spieces)
F1_gn <- table(F1_merge$Genus)

F2_merge <- merge(taxa, F2, by.x = "Code_12sDB", by.y = "F2", all = FALSE)
F2_sp <- table(F2_merge$Spieces)
F2_gn <- table(F2_merge$Genus)


R1_merge <- merge(taxa, R1, by.x = "Code_12sDB", by.y = "R1", all = FALSE)
R1_sp <- table(R1_merge$Spieces)
R1_gn <- table(R1_merge$Genus)

F2R1_merge <- merge(taxa, F2R1, by.x = "Code_12sDB", by.y = "F2R1", all = FALSE)
F2R1_sp <- table(F2R1_merge$Spieces)
F2R1_gn <- table(F2R1_merge$Genus)

write.csv()

All_Gn <- rbind(data.frame(F1_gn), data.frame(F1R1_gn), data.frame(F2_gn), data.frame(F2R1_gn), data.frame(R1_gn))
All_Sp <- rbind(data.frame(F1_sp), data.frame(F1R1_sp), data.frame(F2_sp), data.frame(F2R1_sp), data.frame(R1_sp))

View(F1_gn)




