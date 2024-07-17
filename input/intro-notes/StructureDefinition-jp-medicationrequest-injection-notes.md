
### 必須要素
次のデータ項目は必須（データが存在しなければならない）である。

MedicationRequestリソースは、次の要素を持たなければならない。
- status : ステータスは必須である
- intent : 意図は必須である
- medicationReference : 医薬品の識別情報は必須でありmedicationReference.referenceが必ず存在しなければならない、JP Coreでは注射の医薬品情報は単一薬剤の場合も Medicationリソースとして記述し、MedicationRequest.contained属性に内包しmedicationCodeableConceptは使用しない
- subject :患者の参照情報は必須であり、subject.referenceないしsubject.identifierが必ず存在しなければならない
- authoredOn : 処方依頼日時であり、JP Coreでは必須である
- dosageInstruction.text : フリーテキストの用法指示であり、JP Coreでは必須である
- dosageInstruction.timing : 投薬タイミングを記録し、JP Coreでは必須である

MedicationRequestリソースに内包されるMedicationリソースでは、次の要素を持たなければならない。
- ingredient.itemCodeableConcept : 医薬品の識別情報であり、JP Coreでは必須である
- ingredient.strength : 医薬品の投与量であり、JP Coreでは必須である

### Extensions定義
JP Core MedicationRequest Injectionプロファイルで使用される拡張は次の通りである。

|拡張|説明|定義|値型|
|:----|:----|:----|:----|
|RP内薬剤番号|RP内の薬剤の連番を格納する拡張<br/>《medicationReference配下》|[JP_Medication_Ingredient_DrugNo]|integer|
|力価区分|投与量が製剤単位か成分単位かを格納する拡張<br/>《medicationReference配下》|[JP_Medication_IngredientStrength_StrengthType]|CodeableConcept|
|用法コメント|用法コメントを格納するための拡張<br/>《dosageInstruction配下》|[JP_MedicationDosage_DosageComment]|CodeableConcept/String|
|指示ライン|指示ラインを格納する拡張<br/>《dosageInstruction配下》|[JP_MedicationDosage_Line]|CodeableConcept|
|ラインコメント|ラインコメントを格納するための拡張<br/>《dosageInstruction配下》|[JP_MedicationDosage_LineComment]|CodeableConcept/String|
|投与装置|投与装置を格納する拡張<br/>《dosageInstruction配下》|[JP_MedicationDosage_Device]|Reference (Device)|
|投与経路コメント|投与経路コメントを格納するための拡張<br/>《dosageInstruction配下》|[JP_MedicationDosage_RouteComment]|CodeableConcept/String|
|投与部位詳細|投与部位詳細を格納するための拡張<br/>《dosageInstruction配下》|[bodySite(hl7.org)](http://hl7.org/fhir/R4/extension-bodysite.html)|Reference (BodyStructure)|
|投与部位コメント|投与部位コメントを格納するための拡張<br/>《dosageInstruction配下》|[JP_MedicationDosage_SiteComment]|CodeableConcept/String|
|手技コメント|手技コメントを格納するための拡張<br/>《dosageInstruction配下》|[JP_MedicationDosage_MethodComment]|CodeableConcept/String|
|投与速度コメント|投与速度コメントを格納するための拡張<br/>《dosageInstruction配下》|[JP_MedicationDosage_RateComment]|CodeableConcept/String|
|調剤指示|薬剤単位の調剤指示を表現するための拡張|[JP_MedicationRequest_DispenseRequest_InstructionForDispense]|CodeableConcept/string|
|頓用回数|頓用の場合など調剤量を錠数ではなく回数で表現したい場合の回数を格納する拡張|[JP_MedicationRequest_DispenseRequest_ExpectedRepeatCount]|integer|


### 用語定義
HL7 FHIRの基底規格では、薬剤コードをはじめとして、剤形などでSNOMED CTが使われているが、国としてライセンスを取得していない。代替としてJAHIS注射データ交換規約やSS-MIX2で使われている用語集を採用した。

HL7 ver 2系では用語集を識別するコーディングシステム名(以下、「CS名」）は文字列であったが、FHIRではURIを指定する必要があるため、それぞれにURIを割り当てた。以下に使用する用語集のCS名とURI表記を列記する。

|分類|CS名|URI|
|---------|----|---------------------------|
|医薬品|HOT7|urn:oid:1.2.392.200119.4.403.2|
|医薬品|HOT9|urn:oid:1.2.392.200119.4.403.1|
|医薬品|HOT13|urn:oid:1.2.392.200119.4.402.1|
|医薬品|YJコード|urn:oid:1.2.392.100495.20.1.73|
|剤形|MERIT-9(剤形)|http://jpfhir.jp/fhir/core/CodeSystem/JP_MedicationFormMERIT9_CS |
|処方区分|MERIT-9(処方区分)|http://jpfhir.jp/fhir/core/CodeSystem/JP_MedicationCategoryMERIT9_CS |
|処方区分|JAHIS注射データ交換規約Ver.2.1C(JHSI表0001)|http://jpfhir.jp/fhir/core/CodeSystem/JHSI0001|
|用法種別|JAMI処方・注射オーダ標準用法規格(表14:時間的要素・機器区分コード表)|urn:oid:1.2.392.200250.2.2.20.45|
|薬品単位|MERIT-9(単位）|urn:oid:1.2.392.100495.20.2.101|
|力価区分|処方情報 HL7FHIR 記述仕様(力価区分)|urn:oid:1.2.392.100495.20.2.22|
|頓用条件|JAMI処方・注射オーダ標準用法規格(表6 イベント区分、イベント詳細区分)|http://jpfhir.jp/fhir/core/CodeSystem/JP_MedicationAsNeededConditionJAMI_CS |
|頓用条件|MERIT-9(頓用指示)|http://jpfhir.jp/fhir/core/CodeSystem/JP_MedicationAsNeededConditionMERIT9_CS |
|投与部位|JAMI処方・注射オーダ標準用法規格(部位コード)|urn:oid:1.2.392.200250.2.2.20.32|
|投与部位|HL7 V2(HL7表0550)|http://terminology.hl7.org/CodeSystem/v2-0550|
|投与部位(修飾子)|HL7 V2(HL7表0495)|http://terminology.hl7.org/CodeSystem/v2-0495|
|投与装置|HL7 V2(使用者定義表0164)|http://terminology.hl7.org/CodeSystem/v2-0164|
|投与方法|JAMI処方・注射オーダ標準用法規格(基本用法区分)|urn:oid:1.2.392.200250.2.2.20.30|
|投与手技|HL7 V2(使用者定義表0165)|http://terminology.hl7.org/CodeSystem/v2-0165|
|投与手技|JAMI処方・注射オーダ標準用法規格(用法詳細区分)|urn:oid:1.2.392.200250.2.2.20.40|
|投与手技|JAHIS注射データ交換規約Ver.2.1C(JHSI表0003)|http://jpfhir.jp/fhir/core/CodeSystem/JHSI0003|
|投与経路|HL7 V2(使用者定義表0162)|http://jpfhir.jp/fhir/core/CodeSystem/route-codes|
|入外区分|HL7 V2(HL7表0482)|http://terminology.hl7.org/CodeSystem/v2-0482|

### 項目の追加
日本国内の電子カルテシステムでの注射オーダの運用に合わせ、以下の項目を追加した。

* 指示手技の追加（dosageInstruction.methodを使用）
* 指示ラインの追加（拡張「JP_MedicationDosage_Line」を使用）
* 投与装置の追加（拡張「JP_MedicationDosage_Device」を使用）
* 調剤指示の追加（拡張「JP_MedicationRequest_DispenseRequest_InstructionForDispense」を使用）
* 頓用回数の追加（拡張「JP_MedicationRequest_DispenseRequest_ExpectedRepeatCount」を使用）
* RP番号の追加（identifierを使用）
* 薬剤番号（拡張「JP_Medication_Ingredient_DrugNo」を使用）
* 施用番号の追加（dosageInstruction.sequenceを使用）
* ⼒価区分の追加（拡張「JP_Medication_IngredientStrength_StrengthType」を使用）
* 用法種別の追加（dosageInstruction.additionalInstructionを使用）

## 利用方法

#### Search Parameter一覧

| コンフォーマンス | パラメータ    | 型     | 例                                                           |
| ---------------- | ------------- | ------ | ------------------------------------------------------------ |
| SHALL            | identifier    | token  | GET [base]/MedicationRequest?identifier=http://myhospital.com/fhir/medication\|1234567890 |
| SHOULD            | patient      | reference | GET [base]/MedicationRequest?patient=123456   |
| SHOULD           | patient,date | reference,date  | GET [base]/MedicationRequest?patient=123456&date=eq2013-01-14 |
| SHOULD           | patient,authoredon | reference,date  | GET [base]/MedicationRequest?patient=123456&authoredon=eq2013-01-14 |
| MAY           | date,authoredon,category,code,requester | date,date,token,token,reference | GET [base]/MedicationRequest?code=urn:oid:1.2.392.200119.4.403.1\|105271807  |

##### 必須検索パラメータ

次の検索パラメータは必須でサポートされなければならない。

1. identifier 検索パラメータを使用して、オーダIDなどの識別子によるMedicationRequestの検索をサポートしなければならない（SHALL）

   ```
   GET [base]/MedicationRequest?identifier={system|}[token]
   ```

   例：

   ```
   GET [base]/MedicationRequest?identifier=http://myhospital.com/fhir/medication|1234567890
   ```

   指定された識別子に一致するMedicationRequestリソースを含むBundleを検索する。
   

##### 推奨検索パラメータ

次の検索パラメータをサポートすることが望ましい。

1. patient 検索パラメータを使用して、患者のリファレンス情報によるMedicationRequestの検索をサポートすることが望ましい（**SHOULD**）

   ```
   GET [base]/MedicationRequest?patient=[id]
   GET [base]/MedicationRequest?patient=[url]
   ```

   例：

   ```
   GET [base]/MedicationRequest?patient=123456
   ```

   リソースIDが123456の患者のMedicationRequestリソースを含むBundleを検索する。

1. patient,date 検索パラメータを使用して、患者のリファレンス情報と投薬日によるMedicationRequestの検索をサポートすることが望ましい（**SHOULD**）

   ```
   GET [base]/MedicationRequest?patient=[id]&date=[date]
   GET [base]/MedicationRequest?patient=[url]&date=[date]
   ```

   例：

   ```
   GET [base]/MedicationRequest?patient=123456&date=eq2013-01-14
   ```

   リソースIDが123456の患者の2013-01-14に服用するMedicationRequestリソースを含むBundleを検索する。

1. patient,authoredon 検索パラメータを使用して、患者のリファレンス情報と依頼日によるMedicationRequestの検索をサポートすることが望ましい（**SHOULD**）

   ```
   GET [base]/MedicationRequest?patient=[id]&authoredon=[date]
   GET [base]/MedicationRequest?patient=[url]&authoredon=[date]
   ```

   例：

   ```
   GET [base]/MedicationRequest?patient=123456&authoredon=eq2013-03-21
   ```

   リソースIDが123456の患者の2013-03-21に依頼されたMedicationRequestリソースを含むBundleを検索する。

##### 追加検索パラメータ 

追加検索パラメータは定義しない。

#### Operation一覧

JP Core MedicationRequest Injection リソースに対して使用される操作は次の通りである。

- $everything：[base]/MedicationRequest/[id]/$everything

  - この操作が呼び出された特定のMedicationRequestに関連する全ての情報を返す
    

#### Operation 詳細

##### $everything 操作

この操作は、この操作が呼び出された特定のMedicationRequestリソースに関連する全ての情報を返す。応答は "searchset" タイプのBundleリソースである。サーバは、少なくとも、識別されたMedicationRequestコンパートメントに含まれる全てのリソースと、それらから参照されるすべてのリソースを返すことが望ましい。

この操作の公式なURLは以下である。

```
http://jpfhir.jp/fhir/core/OperationDefinition/JP_Medications_Everything_Op
```

URL: [base]/MedicationRequest/[id]/$everything

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

リクエスト：単一のMedicationRequestに関連する全てのリソースを取得する。

```
GET [base]/MedicationRequest/1234567890/$everything
[some headers]
```

レスポンス：指定されたMedicationRequestに関連する全てのリソースを返す。

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
      "fullUrl": "http://example.org/fhir/MedicationRequest/1234567890",
      "resource": {
        "resourceType": "MedicationRequest",

          ・・・

       },
    }
  ]
}  
```

### サンプル
ホリゾン注射液１０ｍｇ１アンプルを左腕に静脈注射する処方例をFHIRで表現する場合のサンプルを示す。

-[**注射処方指示 ホリゾン注射液１０ｍｇワンショット静脈注射**][jp-medicationrequest-injection-example-1]

## 注意事項

### 記述の単位について
MedicationRequestは薬剤をCodeableConceptとして1つまでしか持つか、Medicationリソースのreferenceをもつことしかできない。したがって、複数の薬剤を同一のRp番号で表現する場合にはMedicationRequestを繰り返すか、複数の薬剤をまとめたMedication Resourceのインスタンスを参照することとなる。ワーキンググループでの検討の結果、複数の薬剤をまとめたMedicationリソースのインスタンスをcontained属性に内包した上で参照することとした。

１オーダ内に複数のRpがある場合には、MedicationRequestを繰り返し、identifier属性にオーダ番号、Rp番号をそれぞれ持つことでリソース間の関係性がわかるようにする。

１オーダ内にRpごとに複数の施用（投薬）を持つことができるシステムの場合は、dosageInstruction要素を施用単位で繰り返すことにより１つのMedicationRequestインスタンスで記述することができる。その場合、施用ごとに投与タイミングを dosageInstruction.timing で指定し、施用番号を dosageInstruction.sequenceで記述する。

### 投与薬剤、投与量の記述方法
１回の投与薬剤と投与量は、RP内の薬剤が１薬剤の場合も混注などで複数の薬剤を含む場合も、すべての薬剤を記述したMedicationリソースを contained 属性に内包し、それをMedicationRequest.medicationReference属性で参照するようにする。
Medicationリソースのingredient.itemCodeableConcept要素にCodeableConcept型で各薬剤の識別情報を記述し、ingredient.strength.numerator要素に１回あたりの含有量を記述する。薬剤を識別するコードはHOT7、HOT9、YJコード、⼀般処方名マスターを推奨するが、ローカルコードを使用してもよい。含有量の単位コードは MERIT-9を使用する。ingredient.strength.denominatorには固定値「１回」をMERIT-9を使用して指定する。
dosageInstruction.doseAndRate.doseQuantity要素には、情報が得られる場合には全体の容量をUCUM("http://unitsofmeasure.org")を使用してmL単位で指定する。

「ソリタ－Ｔ３号輸液５００ｍＬ １本」と「アドナ注（静脈用）50mg／10mL　１アンプル」計510mLを指示する場合のインスタンス例を示す。

```json
"contained": [
  {
    "resourceType": "Medication",
    "id": "#medication",
    "ingredient": [
      {
        "itemCodeableConcept": {
          "coding": [
            {
              "code": "107750602",
              "display": "ソリタ－Ｔ３号輸液５００ｍＬ",
              "system": "urn:oid:1.2.392.200119.4.403.1"
            }
          ]
        },
        "strength": {
          "numerator": {
            "value": 1,
            "unit": "本",
            "system": "urn:oid:1.2.392.100495.20.2.101",
            "code": "HON"
          },
          "denominator": {
            "value": 1,
            "unit": "回",
            "system": "urn:oid:1.2.392.100495.20.2.101",
            "code": "TIME"
          }
        }
      }, {
        "itemCodeableConcept": {
          "coding": [
            {
              "code": "108010001",
              "display": "アドナ注（静脈用）50mg／10mL",
              "system": "urn:oid:1.2.392.200119.4.403.1"
            }
          ]
        },
        "strength": {
          "numerator": {
            "value": 1,
            "unit": "アンプル",
            "system": "urn:oid:1.2.392.100495.20.2.101",
            "code": "AMP"
          },
          "denominator": {
            "value": 1,
            "unit": "回",
            "system": "urn:oid:1.2.392.100495.20.2.101",
            "code": "TIME"
          }
        }
      }
    ]
  },
],
"medicationReference": {
  "reference": "#medication"
},
"dosageInstruction": [
  {
    "doseAndRate": [
      {
        "doseQuantity": {
          "value": 510,
          "unit": "mL",
          "system": "http://unitsofmeasure.org",
          "code": "mL"
        }
      }
    ]
  }
]
```

### 投与速度の記述方法
点滴注射など一定の速度で時間をかけて投与する場合、その投与速度は dosageInstruction.doseAndRate.rateRatioを使用してRatio型で表現する。単位コードには、UCUM("http://unitsofmeasure.org")を使用する。

投与速度「100mL/h」を記述したインスタンス例を示す。

```json
"dosageInstruction": [
  {
    "doseAndRate": [
      {
        "rateRatio": {
          "numerator": {
            "value": 100,
            "unit": "mL",
            "system": "http://unitsofmeasure.org",
            "code": "mL"
          },
          "denominator": {
            "value": 1,
            "unit": "時間",
            "system": "http://unitsofmeasure.org",
            "code": "h"
          }
        }
      }
    ]
  }

```

### 力価区分の記述方法
用量は製剤量で記述することを基本とするが、必要に応じて原薬量指定も可能とする。この識別は、Medication.ingredient.strength要素に対して定義した拡張「JP_Medication_IngredientStrength_StrengthType」を使用する。この拡張を識別するURIとして、"http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Medication_IngredientStrength_StrengthType"を使用し、値はCodeableConcept型を使用して力価区分コードを指定することで行い、製剤量は「1」、原薬量は「2」とする。

投与量「１本」を製剤量で記録したインスタンス例を示す。

```json
"ingredient": [
  {
    "itemCodeableConcept": {
      "coding": [
        {
          "code": "107750602",
          "display": "ソリタ－Ｔ３号輸液５００ｍＬ",
          "system": "urn:oid:1.2.392.200119.4.403.1"
        }
      ]
    },
    "strength": {
      "extension": [
        {
          "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Medication_IngredientStrength_StrengthType",
          "valueCodeableConcept": {
            "coding": [
              {
                "system": "urn:oid:1.2.392.100495.20.2.22",
                "code": "1",
                "display": "製剤量"
              }
            ]
          }
        }
      ],
      "numerator": {
        "value": 1,
        "unit": "本",
        "system": "urn:oid:1.2.392.100495.20.2.101",
        "code": "HON"
      },
      "denominator": {
        "value": 1,
        "unit": "回",
        "system": "urn:oid:1.2.392.100495.20.2.101",
        "code": "TIME"
      }
    },

```

### 調剤容量の記述方法
調剤容量はdispenseRequest.quantityに、SimpleQuantity型で記録する。単位コードはUCUM("http://unitsofmeasure.org")を使用する。

```json
"dispenseRequest": {
  "quantity": {
    "value": 510,
    "unit": "mL",
    "system": "http://unitsofmeasure.org",
    "code": "mL"
  }
}
```

### 調剤指示の記述方法
単一の薬剤に対する調剤指示は、dispenseRequest要素に対して定義した拡張「InstructionForDispense」を使用する。この拡張は、CodeableConcept型を使用して、コード化された指示ないしテキストによる指示を記録できる。両方を併記してもよい。テキストによる指示を記録する場合は text要素を使用する。一つの薬剤に対して、複数の指示を記録する場合には、この拡張を、拡張単位で繰り返して記録する

薬剤単位の調剤指示を表すインスタンス例を示す。

```json
"dispenseRequest": {
  "extension": [
    {
      "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DispenseRequest_InstructionForDispense",
      "valueCodeableConcept": {
        "text": "5mLに溶解して2mL抜きとる"
      }
    }
  ],
```

### 投与開始日時、投与終了日時の記述方法
注射・注入の薬剤の場合、内服・外用の薬剤と異なり投与タイミングは投与開始日時と投与終了日時を指定することが多い。投与開始日時、投与終了日時は、dosageInstruction.timing.repeat.boundsPeriod要素を使用してPeriod型で表現する。なお、ワンショットの場合は投与終了日時は省略するか、投与開始日時と同じ値を指定する。

開始日時「2021/07/07 09:00」終了日時「同 11:00」を記述したインスタンス例を示す。

```json
"dosageInstruction": [
  {
    "timing": {
      "repeat": {
        "boundsPeriod": {
          "start": "2021-07-07T09:00:00+09:00",
          "end": "2021-07-07T11:00:00+09:00"
        }
      }
    }
  }

```

### 投与開始タイミングのあいまい指示の記述方法
例えば「07/15 夕方」など、投与開始タイミングを時刻ではなくイベントで指定する場合、dosageInstruction.timing.event要素で日付をdateTime型で、dosageInstruction.timing.when要素でタイミングをcode型で表現する。コードは、EventTiming("https://hl7.org/fhir/R4/valueset-event-timing.html")を使用する。あいまい指示の場合、投与終了タイミングを指定することはできない。

あいまい指示「2021/07/15 夕方」を指定した場合のインスタンス例を示す。

```json
"dosageInstruction": [
  {
    "timing": {
      "event": "2021-07-15",
      "when": "EVE"
    }
  }
],
```

### 頓用指示の頓用条件、頓用回数の記述方法
例えば「疼痛時10回分」など、頓用の場合の投与条件や投与回数を表現したい場合、投与条件は dosageInstruction.timing.code 要素に CodeableConcept型で指定する。コードは、JAMI処方・注射オーダ標準用法規格の表6 イベント区分、イベント詳細区分("http://jpfhir.jp/fhir/core/CodeSystem/JP_MedicationAsNeededConditionJAMI_CS")を推奨するが、MERIT-9 処方オーダ 表5 頓用指示("http://jpfhir.jp/fhir/core/CodeSystem/JP_MedicationAsNeededConditionMERIT9_CS") を使用してもよい。
頓用回数は、dispenseRequest要素に対して定義した拡張「JP_MedicationRequest_DispenseRequest_ExpectedRepeatCount」を使用し、integer型で頓用回数を記載する。
また、頓用指示の場合、dosageInstruction.asNeededBoolean に true を指定する。

頓用条件、頓用回数「疼痛時10回分」をJAMI処方・注射オーダ標準用法規格、MERIT-9の両方を使用して指定した場合のインスタンス例を示す。

```json
"dosageInstruction": [
  {
    "asNeededBoolean": true,
    "timing": {
      "code": {
        "coding": [
          {
            "system": "http://jpfhir.jp/fhir/core/CodeSystem/JP_MedicationAsNeededConditionJAMI_CS",
            "code": "11",
            "display": "疼痛時"
          },
          {
            "system": "http://jpfhir.jp/fhir/core/CodeSystem/JP_MedicationAsNeededConditionMERIT9_CS",
            "code": "PRNpain",
            "display": "疼痛時"
          },
        ]
      }
    }
  }
],
"dispenseRequest": {
  "extension": {
    "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DispenseRequest_ExpectedRepeatCount",
    "valueInteger": 10
  }
}
```

### 投与部位の記述方法
投与部位を指定する場合は、dosageInstruction.site 要素に、CodeableConcept型で指定する。部位コードは、JAMI標準用法コード 表13 外用部位コード（"urn:oid:1.2.392.200250.2.2.20.32"）を推奨する。
HL7表0550 身体部位("http://terminology.hl7.org/CodeSystem/v2-0550")とHL7表0495 身体部位修飾子("http://terminology.hl7.org/CodeSystem/v2-0495")を組み合わせて使用してもよいが、その場合は拡張「BodyStructure」を使用する。
この拡張は BodyStructureリソースを参照することができるので、location 要素にHL7表0550 身体部位("http://terminology.hl7.org/CodeSystem/v2-0550")のコードを、locationQualifier 要素に
身体部位修飾子("http://terminology.hl7.org/CodeSystem/v2-0495")のコードをそれぞれ指定したBodyStructureリソースをMedicationRequestリソースのcontained属性に内包し、それをExtension.valueReference 要素で参照するようにする。

投与部位「左腕」をJAMI標準用法コードで指定した場合のインスタンス例を示す。

```json
"dosageInstruction": [
  {
    "site": {
      "coding": [
        {
          "system": "urn:oid:1.2.392.200250.2.2.20.32",
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
"dosageInstruction": [
  {
    "site": {
      "extension": [
        {
          "url": "http://hl7.org/fhir/core/Extension/StructureDefinition/bodySite",
          "valueReference": "#site"
        }
      ]
    }
  }
]
```

複数の部位に投与量を記録する場合は、dosageInstruction 要素を複数繰り返す。

### 投与経路、投与手技の記述方法
「静脈内」「眼内」などの投与経路は、dosageInstruction.route 要素にコードまたは文字列で指定する。使用するコード表はHL7 V2の使用者定義表0162 投薬経路を推奨し、その場合識別するURIとして、"http://jpfhir.jp/fhir/core/CodeSystem/route-codes"を使用する。

「0:静脈注射」、「1:中心静脈注射」などJAMI標準用法コードにて用法詳細区分として表現される区分（注射では「投与手技」とも呼ばれる）は、dosageInstruction.method 要素にコードまたは文字列で指定する。 用法詳細区分を識別するURIとして、"urn:oid:1.2.392.200250.2.2.20.30"を使用する。HL7 V2の使用者定義表0165("http://terminology.hl7.org/CodeSystem/v2-0165")やJAHIS注射データ交換規約のJHSI表0003 精密持続点滴("http://jpfhir.jp/fhir/core/CodeSystem/JHSI0003)を使用してもよい。

```json
"route": {
  "coding": [
    {
      "system": "http://jpfhir.jp/fhir/core/CodeSystem/route-codes",
      "code": "IV",
      "display": "静脈内"
    }
  ]
},
"method": {
  "coding": [
    {
      "system": "urn:oid:1.2.392.200250.2.2.20.40",
      "code": "30",
      "display": "静脈注射"
    }
  ]
}
```

### 指示ライン
「末梢ルートメイン１」など、投与時に使用するラインを指示したい場合は、dosageInstruction要素で拡張「JP_MedicationDosage_Line」を使用し、CodeableConcept型で指定する。推奨するコードシステムはないので、ローカルコードを使用する。

指示ライン「末梢ルートメイン１」をローカルコードで指定した場合のインスタンス例を示す。

```json
"dosageInstruction": [
  {
    "extension": [
      {
        "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationDosage_Line",
        "valueCodeableConcept": {
          "coding": [
            {
              "system": "http://jpfhir.jp/fhir/Examples/CodeSystem/JP_MedicationRequestDosageInstructionLine_CS",
              "code": "01",
              "display": "末梢ルートメイン１"
            }
          ]
        }
      }
    ]
  }
]
```

### 投与装置の記述方法
「シリンジポンプ」など、投与時に使用する装置を指示したい場合は、dosageInstruction要素で拡張「JP_MedicationDosage_Device」を使用し、contained 属性に内包した Deviceリソースに対するリファレンスを指定する。
内包したDeviceリソースでは type属性に装置の種類をCodeableConcept型で指定する。推奨するコードシステムはないので、ローカルコードを使用する。
HL7 V2の使用者定義表0164 投薬装置を使用してもよい。

投与装置「点滴ポンプ」を使用者定義表0164で指定した場合のインスタンス例を示す。

```json
"contained" : [ 
  {
    "resourceType": "Device",
    "id": "21125ef6-3566-b94a-3101-c7848866afd1",
    "type": {
      "coding": [
        {
          "system": "http://terminology.hl7.org/CodeSystem/v2-0164",
          "code": "IVP",
          "display": "点滴ポンプ"
        }
      ]
    }
  }
],
"dosageInstruction": [
  {
    "extension": [
      {
        "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationDosage_Device",
        "valueReference": {
          "reference" : "21125ef6-3566-b94a-3101-c7848866afd1",
          "type" : "Device"
        }
      }
    ],
  }
]
```

### 注射箋番号(オーダID)の記述方法
注射箋を識別する番号も、同様に MedicationRequestリソースの identifier 要素で表現することができる。Identifier 型のsystem 要素には、保険医療機関番号を含む注射箋ID の名前空間を表すOID（urn:oid:1.2.392.100495.20.3.11.1[保険医療機関コード(10 桁)]）を指定する。全国で⼀意になる発番ルールにもとづく場合には "urn:oid:1.2.392.100495.20.3.11" とする。

```json
"identifier": [
  {
    "system": "urn:oid:1.2.392.100495.20.3.11.1.11311234567",
    "value": "2020-00123456"
  },
]
```

### RP番号、薬剤番号、施用番号の記述方法
HL7 FHIRでは、注射箋の中で同一の用法を持つ剤グループ(RP)は、剤単位に個別のMedicationRequestリソースに展開される。このとき、剤グループの番号（RP番号と呼ぶ）と、同一剤グループ内での順番は、いずれも MedicationRequestリソースの identifier で表現することができる。RP番号を識別するURIとして、"urn:oid:1.2.392.100495.20.3.81"を使用する。同一剤グループ内での順番を識別するURIとして、"urn:oid:1.2.392.100495.20.3.82"を使用する。value は 文字列型であり、数値はゼロサプレス、つまり、"01"でなく"1"と指定すること。

```json
"identifier": [
  {
    "system": "urn:oid:1.2.392.100495.20.3.81",
    "value": "1"
  },
  {
    "system": "urn:oid:1.2.392.100495.20.3.82",
    "value": "1"
  }
]
```

同一剤グループ内での順番（薬剤番号）は、Medication.ingredient要素に対して定義した拡張「JP_Medication_Ingredient_DrugNo」を使用する。この拡張を識別するURIとして、"http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Medication_Ingredient_DrugNo"を使用し、値はinteger型で指定する。

薬剤番号「1」を記述したインスタンス例を示す。

```json
"ingredient": [
  {
    "extension": [
      {
        "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Medication_Ingredient_DrugNo",
        "valueInteger": 1
      }
    ],

```

一方、投与のそれぞれのタイミングの順番である施用番号については、MedicationRequestリソースの dosageInstruction.sequence で表現することができる。すなわち、同一RPの薬剤を複数回投与する場合、投与のタイミングごとに dosageInstructionごと繰り返し、そのタイミングは dosageInstruction.timing で表現することになる。

開始日時「2021/07/07 09:00」「同 13:00」「2021/07/08 09:00」を記述したインスタンス例を示す。

```json
"dosageInstruction": [
  {
    "sequence": 1,
    "timing": {
      "repeat": {
        "boundsDuration": {
          "start": "2021-07-07T09:00:00+09:00"
        }
      }
    }
  },
  {
    "sequence": 2,
    "timing": {
      "repeat": {
        "boundsDuration": {
          "start": "2021-07-07T13:00:00+09:00"
        }
      }
    }
  },
  {
    "sequence": 3,
    "timing": {
      "repeat": {
        "boundsDuration": {
          "start": "2021-07-08T09:00:00+09:00"
        }
      }
    }
  },

```

### 入外区分
薬剤オーダの入院、外来を区別するための区分として表現される入外区分は、HL7V2で定義されているHL7表0482を使用し、category要素にコードおよび文字列で指定することができる。入外区分を識別するURIとして、"http://terminology.hl7.org/CodeSystem/v2-0482"を使用する。

```json
"category": [ {
  "coding": [ {
    "system": "http://terminology.hl7.org/CodeSystem/v2-0482",
    "code": "O",
    "display": "外来オーダ"
  } ]
},
```

### 処方区分
薬剤オーダの運用上の区分である処方区分は、MERIT-9(処方区分)およびJAHIS注射データ交換規約Ver.2.1CのJHSI表0001を使用し、category要素に2種類のコードおよび文字列で指定することができる。MERIT-9(処方区分)を識別するURIとして"http://jpfhir.jp/fhir/core/CodeSystem/JP_MedicationCategoryMERIT9_CS"を、JHSI表0001を識別するURIとして"http://jpfhir.jp/fhir/core/CodeSystem/JHSI0001"を使用する。

```json
"category": [ {
  "coding": [ {
    "system": "http://jpfhir.jp/fhir/core/CodeSystem/JP_MedicationCategoryMERIT9_CS",
    "code": "IHP",
    "display": "入院処方"
  } ]
}, {
  "coding": [ {
    "system": "http://jpfhir.jp/fhir/core/CodeSystem/JHSI0001",
    "code": "FTP",
    "display": "定時処方"
  } ]
}, 
```

### 用法種別
ワンショットや点滴など、薬剤オーダの時間的な区分である用法種別は、JAMI処方・注射オーダ標準用法規格の表14 時間的要素・機器区分コード表を使用し、dosageInstruction.additionalInstruction要素にコードおよび文字列で指定することができる。時間的要素・機器区分コード表を識別するURIとして"urn:oid:1.2.392.200250.2.2.20.45"を使用する。

```json
"dosageInstruction": [
  {
    "additionalInstruction": [
      {
        "coding": [ {
          "system": "urn:oid:1.2.392.200250.2.2.20.45",
          "code": "1",
          "display": "ワンショット"
        } ]
      }
    ]
  }
],
```

### 各種コメントの記述方法
薬剤オーダのコメントとしては、薬剤単位につくもの、用法指示などRP単位につくもの、注射箋全体につくものがある。
全体のコメントはCommunicationリソースを使用し、薬剤単位、RP単位のコメントは、調剤指示以外はコード化されていれば dosageInstruction.additionalInstruction 要素ないしそうでないものは dosageInstruction.patientInstruction 要素を使用し、調剤指示は dispenseRequest要素に対して定義した拡張「InstructionForDispense」を使用する。

## その他、参考文献・リンク等
1. HL7, FHIR MedicationRequest Resource, [https://hl7.org/fhir/R4/medicationrequest.html](https://hl7.org/fhir/R4/medicationrequest.html)
1. HL7, FHIR Medication Resource, [https://hl7.org/fhir/R4/medication.html](https://hl7.org/fhir/R4/medication.html)
1. HL7, FHIR BodyStructure Resource, [https://hl7.org/fhir/R4/bodystructure.html](https://hl7.org/fhir/R4/bodystructure.html)
1. 保健医療福祉情報システム工業会, JAHIS 注射データ交換規約 Ver.2.1C, [https://www.jahis.jp/standard/detail/id=590](https://www.jahis.jp/standard/detail/id=590)
1. 日本医療情報学会MERIT-9研究会, 医療情報交換規約運用指針、MERIT-9 処方オーダver 1.0, [http://merit-9.mi.hama-med.ac.jp/jahis/SHOHOU.pdf](http://merit-9.mi.hama-med.ac.jp/jahis/SHOHOU.pdf)
1. 保健医療福祉情報システム工業会, JAHISデータ交換規約（共通編）Ver.1.2, [https://www.jahis.jp/standard/detail/id=725](https://www.jahis.jp/standard/detail/id=725)
1. 保健医療福祉情報システム工業会, JAHIS注射データ交換規約Ver.2.1C, [https://www.jahis.jp/standard/detail/id=590](https://www.jahis.jp/standard/detail/id=590)
1. Mike Henderson, 日本HL7協会監修、「HL7メッセージ交換」、第2版、インナービジョン社、2013年
1. 一般社団法人医療情報システム開発センター, 医薬品HOT コードマスター, [http://www2.medis.or.jp/hcode/](http://www2.medis.or.jp/hcode/)
1. 日本医療情報学会、SS-MIX2仕様書・ガイドライン, [http://www.jami.jp/jamistd/ssmix2.php](http://www.jami.jp/jamistd/ssmix2.php)

{% include markdown-link-references.md %}
