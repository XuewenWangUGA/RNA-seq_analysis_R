# GOseq_script.R
library(goseq)
##all DEseq output as input here
all.genes <- read.table(file="DEG_Deseq_result.gene.txt", header=TRUE)
all.genes <- as.data.frame(all.genes)
rownames(all.genes) <- all.genes[,1]
genes <- as.integer(all.genes$padj < 0.05 & abs(all.genes$log2FoldChange)>=1)
names(genes) <- row.names(all.genes)
genes <- na.omit(genes)
glength<- read.table(file="DEG_Deseq_result.gene.filter.id.list.len", header=FALSE)
glen <- glength[,2]
pwf = nullp(genes, bias.data=as.vector(glen))
getko <- read.table("DEG_Deseq_result.gene.filter.id.list.go.NA.txt", header=F, sep="\t", fill=T)
GO.wall <- goseq(pwf, gene2cat=getko[,c(1,2)])
##> head(GO.wall,3)
## category over_represented_pvalue under_represented_pvalue numDEInCat numInCat
## category over_represented_pvalue under_represented_pvalue numDEInCat numInCat
##67 ko04111
 0.001520392
 0.9997066
 22
 26
##8 ko00196
 0.003058524
 0.9989970
 28
 39
##68 ko04113
 0.009473834
 0.9985285
 14
 16
 
