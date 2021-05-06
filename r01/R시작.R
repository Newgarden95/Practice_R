age <- 100

# 주석(Comments)
age


install.packages("ggplot2")
install.packages("corrplot")
install.packages("lattice")
#console clear : ctrl + L
#Case sensitivity

library(corrplot) #ctrl+shift+1: RScript Joom+=
library(lattice)

a = mtcars #여러 차에 대한 정보들이 담긴 데이터
a

#항목확인 $, 상관관계 확인하기기
mtcorrs = cor(mtcars$gear , mtcars$carb)
mtcorrs

#gear~carb에 대한 , dtat : 사용할 데이터프레임
xyplot(gear~carb, data = mtcars)
lm = plot(mtcars$gear , mtcars$carb) #회귀선 생성
abline(lm(mtcars$gear~mtcars$carb)) #lm : 회귀선

#전체데이터에 대한 상관관계확인인
mtcorrs2 = cor(mtcars)
mtcorrs2
round(mtcorrs2, 2)
corrplot(mtcorrs2) #heatmap
plot(mtcars) #pairplot


#무게와 마일간의 관계 : 상관계수, 그래프로 그려보기
corr1 = cor(mtcars$wt, mtcars$mpg)
corr1 #-0.8676594
xyplot(wt~mpg, data = mtcars)
lm = plot(mtcars$wt, mtcars$mpg)
abline(lm(mtcars$wt~mtcars$mpg))

#전체 항목 중에서 양의 상관계수가 제일높은 것은? 배기량 / 실린더
#전체 항목 중에서 읨의 상관계수가 제일 높은 것은? 무게 / 마일