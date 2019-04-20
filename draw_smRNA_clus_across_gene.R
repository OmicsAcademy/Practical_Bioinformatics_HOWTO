pdf("smRNA_cluster_across_gene.gitb.pdf", width=5, height=5);
cc<-read.table("smRNA_cluster_across_gene.gitb.tab");
cc$V3=100*cc$V2/sum(cc$V2);
plot(lowess(cc[,3], f = 0.03),axes=FALSE,xlab="",ylab="",type="l",col="royalblue",lwd=2);
axis(2);
axis(1,label=FALSE,tick=FALSE);
mtext(c("Gene"),side=1,line=0.5);
mtext(c("Percentage (%)"),side=2,line=2);
abline(v = 20.5,lty = "dashed");
abline(v = 120.5,lty = "dashed");

dd<-read.table("smRNA_clus.P60vsCK60.fil_p1.across_gene.tab");
dd$V3=100*dd$V2/sum(dd$V2);
lines(lowess(dd[,3], f = 0.03),col="darkred",lwd=2);

ee<-read.table("smRNA_clus.P96vsCK96.fil_p1.across_gene.tab");
ee$V3=100*ee$V2/sum(ee$V2);
lines(lowess(ee[,3], f = 0.03),col="#0072B5",lwd=2);

legend("topright", legend=c("All smRNA", "Diff-expr smRNA cluster(60)", "Diff-expr smRNA cluster(96)"), col=c("royalblue", "darkred", "#0072B5"), lty=c(1,1,1), lwd=2)

box();
dev.off()
