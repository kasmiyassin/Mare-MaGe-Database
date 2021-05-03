#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Apr 11 11:00:50 2020

@author: toshiba
"""

import pandas as pd
import xml.etree.ElementTree as et

def parse_XML(xml_file, df_cols):   
    xtree = et.parse(xml_file)
    xroot = xtree.getroot()
    rows = []
    
    for node in xroot: 
        res = []
        res.append(node.attrib.get(df_cols[0]))
        for el in df_cols[1:]: 
            if node is not None and node.find(el) is not None:
                res.append(node.find(el).text)
            else: 
                res.append(None)
        rows.append({df_cols[i]: res[i] 
                     for i, _ in enumerate(df_cols)})
    
    out_df = pd.DataFrame(rows, columns=df_cols)
        
    return out_df




df = parse_XML("/home/toshiba/Téléchargements/Thuenen-Institute/Work/COI/ncbi/sequence.fasta (3).xml", ["TSeq_seqtype", "value", "TSeq_accver", "TSeq_taxid", "TSeq_orgname", "TSeq_defline", "TSeq_length", "TSeq_sequence", "TSeq_sid"])

df = parse_XML("/home/toshiba/Téléchargements/ena.xml", [".attrs.accession", ".attrs.sequenceLength", ".attrs.taxonomicDivision", "feature..attrs.location", "", "feature.taxon..attrs.scientificName", "reference.author", ".attrs.firstPublic", "reference.title"])


df.to_csv (r"/home/toshiba/Téléchargements/export_dataframe.csv", index = False, header=True)

print (df)


df = parse_XML("ena.xml", ["accession", "sequenceLength", "taxonomicDivision", "location", "", "taxon scientificName", "author", "sequence", "title"])



import pandas as pd
import xml.etree.ElementTree as et

def parse_XML(xml_file, df_cols): 
    xtree = et.parse(xml_file)
    xroot = xtree.getroot()
    rows = []
    
    for node in xroot: 
        res = []
        res.append(node.attrib.get(df_cols[0]))
        for el in df_cols[1:]: 
            if node is not None and node.find(el) is not None:
                res.append(node.find(el).text)
            else: 
                res.append(None)
        rows.append({df_cols[i]: res[i] 
                     for i, _ in enumerate(df_cols)})
    
    out_df = pd.DataFrame(rows, columns=df_cols)
        
    return out_df


parse_XML("ena.xml", ["accession", "sequence", "description"])

df.to_csv (r"/home/toshiba/Téléchargements/export_dataframe.csv", index = False, header=True)

print (df)