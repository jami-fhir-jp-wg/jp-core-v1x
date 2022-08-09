
### 必須要素

次のデータ項目は必須（データが存在しなければならない）、あるいは、データが送信システムに存在する場合はサポートされなければならないことを意味する（Must Support）。

#### 必須
本プロファイルでは、次の要素を持たなければならない。

- status︓生活背景情報項目の状態は必須である。
- category︓このリソースが示す生活背景情報項目を分類するための区分であり、このプロファイルでは必須とする。
- code︓このリソースは何の生活背景情報項目であるかを示すため必須である。
- subject︓このリソースが示す生活背景情報項目が、どの患者のものかを示すため、このプロファイルでは参照するpatientリソースの定義を必須とする。

#### Must Support
このプロファイルでは MustSupport要素定義は行っていない。

### Extension定義
このプロファイルでは拡張定義は行っていない。

## 利用方法

### インタラクション一覧

Observationリソースのインタラクション一覧の定義はユースケースに依存せず共通であるため、共通情報プロファイルに記載されている。

[Observation共通情報プロファイル#インタラクション一覧][JP_Observation_Common_interaction]

### OperationおよびSearch Parameter 一覧

#### Search Parameter一覧

生活背景情報ユースケースのSearch Parameter一覧は共通情報プロファイルに記載されている。

検索時のcategoryパラメータは"vital-sign"となる。

[Observation共通情報プロファイル#Search Parameter一覧][JP_Observation_Common_Search]

#### Operation一覧

ObservationリソースのOperation一覧の定義はユースケースに依存せず共通であるため、共通情報プロファイルに記載されている。

[Observation共通情報プロファイル#Operation一覧][JP_Observation_Common_Operation]

### サンプル
```json
{
  "resourceType": "Observation",
  "id": "social-12345",
  "category": [
    {
      "coding": [
        {
          "code": "social-history",
          "system": "http://terminology.hl7.org/CodeSystem/observation-category",
          "display": "Social History"
        }
      ]
    }
  ],
  "subject": {
    "reference": "Patient/Patient-67890"
  },
  "code": {
    "coding": [
      {
        "code": "abc-local-456",
        "system": "http://abc-hospital.local/fhir/Observation/localcode",
        "display": "ブリンクマン指数"
      },
      {
        "code": "MD0012920",
        "system": "http://jpfhir.jp/Common/CodeSystem/social-history",
        "display": "喫煙指数"
      }
    ]
  },
  "effectiveDateTime": "2021-10-19T10:00:00+09:00",
  "valueQuantity": {
    "value": 400
  },
  "component": [
    {
      "code": {
        "coding": [
          {
            "code": "MD0012910",
            "system": "http://jpfhir.jp/Common/CodeSystem/social-history",
            "display": "通算喫煙年数"
          }
        ],
        "text": "通算喫煙年数"
      },
      "valueQuantity": {
        "unit": "年",
        "value": 20
      }
    },
    {
      "code": {
        "coding": [
          {
            "code": "MD0012900",
            "system": "http://jpfhir.jp/Common/CodeSystem/social-history",
            "display": "１日の喫煙本数"
          }
        ],
        "text": "１日の喫煙本数"
      },
      "valueQuantity": {
        "unit": "本",
        "value": 20
      }
    }
  ],
  "performer": [
    {
      "reference": "Practitioner/Practitioner-abcde"
    }
  ],
  "status": "final",
  "meta": {
    "lastUpdated": "2021-10-22T07:33:41Z",
    "versionId": "1"
  }
}
```
{% include markdown-link-references.md %}
