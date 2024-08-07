FA <- princomp(USArrests, cor=T)
summary(FA)
FA$scale
FA$loadings
plot(FA$scores[,1], FA$scores[,2], xlab="z1", ylab="z2")
biplot(FA, cex=0.7)
abline(v=0, h=0, col="gray")