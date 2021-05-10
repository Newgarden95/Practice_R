#실습: 전체 데이터 셋의 특성 보기
#단계1: 실습 데이터셋 가져오기

#setwd("C:/Rwork/Part3") ~> 워크플레이스 설정
data <- read_csv("D:/wyj/R_project/data/descriptive.csv")
data

dim(data) #df shape
length(data) #컬럼수
length(data$survey) #행수
head(data)
str(data)

summary(data)# 전체 데이터 분석(요약)

data <- subset(data, gender == 1 | gender == 2) #데이터 일부만 가져오기/ 젠더가 1혹은 2인 경우만 추출해서 
                                                #data라는 변수에 담아줘라

summary(data) #최소/ 최대값

x<-table(data$gender) #table() : 빈도함수 ~> 데이터의 빈도 확인인
x
barplot(x)

#비율을 구하고 싶은 경우 : prop.table(x) 함수 활용
prop.table(x) #prop.table() 에서 .은 그냥 함수 이름의 일부임/ 우리가 알고있는 클래스안에 있는 메서드x


#학력수준(level)으로 요약/빈도/비율/그래프

#학력수준 요약
summary(data$level)

#학력수준 빈도
y <- table(data$level)
y
#학력수준 비율
prop.table(y)
#prop.table(table(data$level))

#학력수준 그래프
barplot(y)


#만족도로 요약/빈도/비율/그래프
#survey : hist(), pie()
summary(data$survey)
table(data$survey)
prop.table(table(data$survey))
hist(table(data$survey))
pie(table(data$survey))

#생활비 
summary(data$cost) #NA가 30개 존재 ~> subset()이용하여 2<=cost<=10 가져오기
data <- subset(data, cost>=2 & cost<=10)
data
summary(data$cost)
cost <- data$cost
cost

mean(cost)
median(cost)
sort(cost) #오름차순
sort(cost , decreasing = T) #내림차순순


#파생변수 생성하여 조건을 통해 값 대입
data$cost2[data$cost >=1 & data$cost <=3] <- 1 #cost2는 파생변수
data$cost2[data$cost >=4 & data$cost <=6] <- 2 #cost2는 파생변수
data$cost2[data$cost >=7] <- 3 #cost2는 파생변수

data$cost2

data <- subset(data, data$cost2 == 1 | data$cost2 == 2 | data$cost2 == 3)
data

cost.tot <- table(data$cost2)
barplot(cost.tot)
pie(cost.tot)

#왜도, 첨도 구하는 라이브러리 설치
install.packages('moments')
library(moments)
cost <- data$cost

skewness(cost) #왜도 구하기 ~> 0.2  / 기본적으로는 0이 나와야함 크게 벗어나지는 않다
kurtosis(cost) #첨도 구하기 ~> 3.9 

#정규성 확인!!!!

par(mfrow = c(1,1)) #1 X 1 그래프 생성

#생성된 그래프위에 그리기

hist(cost, freq = F) #약간 뾰족한 형태의 첨도
#히스토그램 위에 선 그리기기
lines(density(cost), col = "blue")
x <- seq(0,8,0.1)
curve(dnorm(x, mean(cost),sd(cost)), col = 'red', add = T)

#Q-Q plot : 정규성검증(normal)
qqnorm(x)
qqline(x, col = "red", lwd = 2)


######문제1########


# MASS 패키지에 있는 Animals데이터 셋을 이용하여 각 단계에 맞게 기술 통계량을 구하시오
# 단계1 : MASS 패키지 설치 및 메모리 로딩
library(MASS)
data(Animals)
head(Animals)

# 단계2 : R의 기본 함수를 이용하여 brain컬럼을 대상으로 다음 기술 통계량 구하기
Animals$brain

# 단계3 : 패키지에서 제공되는 describe() 과 freq()함수를 이용하여 Animals데이터 셋 전체를 대상으로 기술 통계량 구하기
# 요약, 평균, 중위수, 표준편차(sd), 분산(var), 최댓값, 최솟값

dim(Animals) #df shape
length(Animals) #컬럼수
length(Animals$body) #행수
str(Animals)
summary(Animals) #데이터 요약
sd(Animals$brain) #표준편차
var(Animals$brain) #분산


#describe() 함수 사용 위해 패키지 설치
#vars  n mean sd median trimmed mad  min  max  range skew kurtosis se
install.packages("psych")
library(psych)
describe(Animals)

#freq() 함수를 위해 패키지 설치
install.packages("descr")
library(descr)
freq(Animals) # 빈도수를 막대그래프로 그려줌


######문제2#########

type <- data$type
table(type)
barplot(table(type))
pie(table(type))

#조건2)
age <- data$age
mean(age)
sd(age)

#왜도 첨도
skewness(age)  #0.4306262
kurtosis(age)  #2.002438

#히스토그램

par(mfrow = c(1,1)) #1 X 1 그래프 생성

#생성된 그래프위에 그리기

hist(age, freq = F) 
#히스토그램 위에 선 그리기기
lines(density(age), col = "blue") 

x <- seq(35, 80, 0.1)# 편차를 0.1로 35~ 80까지 x축
curve(dnorm(x, mean(age), sd(age)), col = 'red', add = T) #정규분포 그래프 시프트해서 현재 히스토그램에 그리기(비교를 위해
