##plot graph
##construct data frame with fold change and p value from res or input data file
tab = data.frame(log2FC = res$log2FoldChange, negLogPval = -log10(res$pvalue))
par(mar = c(5, 4, 4, 4))
plot(tab, pch = 16, cex = 0.6, xlab = expression(log[2]~FC), ylab = expression(-log[10]~pvalue))
signGenes = (tab$log2FC > 1 & tab$negLogPval > -log10(0.05))
points(tab[signGenes, ], pch = 16, cex = 0.5, col = "red")
signGenes = (tab$log2FC < -1 & tab$negLogPval > -log10(0.05))
points(tab[signGenes, ], pch = 16, cex = 0.5, col = "green")
abline(h = -log10(0.05), col = "orange", lty = 2)
abline(v = c(-1, 1), col = "blue", lty = 2)
 
