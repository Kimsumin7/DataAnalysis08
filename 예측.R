# 필요한 패키지 설치 및 로드
install.packages("ggplot2")
library(ggplot2)

# mtcars 데이터셋 로드
data(mtcars)

# 종속 변수인 am을 팩터로 변환
mtcars$am <- as.factor(mtcars$am)

# 로지스틱 회귀 모델 피팅
logistic_model <- glm(am ~ wt + hp, data = mtcars, family = binomial)

# 모델 요약 출력
summary(logistic_model)

# exp(B) 값 계산
exp_coefficients <- exp(coef(logistic_model))
exp_coefficients

# 예측 값 및 실제 값 데이터 프레임 생성
predicted_data <- data.frame(
  wt = mtcars$wt,
  hp = mtcars$hp,
  am = mtcars$am,
  predicted_prob = predict(logistic_model, type = "response")
)

# 예측 결과를 0 또는 1로 변환
predicted_data$predicted_am <- ifelse(predicted_data$predicted_prob > 0.5, 1, 0)
predicted_data$predicted_am <- as.factor(predicted_data$predicted_am)

# 예측값 테이블 출력
table(predicted_data$am, predicted_data$predicted_am)

# wt와 am의 관계를 시각화
plot_wt <- ggplot(predicted_data, aes(x = wt, y = predicted_prob, color = am)) +
  geom_point(aes(shape = am), size = 2) +
  geom_smooth(method = "glm", method.args = list(family = "binomial"), se = FALSE) +
  labs(title = "Logistic Regression of wt vs am",
       x = "Weight (wt)",
       y = "Predicted Probability of am")

# hp와 am의 관계를 시각화
plot_hp <- ggplot(predicted_data, aes(x = hp, y = predicted_prob, color = am)) +
  geom_point(aes(shape = am), size = 2) +
  geom_smooth(method = "glm", method.args = list(family = "binomial"), se = FALSE) +
  labs(title = "Logistic Regression of hp vs am",
       x = "Horsepower (hp)",
       y = "Predicted Probability of am")

# 플롯 출력
print(plot_wt)
print(plot_hp)
