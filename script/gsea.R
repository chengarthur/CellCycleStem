sort_filled_6g[["gsva"]] <- CreateAssayObject(counts = sfs_gsva_p)
sort_filled_6g_n<- NormalizeData(sort_filled_6g, assay = "gsva", normalization.method = "CLR")
for (i in 1:length(cc)){
pdf(paste0(cc[i],"_",".pdf"),width = 24,height = 5)
print(FeaturePlot(sort_filled_6g,features = cc[i],pt.size = 0.3,split.by = "reid",combine = T,cols = rev(brewer.pal(n = 9, name = "RdYlBu"))))
dev.off()
}
ttt<-y_rep$pseudo.counts
tttt2<-ttt[rownames(ttt)%in% (FDR_gene_toname[FDR_gene_toname$ENTREZID %in% G1_phase$gene,]$SYMBOL),]
tttt2<-ttt[rownames(ttt)%in% m.g2m.genes,]

######
top_anno <- HeatmapAnnotation(
  cluster = anno_block(gp = gpar(fill = color5g), # 设置填充色
                       labels = levels(color5g), 
                       labels_gp = gpar(cex = 0.5, col = "white"))) 
Heatmap(scale(log2(tttt2)),
        cluster_rows = T,,
        cluster_columns = F,show_row_dend=F,
        show_column_names = T,
        show_row_names = T,row_names_gp = gpar(fontsize = 6),col = color1)

color2 <- colorRamp2(c(-1.5, 0, 1.5), c("blue", "white", "red")) 
color1 <- colorRamp2(c(-0.5, 0, 0.5), c("blue", "white", "red")) 
