#heatmap
#step1. matrix without downsampling
cluster_info<-sort(heatmap_sort$reid)
mat<-GetAssayData(heatmap_sort,assay = "gsva")
   #mat_scale<-GetAssayData(sort_filled_6g,slot = "scale.data")
geneHeatmap<-unique(geneHeatmap)
mat<-as.matrix(mat[rownames(mat) %in% cc,names(cluster_info)])
#mat_scale<-as.matrix(mat_scale[rownames(mat_scale) %in% cc,names(cluster_info)])
###extra pathsway
EP<-t(data.frame("S.Score"=sort_filled_6g$S.Score,"G2M.Score"=sort_filled_6g$G2M.Score,"repeats_score"=sort_filled_6g$repeats_score_total1))
EP<-EP[,colnames(mat)]
identical(colnames(mat_scale),colnames(EP))
identical(colnames(mat),colnames(EP))
mat<-rbind(mat,EP)
mat_scale<-rbind(mat_scale,EP)
####subset cell
list_new<-read.table(file = "GSVA-2.txt")
list_new<-list_new$V1

cellsub<-subset(sort_filled_6g,seed=42,downsample =300)
cluster_info1<-sort(cellsub$reid)
mat<-GetAssayData(cellsub,assay = "gsva")
list_new<-gsub("_","-",list_new)
mat_tem<-as.matrix(mat[rownames(mat) %in% list_new,names(cluster_info1)])
mat1<-mat_tem[,colnames(mat_tem) %in% colnames(cellsub)]
mat_scale1<-mat_scale[,colnames(mat_scale) %in% colnames(cellsub)]
cluster_info1<-sort(cellsub$reid)
###print
top_anno <- HeatmapAnnotation(
  cluster = anno_block(gp = gpar(fill = color5g), # 设置填充色
                       labels = levels(color5g), 
                       labels_gp = gpar(cex = 0.5, col = "white"))) 
Heatmap(scale(mat1),
        cluster_rows = T,,
        cluster_columns = F,show_row_dend=F,
        show_column_names = F,
        show_row_names = T,row_names_gp = gpar(fontsize = 6),column_split = cluster_info1,top_annotation = top_anno,col = color2)

color2 <- colorRamp2(c(-1.5, 0, 1.5), c("blue", "white", "red")) 
color1 <- colorRamp2(c(-0.5, 0, 0.5), c("blue", "white", "red")) 

