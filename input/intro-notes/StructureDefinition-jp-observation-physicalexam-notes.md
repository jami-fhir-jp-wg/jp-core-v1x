#### 必須要素
本プロファイルでは、次の要素を持たなければならない。

- status︓身体所見情報項目の状態は必須である
- category︓このリソースが示す身体所見情報項目を分類するための区分であり、このプロファイルでは必須とする
- code︓このリソースは何の身体所見情報項目であるかを示すため必須である
- subject︓このリソースが示す身体所見情報項目が、どの患者のものかを示すため、このプロファイルでは参照するpatientリソースの定義を必須とする


### Extensions定義

 本プロファイルで追加定義された拡張はない。

## 利用方法

### OperationおよびSearch Parameter 一覧

#### Search Parameter一覧

身体所見ユースケースのSearch Parameter一覧は共通情報プロファイルに記載されている。

検索時のcategoryパラメータは"exam"となる。

[Observation共通情報プロファイル#Search Parameter一覧][JP_Observation_Common_Search]

#### Operation一覧

ObservationリソースのOperation一覧の定義はユースケースに依存せず共通であるため、共通情報プロファイルに記載されている。

[Observation共通情報プロファイル#Operation一覧][JP_Observation_Common_Operation]

### サンプル

* [**身体所見（腹痛）**][jp-observation-physicalexam-example-1]

{% include markdown-link-references.md %}