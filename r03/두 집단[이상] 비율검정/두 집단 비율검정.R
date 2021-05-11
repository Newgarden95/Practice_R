#prop.test(집단 , 시행횟수)

library(readr)
data <- read_csv("C:/swo/r_project/data/two_sample.csv")
View(data)
head(data)


x <- data$method # 1과 2로 이루어진 데이터 PT교육 : 1, 코딩교육 : 2 (명목데이터)
y <- data$survey # 만족도 데이터 0 : 불만족 , 1 : 만족

x; y

#빈도 분석표
table(x) #교육방법 빈도 확인
table(y) #만족도 빈도 확인인

#교차 분석표 y: 결과 x : 원인
table(x, y, useNA = "ifany") #useNA : 결측치 있는지지, ifany : 모두 출력

# 두 집단의 명목척도 비율 검정
# 더 크냐 작냐를 보는거임(단측검정)
# 대립가설 : pt 만족도가 코딩 만족도 보다 클것이다.
help(prop.test)
prop.test(c(110, 135), c(150 ,150), alternative = 'greater', conf.level = 0.95
          ) #c(pt 만족도 110, 코딩 만족도 135), c(전체 시행회수)
# 대립가설 기각 p-value : 0.99  ~> 즉, 코딩 교육이 만족도가 더 클것이다(영가설 채택)
# prop1 < prop2 : 코딩교육 만족도 더 큼

#==================================================================================#
#문제

gender <- data$gender
gender
survey <- data$survey
survey

table(gender)
table(survey)

table(gender , survey, useNA = "ifany")
#survey
#gender   0   1
#     1  36 138  Man
#     2  19 107  Women

#대립가설 : 대학에 진학한 남학생과 여학생의 만족도에 차이가 있다
prop.test(c(138, 107), c(174, 126), alternative = "two.sided", conf.level = 0.95)
# 결론 : 두 집단간 만족도 차이는 없다.


#########단일표본 T검정#############
library(readr)
data <- read_csv("C:/swo/r_project/data/one_sample.csv")
View(data)
head(data)
x <- data$time # A회사 노트북 사용 시간
x
summary(x) #결측치 41개 존재
mean(x, na.rm = T) #결측치 제거하고 평균
x1 <- na.omit(x)
x1

#shapiro.test => 정규성 파악을 해주는 함수
shapiro.test(x1) #정규분포인지 아닌지 파악
#p-value = 0.7242 > 0.05 따라서 정규분포를 따름(P-value가 0.05보다 크다 = 정규분포를 따른다다)

hist(x1)
#정규분포를 따르기 때문에 t검정
#평균사용시간에 차이가 난다 => 양측검증
t.test(x1, mu = 5.2, alternative = 'two.sided', conf.level = 0.95) # x1 : 표본집단 평균 , mu : 모집단의 평균
#p-value : 0.0001417 ~> A사 노트북의 평균 사용시간은 5.2시간보다 차이가 있다


########문제#################
















#######독립표본 T검정###############
# 두 집단 간 평균 차이에 관한 분속
