#vocalnoRNaSEQ

exactTest(y)

et <- exactTest(y_rep)
top<-topTags(et,n=1000000)
et_fdr
et_fdr$sig_p[(et_fdr$FDR > 0.05|et_fdr$FDR=="NA")] = "no"
et_fdr$sig_p[et_fdr$FDR < 0.05] = "sig"
labeled_gene<-c("MERVL","MERVL_LTR","Gm4340","Zscan4c","Gm5662","Gm2022", "Gm4027","Gm8300","Spz1","Zfp352","Duxf3")

  ggplot(deta,aes(logFC,-1*log10(FDR),color = sig_p))+geom_point(size=0.8)+ylim(0,100)+
xlim(-3,3) +  labs(x="log2(FoldChange)",y="-log10(FDR)")+scale_color_manual(values =c("grey","purple","cornflowerblue"))+
geom_text_repel(data = df_va[rownames(df_va)%in% c("WT1"),], aes(label =id),size = 5,color="black",box.padding = unit(1, "lines"),

et_fdr$id=rownames(et_fdr)       
                
                         ggplot(et_fdr,aes(logFC,-1*log10(FDR),color = sig_p))+geom_point(size=0.8)+ylim(0,30)+
                  xlim(-5,3) +  labs(x="log2(FoldChange)",y="-log10(FDR)")+scale_color_manual(values =c("grey","purple","cornflowerblue"))+geom_text_repel(data = et_fdr[rownames(et_fdr)%in% labeled_gene,], aes(label =id),size = 5,color="black",box.padding = unit(1, "lines"),point.padding = unit(0.8, "lines"), segment.color = "black", show.legend = FALSE)+theme_bw()

                      
                         
sum(et_fdr$logFC>=1 & et_fdr$FDR<=0.05)
