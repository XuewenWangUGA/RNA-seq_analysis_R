#usage: copy the following lines and paste into R console
## For DEseq2 differential expression analysis of miRNA and mRNA in this study
## For differential expression graph plot
#set working dir
setwd('E:/DEseq/script')
#get read counts called cts, and sample information called coldata
cts <- read.csv(file="miRNA_count.csv", header=TRUE)
rownames(cts)<- cts[,1]
cts<- cts[,-1]
head(cts,3)
##
 Control AHO
##novelMiR_11821 44899 0
##novelMiR_11548 44899 0
##novelMiR_11950 39784 37664
coldata <- read.table(file="colData.txt", header=TRUE)
head(coldata,5)
##
 group treatment
## 1 Tab_Control_S1 Control
## 2 Tab_AHO_S2
 AHO
library("DESeq2")
coldata$treatment = factor(x = coldata$treatment,levels = c('Control', 'AHO'))
#construct DESeq object
dds = DESeqDataSetFromMatrix(countData = cts, colData = coldata, design = ~ treatment)
dds = DESeq(dds)
res = results(dds)
write.table(res, file="DEM_Deseq_result.txt", sep="\t",col.names=NA)
##filtered results of differential expression FC >=2, P<=0.05
DEM_FC2P0.05 <- subset(res, abs(log2FoldChange)>=1 & pvalue<=0.05)
write.table(DEM_FC2P0.05, file="DEM_Deseq_result_FC2P0.05.txt", sep="\t",col.names=NA)
 
