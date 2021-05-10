install.packages("ggmap")
library(ggplot2)
library(ggmap)

# seoul의 위도 경도 
# c : list와 같은 역할
seoul <- c(left=126.77 , bottom=37.40, right = 127.17, top = 37.70)

#이미지 다운받아 변수에 넣기
map <- get_stamenmap(seoul, zoom = 12, maptype = 'terrain')

#이미지 보여주기 
ggmap(map)

############ass find modify!#####################

#pop <- read.csv(file.choose(), header = T)
pop <- read_csv("population2019.csv") #한글x -> utf-8 ~> Ansi
pop

library(stringr) #replace 함수가 있는 라이브러리 (,같은걸 지워줄 수 있도록)
pop_all <- pop$총인구수
pop_all

region <- pop$지역명
region

lon <- pop$LON
lat <- pop$LAT

lon
lat

#pop에 총인구수 중 ,(쉼표)를 공백으로 바꿔주고 숫자로 바꿔라!!
tot_pop <- as.numeric(str_replace_all(pop$총인구수, ',', ''))  #총인구수에 쉼표가 들어가있음, as.numeric : 문자형-> 숫자형으로 
tot_pop

#데이터 프레임 생성
df <-  data.frame(region, lon, lat, tot_pop) #region, lon, lat, tot_pop으로 데이터 프레임 생성성
df

#유일하게 인덱스를 1로 시작함함
#[ ]안에 하나의 값만 들어오면 컬럼 출력, ,(컴마)를 통해 2개가 입력되면 행 출력력
df[1] # 첫번째 컬럼 출력 ~> 파이썬과는 다르게 열이 출력

df[2] # 두번째 컬럼 출력

df[1:3,] #1~3까지 인덱스에 해당하는 행들 출력

df[1:3] #1~3열의 전체 컬럼 출력

daegu <-c(left = 123.44, bottom = 32.85, right = 131.60, top = 38.85)

map <- get_stamenmap(daegu, zoom = 7, maptype = 'watercolor')# maptype은 3가지 정도 있음음

ggmap(map)

layer1 <- ggmap(map)

#지도 위에 쌓기(레이어 위에 레이어 쌓기기)
layer2 <- layer1 + geom_point( #layer1에 포인트 찍기
  data = df, 
  aes(x= lon, y = lat, color = factor(tot_pop), size =3 ) #색깔은 tot_pop에 따라 다르게, aes : 축설정
)

layer2

