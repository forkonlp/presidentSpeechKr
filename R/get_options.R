#' get search options for president
#'
#' \code{\link{search_speech}} 함수에서 사용할 president 조건을 출력합니다.
#' 대통령에 대한 값들을 확인할 수 있습니다.
#' 인터넷을 사용하는 기능입니다.
#'
#' @return character vector로 역대 대통령:president을 확인합니다.
#'
#' @export
#' @importFrom rvest html_nodes
#' @importFrom rvest html_text
#' @importFrom rvest html_attr
#' @importFrom xml2 read_html

get_president <- function(){
  tar <- "http://www.pa.go.kr/research/contents/speech/index.jsp"
  
  hobj <- xml2::read_html(tar)
  
  category <- rvest::html_nodes(hobj, "ul.iList li label")
  category <- rvest::html_attr(category, "for")
  
  label <- rvest::html_nodes(hobj, "ul.iList li label")
  label <- rvest::html_text(label)
  
  res <- data.frame(category, label, stringsAsFactors = F)
  
  res <- res[-grep("[a-z]0", res$category),]
  res <- res[grep("damPst", res$category),]
  res <- res$label
  res <- sapply(strsplit(res, " "), function(x) x[1])
  
  return(res)
  
}

#' get search options for field
#'
#' \code{\link{search_speech}} 함수에서 사용할 field 조건을 출력합니다.
#' 분야에 대한 값들을 확인할 수 있습니다.
#' 인터넷을 사용하는 기능입니다.
#'
#' @return character vector로 분야:field를 확인합니다.
#'
#' @export
#' @importFrom rvest html_nodes
#' @importFrom rvest html_text
#' @importFrom rvest html_attr
#' @importFrom xml2 read_html


get_field <- function(){
  tar <- "http://www.pa.go.kr/research/contents/speech/index.jsp"
  
  hobj <- xml2::read_html(tar)
  
  category <- rvest::html_nodes(hobj, "ul.iList li label")
  category <- rvest::html_attr(category, "for")
  
  label <- rvest::html_nodes(hobj, "ul.iList li label")
  label <- rvest::html_text(label)
  
  res <- data.frame(category, label, stringsAsFactors = F)
  
  res <- res[-grep("[a-z]0", res$category),]
  res <- res[grep("Field", res$category),]
  res <- res$label
  
  return(res)
}

#' get search options for event
#'
#' \code{\link{search_speech}} 함수에서 사용할 event 조건을 출력합니다.
#' 유형에 대한 값들을 확인할 수 있습니다.
#' 인터넷을 사용하는 기능입니다.
#'
#' @return character vector로 유형:event을 확인합니다.
#' 
#' @export
#' @importFrom rvest html_nodes
#' @importFrom rvest html_text
#' @importFrom rvest html_attr
#' @importFrom xml2 read_html
#' @importFrom tibble tibble

get_event <- function(){
  tar <- "http://www.pa.go.kr/research/contents/speech/index.jsp"
  
  hobj <- xml2::read_html(tar)
  
  category <- rvest::html_nodes(hobj, "ul.iList li label")
  category <- rvest::html_attr(category, "for")
  
  label <- rvest::html_nodes(hobj, "ul.iList li label")
  label <- rvest::html_text(label)
  
  res <- data.frame(category, label, stringsAsFactors = F)
  
  res <- res[-grep("[a-z]0", res$category),]
  res <- res[grep("Event", res$category),]
  res <- res$label
  
  return(res)
}