### 必須要素
本プロファイルでは、次の要素を持たなければならない。

Observation リソースは、次の要素を持たなければならない。
 - status : 検体検査情報項目の状態は必須である
 - code : このリソースは何の検体検査情報項目であるかを示すため必須である

### Extensions定義

 本プロファイルで追加定義された拡張はない。

## 利用方法

### OperationおよびSearch Parameter 一覧

#### Search Parameter一覧

微生物学的検査結果ユースケースのSearch Parameter一覧は共通情報プロファイルとは異なり以下の通りである。

| コンフォーマンス | パラメータ    | 型     | 例                                                           |
| ---------------- | ------------- | ------ | ------------------------------------------------------------ |
| SHALL | identifier | reference | `GET [base]/identifier?id=[id]` |
| SHOULD | category, date, code  | reference, date, reference | `GET [base]?category=[category]` |
| SHOULD | category, value-quantity | reference | `GET [base]?category=[category]` |
| SHOULD | category, value-quantity, code, specimen, patient | reference | `GET [base]?category=[category]` |
| SHOULD | patient, date, based-on | reference | `GET [base]?category=[category]` |

#### Operation一覧

ObservationリソースのOperation一覧の定義はユースケースに依存せず共通であるため、共通情報プロファイルに記載されている。

[Observation共通情報プロファイル#Operation一覧][JP_Observation_Common_Operation]

### サンプル



{% include markdown-link-references.md %}
