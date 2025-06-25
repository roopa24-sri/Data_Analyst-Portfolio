# Load libraries and read files
packages <- c("dplyr", "fpc", "cluster", 
              "factoextra", "dendextend", 
              "psych", "qgraph")
lapply(packages, library, character.only = TRUE)

raw_df <- read.csv("./Team2015season.csv", header=T)

scaled_data <- raw_df %>%
  remove_rownames() %>%
  column_to_rownames("Team") %>%
  scale()

d_1 <- dist(scaled_data, method="euclidean")
clust_1 <- hclust(d_1, method="ward.D")
#draw the dendrogram
plot(clust_1,
     cex=0.7,
     xlab="",
     ylab="Distance",
     main="Clusterings of 60 European teams")
rect.hclust(clust_1, k = 4, border = 2:5)
 
cuts <- cutree(clust_1,k=4)
scaled_data %>%
  as.data.frame() %>%
  mutate(cluster = cuts) %>%
  head

res.dist <- dist(scaled_data, method = "euclidean")

hc1 <- hclust(res.dist, method = "complete")
hc2 <- hclust(res.dist, method = "ward.D2")

dend1 <- as.dendrogram (hc1)
dend2 <- as.dendrogram (hc2)

dend_list <- dendlist(dend1, dend2)

tanglegram(dend1, dend2,
           lwd = 1,
           edge.lwd = 1,
           lab.cex = 0.5,
           columns_width = c(8, 3, 8),
           highlight_distinct_edges = FALSE, # Turn-off dashed lines
           common_subtrees_color_lines = FALSE, # Turn-off line colors
           common_subtrees_color_branches = TRUE, # Color common branches 
           main = paste("entanglement =", round(entanglement(dend_list), 2))
)

km_results <- kmeans(scaled_data, centers = 4, nstart = 100)
km_results

fviz_cluster(km_results, data = scaled_data)

set.seed(123)
fviz_nbclust(scaled_data, kmeans, method = "wss")

fviz_nbclust(scaled_data, kmeans, method = "silhouette")

set.seed(123)
gap_stat <- clusGap(scaled_data,
                    FUN = kmeans,
                    nstart = 100,
                    K.max = 10,
                    B = 50)

print(gap_stat, method = "firstmax")
fviz_gap_stat(gap_stat)

parallel <- fa.parallel(scaled_data,
                        fm = 'minres',
                        fa = 'fa')

fa1 <- factanal(scaled_data,
                factors=2, 
                rotation="none",
                scores="regression")

fa2 <- fa(scaled_data,
          nfactors = 3,
          rotate = "oblimin",
          fm="minres")
fa1

biplot(fa1$scores[,1:2],
       loadings(fa1),
       cex=c(0.7,0.8))

qg.fa1 <- qgraph(fa1)

fa_analysis <- function(data_set, factor,
                        rotate = "varimax", fm = "pa"){
  res <- fa(data_set, nfactors = factor,
            rotate = rotate, fm = fm)
  print("Factor Analysis results:")
  print(res)
  plot(res$loadings, pch=18, col='red')
  abline(h=0)
  abline(v=0)
  text(res$loadings, labels=names(data_set),cex=0.8)
  
  repro <- res$loadings%*%t(res$loadings)
  residual <- cor(data_set)-repro
  print("Residual correlation matrx")
  round(resid2,2)
  
  len <- length(residual[upper.tri(residual)])
  RMSR <- sqrt(sum(residual[upper.tri(residual)]^2)/len)
  print("Root-mean squared residuals:", RMSR)

  prop <- sum(rep(1,len)[abs(residual[upper.tri(residual)])>0.05])/len
  print("Proportion of residuals greater than 0.05 in absolute value:", prop)
}
fa_analysis(soccer, 3)
fa_analysis(soccer, 3, "quartimax", "pa")
