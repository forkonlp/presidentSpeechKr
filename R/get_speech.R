#' get speach
#'
#' \code{\link{search_speech}}에서 얻은 주소:link를 기준으로 연설문을 가져옵니다.
#' 한번에 한 주소만 가져올 수 있습니다.
#'
#' @param link 검색어를 입력합니다. 기본값은 전체를 검색합니다.
#'                character를 입력으로 받습니다.
#'
#' @param paragraph 문단 단위로 분리할지 말지를 정합니다. 기본값은 FALSE 입니다.
#'                 logical 을 입력으로 받습니다.
#'
#' @return tibble 자료형으로 key, value 의 2개 컬럼을 가집니다.
#'
#' @export
#' @importFrom magrittr %>%
#' @importFrom rvest html_nodes
#' @importFrom rvest html_text
#' @importFrom httr GET
#' @importFrom httr content
#' @importFrom purrr map_chr
#' @importFrom tibble tibble

get_speech <- function(target, paragraph = FALSE) {
  hobj <-
    target %>%
    GET %>%
    content("parsed")
  
  title <-
    hobj %>%
    html_nodes("h4") %>%
    html_text
  
  # meta_col <-
  #   hobj %>%
  #   html_nodes("div.viewItem dl dt") %>%
  #   html_text
  
  meta_data <-
    hobj %>%
    html_nodes("div.viewItem dl dd") %>%
    html_text
  
  body <-
    hobj %>%
    html_nodes("div.conTxt") %>%
    gsub(pattern = '<.*?>', replacement = '\t', .) %>%
    strsplit('\t') %>%
    .[[1]] %>%
    map_chr(trimws) %>%
    .[nchar(.) > 0]
  
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
