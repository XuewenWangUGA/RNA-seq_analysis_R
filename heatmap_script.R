##construct a log2FPKM data file
##instruction from https://www.rdocumentation.org/packages/gplots/versions/3.0.1/topics/heatmap.2
#### the R script to make the heatmap
## to prepare data for heatmap
##to run this part within R console
data <-read.table("degFPKMPlus1log2.txt", header=TRUE, sep="\t")
mat_data <- data.matrix(data[,2:ncol(data)])
rownames(mat_data) <- data[,1]
my_palette <- colorRampPalette(c("green", "yellow", "red"))(n = 60)
heatmap.2(mat_data,
labRow = "",
key.xlab ="",
keysize = 1,
density.info="none",
trace="none
scale="col",
margins =c(9,9),
col=my_palette,
dendrogram="both",
key= TRUE,
key.par=list(mar=c(4.5,0.4,1, 0.2)),
)

 
