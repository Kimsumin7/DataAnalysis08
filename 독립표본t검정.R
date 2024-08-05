# 텍스트 파일에서 데이터 읽어오기
data <- read.table("C:/Users/409-23/Documents/age1.txt", header=TRUE, sep="\t")

# 히스토그램 및 관련 코드
par(mar=c(2, 1, 1, 1))
hist(data$weight[data$gender==1], xlim=c(1500, 4500), ylim=c(0, 12), col="red", border=NA, main="", xlab="", ylab="", axes=F)
hist(data$weight[data$gender==2], density=10, angle=45, add=TRUE, col="green")
axis(1)
abline(v = mean(data$weight[data$gender==1]), lty=3, lwd=1.5, col="red")
abline(v = mean(data$weight[data$gender==2]), lty=1, lwd=1.5, col="green")
legends <- c("여자", "남자")
legend("topright", legend=legends, fill=c("red", "green"), density=c(NA, 20))
