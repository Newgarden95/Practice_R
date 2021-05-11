library(readr)
data <- read_csv("C:/swo/r_project/data/two_sample.csv")
View(data)
head(data)
data
summary(data)

class(data) #data의 타입을 알 수 있다 => data.frame

#is.na() : na가 있는것/ subset(data, (조건식)is.na(data에 들어있는 컬럼명))
#c(method, score) => 메서드와 스코어 컬럼만 사용하여 result에 담음
result <- subset(data, !is.na(score), c(method, score)) 
result

length(result$score)

#교육 방법 분리
a <- subset(result, method == 1 ) #PT교육
a #PT교육 (방법, 점수)

b <- subset(result, method == 2 ) #코딩교육
b #코딩교육 (방법, 점수)

#교육방법에 따른 점수를 추출해보자.
a1 <- a$score
b1 <- b$score

length(a1)
length(b1)

# 두 그룹의 동질성 비교 : 동일하게 분포되어 있는 정도(정규분포)
var.test(a1,b1)

# F test to compare two variances
# 
# data:  a1 and b1
# F = 1.2158, num df = 108, denom df = 117, p-value = 0.3002 => 정규분포를 따른다(정규성/등분산성)
# alternative hypothesis: true ratio of variances is not equal to 1
# 95 percent confidence interval:
#   0.8394729 1.7656728
# sample estimates:
#   ratio of variances 
# 1.215768 


# 동질성이 확보되었으므로 , t.test()를 사용
t.test(a1, b1, alternative = "greater", conf.level = 0.95)

# Welch Two Sample t-test
# 
# data:  a1 and b1
# t = -2.0547, df = 218.19, p-value = 0.9794 => 귀무가설 채택, a1< b1 즉, a1의 평균보다 b1의 평균이 더크다
# alternative hypothesis: true difference in means is greater than 0
# 95 percent confidence interval:
#   -0.4446915        Inf
# sample estimates:
#   mean of x mean of y 
# 5.556881  5.803390 

#문제4
library(readr)
data <- read_csv("C:/swo/r_project/data/twomethod.csv")
View(data)
head(data)
summary(data)
x <- subset(data, !is.na(score), c(method, score))
x

#교육방법 분리
a <- subset(x, method == 1)
a

b <- subset(x, method == 2)
b

#교육방법에 따른 점수를 추출해보자.
a1 <- a$score
b1 <- b$score
a1
b1

# 두 그룹의 동질성 비교 : 동일하게 분포되어 있는 정도(정규분포)
var.test(a1,b1)

# F test to compare two variances
# 
# data:  a1 and b1
# F = 1.0648, num df = 21, denom df = 34, p-value = 0.8494 ~> P-value값이 0.05보다 크므로 정규분포를 이룬다
# alternative hypothesis: true ratio of variances is not equal to 1
# 95 percent confidence interval:
#   0.502791 2.427170
# sample estimates:
#   ratio of variances 
# 1.06479 

# 동질성이 확보되었으므로 , t.test()를 사용
t.test(a1, b1, alternative = "two.sided", conf.level = 0.95)


# Welch Two Sample t-test
# 
# data:  a1 and b1
# t = -5.6056, df = 43.705, p-value = 1.303e-06 ~> p-value< 0.05 : 귀무가설을 기각하고 대립가설 채택
# alternative hypothesis: true difference in means is not equal to 0
# 95 percent confidence interval:
#   -17.429294  -8.209667
# sample estimates:
#   mean of x mean of y 
# 16.40909  29.22857 

#즉, 교육방법에 따라 시험성적에 차이가 있다