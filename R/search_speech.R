#' search speech
#'
#' 대통력 연설문을 검색합니다. 대통령 기록 연구실
#' \href{http://www.pa.go.kr/research/contents/speech/index.jsp}{대통령 기록 연구실}의 검색 기능을
#' 이용합니다. 제공하는 url 또한 대통령 기록 연구실의 url을 사용합니다.
#'
#' @param keyword 검색어를 입력합니다. 기본값은 전체를 검색합니다.
#'                character를 입력으로 받습니다.
#' @param searchField 어느 곳을 기준으로 검색할지를 정합니다. 기본 값은 전체입니다.
#'                    전체:0, 제목:1, 내용:2, 장소:3 으로 설정합니다.
#'                    numeric을 입력으로 받습니다.
#' @param count 총 몇 개의 기록을 가져올지 정합니다. 기본값은 전체이며,
#'              numeric을 입력을 받습니다.
#' @param damPst 검색하고자 하는 대통령을 지정합니다. 기본값은 전체를 검색합니다.
#'                  \code{\link{get_options}} 함수로 검색 가능한 리스트를 확인할 수 있습니다.
#'                  character를 입력으로 받습니다. 
#' @param field 검색하고자 하는 분야를 지정합니다. 기본값은 전체를 검색합니다.
#'              \code{\link{get_options}} 함수로 검색 가능한 리스트를 확인할 수 있습니다.
#'              character를 입력으로 받습니다.
#' @param event 검색하고자 하는 유형을 지정합니다. 기본값은 전체를 검색합니다.
#'              \code{\link{get_options}} 함수로 검색 가능한 리스트를 확인할 수 있습니다.
#'              character를 입력으로 받습니다.
#' @param order 검색 결과의 순서를 정합니다. 기본값은 연설문일자순 입니다.
#'              연설문일자순:1, 제목순:2 입니다.
#'              numeric을 입력을 받습니다.
#' @return 대통령, 분야, 유형, 제목, 연설일자, 해당주소로 이루어진 tibble 자료형입니다.
#'         president, field, event, title, date, link의 컬럼 이름으로 출력합니다.
#'
#' @examples
#' \dontrun{
#' splist <- search_speech(count = 20)
#' splist
#' }
#'
#' @export
#' @importFrom magrittr %>%
#' @importFrom rvest html_nodes
#' @importFrom rvest html_text
#' @importFrom rvest html_attr
#' @importFrom httr GET
#' @importFrom httr content
#' @importFrom tibble tibble

search_speech <- function(keyword = "",
                   searchField = 0,
                   count = 90000,
                   damPst = "",
                   field = "",
                   event = "",
                   order = 1) {
  
  root <- "http://www.pa.go.kr/research/contents/speech/index.jsp"
  
  params <- 
    paste0(
    "spMode=",
    "&artid=",
    "&catid=",
    "&orderColumn=",
    order,
    "&pageIndex=1",
    "&searchHistoryCount=0",
    "&damPst=",
    damPst,
    "&speechField=",
    field,
    "&speechEvent=",
    event,
    "&searchCondition=0",
    "&searchKeyword=",
    keyword,
    "&pageUnit=",
    count
  )
  
  res <-
    tibble(
      damPst = "",
      field = "",
      event = "",
      title = "",
      date = "",
      link = ""
    )
  
  tar <- paste0(root, "?", params)
  
  hobj <-
    GET(tar) %>%
    content("parsed")
  
  dat <-
    hobj %>%
    html_nodes("td") %>%
    html_text
  
  if (length(dat) > 6) {
    damPst <- dat[seq(from = 2,
                         to = length(dat),
                         by = 6)]
    field <- dat[seq(from = 3,
                     to = length(dat),
                     by = 6)]
    event <- dat[seq(from = 4,
                     to = length(dat),
                     by = 6)]
    title <- dat[seq(from = 5,
                     to = length(dat),
                     by = 6)]
    date <- dat[seq(from = 6,
                    to = length(dat),
                    by = 6)]
    
    link <-
      hobj %>%
      html_nodes("td.title a") %>%
      html_attr("href")
    
    link <- paste0(root, link)
    
    res <- tibble(damPst, field, event, title, date, link)
  }
  return(res)
}
