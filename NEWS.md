# presidentSpeechKr 0.2.0

* `spidx` 데이터를 추가하였습니다. `spidx` 데이터의 `link` 컬럼을 이용해서 바로 `get_speech()`함수를 사용할 수 있습니다.

# presidentSpeechKr 0.1.1

* `search_speech()` 함수에서 대통령 조건이 동작하지 않는 문제를 해결하였습니다.
* `get_speech()` 함수에서 link를 `tbl` 자료형으로 입력하여도 `character`로 변환하여 동작할 수 있게 수정하였습니다.
* `get_speech()` 함수의 결과를 key, velue 가 아니라 각 column과 값으로 변경하였습니다.
* `get_speech()` 함수의 결과에 paragraph를 추가하여 paragraph = T 일때 순서대로 문단 번호를 가집니다.

# presidentSpeechKr 0.1.0

* `http://www.pa.go.kr/research/contents/speech/index.jsp`의 내용을 가져옵니다.

