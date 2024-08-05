# 필요한 패키지 설치 및 로드
install.packages("readxl")
install.packages("corrplot")
library(readxl)
library(corrplot)

# 엑셀 파일 경로 설정
file_path <- "C:\\Users\\409-23\\Documents\\DSCOR.xlsx"

# 엑셀 파일 읽기
data <- read_excel("file_path", 1)
data

dscorr <- cor(data)
library(corrplot)

corrplot(dscorr, method = "number")
corrplot(dscorr, method = "circle")
corrplot(dscorr, method = "pie")
corrplot(dscorr, method = "ellipse")
