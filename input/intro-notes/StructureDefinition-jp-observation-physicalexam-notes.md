
### 必須要素

次のデータ項目は必須（データが存在しなければならない）、あるいは、データが送信システムに存在する場合はサポートされなければならないことを意味する（Must Support）。

#### 必須
本プロファイルでは、次の要素を持たなければならない。

- `status`︓身体所見情報項目の状態は必須である。
- `category`︓このリソースが示す身体所見情報項目を分類するための区分であり、このプロファイルでは必須とする。
- `code`︓このリソースは何の身体所見情報項目であるかを示すため必須である。
- `subject`︓このリソースが示す身体所見情報項目が、どの患者のものかを示すため、このプロファイルでは参照するpatientリソースの定義を必須とする。
- `encouter`：このリソースが示す身体所見情報項目が、どの診療イベントにより発生したものかを示すため、このプロファイルでは必須とする。

#### Must Support
このプロファイルでは MustSupport要素定義は行っていない。

### Extensions定義
本プロファイルで使用される拡張は次の通りである。

- [`JPCoreBodySitePositionExtension`](https://simplifier.net/jp-core-draftv1/jpobservationbodysiteposition)
  - 部位（bodySite）の左右の区別を表現する際に使用する。

### 用語定義

| Path                            | 定義                               | バインディング強度 | バリューセット |
| ------------------------------- | ---------------------------------- | ------------------ | -------------- |
| `Observation.category` | 「exam」固定 | Preferred | [`ObservationCategoryCodes`](https://hl7.org/fhir/valueset-observation-category.html) |
| `Observation.code` | 所見の有無を表すコード（固定値） | Required | [`ObservationPhysicalExam`](https://simplifier.net/jp-core-draftv1/jpobservationphysicalexamcode) |
| `Observation.value[x]` | コードに限定する | Required | [`Hl7VSYesNoIndicator`](http://terminology.hl7.org/ValueSet/v2-0136) |
| `Observation.bodySite` | 外保連の操作対象部位を基にバリューセットを定義する。左右の区別は拡張で表現する | Preferred | `ObservationBodySite` |
| `Observation.method` | MEDIS症状・所見マスターの「診察方法」を基にバリューセットを定義する | Preferred | `ObservationMethod` |
| `Observation.component.code` | 具体的な所見を表すコード（固定値） | Required | [`ObservationPhysicalExam`](https://simplifier.net/jp-core-draftv1/jpobservationphysicalexamcode) |

### 制約一覧

このプロファイルでは制約定義は行っていない。


## 利用方法

### インタラクション一覧

Observationリソースのインタラクション一覧の定義はユースケースに依存せず共通であるため、共通情報プロファイルに記載されている。

[Observation共通情報プロファイル#インタラクション一覧](Observation#ObsInteraction)

### OperationおよびSearch Parameter 一覧

#### Search Parameter一覧

身体所見ユースケースのSearch Parameter一覧は共通情報プロファイルに記載されている。

検索時の`category`パラメータは"exam"となる。

[Observation共通情報プロファイル#Search Parameter一覧](Observation#ObsSearch)

#### Operation一覧

`Observation`リソースのOperation一覧の定義はユースケースに依存せず共通であるため、共通情報プロファイルに記載されている。

[Observation共通情報プロファイル#Operation一覧](Observation#ObsOperation)

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
    "extension": [
      {
        "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Observation_BodySite_BodySitePosition",
        "valueString": "右"
      }
    ],
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
