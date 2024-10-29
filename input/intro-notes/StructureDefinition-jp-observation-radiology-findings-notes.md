### 必須要素
本プロファイルでは、次の要素を持たなければならない。

Observation リソースは、次の要素を持たなければならない。

 - status :検査項目情報の状態は必須である。
 - code : このリソースは画像診断報告書の所見であることを示すため必須である。

### MustSupport
次のデータは送信システムに存在する場合はサポートされなければならないことを意味する（Must Support）。

 - identifier : リソースの識別子はデータが存在する場合、必須である。
 - subject : このリソースが示す内視鏡を使用した観察結果がどの患者のものかを示すため、このプロファイルでは参照するpatientリソースが存在する場合、必須である。
 - value[x] : string型で「所見」のテキストが含まれる。

### Extensions定義

 本プロファイルで追加定義された拡張はない。

## 注意事項

### category

本バージョンの実装ガイドではCategoryの第1コードとして[JP Core Simple Observation Category ValueSet][JP_SimpleObservationCategory_VS]から`imaging`を指定する。

### code

[JP Core Observation Radiolgoy Code ValueSet][JP_ObservationRadiologyCode_VS]の中から`18782-3`, Radiology Study observation (narrative)を指定する。

## 利用方法

### OperationおよびSearch Parameter 一覧

#### Search Parameter一覧
[common][JP_Observation_Common]の定義を継承する。
本プロファイルでは上位のDIagnosticReportからの参照で所見の内容にあたるvaluestringの検索が想定される。

#### Operation一覧

ObservationリソースのOperation一覧の定義はユースケースに依存せず共通であるため、共通情報プロファイルに記載されている。

[Observation共通情報プロファイル#Operation一覧][JP_Observation_Common_Operation]

### サンプル

* [**放射線読影レポート（所見）**][jp-observation-radiology-findings-example-1]

{% include markdown-link-references.md %}
