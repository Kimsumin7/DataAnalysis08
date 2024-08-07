# mtcars 데이터셋 로드
data(mtcars)

# 종속 변수인 am을 팩터로 변환
mtcars$am <- as.factor(mtcars$am)

# 로지스틱 회귀 모델 피팅
logistic_model <- glm(am ~ wt + hp, data = mtcars, family = binomial)

# 모델 요약 출력
summary(logistic_model)
