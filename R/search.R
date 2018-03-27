#' search speech list
#'
#' search speech list
#'
#' @param keyword is naver news link.
#' @param top_n is what you want to get from news. Defualt is all.
#' @param president is how many you want to try again if error. Default is 3.
#' @param field is wait time to try again. Default is rnorm(1).
#' @param event async crawling if it is TRUE. Default is FALSE.
#' @return Get char vectors for list
#' @export
#' @importFrom rvest html_nodes
#' @importFrom rvest html_text
#' @importFrom httr POST
#' @import magrittr 

search <- function(keyword="", top_n=20, president="", field="", event=""){
  
  body <- list(
    "pageIndex"= 1,
    "searchHistoryCount"= 0,
    "damPst"= president,
    "speechField"= field,
    "speechEvent"= event,
    "searchCondition"= 0,
    "searchKeyword"= keyword,
    "pageUnit"= top_n
  )
  
  tar <- "http://www.pa.go.kr/research/contents/speech/index.jsp"
  
  res <- 
    POST(tar, body) %>%
    content("parsed") %>% 
    html_nodes("td.title") %>% 
    html_text
  
  return(res)
}