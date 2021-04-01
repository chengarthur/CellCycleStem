readmtxcount_cc<-function (base.path) 
{
  if (!dir.exists(base.path)) {
    stop("Directory provided does not exist")
  }
  barcode.loc <- file.path(base.path, "alevin", "quants_mat_rows.txt")
  gene.loc <- file.path(base.path, "alevin", "quants_mat_cols.txt")
  matrix.loc <- file.path(base.path, "alevin", "quants_mat.mtx.gz")
  if (!file.exists(barcode.loc)) {
    stop("Barcode file missing")
  }
  if (!file.exists(gene.loc)) {
    stop("Gene name file missing")
  }
  if (!file.exists(matrix.loc)) {
    stop("Expression matrix file missing")
  }
  cell.names <- read.table(file = barcode.loc)
  gene.names <- read.table(file = gene.loc)
  mm_tem<-readMM(file = matrix.loc)
  rownames(mm_tem)<-cell.names$V1
  colnames(mm_tem)<-gene.names$V1
  sort_mm<-as.data.frame(as.matrix(mm_tem))
  return(sort_mm)
}