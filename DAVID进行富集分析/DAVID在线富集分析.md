转自https://blog.csdn.net/xiaobai1_1/article/details/103596474

1.使用DAVID 进行 GO/ KEGG 富集分析

  a.打开DAVID官网：https://david.ncifcrf.gov/
  
  b.点击左侧功能菜单：Functional Annotation
  
  c.进入到如下的页面中，页面中的大红框中就是进行分析所用的主要操作区域。进入分析页面后，通过如下三步即可完成分析：
提交基因列表 --> 选定提交列表类型 --> 开始分析

  d.在 “Enter Gene List” 中上传基因列表，格式是每行一个基因。按照 DAVID 的要求，总的基因个数不得超过 3000 个。这里使用的基因序列：
      AAK1 
      AIF1 
      ATP5J 
      BCL11B 
      CDC25B
      CECR1
      CENPT
      CETN3
      CHMP5
      CISD2
      CKLF
      CLEC4D
      CMTM2
      TP53
      MDM4
      ATR
      FZR1
      CCND3
      CCNE2
      ATR
      CKS1B
      HDAC2
      FAT1
      POX1
      FAS2
      FAA1
      FAA4
      TGL3
      YJU3
  e.“Select Identifier” 中选择上传的基因类型，因为我们上传的是基因名（Gene Symbol），所以在下拉菜单中选择 “OFFICIAL_GENE_SYMBOL”。
  
  f.在 “List Type” 中有两个单选框，我们统一选择 “Gene List” 这一项。
  
  g.点击 “Submit List” 即可
  
  ![20191218150544216](https://user-images.githubusercontent.com/102901955/166135036-6fb1d06c-0cb8-4378-a092-c667b15432dc.png)
  
  h.提交基因列表之后，经过几秒钟的等待，如果分析顺利，就会弹出一个提示：Please note that multiple species have been detected in your gene list. 
    这句话的意思就是在我们提交的基因列表中检测到多个物种，需要我们选择相应的物种。
    点击弹出框中的 “确定”，然后在 “List” 中的选择相应物种，于本次分析使用的是人类细胞，
    故这里我们选择 “Homo sapiens”，（读者可根据自己研究物种的类型进行选择）并点击下方的 “Select Species” 即可。
   ![20191218151313531](https://user-images.githubusercontent.com/102901955/166135104-f4b3be4e-8e1b-4c6d-9234-1645d542801c.png)
   ![20191218152026225](https://user-images.githubusercontent.com/102901955/166135116-11ab9e33-b95a-4c27-8856-c454493e2a8c.png)
   
  i.在功能富集分析的结果中有多个折叠栏，其中 Gene_Ontology 这一折叠栏中有有三个栏目：GOTERM_BP_FAT、GOTERM_CC_FAT、GOTERM_MF_FAT 就是我们想要的 GO 功能富集分析结果。
    而 Pathways 里面有一个 KEGG_PATHWAY 就是我们要的结果。找到 BP、CC、MF 和 KEGG 对应的详细结果， 点击每个栏目后面的 “Chart” 即可。
   ![20191218161843663](https://user-images.githubusercontent.com/102901955/166135146-40de1cb7-b8d7-4201-af5b-211f8ab3346b.png)
  
  j.点击 “Chart” 之后，即可出现如下图所示的结果，这里面有几列数据分别是：Category、Term、RT、Genes、Count、%、P-Value 和 Benjamini。
    这几列中我们比较关心的是：Term（GO语义）、P-Value（P值）、Count（基因数）、%（基因比例）点击红框中的 Download File 即可。
    打开一个新的网页，新打开的网页就是分析结果的文本文件，可以下载或者导入到作图软件中进行后续的操作。
  
  ![20191218161941684](https://user-images.githubusercontent.com/102901955/166135181-160938f2-cc9a-4b93-a4d8-5deb4afe37e7.png)





    


