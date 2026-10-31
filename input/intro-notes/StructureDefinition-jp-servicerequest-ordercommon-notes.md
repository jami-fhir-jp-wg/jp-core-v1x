### 必須要素
本プロファイルでは、次の要素を持たなければならない。
- status : ステータスは必須である
- intent : 意図は必須であり、本プロファイルでは"order"に固定される。
- subject : 患者の参照情報は必須であり、subject.referenceないしsubject.identifier が必ず存在しなければならない

### Extensions定義
本プロファイルで使用される拡張は次の通りである。

|拡張|説明|定義|値型|
|:----|:----|:----|:----|
|依頼科|オーダを依頼した診療科を格納する拡張|[JP_Common_Department]|CodeableConcept|
|入外区分|オーダの入外区分を格納する拡張|[JP_ServiceRequest_OrderType]|CodeableConcept|

### 制約一覧
本プロファイルでは、以下の制約を満たさなければならない。
- intent : 有資格者により承認された具体的な要求（いわゆる「オーダ」）であることを意味する"order"に固定される

### 項目の追加
本プロファイルでは、オーダ情報の共通的な属性として、以下の項目の記述方法を定義する。

* 依頼科（拡張「JP_Common_Department」を使用）
* 入外区分（拡張「JP_ServiceRequest_OrderType」を使用）
* オーダID（identifier要素の追加インスタンスを使用）
* オーダ種別（category要素を使用）
* 優先度（priority要素を使用）
* 実施予定日時（occurrence[x]要素を使用）
* 依頼日時（authoredOn要素を使用）
* 依頼者（requester要素を使用）
* 検査目的（reasonCode要素を使用）
* 依頼病名（reasonCode要素ないしリソース化可能な場合はreasonReference要素からJP_Condition_Diagnosisリソースを参照）
* 適用保険（insurance要素からJP_Coverageリソースを参照）
* 依頼コメント（note要素を使用）

### 利用方法

#### Search Parameter一覧

| コンフォーマンス | パラメータ    | 型     | 例                                                           |
| ---------------- | ------------- | ------ | ------------------------------------------------------------ |
| SHALL            | identifier    | token  | GET [base]/ServiceRequest?identifier=http://myhospital.com/fhir/request\|1234567890 |
| SHOULD            | patient      | reference | GET [base]/ServiceRequest?patient=123456   |
| SHOULD           | patient,category | reference,token  | GET [base]/ServiceRequest?patient=123456&category=radiology |
| SHOULD           | patient,date | reference,date  | GET [base]/ServiceRequest?patient=123456&date=eq2013-01-14 |
| SHOULD           | patient,authoredon | reference,date  | GET [base]/ServiceRequest?patient=123456&authoredon=eq2013-01-14 |
| MAY           | date,authoredon,category,code,requester | date,date,token,token,reference | GET [base]/ServiceRequest?code=http://myhospital.com/fhir/request\|105271807  |

##### 必須検索パラメータ

次の検索パラメータは必須でサポートされなければならない。

1. identifier 検索パラメータを使用して、オーダIDなどの識別子によるServiceRequestの検索をサポートしなければならない（SHALL）

   ```
   GET [base]/ServiceRequest?identifier={system|}[token]
   ```

   例：

   ```
   GET [base]/ServiceRequest?identifier=http://myhospital.com/fhir/request|1234567890
   ```

   指定された識別子に一致するServiceRequestリソースを含むBundleを検索する。
  

##### 推奨検索パラメータ

次の検索パラメータをサポートすることが望ましい。

1. patient 検索パラメータを使用して、患者のリファレンス情報によるServiceRequestの検索をサポートすることが望ましい（**SHOULD**）

   ```
   GET [base]/ServiceRequest?patient=[id]
   GET [base]/ServiceRequest?patient=[url]
   ```

   例：

   ```
   GET [base]/ServiceRequest?patient=123456
   ```

   リソースIDが123456の患者のServiceRequestリソースを含むBundleを検索する。

1. patient 検索パラメータを使用して、患者のリファレンス情報とオーダ種別によるServiceRequestの検索をサポートすることが望ましい（**SHOULD**）

   ```
   GET [base]/ServiceRequest?patient=[id]&category=[category]
   GET [base]/ServiceRequest?patient=[url]&category=[category]
   ```

   例：

   ```
   GET [base]/ServiceRequest?patient=123456&category=radiology
   ```

   リソースIDが123456の患者の放射線オーダのServiceRequestリソースを含むBundleを検索する。

1. patient,date 検索パラメータを使用して、患者のリファレンス情報と実施予定日によるServiceRequestの検索をサポートすることが望ましい（**SHOULD**）

   ```
   GET [base]/ServiceRequest?patient=[id]&date=[date]
   GET [base]/ServiceRequest?patient=[url]&date=[date]
   ```

   例：

   ```
   GET [base]/ServiceRequest?patient=123456&date=eq2027-01-14
   ```

   リソースIDが123456の患者の2027-01-14に実施するServiceRequestリソースを含むBundleを検索する。

1. patient,authoredon 検索パラメータを使用して、患者のリファレンス情報と依頼日によるMedicationRequestの検索をサポートすることが望ましい（**SHOULD**）

   ```
   GET [base]/ServiceRequest?patient=[id]&authoredon=[date]
   GET [base]/ServiceRequest?patient=[url]&authoredon=[date]
   ```

   例：

   ```
   GET [base]/ServiceRequest?patient=123456&authoredon=eq2026-03-21
   ```

   リソースIDが123456の患者の2026-03-21に依頼されたServiceRequestリソースを含むBundleを検索する。

#### Operation一覧

本プロファイルでは、リソースに対する固有の操作は定義されていない。

## 注意事項

### 記述の単位について
本プロファイルでは、ServiceRequestリソースの記述単位は特に定めない。本プロファイルから派生されるプロファイルで、オーダ単位の記述とするか、項目単位での記述とするか、検体などその他の単位での記述とするかを定めることとする。

### オーダの階層構造の記述方法について
ServiceRequestリソース単体でオーダ情報を完全な形で記述することは難しいため、オーダ単位のServiceRequestと項目単位のServiceRequestを組み合わせ、basedOn要素で関連付ける実装例もみられるが、basedOn属性のそのような使い方はFHIR基底仕様の本来の意図とは異なるとされており、本プロファイルでは、このような使い方は採用せず、オーダの階層構造の具体的な記述方法は定めない。なお、ユースケースレベルのプロファイルでの上記のような使い方を妨げるものではない。

### 依頼科の記述方法について
依頼科（オーダを依頼した診療科）は、ServiceRequestリソースの標準的な要素では記述が難しいため、JP_Common_Department拡張を使用してCodeableConcept型で記述する。使用する標準コードはSS-MIX2診療科コードを推奨する。

依頼科が「内科」のインスタンス例を示す。
```json
{
  "resourceType": "ServiceRequest",
  ...
  "extension": [
    {
      "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Common_Department",
      "valueCodeableConcept": {
        "coding": [
          {
            "system": "http://jami.jp/SS-MIX2/CodeSystem/ClinicalDepartment",
            "code": "01",
            "display": "内科"
          }
        ]
      }
    }
  ]
}
```

### オーダ入外区分の記述方法について
オーダの入外区分は、ServiceRequestリソースの標準的な要素では記述が難しいため、JP_ServiceRequest_OrderType拡張を使用してCodeableConcept型で記述する。使用する標準コードはHL7表0482を推奨する。

入外区分が「外来」のインスタンス例を示す。
```json
{
  "resourceType": "ServiceRequest",
  ...
  "extension": [
    {
      "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_ServiceRequest_OrderType",
      "valueCodeableConcept": {
        "coding": [
          {
            "system": "http://terminology.hl7.org/CodeSystem/v2-0482",
            "code": "O",
            "display": "外来オーダ"
          }
        ]
      }
    }
  ]
}
```

### オーダIDの記述方法について
オーダIDは、発行したオーダに対してオーダエントリシステムにより採番された一意の文字列である。本プロファイルでは、identifier要素の追加インスタンスとしてIdentifier型で記述する。system値には固定値「http://jpfhir.jp/fhir/core/IdSystem/orderID」を指定する。

オーダIDが「202612270000301」のインスタンス例を示す。
```json
{
  "resourceType": "ServiceRequest",
  ...
  "identifier": [
    {
      "system": "http://myhospital.com/IdSystem/ServiceRequest",
      "value": "00000020.20261227.162128.Z999.2.16.XA0.1"
    }, {
      "system": "http://jpfhir.jp/fhir/core/IdSystem/orderID",
      "value": "202612270000301"
    }
  ]
}
```

### オーダ種別の記述方法について
オーダ種別は、検体検査、放射線検査、生理機能検査、などのオーダの大まかな分類を示す種別であり、本プロファイルでは、category要素を使用してCodeableConcept型で記述する。コード表は「JP_ServiceRequest_OrderCategory_CS」を使用し、system値には固定値「http://jpfhir.jp/fhir/core/CodeSystem/JP_ServiceRequest_OrderCategory」を指定する。

オーダIDが「202612270000301」のインスタンス例を示す。
```json
{
  "resourceType": "ServiceRequest",
  ...
  "category": [
    {
    　"coding": [ {
        "system": "http://jpfhir.jp/fhir/core/CodeSystem/JP_ServiceRequest_OrderCategory_CS",
        "code": "radiology",
        "display": "放射線検査"
      }, {
        "system": "http://myhospital.com/CodeSystem/order-category",
        "code": "C16",
        "display": "放射線検査"
      } ],
      "text": "放射線検査"
    }
  ]
}
```

### 優先度の記述方法について
優先度は、priority要素を使用し、code型で記述する。使用するValueSetは「http://hl7.org/fhir/ValueSet/request-priority」である。

優先度が「asap」のインスタンス例を示す。
```json
{
  "resourceType": "ServiceRequest",
  ...
  "priority": "asap"
}
```

### 実施予定日時の記述方法について
実施予定日時は、occurrence[x]要素を使用し、dateTime型、Period型、Timing型のいずれかで記述する。時刻まで指定しない場合は日付のみの記述でもよい。実施予定日時が未定の場合はoccurrence[x]は省略する。

実施予定日時が「2026-12-01 10:30」のインスタンス例を示す。
```json
{
  "resourceType": "ServiceRequest",
  ...
  "occurrenceDateTime": "2026-12-01T10:30+09:00"
}
```

### 依頼日時の記述方法について
依頼日時は、authoredOn要素を使用し、dateTime型で記述する。

依頼日時が「2026-10-31 11:23:00」のインスタンス例を示す。
```json
{
  "resourceType": "ServiceRequest",
  ...
  "authoredOn": "2026-10-31T11:23:00+09:00"
}
```

### 依頼者の記述方法について
依頼者は、requester要素を使用し、依頼者の情報を記述したPractitioner等のリソースを参照する。

依頼者が「Practitioner/1234」のインスタンス例を示す。
```json
{
  "resourceType": "ServiceRequest",
  ...
  "requester": {
    "reference": "Practitioner/1234",
    "display": "医師 太郎"
  }
}
```

### 検査目的の記述方法について
検査目的は、reasonCode要素を使用し、CodeableConcept型で記述する。コード化されていればcoding要素を使用し、コード化されていない場合はtext要素を使用して記述する。

検査目的が「入院時スクリーニング」のインスタンス例を示す。
```json
{
  "resourceType": "ServiceRequest",
  ...
  "reasonCode": [
    {
      "text": "入院時スクリーニング"
    }
  ]
}
```

### 依頼病名の記述方法について
依頼病名は、reasonCode要素を使用してCodeableConcept型で記述するか、リソース化可能な場合はreasonReference要素からJP_Condition_DiagnosisプロファイルのConditionリソースを参照する。reasonCode要素を使用する場合、コード化されていればcoding要素を使用し、コード化されていない場合はtext要素を使用して記述する。

依頼病名が「肺炎」のインスタンス例を示す。
```json
{
  "resourceType": "ServiceRequest",
  ...
  "reasonCode": [
    {
      "text": "肺炎"
    }
  ]
}
```

依頼病名が「肺炎」を表すConditionリソース「Condition/123」のインスタンス例を示す。
```json
{
  "resourceType": "ServiceRequest",
  ...
  "reasonReference": [
    {
        "reference": "Condition/123",
        "display": "肺炎"
    }
  ]
}
```
なお、reasonCode要素を使用する場合、検査目的と依頼病名の形式上の区別が難しく、内容から判断するしかないので注意が必要である。

### 適用保険の記述方法について
適用保険は、insurance要素からCoverageリソースを参照する。。

適用保険が「組合管掌健康保険」を表すCoverageリソース「Coverage/123」のインスタンス例を示す。
```json
{
  "resourceType": "ServiceRequest",
  ...
  "insurance": [
    {
        "reference": "Coverage/123",
        "display": "組合管掌健康保険"
    }
  ]
}
```

### 依頼コメントの記述方法について
依頼コメントは、node要素を使用してAnnotation型で記述する。

依頼コメントが「造影剤アレルギーがあるので要注意」のインスタンス例を示す。
```json
{
  "resourceType": "ServiceRequest",
  ...
  "note": [
    {
      "text": "造影剤アレルギーがあるので要注意"
    }
  ]
}
```

{% include markdown-link-references.md %}
