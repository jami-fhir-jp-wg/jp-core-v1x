### 必須要素
本プロファイルでは、次の要素を持たなければならない。

Observation リソースは、次の要素を持たなければならない。
 - status : 検体検査情報項目の状態は必須である
 - category : このリソースが示す検体検査情報項目を分類するための区分であり、このプロファイルでは必須とする
 - code : このリソースは何の検体検査情報項目であるかを示すため必須である
 - subject︓このリソースが示す検体検査情報項目がどの患者のものかを示すためこのプロファイルでは参照するpatientリソースの定義を必須とする

### Extensions定義

 本プロファイルで追加定義された拡張はない。

## 利用方法

### OperationおよびSearch Parameter 一覧

#### Search Parameter一覧
ースケース独自のSearch Parameterが定義されていない場合、以下の表の内容が共通のSearch Parameterとなる。ただし、categoryパラメータおよびcodeパラメータについては、各ユースケース毎に異なる固定値および用語定義で定められたコード体系を指定することになるので注意が必要である。

| コンフォーマンス | パラメータ | 型 | 例 |
| --- | --- | --- | --- |
| SHALL | identifier | token  | GET [base]/Observation?identifier=http://myhospital.com/fhir/observation-id-system\|1234567890 |
| MAY | patient,category,code,value-quantity | reference,token,token,quantity  | GET [base]/Observation?patient=123&category=http://jpfhir/fhir/core/CodeSystem/loinc.org\|18725-2&code=urn:oid:1.2.392.100495.10.3.100.5.11.5.2\|1216&value-quantity=gt4 |
| MAY | patient,category,code,value-quantity,date | reference,token,token,quantity,date  | GET [base]/Observation?patient=123&category=http://jpfhir/fhir/core/CodeSystem/loinc.org\|18725-2&code=urn:oid:1.2.392.100495.10.3.100.5.11.5.2\|1216&value-quantity=gt4&date=le2020-12-31 |
| MAY | patient,category,code,value-quantity,encounter | reference,token,token,quantity,encounter  | GET [base]/Observation?patient=123&category=http://jpfhir/fhir/core/CodeSystem/loinc.org\|18725-2&code=urn:oid:1.2.392.100495.10.3.100.5.11.5.2\|1216&value-quantity=gt4&encounter=456 |

#### Operation一覧

ObservationリソースのOperation一覧の定義はユースケースに依存せず共通であるため、共通情報プロファイルに記載されている。

[Observation共通情報プロファイル#Operation一覧][JP_Observation_Common_Operation]

### サンプル
Diagnostic Reportのサンプルの一部に定義しているため、これを参照すること。

* [**一般細菌検査レポート**][jp-diagnosticreport-microbiology-example-1]


## その他、参考文献、リンク等

1. 厚生労働省院内感染対策サーベイランス事業 [(https://janis.mhlw.go.jp/)](https://janis.mhlw.go.jp/)

{% include markdown-link-references.md %}
