### 必須要素

次のデータ項目は必須（**SHALL**）である。

- status : オーダの状態
- intent : オーダの意図（通常は order）
- subject : 対象患者
- category : オーダの分類
  - category[orderCategory] : オーダ種別（[JP_ServiceRequestOrderCategory_VS][JP_ServiceRequestOrderCategory_VS]から、処方オーダは prescription、注射オーダは injection を指定する）

### MustSupport

本プロファイルではMustSupportを定義しない。

### Extensions定義

本プロファイルで追加定義された拡張はない。

### 用語定義

本プロファイルで追加定義された用語は以下のとおりである。

- [JP_ServiceRequestOrderCategory_CS][JP_ServiceRequestOrderCategory_CS] : オーダ種別を示すコードシステム
- [JP_ServiceRequestOrderCategory_VS][JP_ServiceRequestOrderCategory_VS] : オーダ種別を示す値セット

## 注意事項

### categoryの使い方

`category`をスライスし、次の2種類のコードを格納する。

| スライス名 | 多重度 | 内容 | 値セット |
| --- | --- | --- | --- |
| orderCategory | 1..1 | オーダ種別（処方／注射） | [JP_ServiceRequestOrderCategory_VS][JP_ServiceRequestOrderCategory_VS]（required） |
| medicationCategory | 0..* | 処方区分または注射区分 | `JP_MedicationCategory_VS`（jpfhir-terminology、required） |

#### オーダ種別（orderCategory）

| code | display | 用途 |
| --- | --- | --- |
| prescription | 処方 | 処方オーダ（内服・外用など） |
| injection | 注射 | 注射オーダ（注射・点滴・注入など） |

#### 処方区分・注射区分（medicationCategory）

[JP_MedicationRequest][JP_MedicationRequest]および[JP_MedicationRequest_Injection][JP_MedicationRequest_Injection]の`category`と同じコード体系を使用する。オーダ種別が「処方」の場合は処方区分を、「注射」の場合は注射区分を指定する。複数の観点（例：入院処方かつ定期処方）を表す場合は繰り返して指定する。

| オーダ種別 | 主なコード体系 | コード例 |
| --- | --- | --- |
| 処方 | MERIT-9処方オーダ表7（`http://jpfhir.jp/fhir/core/CodeSystem/JP_MedicationCategoryMERIT9_CS`）、JHSP0007表（`http://jpfhir.jp/fhir/core/CodeSystem/JHSP0007`） | OHP 外来処方、OHO 院外処方、IHP 入院処方、ORD 定期処方、XTR 臨時処方、DCG 退院処方、BDP 持参薬処方 |
| 注射 | JHSI0001表（`http://jpfhir.jp/fhir/core/CodeSystem/JHSI0001`）、MERIT-9処方オーダ表7 | FTP 定時処方、EMP 至急処方、PFP 事後処方、OTP 頓用処方、IHP 入院処方 |

処方区分と注射区分は同じ値セットに含まれるため、スライスは1つ（medicationCategory）とし、どちらを指定するかはオーダ種別で判断する。本プロファイルでは、オーダ種別と区分コードの組み合わせを制約しない。

スライス名は、既存プロファイルで用いている`first`／`second`ではなく、格納するコードの意味が分かる名前（orderCategory、medicationCategory）とした。

#### バインディング強度

orderCategoryスライスおよびmedicationCategoryスライスは、いずれも固定値を持たず、バインドする値セットによってスライスを判別する。このため、両スライスのバインディング強度を required とした。なお、[JP_MedicationRequest][JP_MedicationRequest]および[JP_MedicationRequest_Injection][JP_MedicationRequest_Injection]の`category`は preferred であり、MedicationRequest側で値セット外のコードを使用している場合でも、本プロファイルのmedicationCategoryスライスには値セット内のコードを指定する必要がある。

```json
"category": [
  {
    "coding": [{
      "system": "http://jpfhir.jp/fhir/core/CodeSystem/JP_ServiceRequestOrderCategory_CS",
      "code": "prescription",
      "display": "処方"
    }]
  },
  {
    "coding": [{
      "system": "http://jpfhir.jp/fhir/core/CodeSystem/JP_MedicationCategoryMERIT9_CS",
      "code": "OHP",
      "display": "外来処方"
    }]
  },
  {
    "coding": [{
      "system": "http://jpfhir.jp/fhir/core/CodeSystem/JP_MedicationCategoryMERIT9_CS",
      "code": "OHO",
      "display": "院外処方"
    }]
  }
]
```

### 配下のMedicationRequestとの関連付け

本プロファイルでは配下のMedicationRequestとの関連を要素の制約として定義しない。本節で示す関連付けの方法は参考情報であり、本プロファイルへの準拠を判断する要件ではない。関連付けが必要な場合は、次のいずれかの方法で表現することができる。

#### MedicationRequest.basedOnによる参照

個々の[JP_MedicationRequest][JP_MedicationRequest]／[JP_MedicationRequest_Injection][JP_MedicationRequest_Injection]の`basedOn`から、本プロファイルに準拠したServiceRequestを参照する。両プロファイルの`basedOn`は`JP_ServiceRequest_Common`への参照を許容しており、本プロファイルはその派生であるため、追加の制約なしに利用できる。

```json
"basedOn": [
  { "reference": "ServiceRequest/jp-servicerequest-order-medication-requesting-example-1" }
]
```

あわせて、ServiceRequestの`requisition`とMedicationRequestの`groupIdentifier`に同じオーダ番号（system：`http://jpfhir.jp/fhir/core/IdSystem/resourceInstance-identifier`）を設定すると、参照を解決しなくても同じオーダに属するリソースを特定できる。なお、MedicationRequestの`identifier[requestIdentifier]`には、オーダ番号を接頭部に持つ薬剤ごとの識別子（例：オーダ番号`1234567890`に対して`1234567890.1.1`）を設定する。

```json
"groupIdentifier": {
  "system": "http://jpfhir.jp/fhir/core/IdSystem/resourceInstance-identifier",
  "value": "1234567890"
}
```

この方法では参照の向きが子（MedicationRequest）から親（ServiceRequest）になるため、親のServiceRequestを取得しただけでは配下のMedicationRequestを辿ることができない。親と子をまとめて取得する場合は、`_revinclude`を用いて検索する必要がある（サーバーが`_revinclude`に対応している場合に限る）。

```
GET [base]/ServiceRequest?_id=jp-servicerequest-order-medication-requesting-example-1&_revinclude=MedicationRequest:based-on
```

#### orderDetailの拡張による参照

ServiceRequest側から配下のMedicationRequestを参照する必要がある場合は、`orderDetail`に拡張を追加し、MedicationRequestへの参照を格納する方法が考えられる。この方法では、親のServiceRequestを取得するだけで配下のMedicationRequestへの参照が得られ、`_include`での取得も可能になる。

この拡張はJP Coreでは定義していないため、利用する場合は派生プロファイルで定義すること。なお、`orderDetail`を使用する場合は、基底仕様の制約（prr-1）により`code`も設定する必要がある。

以下は、拡張URLを`http://example.org/fhir/StructureDefinition/servicerequest-orderdetail-medicationrequest`（例示用）とし、1つのMedicationRequestにつき1つの`orderDetail`を設定した記述例である。

```json
{
  "resourceType": "ServiceRequest",
  "id": "example-orderdetail",
  "meta": {
    "profile": [
      "http://jpfhir.jp/fhir/core/StructureDefinition/JP_ServiceRequest_Order_Medication_Requesting"
    ]
  },
  "requisition": {
    "system": "http://jpfhir.jp/fhir/core/IdSystem/resourceInstance-identifier",
    "value": "1234567890"
  },
  "status": "active",
  "intent": "order",
  "category": [
    {
      "coding": [{
        "system": "http://jpfhir.jp/fhir/core/CodeSystem/JP_ServiceRequestOrderCategory_CS",
        "code": "prescription",
        "display": "処方"
      }]
    }
  ],
  "code": {
    "text": "処方オーダ"
  },
  "orderDetail": [
    {
      "extension": [{
        "url": "http://example.org/fhir/StructureDefinition/servicerequest-orderdetail-medicationrequest",
        "valueReference": {
          "reference": "MedicationRequest/jp-medicationrequest-example-1"
        }
      }],
      "text": "RP1 ムコダイン錠２５０ｍｇ"
    },
    {
      "extension": [{
        "url": "http://example.org/fhir/StructureDefinition/servicerequest-orderdetail-medicationrequest",
        "valueReference": {
          "reference": "MedicationRequest/jp-medicationrequest-example-2"
        }
      }],
      "text": "RP2 パンスポリンＴ錠１００　１００ｍｇ"
    }
  ],
  "subject": {
    "reference": "Patient/jp-patient-example-1"
  },
  "authoredOn": "2026-04-01T10:00:00+09:00"
}
```

### その他

- 基底のServiceRequestは「1つのリソースで1つの処置を要求する」ことを前提とする。本プロファイルでは、1つのServiceRequestで1件の処方オーダまたは注射オーダ（オーダ単位）を表し、オーダ内の個々の薬剤指示はMedicationRequestで表す。
- `code`は本プロファイルでは制約しない。オーダ名称などを表す場合は`code.text`を使用してよい。

## 利用方法

#### 検索パラメータ

[ServiceRequest共通の検索パラメータ][JP_ServiceRequest_Common]が利用される。本プロファイルでの主な利用例を以下に示す。

| パラメータ | 型 | 説明 | 例 |
| --- | --- | --- | --- |
| category | token | オーダ種別、処方区分／注射区分による検索 | GET [base]/ServiceRequest?category=http://jpfhir.jp/fhir/core/CodeSystem/JP_ServiceRequestOrderCategory_CS\|prescription |
| requisition | token | オーダ番号による検索 | GET [base]/ServiceRequest?requisition=http://jpfhir.jp/fhir/core/IdSystem/resourceInstance-identifier\|1234567890 |

### サンプル

* [**処方オーダ**][jp-servicerequest-order-medication-requesting-example-1]
* [**注射オーダ**][jp-servicerequest-order-medication-requesting-example-2]

{% include markdown-link-references.md %}
