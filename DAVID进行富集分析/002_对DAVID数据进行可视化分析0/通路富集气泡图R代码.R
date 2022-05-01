library(tidyr)
library(ggplot2)

# 设置工作目录 文件位置
setwd("C:/Users/ThinkPad/Desktop")        
rt = read.table(file = 'DAVID_pathway_AnalyseResult.txt',sep = '\t',header = T,quote = '')

# 选出P值显著的富集结果
keggSig = rt[rt$PValue < 0.05,]    

# 格式化TXT文件，拆分Term列
keggSig = separate(keggSig, Term, sep = ":",
                   into = c("ID", "Term"))

# 作图函数
ggplot(keggSig,aes(x=Fold.Enrichment,y=Term))
  +geom_point(aes(size=Count,color=-1*log10(PValue)))
  +scale_colour_gradient(low="green",high="red")
  +labs(
    color=expression(-log[10](P.value)),
    size="Gene number",
    x="Fold enrichment",
    y="Pathway name",
    title="Pathway enrichment"
  )
  +theme_bw()
  +theme(
    axis.text.y = element_text(size = rel(1.3)),
    axis.title.x = element_text(size=rel(1.3)),
    axis.title.y = element_blank()
  )

ggsave('plot.pdf',width = 7,height = 4)


