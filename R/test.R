library(httr)
library(rvest)
library(dplyr)

body <- list(
  "pageIndex"= 1,
  "searchHistoryCount"= 0,
  "damPst"= "박정희",
  "searchCondition"= 0,
  "pageUnit"= 1270
)

tem<-POST("http://www.pa.go.kr/research/contents/speech/index.jsp",
          body=body)
ht<-content(tem,"parsed")
ht %>% 
  html_nodes("td.title") %>% 
  html_text
