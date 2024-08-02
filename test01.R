# CRAN 패키지 수 확인
cran_packages <- available.packages(contrib.url("https://cran.r-project.org"))
num_packages <- nrow(cran_packages)
cat("현재 CRAN에 등록된 패키지 수는", num_packages, "개 입니다.\n")

