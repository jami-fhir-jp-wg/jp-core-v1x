### 必須要素
本プロファイルでは、次の要素を持たなければならない。

Observation リソースは、次の要素を持たなければならない。
 - status : 検体検査情報項目の状態は必須である
 - category : このリソースが示す検体検査情報項目を分類するための区分であり、このプロファイルでは必須とする
 - code : このリソースは何の検体検査情報項目であるかを示すため必須である
 - subject︓このリソースが示す検体検査情報項目がどの患者のものかを示すためこのプロファイルでは参照するpatientリソースの定義を必須とする

### Extensions定義

 本プロファイルで追加定義された拡張はない。

### 制約一覧
本プロファイルでは、以下の制約を満たさなければならない。

#### 共通

|id|レベル|位置|説明|式|
|---|---|---|---|---|
|1|Warning |Observation.effective[x]|一日を含む細かな検体採取日時を記載する必要がある。（年月のみでは不足）|Observation.effectiveDateTime.exists() implies Observation.effectiveDateTime.toString().length() >= 8|
|2|Error |Observation|component または、hasMember が存在しない場合、valueが存在する必要がある。|component.empty() and hasMember.empty()) implies  value.exists()|

#### 一般細菌

|id|レベル|位置|説明|式|
|---|---|---|---|---|
|3|Error |Observation.id|categoryが、'gram stains' 、'AOE' または'Organism panels'の場合、idは上位のDiagnosticReport.result.referenceに含まれなくてはならない。<br>例）id='obs1'のObservationは、上位のDiagnosticReportに以下の記載がある。result.reference='Observation/obs1'|Observation.category.code='gram-stains'<br>or Observation.category.code='aoes'<br>or Observation.category.code='organism-panels'<br>Observation.id='obs1'<br>DiagnosticReport.result.reference='Observation/obs1'|
|4|Error |Observation.id|categoryが、'Organism Id' または'Susceptibility panels'の場合、idは上位のObservation.hasMember.referenceに含まれなくてはならない。またこの上位のObservationのcategoryは'Organism panels'でなくてはならない。<br>例）id='obs2-1'のObservationは、上位のObservationに以下の記載がある。.hasMember.reference='Observation/obs2-1'|Observation.category.code='organism-id'<br>or Observation.category.code='susceptibility-panels'<br>Observation.id='obs2-1'<br>Observation.category.code='organism-panels'<br>Observation.hasMember.reference='Observation/obs2-1'|
|5|Error |Observation.Code<br>（categoryが、'Organism Id' または'Susceptibility panels'の場合）|同じ菌の場合、同じObservation.hasMember.referenceに属し、codeが同じでなくてはならない。<br>（この時categoryは、'Organism Id' または'Susceptibility panels'：上記参照）|Observation.category.code='organism-id'<br>and Observation.id='obs2'<br>Observation.category.code='susceptibility-panels' and Observation.id='obs2´<br>Observation.code = "2152" / "Enterobacter aerogenes"|
|6|Error |Observation.id|categoryが、'Susceptibility measurements' の場合、idは上位のObservation.hasMember.referenceに含まれなくてはならない。またこの上位のObservationのcategoryは'Susceptibility panels'でなくてはならない。<br>例）id='obs3-3-1'のObservationは、上位のObservationに以下の記載がある。.hasMember.reference='Observation/obs3-3-1'|Observation.category.code='susceptibility-measurements'<br>Observation.id='obs2-1-1'<br>Observation.category.code='susceptibility-panels'<br>Observation.hasMember.reference='Observation/obs2-1-1'|

#### 抗酸菌

|id|レベル|位置|説明|式|
|---|---|---|---|---|
|8|Error |Observation.id|categoryが、'gram stains' 、'AOE' または'Organism panels'の場合、idは上位のDiagnosticReport.result.referenceに含まれなくてはならない。<br>例）id='obs1'のObservationは、上位のDiagnosticReportに以下の記載がある。result.reference='Observation/obs1'|Observation.category.code='gram-stains'<br>or Observation.category.code='aoes'<br>or Observation.category.code='organism-panels'<br>Observation.id='obs1'<br>DiagnosticReport.result.reference='Observation/obs1'|
|9|Error |Observation.id|categoryが、'Growth'、'Organism Id' または'Susceptibility panels'の場合、idは上位のObservation.hasMember.referenceに含まれなくてはならない。またこのObservationのcategoryは'Organism panels'でなくてはならない。<br>例）id='obs4-1'のObservationは、上位のObservationに以下の記載がある。.hasMember.reference='Observation/obs4-1'|Observation.category.code='organism-id'<br>or Observation.category.code='susceptibility-panels'<br>Observation.id='obs4-1'<br>Observation.category.code='organism-panels'<br>Observation.hasMember.reference='Observation/obs4-1'|
|10|Error |Observation.Code<br>（categoryが、'Organism Id' または'Susceptibility panels'の場合）|同じ菌の場合、同じObservation.hasMember.referenceに属し、codeが同じでなくてはならない。<br>（この時categoryは、'Organism Id' または'Susceptibility panels'：上記参照）|Observation.category.code='organism-id'<br>and Observation.id='obs4'<br>Observation.category.code='susceptibility-panels' and Observation.id='obs4´<br>Observation.code = "6501" / "Micobacterium tuberculosis"|
|11|Warning|Observation. identifier|categoryが、'Susceptibility measurements' の場合、identifierには濃度を記載する。system = "濃度"<br>value = "1"が必要。|Observation.category.code='susceptibility-measurements'<br>Observation.hasmember.identifier. system ="濃度"<br>Observation.hasmember.identifier.identifier='1'|
|12|Error |Observation.id|categoryが、'Susceptibility measurements' の場合、idは上位のObservation.hasMember.referenceに含まれなくてはならない。またこのObservationのcategoryは'Susceptibility panels'でなくてはならない。<br>例）id='obs4-2-1'のObservationは、上位のObservationに以下の記載がある。.hasMember.reference='Observation/obs4-2-1'|Observation.category.code='susceptibility-measurements'<br>Observation.id='obs4-2-1'<br>Observation.category.code='susceptibility-panels'<br>Observation.hasMember.reference='Observation/obs4-2-1'|

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
