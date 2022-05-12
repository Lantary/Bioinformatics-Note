# 加载R包
library(pROC)
library(ggplot2)

# 读取数据
# 以pROC内置数据集aSAH为例

# ROC计算
rocobj_1 <- roc(aSAH[, "outcome"], aSAH[, "s100b"])
rocobj_2 <- roc(aSAH[, "outcome"], aSAH[, "ndka"])

# 计算临界点/阈值 -最佳阈值
cutOffPoint <- coords(rocobj, "best")

# 计算AUC值
auc_1 <- auc(rocobj_1)[1]
auc_2 <- auc(rocobj_2)[1]

# 绘图
plot(rocobj_1, col = "red", legacy.axes = T, print.thres = T)
plot(rocobj_2, col = "blue", legacy.axes = T, print.thres = T, add = T)
legend("bottomright", legend = c("roc1 AUC-0.731", "roc2 AUC-0.612"), col = c("red", "blue"), lty = c(1, 1))  # 添加图例



