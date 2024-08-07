# 필요한 패키지 로드
library(datasets)
library(ggplot2)

# 데이터 로드
data("USArrests")

# 주성분 분석 수행
FA <- princomp(USArrests, cor = TRUE)

# 주성분 분석 결과 요약
summary(FA)

# 주성분 로딩 확인
FA$scale
FA$loadings

# 기본 plot 크기 조정
plot(FA$scores[, 1], FA$scores[, 2], xlab = "z1", ylab = "z2", cex = 1.5, pch = 19)
biplot(FA, cex = 1.2, col = c("black", "red"))
abline(v = 0, h = 0, col = "gray")

# ggplot2로 주성분 분석 시각화
# 주성분 점수 데이터프레임 생성
pca_data <- as.data.frame(FA$scores)
pca_data$State <- rownames(USArrests)

# 주성분 로딩 데이터프레임 생성
loading_data <- as.data.frame(FA$loadings[, 1:2])
loading_data$Variable <- rownames(loading_data)

# ggplot2를 사용한 주성분 분석 시각화
ggplot() +
  geom_point(data = pca_data, aes(x = Comp.1, y = Comp.2), color = "blue", size = 3) +
  geom_text(data = pca_data, aes(x = Comp.1, y = Comp.2, label = State), hjust = 0, vjust = 0, size = 5) +
  geom_segment(data = loading_data, aes(x = 0, y = 0, xend = Comp.1, yend = Comp.2), arrow = arrow(length = unit(0.3, "cm")), color = "red") +
  geom_text(data = loading_data, aes(x = Comp.1, y = Comp.2, label = Variable), color = "red", hjust = 0, vjust = 0, size = 5) +
  ggtitle("PCA Biplot of USArrests Data") +
  theme_minimal(base_size = 15) +
  theme(plot.title = element_text(hjust = 0.5))
