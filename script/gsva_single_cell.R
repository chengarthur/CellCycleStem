###sort_filled_sub2
sort_filled_sub6_count<-as.matrix(sort_filled_6g@assays$RNA@data)
  fill_gene_toname<-bitr(rownames(sort_filled_sub6_count),fromType = "SYMBOL",toType ="ENTREZID",OrgDb = "org.Mm.eg.db")
sort_filled_sub6_count<-sort_filled_sub6_count[fill_gene_toname$SYMBOL,]
identical(fill_gene_toname$SYMBOL,rownames(sort_filled_sub6_count)) 
rownames(sort_filled_sub6_count)<-fill_gene_toname$ENTREZID

sfs_gsva_G_test<-gsva(sort_filled_sub6_count,Mm.c2,mx.diff=TRUE,abs.ranking=TRUE, kcdf="Gaussian",min.sz=2,max.sz=9999)

sfs_gsva_Possion_Go_test<-gsva(sort_filled_sub6_count,Mm.c5,mx.diff=TRUE,abs.ranking=TRUE, kcdf="Poisson",min.sz=5,max.sz=9999)
gesa_default<-GSEA(GENElist0.05,TERM2GENE = GMT0.05,pvalueCutoff = 100,minGSSize =1 ,maxGSSize = 10000)
#####

gsva_ssf[["gsva"]]<-CreateAssayObject(counts = sfs_gsva,min.cells = 0,min.features = 0) 
gsva_ssf<-NormalizeData(gsva_ssf,assay = "gsva",normalization.method = "CLR")
gsva_ssf<- ScaleData(gsva_ssf, assay = "gsva")
sssmm<-FindAllMarkers(gsva_ssf,assay = "gsva",only.pos = T)
FeaturePlot(gsva_ssf,features = "KEGG-CELL-CYCLE",label = T)+scale_colour_gradientn(,colours = rev(brewer.pal(n = 4, name = "RdYlBu")))
FeaturePlot(gsva_ssf,features = "KEGG-RIBOSOME",label = T)+scale_colour_gradientn(,colours = rev(brewer.pal(n = 4, name = "RdYlBu")))
FeaturePlot(gsva_ssf,features = "KEGG-PENTOSE-PHOSPHATE-PATHWAY",label = T)+scale_colour_gradientn(,colours = rev(brewer.pal(n = 4, name = "RdYlBu")))
FeaturePlot(gsva_ssf,features = "KEGG-MAPK-SIGNALING-PATHWAY",label = T)+scale_colour_gradientn(,colours = rev(brewer.pal(n = 4, name = "RdYlBu")))
