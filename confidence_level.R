# 필요한 패키지 설치
install.packages("tidyverse")
install.packages("car")
install.packages("multcomp")

# 패키지 로드
library(tidyverse)
library(car)
library(multcomp)

# 데이터프레임 생성
data <- data.frame(
  weight = c(4.17, 5.58, 5.18, 6.11, 4.5, 4.61, 5.17, 4.53, 5.33, 5.14, 
             4.81, 4.17, 4.41, 3.59, 5.87, 3.83, 6.03, 4.89, 4.32, 4.69,
             6.31, 5.12, 5.54, 5.5, 5.37, 5.29, 4.92, 6.15, 5.8, 5.26),
  group = rep(c("C", "T1", "T2"), each = 10)
)

# 데이터 확인
head(data)

# ANOVA 수행
anova_result <- aov(weight ~ group, data = data)
summary(anova_result)

# 사후검정 수행 (Tukey's HSD 테스트)
tukey_result <- TukeyHSD(anova_result)
print(tukey_result)

# 사후검정 결과 시각화
plot(tukey_result)
