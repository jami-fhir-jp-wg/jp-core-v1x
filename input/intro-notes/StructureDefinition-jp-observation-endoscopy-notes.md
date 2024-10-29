### 必須要素
本プロファイルでは、次の要素を持たなければならない。

Observation リソースは、次の要素を持たなければならない。
 - status :検査項目情報の状態は必須である。
 - category : このリソースが内視鏡の検査項目であることを分類するために必須とする。
 - code : このリソースは内視鏡を使用した観察結果の何の情報項目かを示すため必須である。
 - subject : このリソースが示す内視鏡を使用した観察結果が、どの患者のものかを示すためこのプロファイルでは参照するpatientリソースの定義を必須とする。

### MustSupport

次の要素に関する情報が送信システムに存在する場合、その要素がサポートされなければならないことを意味する。（**Must Support**）

- subject : 患者リソース（Patient）への参照。殆どの場合存在するが、緊急検査等で患者リソースが確定していない場合が想定される。
- effectiveDateTime : 観察結果の確定日時。
- value : 診断レポートの一部となる内視鏡検査、治療による観察結果（診断、所見など）の情報。
- hasMember : 内視鏡による観察結果を病変単位で表現する際に使用する。

### Extensions定義

 本プロファイルで追加定義された拡張はない。

## 注意事項

### category

本バージョンの実装ガイドではCategoryの第1コードとして[JP Core Simple Observation Category ValueSet][JP_SimpleObservationCategory_VS]から`procedure`を指定する。
また、第2コードとして[JP Core EndoscopyCategory ValueSet][JP_EndoscopyCategory_VS]から"Endoscopy"を表す`LP7796-8`を指定する。

### code

[JP Core Observation Endoscopy Code ValueSet][JP_ObservationEndoscopyCode_VS]の中から適切なコードを指定することを推奨する。
 - 例：内視鏡による診断（Diagnosis Endoscopy Procedure Narrative）：`19811-9`
 - 例：内視鏡による所見（Indications description Narrative Endoscopy）：`19778-0`

## 利用方法

### OperationおよびSearch Parameter 一覧

#### Search Parameter一覧
内視鏡ユースケースのSearch Parameter一覧は以下のとおり。

| コンフォーマンス | パラメータ | 型 | 例 |
| --- | --- | --- | --- |
| MAY | based-on | reference  | GET [base]/Observation?based-on=ServiceRequest/12345 |
| SHOULD | patient,code,date | reference,token,date  | GET [base]/Observation?patient=123&code=http://loinc.org\|19811-9&date=le2024-11-01 |
| SHOULD | patient, code-value-concept | reference, composite  | GET [base]/Observation?patient=123&code-value-concept=code\$http://loinc.org\|19811-9,value\$urn:oid:1.2.392.200270.4.1000.1\|Z2L30301 |
| SHOULD | patient, code-value-concept,date | reference, composite,date  | GET [base]/Observation?patient=123&code-value-concept=code$http://loinc.org\|19811-9,value\$urn:oid:1.2.392.200270.4.1000.1\|Z2L30301&date=le2024-11-01 |
| MAY | code-value-concept,date | composite,date  | GET [base]/Observation?code-value-concept=code\$http://loinc.org\|19811-9,value$urn:oid:1.2.392.200270.4.1000.1\|Z2L30301&date=le2024-11-01 |

#### Operation一覧

ObservationリソースのOperation一覧の定義はユースケースに依存せず共通であるため、共通情報プロファイルに記載されている。

[Observation共通情報プロファイル#Operation一覧][JP_Observation_Common_Operation]

### サンプル

* [**内視鏡検査 診断1**][jp-observation-endoscopy-example-diagnosis-1]
* [**内視鏡検査 診断2**][jp-observation-endoscopy-example-diagnosis-2]
* [**内視鏡検査 所見1a**][jp-observation-endoscopy-example-findings-1a]
* [**内視鏡検査 所見1b**][jp-observation-endoscopy-example-findings-1b]
* [**内視鏡検査 所見2a**][jp-observation-endoscopy-example-findings-2a]
* [**内視鏡検査 所見2b**][jp-observation-endoscopy-example-findings-2b]

## その他、参考文献、リンク等

* 本プロファイルそのものの定義には影響しないが、消化器内視鏡検査の観察結果をvalueに格納する際は、日本消化器内視鏡学会が推進するJED (Japan Endoscopy Database) Projectに準拠した内容とすることを強く推奨（**SHOULD**）される。
* 2024年11月現在、JED用語のLOINC(http://loinc.org)コードを申請中である。現在、同一用語に対して異なるローカルコードが割り振られている箇所が存在するが、LOINCコード取得時に名寄せする予定である。

{% include markdown-link-references.md %}
