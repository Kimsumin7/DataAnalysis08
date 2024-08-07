# 패키지 로드
library(dplyr)
library(readxl)

# 파일 경로 수정
file_path <- "C:/Users/409-23/Documents/카카오톡 받은 파일/Overall_satification.xlsx"

# 데이터 불러오기
data <- read_excel(file_path, sheet = 1)

# 데이터 요약
summary(data)

# Ove_S 변수 확인
if(!"Ove_S" %in% colnames(data)) {
  stop("Ove_S 변수가 데이터에 없습니다.")
}

# 회귀 분석 모델 생성
model <- lm(Ove_S ~ ., data = data)

# 모델 요약
summary(model)