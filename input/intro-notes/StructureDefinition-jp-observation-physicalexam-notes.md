
### 必須要素

次のデータ項目は必須（データが存在しなければならない）、あるいは、データが送信システムに存在する場合はサポートされなければならないことを意味する（Must Support）。

#### 必須
本プロファイルでは、次の要素を持たなければならない。

- `status`︓身体所見情報項目の状態は必須である。
- `category`︓このリソースが示す身体所見情報項目を分類するための区分であり、このプロファイルでは必須とする。
- `code`︓このリソースは何の身体所見情報項目であるかを示すため必須である。
- `subject`︓このリソースが示す身体所見情報項目が、どの患者のものかを示すため、このプロファイルでは参照するpatientリソースの定義を必須とする。

#### Must Support
このプロファイルでは MustSupport要素定義は行っていない。

### Extensions定義
このプロファイルでは拡張定義は行っていない。

## 利用方法

### インタラクション一覧

Observationリソースのインタラクション一覧の定義はユースケースに依存せず共通であるため、共通情報プロファイルに記載されている。

[Observation共通情報プロファイル#インタラクション一覧][JP_Observation_Common_interaction]

### OperationおよびSearch Parameter 一覧

#### Search Parameter一覧

身体所見ユースケースのSearch Parameter一覧は共通情報プロファイルに記載されている。

検索時の`category`パラメータは"exam"となる。

[Observation共通情報プロファイル#Search Parameter一覧][JP_Observation_Common_Search]

#### Operation一覧

`Observation`リソースのOperation一覧の定義はユースケースに依存せず共通であるため、共通情報プロファイルに記載されている。

[Observation共通情報プロファイル#Operation一覧][JP_Observation_Common_Operation]

### サンプル
```json
{
  "resourceType": "Observation",
  "id": "jp-observation-physicalexam",
  "status": "final",
  "category": [
    {
      "coding": [
        {
          "system": "http://terminology.hl7.org/CodeSystem/observation-category",
          "code": "exam",
          "display": "Exam"
        }
      ]
    }
  ],
  "code": {
    "coding": [
      {
        "system": "http://jpfhir.jp/fhir/Common/CodeSystem/observation-physicalExam",
        "code": "physical-findings",
        "display": "Physical Findings"
      }
    ]
  },
  "subject": {
    "reference": "http://jpfhir.jp/fhir/Patient/jp-patient"
  },
  "encounter": {
    "reference": "http://jpfhir.jp/fhir/Encounter/jp-encounter"
  },
  "effectiveDateTime": "2021-07-09T17:00:00+09:00",
  "valueCodeableConcept": {
    "coding": [
      {
        "system": "http://terminology.hl7.org/CodeSystem/v2-0532",
        "code": "Y",
        "display": "Yes"
      }
    ]
  },
  "bodySite": {
    "coding": [
      {
        "system": "http://jpfhir.jp/fhir/Common/CodeSystem/observation-bodySite",
        "code": "TBD",
        "display": "下腹部"
      }
    ]
  },
  "method": {
    "coding": [
      {
        "system": "http://jpfhir.jp/fhir/Common/CodeSystem/observation-method",
        "code": "TBD",
        "display": "触診"
      }
    ]
  },
  "component": [
    {
      "code": {
        "coding": [
          {
            "system": "http://jpfhir.jp/fhir/Common/CodeSystem/observation-physicalExam",
            "code": "detailed-physical-findings",
            "display": "Detailed Physical Findings"
          }
        ]
      },
      "valueString": "圧痛あり"
    }
  ]
}
```
{% include markdown-link-references.md %}