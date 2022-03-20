
### 必須要素

次のデータ項目は必須（データが存在しなければならない）、あるいは、データが送信システムに存在する場合はサポートされなければならないことを意味する（Must Support）。

#### 必須
本プロファイルでは、次の要素を持たなければならない。

- `status`︓患者身体計測情報の状態は必須である。
- `category`︓このリソースが示す身体計測情報項目を分類するための区分であり、このプロファイルでは必須とする。
- `code`︓このリソースは何の身体計測情報項目であるかを示すため必須である。
- `subject`︓このリソースが示す身体計測情報項目が、どの患者のものかを示すため、このプロファイルでは参照する`patient`リソースの定義を必須とする。
- `encouter`：このリソースが示す身体計測情報項目が、どの診療イベントにより発生したものかを示すため、このプロファイルでは必須とする。

#### Must Support
このプロファイルでは MustSupport要素定義は行っていない。

### Extension定義
このプロファイルでは拡張定義は行っていない。

### 用語定義

| Path | 定義 | バインディング強度 | バリューセット |
|---|---|---|---|
| `Observation.category` | MEDISの看護実践用語標準マスター＜看護観察編＞の大分類１．バイタルサイン・基本情報、中分類2．身体計測の「焦点」を基にバリューセットを定義する | Preferred | `BodyMeasurementCategory` |
| `Observation.code` | MEDISの看護実践用語標準マスター＜看護観察編＞の大分類１．バイタルサイン・基本情報、中分類2．身体計測を対象とする | Preferred | `BodyMeasurementCode` |

### 制約一覧

このプロファイルでは制約定義は行っていない。


## 利用方法

### インタラクション一覧

`Observation`リソースのインタラクション一覧の定義はユースケースに依存せず共通であるため、共通情報プロファイルに記載されている。

[Observation共通情報プロファイル#インタラクション一覧](Observation#ObsInteraction)

### OperationおよびSearch Parameter 一覧

#### Search Parameter一覧

身体計測ユースケースのSearch Parameter一覧は共通情報プロファイルに記載されている。

検索時の`category`パラメータは"vital-sign"となる。

[Observation共通情報プロファイル#Search Parameter一覧](Observation#ObsSearch)

#### Operation一覧

ObservationリソースのOperation一覧の定義はユースケースに依存せず共通であるため、共通情報プロファイルに記載されている。

[Observation共通情報プロファイル#Operation一覧](Observation#ObsOperation)

### サンプル
```json
{
  "resourceType": "Observation",
  "id": "bm-12345",
  "category": [
    {
      "coding": [
        {
          "code": "体重",
          "system": "http://jpfhir.jp/Common/CodeSystem/bodymeasurement-category",
          "display": "体重"
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
        "display": "体重"
      },
      {
        "code": "31000296",
        "system": "http://jpfhir.jp/Common/CodeSystem/vitalsign-code",
        "display": "体重"
      }
    ]
  },
  "effectiveDateTime": "2021-10-19T10:00:00+09:00",
  "valueQuantity": {
    "unit": "kg",
    "value": 63.5
  },
  "status": "final",
  "meta": {
    "lastUpdated": "2021-10-22T07:33:41Z",
    "versionId": "1"
  }
}
```
