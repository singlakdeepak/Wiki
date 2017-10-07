# Matrix Factorization Algorithms in Genomics

Discussion on the paper : [Enter the matrix: Interpreting unsupervised feature learning with matrix decomposition to discover hidden knowledge in high-throughput omics data](https://www.biorxiv.org/content/early/2017/10/02/196915.1)

Matrix Factorization (MF) is a class of diverse algorithms to reduce data dimensionality through a decomposition approach which learns one matrix that describes the structure between genes and another matrix that learns the biological processes for each sample from the original data matrix.
Matrix decomposition methods require the computation and manipulations of similarity matrix and fast computation approaches are required.

In the specific application of MF to genomics, terms including modules, features, eigengenes, metagenes, meta-pathways, and patterns are analytical orthologs.

* **PCA**: This method searches for components among gene and samples that are uncorrelated. The first component explains the maximum variation in the data, the second the maximum variation after that first component is removed, and continuing so that each subsequent factor explains a smaller degree of variation in the data than the previous one. But PCA conflates multiple biological processes into single components and, thus, is unable to learn the specific genes co-regulated by a specific CBP. 
* **ICA**: Independent Component Analysis (ICA) learns factors that are statistically independent. This assumption of independence ensures that the patterns learned in the data are from distinct processes, thus providing more accurate gene sets than PCA.
* **NMF**: Non-negative matrix factorization (NMF) methods constrain all elements of the amplitude and pattern matrices to be greater than zero. This model has a twofold advantage. First, it models the non-negative nature of transcriptional data. Second, it enables algorithms to learn shared components in multiple components
thereby modeling coregulation. So-called sparsity can be encoded in all of these methods to promote more zero values for the amplitude matrix.

* Class of MF modeling techniques that has been used for integrated data analysis is based on a three dimensional representation of the data with each dimension indicating a different data modality. These approaches, termed tensor decomposition, discover the linear relationships between three or more datasets, decomposing datasets into more than two composite matrices, reflecting the shared sources of variation between all pairs of matrices. As a result, these approaches
extract informative components that share similarity within and between data sets.