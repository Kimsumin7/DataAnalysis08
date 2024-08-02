data(EuStockMarkets)
dim(EuStockMarkets)
EuStockMarkets
EuStockMarkets[,'DAX']
summary(EuStockMarkets)
mean(EuStockMarkets[,'DAX'])
median(EuStockMarkets[,'DAX'])
range(EuStockMarkets[,'DAX'])
summary(EuStockMarkets[,'DAX'])
var(EuStockMarkets[,'DAX'])
sd(EuStockMarkets[,'DAX'])

# 주요 국가별 기술 통계
# 데이터 로드
data(EuStockMarkets)

# 데이터 차원 확인
dim(EuStockMarkets)

# 데이터 전체 출력
print(EuStockMarkets)

# 독일 DAX, 스위스 SMI, 프랑스 CAC, 영국 FTSE에 대한 기술 통계 계산
for (index in c('DAX', 'SMI', 'CAC', 'FTSE')) {
  cat("\n\n---", index, "---\n")
  print(summary(EuStockMarkets[, index]))
  cat("Mean:", mean(EuStockMarkets[, index]), "\n")
  cat("Median:", median(EuStockMarkets[, index]), "\n")
  cat("Range:", range(EuStockMarkets[, index]), "\n")
  cat("Variance:", var(EuStockMarkets[, index]), "\n")
  cat("Standard Deviation:", sd(EuStockMarkets[, index]), "\n")
}



# 데이터 로드
data(EuStockMarkets)

# 상관관계 행렬 계산
cor_matrix <- cor(EuStockMarkets)

# 상관관계 행렬을 데이터프레임으로 변환
cor_data <- as.data.frame(as.table(cor_matrix))

# 상관관계 행렬에서 하삼각행렬 부분만 추출
cor_data <- cor_data[lower.tri(cor_matrix, diag = TRUE), ]

# y축 순서를 반대로 변경
cor_data$Var2 <- factor(cor_data$Var2, levels = rev(levels(cor_data$Var2)))

# 상관관계 행렬 시각화
library(ggplot2)

ggplot(data = cor_data, aes(x=Var1, y=Var2, fill=Freq)) + 
  geom_tile(color = "white") + 
  geom_text(aes(label = sprintf("%.2f", Freq)), size = 4, color = "white") +
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", 
                       midpoint = 0, limit = c(-1, 1), space = "Lab", 
                       name="Pearson\nCorrelation") + 
  theme_minimal() + 
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 12, hjust = 1),
        axis.text.y = element_text(size = 12)) + 
  coord_fixed() +
  ggtitle("Correlation Matrix of EuStockMarkets")
