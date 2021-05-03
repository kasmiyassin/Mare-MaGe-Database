
#To download the sequences from NCBI by R we used
#call packages.
###################
packages = c("ape", "rentrez")
package.check <- lapply(
  packages,
  FUN = function(x) {
    if (!require(x, character.only = TRUE)) {
      install.packages(x, dependencies = TRUE)
      library(x, character.only = TRUE)
    }
  }
)

setwd("path")

## import the sequence list from a CSV file which include the codes preparer by command esearch in unix
#thought ubuntu esearch -db nuccore -query "Gadus ... condition"  |efetch -format xml > COI.xml
# or download them directly from Web site


## NO "strings as factor"
coi <- read.table("/COI.csv",
                  quote="\"", stringsAsFactors=FALSE)

## convert to character lists
as.list(coi)$V1 -> coi_list

## see how it's formatted
str(coi_list)


## use read.GenBank to acquire the sequences
coi_gen <- read.GenBank(coi_list, species.names = TRUE)

## but note that these are named according to the sequence ID
coi_gen




