# 필요한 패키지 설치 및 로드
install.packages("corrplot")
install.packages("knitr")
library(corrplot)
library(knitr)

# mtcars 데이터셋 로드
data(mtcars)

# 원하는 열 선택
input <- mtcars[, c("mpg", "disp", "hp", "wt")]

# 데이터 프레임 출력
print(head(input))

# 상관분석표 생성
cor_matrix <- cor(input)
print(cor_matrix)

# 상관분석표 시각화
corrplot(cor_matrix, method = "circle", type = "upper", order = "hclust", 
         tl.col = "black", tl.srt = 45, addCoef.col = "black", number.cex = 0.7)

# 다중회귀분석 실행 (disp, hp, wt를 사용)
model_full <- lm(mpg ~ disp + hp + wt, data = input)

# 회귀분석 요약 출력
summary(model_full)

# 모델 출력
print(model_full)

# disp 변수를 제거한 모델 생성
model_no_disp <- lm(mpg ~ hp + wt, data = input)
summary(model_no_disp)
print(model_no_disp)

# 요약 결과를 데이터 프레임으로 변환
summary_no_disp <- summary(model_no_disp)

# 회귀 계수를 데이터 프레임으로 변환
coefficients_no_disp <- as.data.frame(summary_no_disp$coefficients)
colnames(coefficients_no_disp) <- c("Estimate", "Std. Error", "t value", "Pr(>|t|)")

# 결과 출력
print(coefficients_no_disp)

# Disp 변수를 제거한 모델의 요약 결과를 표로 출력
kable(coefficients_no_disp, caption = "Disp 변수를 제거한 모델의 회귀 계수")
