#' get speach
#'
#' \code{\link{search_speech}}에서 얻은 주소:link를 기준으로 연설문을 가져옵니다.
#' 한번에 한 주소만 가져올 수 있습니다.
#'
#' @param link 게시글의 url 주소입니다. 한 번에 한 주소만 가능합니다.
#'             \url{http://www.pa.go.kr/research/contents/speech/index.jsp?spMode=view&catid=c_pa02062&artid=1310475}
#'             와 같이 생겼습니다.
#'             character를 입력으로 받습니다.
#'
#' @param paragraph 문단 단위로 분리할지 말지를 정합니다.
#'                  기본값은 FALSE 입니다.
#'                  logical 을 입력으로 받습니다.
#'
#' @return tibble 자료형으로 key, value 의 2개 컬럼을 가집니다.
#'
#' @export
#' @importFrom rvest html_nodes
#' @importFrom rvest html_text
#' @importFrom xml2 read_html
#' @importFrom tibble tibble

get_speech <- function(link, paragraph = FALSE) {
  hobj <- xml2::read_html(link)
  
  title <- rvest::html_nodes(hobj, "h4")
  title <- rvest::html_text(title)
  
  meta_data <- rvest::html_nodes(hobj, "div.viewItem dl dd")
  meta_data <- rvest::html_text(meta_data)
  
  body <- rvest::html_nodes(hobj, "div.conTxt")
  body <- gsub(pattern = '<.*?>', replacement = '\t', body)
  body <- strsplit(body, '\t')
  
  body <- trimws(body[[1]])
  body <- body[nchar(body) > 0]
  
  if (!paragraph) {
    body <- paste0(body , collapse = " ")
  }
  
  key <-
    c(
      "title",
      "date",
      "damPst",
      "place",
      "field",
      "event",
      "source",
      rep("content", length(body))
    )
  value <- c(title, meta_data, body)
  
  res <- tibble(key, value)
  
  return(res)
}
