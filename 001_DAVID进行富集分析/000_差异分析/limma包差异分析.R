library(limma)
library(stringr)

# 设置工作目录
setwd("E:/Project/R/差异分析")



# ======原始数据导入======



# 导入表达矩阵
expmatrix_data <- read.table("GSE115269_series_matrix.txt", header = TRUE, skip = 64)


# 导入平台文件
pla_data <- read.table("GPL18233-21178.txt", sep = "\t", header = T)


# 格式化平台文件（将转录组编号列提出，只保留ENSMUST编号）
mRNA_assigment <- pla_data[, "mrna_assignment"]   

pattern <- "ENSMUST\\d*"

for (i in 1:length(mRNA_assigment)){
  # 用正则表达式循环替换单元格内的内容
  mRNA_assigment[i] <- str_match(string = mRNA_assigment[i], pattern = pattern)
}

pla_data[, "mrna_assignment"] <- mRNA_assigment

  # 让平台文件以ID列重排序
pla_data <- pla_data[order(pla_data[, 'ID']), ]


# 将样品处理方式导入R --手动
samp_treat <- c("DJ-1+/+_01", "DJ-1+/+_02", "DJ-1+/+_03", "DJ-1-/-_01", "DJ-1-/-_02", "DJ-1-/-_03")

# 以csv文件保存格式化后的平台注释文件
write.table(pla_data, "pla_data.csv", row.names = T, col.names = T, sep = ",")


# 格式化表达矩阵
rownames(expmatrix_data) <- expmatrix_data[, "ID_REF"]

expmatrix_data <- expmatrix_data[, -1]

colnames(expmatrix_data) <- samp_treat

expmatrix_data <- log2(expmatrix_data)



#=====用limma包进行数据处理得到差异分析结果=====



# limma包中的avereps函数进行去重
expmatrix_data <- avereps(expmatrix_data)


# 根据样本处理方式设计design矩阵
group_list <- c(rep("Control", 3), rep("Treatment", 3)) 

design <- model.matrix(~0 + factor(group_list))

colnames(design) = levels(factor(group_list))

rownames(design) = colnames(expmatrix_data)


# 模型拟合及分析
fit <- lmFit(expmatrix_data, design)

contrast.matrix <- makeContrasts("Control-Treatment", levels = design)

fit2 <- contrasts.fit(fit, contrast.matrix) 

fit2 <- eBayes(fit2) 

expDiff_data <- topTable(fit2, coef = 1, n = Inf) %>% na.omit()

  # 保存差异分析结果文件
write.table(expDiff_data, "expDiff.csv", row.names = TRUE, col.names = TRUE, sep = ",")




# 绘制火山图

# 绘制热图





  
