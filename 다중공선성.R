# 필요한 패키지 설치 및 로드
install.packages("corrplot")
library(corrplot)

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

# 하나씩 변수를 제거하면서 모델을 생성
model_no_disp <- lm(mpg ~ hp + wt, data = input)
summary(model_no_disp)
print(model_no_disp)

model_no_hp <- lm(mpg ~ disp + wt, data = input)
summary(model_no_hp)
print(model_no_hp)

model_no_wt <- lm(mpg ~ disp + hp, data = input)
summary(model_no_wt)
print(model_no_wt)

# 두 개의 변수만 사용하여 모델을 생성
model_disp_hp <- lm(mpg ~ disp + hp, data = input)
summary(model_disp_hp)
print(model_disp_hp)

model_disp_wt <- lm(mpg ~ disp + wt, data = input)
summary(model_disp_wt)
print(model_disp_wt)

model_hp_wt <- lm(mpg ~ hp + wt, data = input)
summary(model_hp_wt)
print(model_hp_wt)
