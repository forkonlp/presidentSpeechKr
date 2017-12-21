# presidentSpeechKr

[![Travis-CI Build Status](https://travis-ci.org/mrchypark/presidentSpeechKr.svg?branch=master)](https://travis-ci.org/mrchypark/presidentSpeechKr)

공공데이터 포털에 공개된 표준공시지가 데이터를
R에서 사용하기 쉽게 제작한 패키지

* `land2017_raw`: 가공하지 않은 2017년 표준공시지가 데이터
* `land2016_raw`: 가공하지 않은 2016년 표준공시지가 데이터

## to-do

* [ ] 컬럼 맞춤 등 가공
* [ ] 라이선스 문의 및 통일
* [ ] 과거년도 데이터 적용

## installation

```
if(!requireNamespace("devtools")) install.packages("devtools")
devtools::install_github("mrchypark/presidentSpeechKr")
library(presidentSpeechKr)

```
