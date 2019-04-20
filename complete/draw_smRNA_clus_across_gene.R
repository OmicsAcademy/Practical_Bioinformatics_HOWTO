pdf("smRNA_cluster_across_gene.gitb.pdf", width=5, height=5);
cc<-read.table("complete/smRNA_cluster_across_gene.tab");
cc$V3=100*cc$V2/sum(cc$V2);
plot(lowess(cc[,3], f = 0.03),axes=FALSE,xlab="",ylab="",type="l",col="royalblue",lwd=2);
axis(2);
axis(1,label=FALSE,tick=FALSE);
mtext(c("Gene"),side=1,line=0.5);
mtext(c("Percentage (%)"),side=2,line=2);
abline(v = 20.5,lty = "dashed");
abline(v = 120.5,lty = "dashed");

ee<-read.table("complete/smRNA_cluster.diff_expr.across_gene.tab");
ee$V3=100*ee$V2/sum(ee$V2);
lines(lowess(ee[,3], f = 0.03),col="darkred",lwd=2);

legend("topright", legend=c("All smRNA", "Diff-expr smRNA cluster"), col=c("royalblue", "darkred"), lty=c(1,1), lwd=2)

box();
dev.off()
