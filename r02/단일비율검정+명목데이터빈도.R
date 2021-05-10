library(readr)
data <- read_csv("D:/wyj/R_project/data/one_sample.csv")
View(data)
head(data)

summary(data$survey) #요약 0~1
length(data$survey) #개수수
table(data$survey) #빈도테이블/ 교차테이블 0: 만족 , 1: 불만족

install.packages('prettyR')
library(prettyR)
freq(data$survey) #빈도의 퍼센테이지를 보여줌(빈도분석)

#검증하고자 하는게 앞에 나와야한다.
#불만율이 커졌는지 작아졌는지 확인하기 위해 이전 불만율 20% , 즉, 80%보다 큰지 (alternative = 'greater') ~> 현재 90%나왔음
binom.test(c(136, 14),p = 0.8, alternative = 'greater' ,conf.level = 0.95 ) #단일집단(survey) + 이항분포(맞다, 틀리다)의 빈도/ p = 0.8 만족률 80%이상 찾기(단측검정), conf.level = 신뢰구간
                                                                             #alternativt : 큰지 작은지 비교, 



##############문제##############

library(readr)
data1 <- read_csv("D:/wyj/R_project/data/hdtv.csv")
View(data1)
head(data1)

summary(data1$buy)
length(data1$buy)
install.packages('prettyR')
library(prettyR)

freq(data1$buy) #구매량의 빈도수와 비율계산 1 : 구매하지 않음 , 2 : 구매함

#차이가 있다 없다 = 양측검정
#검증하고자 하는게 앞으로
#만약 alternative가 greater이 되면 가설이 바뀌게 됨(단측검정)
binom.test(c(10, 40), p = 0.11, alternative = 'two.sided', conf.level = 0.95)
#결과를 통해 보면 p-value = 0.321 이 나옴 ~> 이거는 유의확률보다 크니까 대립가설이 기각, 영가설 채택 => 기존구매율과 차이가 없다.