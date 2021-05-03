
# The objective of this code is to convert xml file to csv
#######################

library(tidyverse)
library(XML)
library(purrr)
library(dplyr)
library(tidyr)
      
setwd ("path")
df = xmlInternalTreeParse("/ena.xml")
df_root = xmlRoot(df)
df_children = xmlChildren(df_root)

df_flattened = map_dfr(df_children,  ~.x %>% 
                         xmlToList() %>% 
                         unlist %>% 
                         stack %>% 
                         mutate(ind = as.character(ind),
                                ind = make.unique(ind)) %>% # for duplicate identifiers
                           spread(ind, values))

  write.csv(df_flattened,"/ena.csv")
rm(list = ls())
gc()


MedlineCitation = function(x, ...) {
  #This is a "branch" function
  #x is a XML node - everything inside element <MedlineCitation>
  # find element <ArticleTitle> inside and print it:
  ns <- getNodeSet(x,path = "//ArticleTitle")
  value <- xmlValue(ns[[1]])
  print(value)
}
Call XML parsing:
  
  xmlEventParse(
    file = "http://www.nlm.nih.gov/databases/dtd/medsamp2015.xml", 
    handlers = NULL, 
    branches = list(MedlineCitation = MedlineCitation)
  )
