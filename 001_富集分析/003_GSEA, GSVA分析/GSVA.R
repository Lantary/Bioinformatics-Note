# 加载R包
library(GSVA)            # 用于GSVA分析
library(GSEABase)        # 用于读取文件
library(pheatmap)        # 制作热图

# 文件读取
setwd("工作路径")                                    # 设置工作路径
keggSet = getGmt("基因集文件路径")                   # 读取基因集文件
expmatrix_data = read.table(                         # 读取表达矩阵
  "表达矩阵路径", 
  header = TRUE, 
  skip = 64                                          
)
expmatrix_data[, 2:7] <- log2(expmatrix_data[, 2:7]) # log2化

# GSVA分析
gsva_data <- gsva(
  expr = as.matrix(exp_new),         # 输入表达矩阵
  gset.idx.list = keggSet,           # 输入基因集
  method = "gsva",                   # 选择算法
  kcdf = "none"                      # 选择CDF计算模型,正态，高斯还是泊松
)

# 绘制热图
pheatmap(
  gsva_data,
  show_colnames = T,
  show_rownames = T,
  kmeans_k = NA
)
