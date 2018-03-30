#' get search options
#'
#' \code{\link{search_speech}} 함수에서 사용할 조건들을 출력합니다.
#' 대통령, 분야, 유형에 대한 값들을 확인할 수 있습니다.
#' 인터넷을 사용한 기능입니다.
#'
#' @return tibble 자료형으로 category, label 컬럼으로 구성되어 있습니다.
#'        패키지 제작일 기준으로 대통령:damPst, 분야:speechField, 유형:speechEvent
#'        이 category에, 관련 내용이 label에 있습니다.
#'
#' @export
#' @importFrom rvest html_nodes
#' @importFrom rvest html_text
#' @importFrom rvest html_attr
#' @importFrom xml2 read_html
#' @importFrom tibble tibble

get_options <- function() {
  tar <- "http://www.pa.go.kr/research/contents/speech/index.jsp"
  
  hobj <- xml2::read_html(tar)

  category <- rvest::html_nodes(hobj, "ul.iList li label")
  category <- rvest::html_text(category)
  
  label <- rvest::html_nodes(hobj, "ul.iList li label")
  label <- rvest::html_attr(label, "for")
  
  res <- tibble(category, label)
  
  res <- res[-grep("[a-z]0", res$category),]
  res <- res[-grep("search", res$category),]
  
  res$category <- gsub("[0-9]", "", res$category)
  
  return(res)
}