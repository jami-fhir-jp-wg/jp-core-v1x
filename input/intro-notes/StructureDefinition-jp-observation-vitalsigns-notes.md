
### 必須要素

次のデータ項目は必須（データが存在しなければならない）、あるいは、データが送信システムに存在する場合はサポートされなければならないことを意味する（Must Support）。

#### 必須
本プロファイルは、次の要素を持たなければならない。

- status︓患者バイタルサイン情報項目の状態は必須である。
- category︓このリソースが示す患者バイタルサイン情報項目を分類するための区分であり、このプロファイルでは必須とする。
- code︓このリソースは何の患者バイタルサイン情報項目であるかを示すため必須である。
- subject︓このリソースが示す患者バイタルサイン情報項目が、どの患者のものかを示すため、このプロファイルでは参照するpatientリソースの定義を必須とする。

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

バイタルサインユースケースのSearch Parameter一覧は共通情報プロファイルに記載されている。

検索時のcategoryパラメータは"vital-sign"となる。

[Observation共通情報プロファイル#Search Parameter一覧][JP_Observation_Common_Search]

#### Operation一覧

ObservationリソースのOperation一覧の定義はユースケースに依存せず共通であるため、共通情報プロファイルに記載されている。

[Observation共通情報プロファイル#Operation一覧][JP_Observation_Common_Operation]

### サンプル
```json
{
  "resourceType": "Observation",
  "id": "vital-12345",
  "category": [
    {
      "coding": [
        {
          "code": "呼吸機能",
          "system": "http://jpfhir.jp/Common/CodeSystem/vitalsign-category",
          "display": "呼吸機能"
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
        "code": "abc-local-123",
        "system": "http://abc-hospital.local/fhir/Observation/localcode",
        "display": "呼吸数"
      },
      {
        "code": "31001369",
        "system": "http://jpfhir.jp/Common/CodeSystem/vitalsign-code",
        "display": "呼吸数"
      }
    ]
  },
  "effectiveDateTime": "2021-10-19T10:00:00+09:00",
  "valueQuantity": {
    "unit": "回",
    "value": 90
  },
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