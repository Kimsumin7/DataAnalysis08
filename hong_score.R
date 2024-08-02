# 홍길동의 점수, 평균, 표준편차, 전체 학생 수 정의
hong_score <- 92
mean_score <- 80
sd_score <- 7
total_students <- 350

# Z-값 계산
z_value <- (hong_score - mean_score) / sd_score

# Z-값을 이용하여 누적 백분위 계산
percentile <- pnorm(z_value)

# 등수 계산
rank <- total_students * (1 - percentile) + 1

# 결과 출력
cat("홍길동의 Z-값:", z_value, "\n")
cat("홍길동의 백분위:", percentile * 100, "%\n")
cat("홍길동의 예상 등수:", floor(rank), "등\n")
