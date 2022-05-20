# 加载R包
library(enrichplot)      # 用于画图
library(clusterProfiler) # 用于基因ID转换
library(org.Mm.eg.db)    # 老鼠基因名数据库，人类为org.Hs.eg.db

# 导入文件
df = read.csv("E:/Project/R/差异分析/expDiff2.csv", head = T)

# 转换基因ID keytypes(org.Mm.eg.db)用于查询支持转换的ID
df_EID <- bitr(
  df$ENSEMBLTRANS,             # 需转换的ID
  fromType = "ENSEMBLTRANS",   # 需转换ID的类型
  toType = "ENTREZID",         # 转化目标ID的类型
  OrgDb = "org.Mm.eg.db"       # 对应物种的数据库，人类为org.Hs.eg.db
)

# 将ENTREZID合并到df数据集中
df_all <- merge(df, df_EID, by = "ENSEMBLTRANS", all = F)

# GAEA
df_all <- df_all[order(df_all$logFC, decreasing = T), ]  # 数据按logFC排列
gene_fc <- df_all$logFC                                  # 构造字典向量
names(gene_fc) <- df_all$ENTREZID                        # 构造字典向量
KEGG <- gseKEGG(gene_fc, organism = "mmu")               # 人类样本organism参数为hsa 详情见http://www.genome.jp/kegg/catalog/org_list.html

# 绘图
gseaplot2(
  KEGG,                           # gseaResult object，即GSEA结果
  "mmu00830",                     # 富集的ID编号，选择表示的通路
  title = "Retinol metabolism",   # 标题
  color = "green",                # GSEA线条颜色
  base_size = 11,                 # 基础字体大小
  rel_heights = c(1.5, 0.5, 1),   # 副图的相对高度
  subplots = 1:3,                 # 要显示哪些副图 如subplots=c(1,3) -只要第一和第三个图，subplots=1 -只要第一个图
  pvalue_table = FALSE,           # 是否添加 pvalue table
  ES_geom = "line"                # running enrichment score用线还是用点ES_geom = "dot"
)



