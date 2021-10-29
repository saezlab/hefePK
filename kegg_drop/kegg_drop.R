library(KEGGREST)
library(KEGG.db)
library(KEGGgraph)
library(org.Sc.sgd.db)
library(hefePK)

pathways_ids <- data.table::setDT(as.data.frame(cbind(KEGGREST::keggList("pathway", "sce"))), keep.rownames = T)
pathways_ids$rn <- gsub("path:","",pathways_ids$rn)

sif_list <- list()
i <- 1
for(pathway in pathways_ids$rn)
{
  print(pathway)
  file_target <- paste("kegg_drop/",paste(pathway,".kgml",sep = ""), sep = "")
  KEGGgraph::retrieveKGML(pathwayid = pathway, organism = "sce", destfile = file_target)
  pathway_sif <- parseKGML2DataFrame(file_target, reactions=FALSE)

  file.remove(file_target)
  sif_list[[i]] <- pathway_sif
  i <- i + 1
}

pathway_sif <- as.data.frame(do.call(rbind,sif_list))
pathway_sif <- pathway_sif[grepl("activation",pathway_sif$subtype) |
                           grepl("inhibition",pathway_sif$subtype),]

prots <- unique(c(pathway_sif$from, pathway_sif$to))

pairs <- seq(0,length(prots),99)
pairs <- c(pairs,length(prots))

mapping_full <- list()
for (i in 1:(length(pairs)-1))
{
  start <- pairs[i] + 1
  end <- pairs[i + 1]
  mapping_full[[i]] <- keggConv("uniprot", prots[start:end], querySize = 100)
}

mapping <- unlist(mapping_full)
dubs <- mapping[duplicated(names(mapping))]
mapping <- gsub("up:","",mapping)

mapping_uniprot_to_symbole <- mapIds(org.Sc.sgd.db, mapping, 'GENENAME','UNIPROT')
mapping_uniprot_to_symbole[duplicated(mapping_uniprot_to_symbole)]

#convert ot uniprot
pathway_sif$from <- mapping[pathway_sif$from]
pathway_sif$to <- mapping[pathway_sif$to]

#convert to names
pathway_sif$from <- mapping_uniprot_to_symbole[pathway_sif$from]
pathway_sif$to <- mapping_uniprot_to_symbole[pathway_sif$to]
pathway_sif$subtype <- ifelse(pathway_sif$subtype == "activation", 1, -1)
pathway_sif <- pathway_sif[,-3]
names(pathway_sif) <- c("source","target","sign")

pathway_sif$database <- "KEGG"
PKN_STRING_yeast <- PKN_STRING_yeast
PKN_STRING_yeast$database <- "STRING"

###NEED TO BIND THEM AND WHEN INCOHERENT TRUST KEGG
