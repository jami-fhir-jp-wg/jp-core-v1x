
### 必須要素
本プロファイルは、次の要素を持たなければならない。

- status︓患者バイタルサイン情報項目の状態は必須である
- category︓このリソースが示す患者バイタルサイン情報項目を分類するための区分であり、このプロファイルでは必須とする
- code︓このリソースは何の患者バイタルサイン情報項目であるかを示すため必須である
- subject︓このリソースが示す患者バイタルサイン情報項目が、どの患者のものかを示すため、このプロファイルでは参照するpatientリソースの定義を必須とする

### Extension定義
このプロファイルでは拡張定義は行っていない。

## 利用方法

### OperationおよびSearch Parameter 一覧

#### Search Parameter一覧

バイタルサインユースケースのSearch Parameter一覧は共通情報プロファイルに記載されている。

検索時のcategoryパラメータは"vital-sign"となる。

[Observation共通情報プロファイル#Search Parameter一覧][JP_Observation_Common_Search]

#### Operation一覧

ObservationリソースのOperation一覧の定義はユースケースに依存せず共通であるため、共通情報プロファイルに記載されている。

[Observation共通情報プロファイル#Operation一覧][JP_Observation_Common_Operation]

### サンプル

* [**バイタル（呼吸数）**][jp-observation-vitalsigns-example-1]

{% include markdown-link-references.md %}