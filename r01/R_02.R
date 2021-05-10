# library 설치
install.packages("corrplot")
install.packages("lattice")

#import
library(corrplot)
library(lattice)

#mtcars => 데이터프레임
a = mtcars
a

# 무게와 마일간의 관계 : 상관계수, 그래프로 그려보기
mcors = cor(mtcars$wt, mtcars$mpg)
mcors

xyplot(wt~mpg, data=mtcars)
lm = plot(mtcars$wt,mtcars$mpg)
abline(lm(mtcars$wt~mtcars$mpg))

mcor = cor(mtcars)
round(mcor,2) #소수점 반올림
corrplot(mcor)  #heatmap
plot(mtcars) 
