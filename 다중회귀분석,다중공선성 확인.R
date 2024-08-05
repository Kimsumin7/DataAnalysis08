# 필요한 패키지 설치 및 로드
install.packages("corrplot")
library(corrplot)

# mtcars 데이터셋 로드
data(mtcars)

# 원하는 열 선택
input <- mtcars[, c("mpg", "disp", "hp", "wt")]

# 데이터 프레임 출력
print(head(input))

# 상관 행렬 계산
cor_matrix <- cor(input)

# 상관 행렬 출력
print(cor_matrix)

# 상관 행렬 히트맵 생성
corrplot(cor_matrix, method = "circle", type = "upper", order = "hclust", 
         tl.col = "black", tl.srt = 45, addCoef.col = "black", number.cex = 0.7)

# 다중회귀분석 실행 (disp, hp, wt를 사용)
model_full <- lm(mpg ~ disp + hp + wt, data = input)

# 회귀분석 요약 출력
summary(model_full)

# 모델 출력
print(model_full)

# disp 변수를 제거한 데이터셋 선택
input2 <- mtcars[, c("mpg", "hp", "wt")]

# disp 변수를 제거한 모델 생성
model_no_disp <- lm(mpg ~ hp + wt, data = input2)
summary(model_no_disp)
print(model_no_disp)

# 상관 행렬 계산
cor_matrix2 <- cor(input2)

# 상관 행렬 출력
print(cor_matrix2)

# 상관 행렬 히트맵 생성 (첫 번째 히트맵과 동일한 모양으로)
corrplot(cor_matrix2, method = "circle", type = "upper", order = "hclust", 
         tl.col = "black", tl.srt = 45, addCoef.col = "black", number.cex = 0.7)
