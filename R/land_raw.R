#' 가공하지 않은 2017년도 표준공시지가
#'
#' 공공 데이터 포털에 있는 2017년 표준공시지가 데이터를 가공 없이 R 객체로 제공.
#'
#' @source 국토교통부(공공데이터 포털),
#'  \url{https://www.data.go.kr/dataset/15004246/fileData.do}
#' @format tibble 자료형. \url{https://github.com/tidyverse/tibble}
#' \describe{
#' \item{지역}{시도 시군구 단위의 지역정보 ex> 강원 강릉시}
#' \item{건물명}{설치되어 있는 건물 이름}
#' \item{건물층수}{건축법에서 정의한 건물의 층수 \url{http://blog.naver.com/PostView.nhn?blogId=ltg4389&logNo=220596822269}}
#' \item{운행층수}{승강기가 건물에서 동작하는 층수}
#' \item{승강기종류}{설치된 승강기의 종류}
#' \item{건물용도(대)}{허가 받은 건물의 용도}
#' \item{정격속도(m/s)}{승강기가 움직일 수 있는 한계 속도}
#' \item{대수}{설치된 승강기의 대수}
#' }
#' @examples
#'   land2017_raw
"land2017_raw"

#' 가공하지 않은 2016년도 표준공시지가
#'
#' 공공 데이터 포털에 있는 2016년 표준공시지가 데이터를 가공 없이 R 객체로 제공.
#'
#' @source 국토교통부(공공데이터 포털),
#'  \url{https://www.data.go.kr/dataset/15004246/fileData.do}
#' @format tibble 자료형. \url{https://github.com/tidyverse/tibble}
#' \describe{
#' \item{일련번호}{시도 시군구 단위의 지역정보 ex> 강원 강릉시}
#' \item{시군구}{설치되어 있는 건물 이름}
#' \item{읍면동리}{건축법에서 정의한 건물의 층수}
#' \item{지번구분}{승강기가 건물에서 동작하는 층수}
#' \item{본번지}{설치된 승강기의 종류}
#' \item{부번지}{허가 받은 건물의 용도}
#' \item{시도}{승강기가 움직일 수 있는 한계 속도}
#' \item{시군구_1}{설치된 승강기의 대수}
#' \item{읍면}{설치된 승강기의 대수}
#' \item{동리}{설치된 승강기의 대수}
#' \item{본번지_1}{설치된 승강기의 대수}
#' \item{부번지_1}{설치된 승강기의 대수}
#' \item{면적}{설치된 승강기의 대수}
#' \item{지목}{설치된 승강기의 대수}
#' \item{공시지가}{설치된 승강기의 대수}
#' \item{지리적 위치}{설치된 승강기의 대수}
#' \item{이용상황}{설치된 승강기의 대수}
#' \item{용도지역}{설치된 승강기의 대수}
#' \item{주위환경}{설치된 승강기의 대수}
#' \item{도로교통}{설치된 승강기의 대수}
#' \item{형상}{설치된 승강기의 대수}
#' \item{지세}{설치된 승강기의 대수}
#' }
#' @examples
#'   land2016_raw
"land2016_raw"

#' @importFrom tibble tibble
NULL