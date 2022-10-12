
### 必須要素
次のデータ項目は必須（データが存在しなければならない）である。

MedicationAdministrationリソースは、次の要素を持たなければならない。
- status : ステータスは必須であり、JP Coreでは `completed` or `stopped` に限定される
- medicationReference : 医薬品の識別情報は必須でありmedicationReference.referenceが必ず存在しなければならない、JP Coreでは注射の医薬品情報は単一薬剤の場合もMedicationリソースとして記述し、MedicationRequest.contained属性に内包しmedicationCodeableConceptは使用しない
- subject :患者の参照情報は必須でありsubject.referenceないしsubject.identifierが必ず存在しなければならない
- effectiveDateTime : 投与実施日時であり、JP Coreでは必須である

MedicationAministrationリソースに内包されるMedicationリソースでは、次の要素を持たなければならない。
- ingredient.itemCodeableConcept : 医薬品の識別情報であり、JP Coreでは必須である

※投与実施のユースケースにおいては、実施投与量(ingredient.strength)が必須であることが望ましいが、ワーキンググループでの検討の結果、投与中止のユースケースも考慮して必須としない結論となった。

### Extensions定義
JP Core MedicationAdministration Injection プロファイルで使用される拡張は次の通りである。

|拡張|説明|定義|値型|
|:----|:----|:----|:----|
|依頼科|依頼科を格納するための拡張|[JP_MedicationAdministration_RequestDepartment]|CodeableConcept|
|依頼日時|依頼日時を格納するための拡張|[JP_MedicationAdministration_RequestAuthoredOn]|DateTime|
|実施場所|実施場所を格納するための拡張|[JP_MedicationAdministration_Location]|Reference(Location)|
|依頼医|依頼医を格納するための拡張|[JP_MedicationAdministration_Requester]|Reference(Practitioner)|
|未分類コメント|未分類コメントを格納するための拡張|[JP_MedicationAdministration_UncategorizedComment]|CodeableConcept/String|
|RP内薬剤番号|RP内の薬剤の連番を格納する拡張<br/>《medicationReference配下》|[JP_Medication_Ingredient_DrugNo]|integer|
|力価区分|投与量が製剤単位か成分単位かを格納する拡張<br/>《medicationReference配下》|[JP_Medication_IngredientStrength_StrengthType]|CodeableConcept|
|用法コメント|用法コメントを格納するための拡張|[JP_MedicationDosage_DosageComment]|CodeableConcept/String|
|投与装置|投与装置を格納する拡張|[JP_MedicationDosage_Device]|Reference (Device)|
|指示ライン|指示ラインを格納する拡張<|[JP_MedicationDosage_Line]|CodeableConcept|
|ラインコメント|ラインコメントを格納するための拡張|[JP_MedicationDosage_LineComment]|CodeableConcept/String|
|投与部位詳細|投与部位詳細を格納するための拡張<br/>《dosageInstruction配下》|[bodySite(hl7.org)](http://hl7.org/fhir/R4/extension-bodysite.html)|Reference (BodyStructure)|
|投与部位コメント|投与部位コメントを格納するための拡張|[JP_MedicationDosage_SiteComment]|CodeableConcept/String|
|投与経路コメント|投与経路コメントを格納するための拡張|[JP_MedicationDosage_RouteComment]|CodeableConcept/String|
|手技コメント|手技コメントを格納するための拡張|[JP_MedicationDosage_MethodComment]|CodeableConcept/String|
|投与速度コメント|投与速度コメントを格納するための拡張|[JP_MedicationDosage_RateComment]|CodeableConcept/String|

### 用語定義

HL7 FHIRの基底規格では、薬剤コードをはじめとして、剤形などでSNOMED CTが使われているが、日本ではライセンスの問題もあり普及していない。代替としてJAHIS処方データ交換規約やSS-MIX2で使われている用語集を採用した。

HL7 V2系では用語集を識別するコーディングシステム名(以下、「CS名」）は文字列であったが、FHIRではURIを指定する必要があるため、それぞれにURIを割り当てた。以下に使用する用語集のCS名とURI表記を列記する。

|分類|CS名|URI|
|---------|----|---------------------------|
|医薬品|HOT7|urn:oid:1.2.392.200119.4.403.2|
|医薬品|HOT9|urn:oid:1.2.392.200119.4.403.1|
|医薬品|HOT13|urn:oid:1.2.392.200119.4.402.1|
|医薬品|YJコード|urn:oid:1.2.392.100495.20.1.73|
|医薬品|⼀般処⽅名マスター|urn:oid:1.2.392.100495.20.1.81|
|薬品単位|MERIT-9(単位）|urn:oid:1.2.392.100495.20.2.101|
|力価区分|処方情報 HL7FHIR 記述仕様(力価区分)|urn:oid:1.2.392.100495.20.2.22|
|用法|JAMI処方・注射オーダ標準用法規格(用法コード)|urn:oid:1.2.392.200250.2.2.20.20|
|用法|JAMI処方・注射オーダ標準用法規格(補足用法コード)|urn:oid:1.2.392.200250.2.2.20.22|
|部位|JAMI処方・注射オーダ標準用法規格(部位コード)|urn:oid:1.2.392.200250.2.2.20.32|
|投与方法|JAMI処方・注射オーダ標準用法規格(基本用法区分)|urn:oid:1.2.392.200250.2.2.20.30|
|投与経路|JAMI処方・注射オーダ標準用法規格(用法詳細区分)|urn:oid:1.2.392.200250.2.2.20.40|
|入外区分|HL7V2(HL7表0482)|http://terminology.hl7.org/CodeSystem/v2-0482|

### 項目の追加
MedicationAdministrationリソースでは、依頼元のMedicationRequestリソースをrequest要素にReferenceで参照できるようになっているが、
依頼元のMedicationRequestリソースが取得できないケースも考慮して、依頼情報を直接記述できるように以下の項目を追加した。

* 依頼科の追加（拡張「JP_MedicationAdministration_RequestDepartment」を使用）
* 依頼医の追加（拡張「JP_MedicationAdministration_Requester」を使用）
* 依頼日時の追加（拡張「JP_MedicationAdministration_RequestAuthoredOn」を使用）

また、投薬実施場所（病棟、病室、ベッド番号など）を記述できるように以下の項目を追加した。

* 実施場所の追加（拡張「JP_MedicationAdministration_Location」を使用）

## 利用方法

#### Search Parameter一覧

| コンフォーマンス | パラメータ    | 型     | 例                                                           |
| ---------------- | ------------- | ------ | ------------------------------------------------------------ |
| SHALL            | identifier    | token  | GET [base]/MedicationAdministration?identifier=http://myhospital.com/fhir/medication\|1234567890 |
| SHOULD            | patient      | reference | GET [base]/MedicationAdministration?patient=123456   |
| SHOULD           | patient,effective-time | reference,date  | GET [base]/MedicationAdministration?patient=123456&effective-time=eq2013-01-14 |
| MAY           | effective-time,medication,performer,request | date,reference,reference,reference | GET [base]/MedicationAdministration?medication.ingredient-code=urn:oid:1.2.392.200119.4.403.1|105271807  |

##### 必須検索パラメータ

次の検索パラメータは必須でサポートされなければならない。

1. identifier 検索パラメータを使用して、オーダIDなどの識別子によるMedicationAdministrationの検索をサポートしなければならない（SHALL）

   ```
   GET [base]/MedicationAdministration?identifier={system|}[code]
   ```

   例：

   ```
   GET [base]/MedicationAdministration?identifier=http://myhospital.com/fhir/medication|1234567890
   ```

   指定された識別子に一致するMedicationAdministrationリソースを含むBundleを検索する。
   

##### 推奨検索パラメータ

次の検索パラメータをサポートすることが望ましい。

1. patient 検索パラメータを使用して、患者のリファレンス情報によるMedicationAdministrationの検索をサポートすることが望ましい（**SHOULD**）

   ```
   GET [base]/MedicationAdministration?patient=[id]
   GET [base]/MedicationAdministration?patient=[url]
   ```

   例：

   ```
   GET [base]/MedicationAdministration?patient=123456
   ```

   リソースIDが123456の患者のMedicationAdministrationリソースを含むBundleを検索する。

1. patient,effective-time 検索パラメータを使用して、患者のリファレンス情報と払い出し日によるMedicationAdministrationの検索をサポートすることが望ましい（**SHOULD**）

   ```
   GET [base]/MedicationAdministration?patient=[id]&effective-time=[date]
   GET [base]/MedicationAdministration?patient=[url]&effective-time=[date]
   ```

   例：

   ```
   GET [base]/MedicationAdministration?patient=123456&effective-time=eq2013-01-14
   ```

   リソースIDが123456の患者の2013-01-14に投与実施されたMedicationAdministrationリソースを含むBundleを検索する。


##### 追加検索パラメータ 

追加検索パラメータは定義しない。

#### Operation一覧

JP MedicationAdministration リソースに対して使用される操作は次の通りである。

- $everything：[base]/MedicationAdministration/[id]/$everything

  - この操作が呼び出された特定のMedicationAdministrationに関連する全ての情報を返す
    

#### Operation 詳細

##### $everything 操作

この操作は、この操作が呼び出された特定のMedicationAdministrationリソースに関連する全ての情報を返す。応答は "searchset" タイプのBundleリソースである。サーバは、少なくとも、識別されたMedicationAdministrationコンパートメントに含まれる全てのリソースと、それらから参照されるすべてのリソースを返すことが望ましい。

この操作の公式なURLは以下である。

```
http://hl7.jp/fhir/OperationDefinition/MedicationAdministration-everything
```

URL: [base]/MedicationAdministration/[id]/$everything

本操作は、べき等な操作である。


###### 入力パラメータ

| 名前   | 多重度 | 型      | 説明                                                         |
| ------ | ------ | ------- | ------------------------------------------------------------ |
| start  | 0..1   | date    | 特定の日付範囲で提供されたケアに関連する全ての記録を意味する。開始日が指定されていない場合、終了日以前のすべてのレコードが対象に含まれる。 |
| end    | 0..1   | date    | 特定の日付範囲で提供されたケアに関連する全ての記録を意味する。終了日が指定されていない場合、開始日以降のすべてのレコードが対象に含まれる。 |
| _since | 0..1   | instant | 指定された日時以降に更新されたリソースのみが応答に含まれる。 |
| _type  | 0..*   | code    | 応答に含むFHIRリソース型を、カンマ区切りで指定する。指定されない場合は、サーバは全てのリソース型を対象とする。 |
| _count | 0..1   | integer | Bundleの1ページに含まれるリソース件数を指定。                |

###### 出力パラメータ

| 名前   | 多重度 | 型     | 説明                                                         |
| ------ | ------ | ------ | ------------------------------------------------------------ |
| return | 1..1   | Bundle | バンドルのタイプは"searchset"である。この操作の結果は、リソースとして直接返される。 |

###### 例

リクエスト：単一のMedicationAdministrationに関連する全てのリソースを取得する。

```
GET [base]/MedicationAdministration/1234567890/$everything
[some headers]
```

レスポンス：指定されたMedicationAdministrationに関連する全てのリソースを返す。

```
HTTP/1.1 200 OK
[other headers]

{
  "resourceType": "Bundle",
  "id": "example",
  "meta": {
    "lastUpdated": "2014-08-18T01:43:33Z"
  },
  "type": "searchset",
  "entry": [
    {
      "fullUrl": "http://example.org/fhir/MedicationAdministration/1234567890",
      "resource": {
        "resourceType": "MedicationAdministration",

          ・・・

       },
    }
  ]
}  
```

### サンプル
[JAHIS注射データ交換規約Ver.2.1C](https://www.jahis.jp/standard/detail/id=590)に記載されている下記の注射実施をFHIRで表現する場合のサンプルを示す。

- [**ワンショット静脈注射 実施**][jp-medicationadministration-injection-example-1] 
- [**点滴注射 実施**][jp-medicationadministration-injection-example-2] 

## 注意事項

### 記述の単位について
MedicationAdministrationは薬剤をCodeableConceptとして1つまでしか持つか、Medicationリソースのreferenceをもつことしかできない。したがって、複数の薬剤を同一のRp番号で表現する場合にはMedicationAdministrationを繰り返すか、複数の薬剤をまとめたMedication Resourceのインスタンスを参照することとなる。ワーキンググループでの検討の結果、複数の薬剤をまとめたMedicationリソースのインスタンスをcontained属性に内包した上で参照することとした。

### 投与薬剤、投与量の記述方法
１回の投与薬剤と投与量は、RP内の薬剤が１薬剤の場合も混注などで複数の薬剤を含む場合も、すべての薬剤を記述したMedicationリソースを contained 属性に内包し、それをMedicationRequest.medicationReference属性で参照するようにする。
Medicationリソースのingredient.itemCodeableConcept要素にCodeableConcept型で各薬剤の識別情報を記述し、ingredient.strength.numerator要素に１回あたりの含有量を記述する。薬剤を識別するコードはHOT7、HOT9、YJコードを推奨するが、ローカルコードを使用してもよい。含有量の単位コードは MERIT-9を使用する。ingredient.strength.denominatorには固定値「１回」をMERIT-9を使用して指定する。
dosage.dose要素には、情報が得られる場合には全体の容量をUCUM(`http://unitsofmeasure.org`)を使用してmL単位で指定する。

### 投薬管理ステータス
投与が実施された場合、status要素に `completed` を記述する。
```json
"status": "completed"
```

投与が中止された場合、status要素に `stopped` を記述する。
```json
"status": "stopped"
```

### 実施日
投与が実施された日時をeffectiveDateTime、またはeffectivePeriod要素に[RFC3339](https://datatracker.ietf.org/doc/html/rfc3339)形式で記述する。
タイムゾーンはJST(+09:00)を指定する。

開始日時、終了日時が明確である場合はeffectivePeriodに記述する。（e.g. 点滴注射）
```json
"effectivePeriod": {
  "start": "2016-07-01T08:05:21+09:00",
  "end": "2016-07-01T13:05:43+09:00"
}
```
開始日時しか存在せず終了日時が明確でない場合、effectivePeriodのstartとendに同じ値を記述するか、effectiveDateTime要素に記述する。（e.g. ワンショット注射）
```json
"effectiveDateTime": "2016-08-25T08:30:00+09:00"
```

### 実施者
投与を実施した医療従事者（自己管理の場合は患者）をperformer要素に記述する。

performer.functionには、FHIR標準のValueSetである `http://terminology.hl7.org/CodeSystem/med-admin-perform-function` から、実施者を表す `performer` を固定で記述する。
performer.actorには、医療従事者(Practitioner)、または患者(Patient)リソースの参照を記述する。
```json
"performer": {
  "function": {
    "coding": [
      {
        "system": "http://terminology.hl7.org/CodeSystem/med-admin-perform-function",
        "code": "performer",
        "display": "Performer"
      }
    ]
  },
  "actor": {
    "reference": "Practitioner/1"
  }
}
```

### 実施場所
投与を実施した場所（病棟、病室、ベッド番号など）を、拡張「JP_MedicationAdministration_Location」を使用して、Reference型でLocationリソースの参照情報を記述する。
(Location Resourceの記述仕様については、当プロファイルのスコープ外とする)
```json
{
  "resourceType": "MedicationAdministration",
  "extension": [
    {
      "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Location",
      "valueReference": {
        "reference": "Location/1"
      }
    }
  ]
}
```

### 実施投与ライン
投与時に使用したラインを記述する場合は、dosage要素で拡張「JP_MedicationDosage_Line」を使用し、CodeableConcept型で指定する。推奨するコードシステムはないので、ローカルコードを使用する。

```json
"dosage": {
  "extension": [
    {
      "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationDosage_Line",
      "valueCodeableConcept": {
        "coding": [
          {
            "system": "http://jpfhir.jp/fhir/Examples/CodeSystem/JP_MedicationRequestDosageInstructionLine_CS",
            "code": "01",
            "display": "末梢ルート"
          }
        ]
      }
    }
  ]
}
```

### 実施投与経路
「1:内服」、「2:外用」などJAMI標準用法コードにて基本用法区分として表現される区分は、dosage.route 要素にコードまたは文字列で指定する。基本用法区分を識別するURIとして、"urn:oid:1.2.392.200250.2.2.20.30"を使用する。

```json
"dosage": {
  "route": {
    "coding": [
      {
        "system": "http://terminology.hl7.org/CodeSystem/v2-0162",
        "code": "IV",
        "display": "静脈内"
      }
    ]
  }
}
```

### 実施投与部位
投与部位を指定する場合は、dosage.site 要素に、CodeableConcept型で指定する。部位コードは、JAMI標準用法コード 表13 外用部位コード（"urn:oid:1.2.392.100495.20.2.33"）を推奨する。
HL7表0550 身体部位("http://terminology.hl7.org/CodeSystem/v2-0550")とHL7表0495 身体部位修飾子("http://terminology.hl7.org/CodeSystem/v2-0495")を組み合わせて使用してもよいが、その場合は拡張「BodyStructure」を使用する。
この拡張は BodyStructureリソースを参照することができるので、location 要素にHL7表0550 身体部位("http://terminology.hl7.org/CodeSystem/v2-0550")のコードを、locationQualifier 要素に
身体部位修飾子("http://terminology.hl7.org/CodeSystem/v2-0495")のコードをそれぞれ指定したBodyStructureリソースをMedicationRequestリソースのcontained属性に内包し、それをExtension.valueReference 要素で参照するようにする。

投与部位「左腕」をJAMI標準用法コードで指定した場合のインスタンス例を示す。

```json
"dosage": [
  {
    "site": {
      "coding": [
        {
          "system": "urn:oid:1.2.392.100495.20.2.33",
          "code": "73L",
          "display": "左腕"
        }
      ]
    },

```

投与部位「左腕」をHL7表0550 身体部位とHL7表0495 身体部位修飾子で指定した場合のインスタンス例を示す。

```json
"contained": [
  {
    "resourceType": "BodyStructure",
    "id": "#site",
    "location": {
      "coding": [
        {
          "system": "http://terminology.hl7.org/CodeSystem/v2-0550",
          "code": "ARM",
          "display": "腕"
        }
      ]
    },
    "locationQualifier": [
      {
        "coding": [
          {
            "system": "http://terminology.hl7.org/CodeSystem/v2-0495",
            "code": "L",
            "display": "左"
          }
        ]
      }
    ]
  }
],
"dosage": [
  {
    "site": {
      "extension": [
        {
          "url": "http://hl7.org/fhir/core/StructureDefinition/bodySite",
          "valueReference": "#site"
        }
      ]
    }
  }
]
```

### 実施投与手技
「A:貼付」、「B:塗布」などJAMI標準用法コードにて用法詳細区分として表現される区分は、dosage.method 要素にコードまたは文字列で指定する。 用法詳細区分を識別するURIとして、"urn:oid:1.2.392.200250.2.2.20.40"を使用する。

```json
"dosage": {
  "method": {
    "coding": [
      {
        "system": "http://terminology.hl7.org/CodeSystem/v2-0165",
        "code": "IVP",
        "display": "IVプッシュ"
      }
    ]
  }
}
```

### 実施投与量
Medication.ingredientに記述される薬剤の合計容量(mL)を dosage.dose に、SimpleQuantity型で記録する。単位コードには、医薬品単位略号を使用する。

以下薬剤を混注した際の合計容量「510mL」を記述したインスタンス例を示す。
```
ソリタ－Ｔ３号輸液５００ｍＬ ... 1本
アドナ注（静脈用）５０ｍｇ／１０ｍＬ ... 1アンプル
```
=> **510mL** (500mL + 10mL) をdosage.doseに記述する。

```json
"dosage": {
  "dose": {
    "value": 510,
    "unit": "mL",
    "system": "http://unitsofmeasure.org",
    "code": "mL"
  }
}
```

### 投与速度
点滴注射など一定の速度で時間をかけて投与する場合、その投与速度は dosageInstruction.doseAndRate.rateRatioを使用してRatio型で表現する。単位コードには、UCUM(`http://unitsofmeasure.org`)を使用する。

投与速度「100mL/h」を記述したインスタンス例を示す。

```json
"dosage": {
  "rateRatio": {
    "numerator": {
      "value": 100,
      "unit": "mL",
      "system": "http://unitsofmeasure.org",
      "code": "mL"
    },
    "denominator": {
      "value": 1,
      "unit": "h",
      "system": "http://unitsofmeasure.org",
      "code": "h"
    }
  }
}
```

### 各種実施コメント

#### 投与経路コメント
投与経路を補足するためのコメントは、route要素に対して定義した拡張「JP_MedicationAdministration_Route_RouteComment」を使用する。
この拡張は、コメントがコード化されている場合はCodeableConcept型を使用して記述する。コード化されていない場合はString型を使用して記述する。
複数のコメントを記述する場合は、この拡張を繰り返して記述する。

投与経路コメントをString型で記述したインスタンス例を示す。
```json
"route": {
  "extension": [
    {
      "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Route_RouteComment",
      "valueString": "右手に実施"
    }
  ],
  "coding": [
    {
      "system": "http://terminology.hl7.org/CodeSystem/v2-0162",
      "code": "IV",
      "display": "静脈内"
    }
  ]
}
```

#### 投与部位コメント
投与部位を補足するためのコメントは、site要素に対して定義した拡張「JP_MedicationAdministration_Site_SiteComment」を使用する。
この拡張は、コメントがコード化されている場合はCodeableConcept型を使用して記述する。コード化されていない場合はString型を使用して記述する。
複数のコメントを記述する場合は、この拡張を繰り返して記述する。

投与部位コメントをString型で記述したインスタンス例を示す。

```json
"site": {
  "extension": [
    {
      "url": "http://hl7.org/fhir/core/StructureDefinition/bodySite",
      "valueReference": {
        "reference": "BodyStructure/1",
        "display": "右腕"
      }
    },
    {
      "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Site_SiteComment",
      "valueString": "左利きのため"
    }
  ]
}
```

#### 手技コメント
手技を補足するためのコメントは、method要素に対して定義した拡張「JP_MedicationAdministration_Method_MethodComment」を使用する。
この拡張は、コメントがコード化されている場合はCodeableConcept型を使用して記述する。コード化されていない場合はString型を使用して記述する。
複数のコメントを記述する場合は、この拡張を繰り返して記述する。

手技コメントをString型で記述したインスタンス例を示す。

```json
"method": {
  "extension": [
    {
      "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Method_MethodComment",
      "valueString": "１分ほどかけて緩徐に行いました"
    }
  ],
  "coding": [
    {
      "system": "http://jpfhir.jp/medication/99ILL",
      "code": "101",
      "display": "静注(末梢)"
    }
  ]
}
```

#### ラインコメント
ラインを補足するためのコメントは、dosage要素に対して定義した拡張「JP_MedicationDosage_LineComment」を使用する。
この拡張は、コメントがコード化されている場合はCodeableConcept型を使用して記述する。コード化されていない場合はString型を使用して記述する。
複数のコメントを記述する場合は、この拡張を繰り返して記述する。

ラインコメントをString型で記述したインスタンス例を示す。

```json
"dosage": {
  "extension": [
    {
      "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationDosage_Line",
      "valueCodeableConcept": {
        "coding": [
          {
            "system": "http://jpfhir.jp/fhir/Examples/CodeSystem/JP_MedicationRequestDosageInstructionLine_CS",
            "code": "01",
            "display": "末梢ルート"
          }
        ]
      }
    },
    {
      "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationDosage_LineComment",
      "valueString": "末梢キープ"
    }
  ]
}
```

#### 投与速度コメント
投与速度を補足するためのコメントは、rate要素に対して定義した拡張「JP_MedicationAdministration_Rate_RateComment」を使用する。
この拡張は、コメントがコード化されている場合はCodeableConcept型を使用して記述する。コード化されていない場合はString型を使用して記述する。
複数のコメントを記述する場合は、この拡張を繰り返して記述する。

投与速度コメントをString型で記述したインスタンス例を示す。

```json
"rateRatio": {
  "extension": [
    {
      "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Rate_RateComment",
      "valueString": "倍速で実施"
    }
  ],
  "numerator": {
    "value": 102,
    "unit": "mL",
    "system": "http://unitsofmeasure.org",
    "code": "mL"
  },
  "denominator": {
    "value": 1,
    "unit": "h",
    "system": "http://unitsofmeasure.org",
    "code": "h"
  }
}
```

#### 用法コメント
用法を補足するためのコメントは、dosage要素に対して定義した拡張「JP_MedicationDosage_DosageComment」を使用する。
この拡張は、コメントがコード化されている場合はCodeableConcept型を使用して記述する。コード化されていない場合はString型を使用して記述する。
複数のコメントを記述する場合は、この拡張を繰り返して記述する。

用法コメントをString型で記述したインスタンス例を示す。

```json
"dosage": {
  "extension": [
    {
      "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationDosage_DosageComment",
      "valueString": "痙攣が発生したため、主治医に確認の上実施しました"
    }
  ]
}
```

#### 進捗コメント
進捗を補足するためのコメントは、reasonCode要素を使用してCodeableConcept型でテキストによる記述とコードによる記述のどちらかを選択することができる。

進捗コメントをテキストで記述したインスタンス例を示す

```json
"reasonCode": {
  "text": "容体急変のため倍の速度で実施"
}
```

#### 未分類コメント
上記のコメントに分類できない、またはシステム的に分類して管理されていない場合、MedicationAdministrationに対して定義した拡張「JP_MedicationAdministration_UncategorizedComment」を使用する。
この拡張は、コメントがコード化されている場合はCodeableConcept型を使用して記述する。コード化されていない場合はString型を使用して記述する。
複数のコメントを記述する場合は、この拡張を繰り返して記述する。

未分類コメントをString型で記述したインスタンス例を示す。
```json
{
  "resourceType": "MedicationAdministration",
  "extension": [
    {
      "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_UncategorizedComment",
      "valueString": "１分ほどかけて緩徐に行いました"
    },
    {
      "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_UncategorizedComment",
      "valueString": "痙攣が発生したため、主治医に確認の上実施しました"
    }
  ]
}
```

### 投薬依頼情報
実施の元となった投薬依頼(MedicationRequest)リソースの参照を記述する。
```json
"request": {
  "reference": "MedicationRequest/1"
}
```

### 依頼科
投薬依頼を行なった診療科を、拡張「JP_MedicationAdministration_RequestDepartment」を使用して、CodeableConcept型で記述する。
```json
{
  "resourceType": "MedicationAdministration",
  "extension": [
    {
      "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_RequestDepartment",
      "valueCodeableConcept": {
        "coding": [
          {
            "system": "urn:oid:1.2.392.200250.2.2.2",
            "code": "01",
            "display": "内科"
          }
        ]
      }
    }
  ]
}
```

### 依頼医師
投薬依頼を行なった医師を、拡張「JP_MedicationAdministration_Requester」を使用して、Reference型でPractitionerリソースの参照情報を記述する。
(Practitioner Resourceの記述仕様については、当プロファイルのスコープ外とする)
```json
{
  "resourceType": "MedicationAdministration",
  "extension": [
    {
      "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Requester",
      "valueReference": {
        "reference": "Practitioner/2"
      }
    }
  ]
}
```

### 依頼日時
投薬依頼を行なった日時を、拡張「JP_MedicationAdministration_RequestAuthoredOn」を使用して、[RFC3339](https://datatracker.ietf.org/doc/html/rfc3339)形式で記述する。
タイムゾーンはJST(+09:00)を指定する。
```json
{
  "resourceType": "MedicationAdministration",
  "extension": [
    {
      "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_RequestAuthoredOn",
      "valueDateTime": "2016-08-20T09:30:00+09:00"
    }
  ]
}
```

### 薬剤処方の各種指示情報の記述方法について
投与実施の基となった薬剤処方の用法などの情報は、特に記述のない限り JP Core MedicationRequest Injection と同様の記述方法とする。該当する項目としては以下のものがある。

* RP番号、薬剤番号、施用番号
* 処方箋番号（オーダID）
* 投与方法、投与手技、投与経路、投与ライン、投与装置
* 入外区分

## その他、参考文献・リンク等
1. HL7, FHIR MedicationRequest Resource, [https://hl7.org/fhir/R4/medicationrequest.html](https://hl7.org/fhir/R4/medicationrequest.html)
1. 保健医療福祉情報システム工業会, JAHIS 処方データ交換規約 Ver.3.0C, [https://www.jahis.jp/standard/detail/id=564](https://www.jahis.jp/standard/detail/id=564)
1. 日本医療情報学会MERIT-9研究会, 医療情報交換規約運用指針、MERIT-9 処方オーダver 1.0, [http://merit-9.mi.hama-med.ac.jp/jahis/SHOHOU.pdf](http://merit-9.mi.hama-med.ac.jp/jahis/SHOHOU.pdf)
1. 保健医療福祉情報システム工業会, JAHISデータ交換規約（共通編）Ver.1.1, [https://www.jahis.jp/standard/detail/id=125](https://www.jahis.jp/standard/detail/id=125)
1. 保健医療福祉情報システム工業会, JAHIS注射データ交換規約Ver.2.1C, [https://www.jahis.jp/standard/detail/id=590](https://www.jahis.jp/standard/detail/id=590)
1. Mike Henderson, 日本HL7協会監修、「HL7メッセージ交換」、第2版、インナービジョン社、2013年
1. 厚生労働省、保険医療機関及び保険医療養担当規則、平三〇厚労令二〇・一部改正, [https://www.mhlw.go.jp/web/t_doc?dataId=84035000&dataType=0&pageNo=1](https://www.mhlw.go.jp/web/t_doc?dataId=84035000&dataType=0&pageNo=1)
1. 一般社団法人医療情報システム開発センター, 医薬品HOT コードマスター, [http://www2.medis.or.jp/hcode/](http://www2.medis.or.jp/hcode/)
1. 日本医療情報学会、SS-MIX2仕様書・ガイドライン, [http://www.jami.jp/jamistd/ssmix2.php](http://www.jami.jp/jamistd/ssmix2.php)
1. 保健医療福祉情報システム工業会, JAHIS電子処方箋実装ガイドVer.1.2, [https://www.jahis.jp/standard/detail/id=774](https://www.jahis.jp/standard/detail/id=774)
1. 日本医療情報学会, 処方情報 HL7FHIR 記述仕様(2021年10月), [https://std.jpfhir.jp/stddoc/ePrescriptionDataFHIR_v1x.pdf](https://std.jpfhir.jp/stddoc/ePrescriptionDataFHIR_v1x.pdf)

{% include markdown-link-references.md %}
