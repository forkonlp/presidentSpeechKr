#' get speech
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
#' @return tibble 자료형으로 title, date, president, place, field, event, source, paragraph, content의 9개 컬럼을 가집니다.
#'
#' @export
#' @importFrom rvest html_nodes
#' @importFrom rvest html_text
#' @importFrom xml2 read_html
#' @importFrom tibble tibble

get_speech <- function(link, paragraph = FALSE) {
  
  if("tbl" %in% class(link)){
    link <- as.character(link)
  }
  
  hobj <- xml2::read_html(link)
  
  title <- rvest::html_nodes(hobj, "h4")
  title <- rvest::html_text(title)
  
  meta_data <- rvest::html_nodes(hobj, "div.viewItem dl dd")
  meta_data <- rvest::html_text(meta_data)
  
  content <- rvest::html_nodes(hobj, "div.conTxt")
  content <- gsub(pattern = '<.*?>', replacement = '\t', content)
  content <- strsplit(content, '\t')
  
  content <- trimws(content[[1]])
  content <- gsub("^[[:blank:]]$", "", content)
  content <- content[nchar(content) > 0]
  
  
  if (!paragraph) {
    content <- paste0(content , collapse = " ")
  }
  
  date <- meta_data[1]
  president <- meta_data[2]
  place <- meta_data[3]
  field <- meta_data[4]
  event <- meta_data[5]
  source <- meta_data[6]
  
  res <- tibble(title, date, president, place, field, event, source, paragraph=1:length(content), content)
  
  return(res)
}
