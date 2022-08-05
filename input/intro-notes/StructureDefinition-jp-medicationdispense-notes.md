
### 必須要素
次のデータ項目は必須（データが存在しなければならない）、あるいは、データが送信システムに存在する場合はサポートされなければならないことを意味する。（Must Support）。

JP Core MedicationDispense リソースは、次の要素を持たなければならない。
- status : ステータスは必須である。
- medicationCodeableConcept : 医薬品の識別情報は必須であり、medicationCodeableConcept.coding.system, medicationCodeableConcept.coding.code, medicationCodeableConcept.coding.display が必ず存在しなければならない。
- subject :患者の参照情報は必須であり、subject.reference ないし subject.identifier が必ず存在しなければならない。
- whenHandedOver : 払い出し日時であり、JP Coreでは必須である。
- quantity : 調剤量は必須であり、quantity.value, quantity.unit, quantity.system, quantity.code が必ず存在しなければならない 
- dosageInstruction.text : フリーテキストの用法指示であり、JP Coreでは必須である。
- dosageInstruction.timing : 服⽤タイミングを記録し、JP Coreでは必須である。dosageInstruction.timing.code.coding.code, dosageInstruction.timing.code.coding.system が必ず存在しなければならない。

JP Core MedicationDispenseリソースは、次の要素をサポートしなければならない。
- medicationCodeableConcept : 医薬品の識別情報
- subject :患者の参照情報
- whenHandedOver : 払い出し日時
- quantity : 調剤量
- dosageInstruction.timing : 服⽤タイミング

### Extensions定義
JP Core MedicationDispense リソースで使用される拡張は次の通りである。

#### JP Core MedicationDispense独自で追加されたExtension

|拡張|説明|URL|値の型|
|------------|-------------|----------|-----|
|調剤結果|薬剤単位の調剤結果|http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationDispense_Preparation|CodeableConcept|

#### 既存のExtensionの利用

JP Core MedicationDispense リソースでは、JP Core MedicationRequestプロファイルで定義された以下の拡張を使用する。

|拡張|説明|URL|値の型|
|------------|-------------|----------|-----|
|服用開始日|服用開始日を格納する拡張|http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DosageInstruction_PeriodOfUse|Period|
|実服用日数|実服用日数を格納する拡張|http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DosageInstruction_UsageDuration|Duration|

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
|剤形|MERIT-9(剤形)|http://jpfhir.jp/ePrescription/CodeSystem/merit9-form |
|薬品単位|MERIT-9(単位）|urn:oid:1.2.392.100495.20.2.101|
|力価区分|電子処方箋HL7 FHIR仕様(力価区分)|urn:oid:1.2.392.100495.20.2.22|
|用法|JAMI処方・注射オーダ標準用法規格(用法コード)|urn:oid:1.2.392.200250.2.2.20.20|
|用法|JAMI処方・注射オーダ標準用法規格(補足用法コード)|urn:oid:1.2.392.200250.2.2.20.22|
|部位|JAMI処方・注射オーダ標準用法規格(部位コード)|urn:oid:1.2.392.200250.2.2.20.32|
|投与方法|JAMI処方・注射オーダ標準用法規格(基本用法区分)|urn:oid:1.2.392.200250.2.2.20.30|
|投与経路|HL7 V2(使用者定義表0162)|http://terminology.hl7.org/CodeSystem/v2-0162|
|入外区分|HL7V2(HL7表0482)|http://terminology.hl7.org/CodeSystem/v2-0482|

### 項目の追加
療養担当則23条では、「保険医は、処方箋を交付する場合には、様式第二号若しくは第二号の二又はこれらに準ずる様式の処方箋に必要な事項を記載しなければならない。」とされており、外来処方、院内処方の区分を明示していない。
したがって、個別のユースケースにおいては一部を省略されることも前提の上で、規格としてはこれに準拠すべきと考え、様式に収載されている以下の項目を追加した。

* 服用開始日の追加（拡張「JP_MedicationRequest_DosageInstruction_PeriodOfUse」を使用）
* 実服用日数の追加（拡張「JP_MedicationRequest_DosageInstruction_UsageDuration」を使用）
* 調剤結果の追加（拡張「JP_MedicationDispense_Preparation」を使用）
* 一日量処方への対応（doseInstruction.doseAndRate.rateRatioを使用）
* RP番号、薬剤番号の追加（identifierを使用）
* ⼒価区分の追加（dosageInstruction.doseAndRate.typeを使用）

## 利用方法

### Interaction一覧

| コンフォーマンス | インタラクション                            |
| ---------------- | ------------------------------------------- |
| SHALL（必須）    | search-type、read                           |
| SHOULD（推奨）   | vread、history-instance                     |
| MAY（利用可能）  | create、update、patch、delete、history-type |

#### Search Parameter一覧

| コンフォーマンス | パラメータ    | 型     | 例                                                           |
| ---------------- | ------------- | ------ | ------------------------------------------------------------ |
| SHALL            | identifier    | token  | GET [base]/MedicationDispense?identifier=http://myhospital.com/fhir/medication\|1234567890 |
| SHOULD            | patient      | reference | GET [base]/MedicationDispense?patient=123456   |
| SHOULD           | patient,whenhandedover | referenece,date  | GET [base]/MedicationDispense?patient=123456&whenhandedover=eq2013-01-14 |
| MAY           | whenhandedover,whenprepared,context,code,performer| date,date,token,token,token | GET [base]/MedicationDispense?code=urn:oid:1.2.392.100495.20.2.74\|105271807  |

##### 必須検索パラメータ

次の検索パラメータは必須でサポートされなければならない。

1. identifier 検索パラメータを使用して、オーダーIDなどの識別子によるMedicationRequestの検索をサポートしなければならない（SHALL）。

   ```
   GET [base]/MedicationDispense?identifier={system|}[code]
   ```

   例：

   ```
   GET [base]/MedicationDispense?identifier=http://myhospital.com/fhir/medication\|1234567890
   ```

   指定された識別子に一致するMedicationDispenseリソースを含むBundleを検索する。
   

##### 推奨検索パラメータ

次の検索パラメータをサポートすることが望ましい。

1. patient 検索パラメータを使用して、患者のリファレンス情報によるMedicationDispenseの検索をサポートすることが望ましい（SHOULD）。

   ```
   GET [base]/MedicationDispense?patient=[id]
   GET [base]/MedicationDispense?patient=[url]
   ```

   例：

   ```
   GET [base]/MedicationDispense?patient=123456
   ```

   リソースIDが123456の患者のMedicationDispenseリソースを含むBundleを検索する。

1. patient,whenhandedover 検索パラメータを使用して、患者のリファレンス情報と払い出し日によるMedicationDispenseの検索をサポートすることが望ましい（SHOULD）。

   ```
   GET [base]/MedicationDispense?patient=[id]&whenhandedover=[date]
   GET [base]/MedicationDispense?patient=[url]&whenhandedover=[date]
   ```

   例：

   ```
   GET [base]/MedicationDispense?patient=123456&whenhandedover=eq2013-01-14
   ```

   リソースIDが123456の患者の2013-01-14に払い出されたMedicationDispenseリソースを含むBundleを検索する。


##### 追加検索パラメータ 


#### Operation一覧

JP Core MedicationDispense リソースに対して使用される操作は次の通りである。

- $everything：[base]/MedicationDispense/[id]/$everything

  - この操作が呼び出された特定のMedicationDispenseに関連する全ての情報を返す。
    

#### Operation 詳細

##### $everything 操作

この操作は、この操作が呼び出された特定のMedicationDispenseリソースに関連する全ての情報を返す。応答は "searchset" タイプのBundleリソースである。サーバは、少なくとも、識別されたMedicationDispenseコンパートメントに含まれる全てのリソースと、それらから参照されるすべてのリソースを返すことが望ましい。

この操作の公式なURLは以下である。

```
http://hl7.jp/fhir/OperationDefinition/MedicationDispense-everything
```

URL: [base]/MedicationDispense/[id]/$everything

本操作は、べき等な操作である。


###### 入力パラメータ

| 名前   | 多重度 | 型      | バインディング | プロファイル | 説明                                                         |
| ------ | ------ | ------- | -------------- | ------------ | ------------------------------------------------------------ |
| start  | 0..1   | date    |                |              | 特定の日付範囲で提供されたケアに関連する全ての記録を意味する。開始日が指定されていない場合、終了日以前のすべてのレコードが対象に含まれる。 |
| end    | 0..1   | date    |                |              | 特定の日付範囲で提供されたケアに関連する全ての記録を意味する。終了日が指定されていない場合、開始日以降のすべてのレコードが対象に含まれる。 |
| _since | 0..1   | instant |                |              | 指定された日時以降に更新されたリソースのみが応答に含まれる。 |
| _type  | 0..*   | code    |                |              | 応答に含むFHIRリソース型を、カンマ区切りで指定する。指定されない場合は、サーバは全てのリソース型を対象とする。 |
| _count | 0..1   | integer |                |              | Bundleの1ページに含まれるリソース件数を指定。                |

###### 出力パラメータ

| 名前   | 多重度 | 型     | バインディング | プロファイル | 説明                                                         |
| ------ | ------ | ------ | -------------- | ------------ | ------------------------------------------------------------ |
| return | 1..1   | Bundle |                |              | バンドルのタイプは"searchset"である。この操作の結果は、リソースとして直接返される。 |

###### 例

リクエスト：単一のMedicationDispenseに関連する全てのリソースを取得する。

```
GET [base]/MedicationDispense/1234567890/$everything
[some headers]
```

レスポンス：指定されたMedicationDispenseに関連する全てのリソースを返す。

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
      "fullUrl": "http://example.org/fhir/MedicationDispense/1234567890",
      "resource": {
        "resourceType": "MedicationDispense",

　　　　　・・・

　　　 },
    }
  ]
}  
```

### サンプル
下記の内容の処方に従って調剤する例をFHIRで表現する場合のサンプルを示す。
```
Rp1 ムコダイン錠２５０ｍｇ１錠（  １日３錠)
　　１日３回朝昼夕食後３日分
```

```json
{
  "resourceType": "MedicationDispense",
  "id": "jp-medicationdispense-example-1",
  "meta": {
    "profile": [
      "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationDispense"
    ]
  },
  "text": {
    "status": "generated",
    "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p><b>Generated Narrative</b></p><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\">Resource \"jp-medicationdispense-example-1\" </p><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-jp-medicationdispense.html\">JP Core MedicationDispense Profile</a></p></div><p><b>identifier</b>: id: 1234567890, id: 1, id: 1</p><p><b>status</b>: completed</p><p><b>category</b>: Inpatient Order <span style=\"background: LightGoldenRodYellow; margin: 4px; border: 1px solid khaki\"> (<a href=\"http://terminology.hl7.org/3.1.0/CodeSystem-v2-0482.html\">orderType</a>#I)</span></p><p><b>medication</b>: ムコダイン錠２５０ｍｇ <span style=\"background: LightGoldenRodYellow; margin: 4px; border: 1px solid khaki\"> (unknown#103835401)</span></p><p><b>subject</b>: <a href=\"Patient-jp-patient-example-1.html\">Patient/jp-patient-example-1</a> \" 山田\"</p><h3>Performers</h3><table class=\"grid\"><tr><td>-</td><td><b>Function</b></td><td><b>Actor</b></td></tr><tr><td>*</td><td>Packager <span style=\"background: LightGoldenRodYellow; margin: 4px; border: 1px solid khaki\"> (<a href=\"http://terminology.hl7.org/3.1.0/CodeSystem-medicationdispense-performer-function.html\">MedicationDispense Performer Function Codes</a>#packager)</span></td><td><a href=\"Practitioner-jp-practionner-example-male-1.html\">Practitioner/jp-practionner-example-male-1</a> \" 大阪\"</td></tr></table><p><b>quantity</b>: 9 錠<span style=\"background: LightGoldenRodYellow\"> (Details: urn:oid:1.2.392.100495.20.2.101 code TAB = 'TAB')</span></p><p><b>whenPrepared</b>: 2021-10-07 10:47:19+0900</p><p><b>whenHandedOver</b>: 2021-10-07 10:55:23+0900</p><p><b>destination</b>: <a href=\"Location-jp-location-example-ward.html\">Location/jp-location-example-ward</a> \"09A病棟 021病室 4ベッド\"</p><p><b>note</b>: 後発品へ変更可能か依頼医のＡ医師に確認したところ、患者の希望により不可との回答あり。</p><h3>Substitutions</h3><table class=\"grid\"><tr><td>-</td><td><b>WasSubstituted</b></td><td><b>Type</b></td><td><b>Reason</b></td></tr><tr><td>*</td><td>true</td><td>generic composition <span style=\"background: LightGoldenRodYellow; margin: 4px; border: 1px solid khaki\"> (<a href=\"http://terminology.hl7.org/3.1.0/CodeSystem-v3-substanceAdminSubstitution.html\">Substance Admin Substitution</a>#G)</span></td><td>regulatory requirement <span style=\"background: LightGoldenRodYellow; margin: 4px; border: 1px solid khaki\"> (<a href=\"http://terminology.hl7.org/3.1.0/CodeSystem-v3-ActReason.html\">ActReason</a>#RR)</span></td></tr></table></div>"
  },
  "identifier": [
    {
      "system": "http://www.sample.com/fhir/medication-dispense",
      "value": "1234567890"
    },
    {
      "system": "urn:oid:1.2.392.100495.20.3.81",
      "value": "1"
    },
    {
      "system": "urn:oid:1.2.392.100495.20.3.82",
      "value": "1"
    }
  ],
  "status": "completed",
  "category": {
    "coding": [
      {
        "system": "http://terminology.hl7.org/CodeSystem/v2-0482",
        "code": "I",
        "display": "Inpatient Order"
      }
    ]
  },
  "medicationCodeableConcept": {
    "coding": [
      {
        "system": "urn:oid:1.2.392.200119.4.403.1",
        "code": "103835401",
        "display": "ムコダイン錠２５０ｍｇ"
      }
    ]
  },
  "subject": {
    "reference": "Patient/jp-patient-example-1"
  },
  "performer": [
    {
      "function": {
        "coding": [
          {
            "system": "http://terminology.hl7.org/CodeSystem/medicationdispense-performer-function",
            "code": "packager",
            "display": "Packager"
          }
        ]
      },
      "actor": {
        "reference": "Practitioner/jp-practionner-example-male-1"
      }
    }
  ],
  "quantity": {
    "value": 9,
    "unit": "錠",
    "system": "urn:oid:1.2.392.100495.20.2.101",
    "code": "TAB"
  },
  "whenPrepared": "2021-10-07T10:47:19+09:00",
  "whenHandedOver": "2021-10-07T10:55:23+09:00",
  "destination": {
    "reference": "Location/jp-location-example-ward"
  },
  "note": [
    {
      "text": "後発品へ変更可能か依頼医のＡ医師に確認したところ、患者の希望により不可との回答あり。"
    }
  ],
  "dosageInstruction": [
    {
      "text": "内服・経口・１日３回朝昼夕食後",
      "timing": {
        "code": {
          "coding": [
            {
              "system": "urn:oid:1.2.392.200250.2.2.20.20",
              "code": "1013044400000000",
              "display": "内服・経口・１日３回朝昼夕食後"
            }
          ]
        }
      },
      "route": {
        "coding": [
          {
            "system": "urn:oid:2.16.840.1.113883.3.1937.777.10.5.162",
            "code": "PO",
            "display": "口"
          }
        ]
      },
      "method": {
        "coding": [
          {
            "system": "urn:oid:1.2.392.200250.2.2.20.40",
            "code": "10",
            "display": "経口"
          }
        ]
      },
      "doseAndRate": [
        {
          "type": {
            "coding": [
              {
                "system": "urn:oid:1.2.392.100495.20.2.22",
                "code": "1",
                "display": "製剤量"
              }
            ]
          },
          "doseQuantity": {
            "value": 1,
            "unit": "錠",
            "system": "urn:oid:1.2.392.100495.20.2.101",
            "code": "TAB"
          },
          "rateRatio": {
            "numerator": {
              "value": 3,
              "unit": "錠",
              "system": "urn:oid:1.2.392.100495.20.2.101",
              "code": "TAB"
            },
            "denominator": {
              "value": 1,
              "unit": "日",
              "system": "http://unitsofmeasure.org",
              "code": "d"
            }
          }
        }
      ]
    }
  ],
  "substitution": {
    "wasSubstituted": true,
    "type": {
      "coding": [
        {
          "system": "http://terminology.hl7.org/CodeSystem/v3-substanceAdminSubstitution",
          "code": "G",
          "display": "generic composition"
        }
      ]
    },
    "reason": [
      {
        "coding": [
          {
            "system": "http://terminology.hl7.org/CodeSystem/v3-ActReason",
            "code": "RR",
            "display": "regulatory requirement"
          }
        ]
      }
    ]
  }
}
```

## 注意事項

### 記述の単位について
MedicationDispenseは薬剤をCodeableConceptとして1つまでしか持つか、Medication Resourceのreferenceをもつことしかできない。
したがって、複数の薬剤を同一のRp番号で表現する場合にはMedicationDispenseを繰り返すか、複数の薬剤をまとめたMedication Resouceのインスタンスを参照することとなる。
ワーキンググループでの検討の結果、冗長とはなるがidentifierにRp番号と薬剤番号を記録することとし、MedicationDispenseを繰り返すことで表現する方法を推奨することとした。

### 調剤量の記述方法
調剤量はquantityに、SimpleQuantity型で記録する。単位コードには、投与量と同様に医薬品単位略号（"urn:oid:1.2.392.100495.20.2.101"）を使用する。
調剤日数を記述したい場合は、daysSupply要素にSimpleQuantity方で記述し、単位コードはUCUM("http://unitsofmeasure.org")を使用する。

21錠（1日3錠×7日分）を調剤する場合のインスタンス例を以下に示す。

```json
"quantity": {
    "value": 21,
    "unit": "錠",
    "system": "urn:oid:1.2.392.100495.20.2.101",
    "code": "TAB"
},
"daysSupply": {
    "value": 7,
    "unit": "日",
    "system": "http://unitsofmeasure.org",
    "code": "d"
}
```

### 力価区分の記述方法
用量は製剤量で記述することを基本とするが、必要に応じて原薬量指定も可能とする。この識別の記述方法は、JP Core MedicationRequestと同様とする。

### 代替医薬品への変更内容の記述方法
調剤時に行ったジェネリック医薬品などへの変更内容の記述は、substitution.wasSubstituted, substitution.type, substitution.reason を使用する。
変更の種類はデフォルトのコード表（"http://terminology.hl7.org/CodeSystem/v3-substanceAdminSubstitution"）を使用する。
変更の理由はデフォルトのコード表（"http://terminology.hl7.org/CodeSystem/v3-ActReason")を使用するかフリーテキストで記述する。ローカルのコード表を使用してもよい。

ジェネリック医薬品への変更の場合のインスタンス例を以下に示す。

```json
"substitution" : {
    "wasSubstituted" : true,
    "type" : {
        "coding" : [
            {
                "code" : "G",
                "system" : "http://terminology.hl7.org/CodeSystem/v3-substanceAdminSubstitution",
                "display" : "generic composition"
            }
        ]
    },
    "reason": [
        {
            "coding" : [
                {
                    "code" : "RR",
                    "system" : "http://terminology.hl7.org/CodeSystem/v3-ActReason",
                    "display" : "regulatory requirement"
                }
            ]
        }
    ]
}
```

### 払い出し先
調剤された薬剤が払い出された先は、destination要素にReference型でLocationリソースの参照情報を記述する。

```json
"destination" : {
    "reference" : "Location/12A"
}
```

### 払い出し日時
調剤された薬剤が払い出された日時は、whenHandedOver要素にdateTime型で記述する。

### 調剤日時
薬剤が実際に調剤された日時は、whenPrepared要素にdateTime型で記述する。

### 調剤実施者
調剤を実際に行った医療従事者は、performer.actor要素にReference型でPractitionerリソースの参照情報を記述する。役割に応じて複数の医療従事者を記述できる。

```json
"performer" : [
    {
        "function" : {
            "coding" : [
                {
                    "code" : "packager",
                    "system" : "http://terminology.hl7.org/CodeSystem/medicationdispense-performer-function",
                    "display" : "Packager"
                }
            ]
        },
        "actor" : {
            "reference" : "Practitioner/01234567"
        }
    }
]
```

### 調剤結果の記述方法
単一の薬剤に対する調剤結果は、MedicationDispenseに対して定義した拡張「JP_MedicationDispense_Preparation」を使用する。
この拡張は、CodeableConcept型を使用してテキストによる指示とコードによる指示のどちらかを記述することができる。
一つの薬剤に対して、複数の指示を記録する場合には、この拡張を、拡張単位で繰り返して記録する。 
調剤結果で使用するコードは、電子処方箋HL7 FHIR仕様(調剤指示)("urn:oid:1.2.392.200250.2.2.30.10")を推奨する。

薬剤単位の調剤結果を表すインスタンス例を示す。
```json
"extension": [
    {
        "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationDispense_Preparation",
        "valueCodeableConcept": {
            "coding": [
                {
                "code": "C",
                "system": "urn:oid:1.2.392.200250.2.2.30.10",
                "display": "粉砕指示"
                }
            ]
        }
    }, {
        "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationDispense_Preparation",
        "valueCodeableConcept": {
            "text" : "嚥下障害のため、上記粉砕指示"
        }
    } 
],

```

### 疑義照会の内容
調剤時に行った疑義照会の内容は、note要素にAnnotation型で記述する。

### 調剤時の特記事項（コメントなど）
調剤時の特記事項（コメントなど）も、note要素にAnnotation型で記述する。

### 薬剤処方の各種指示情報の記述方法について
調剤の基となった薬剤処方の用法などの情報は、特に記述のない限り JP Core MedicationRequest と同様の記述方法とする。該当する項目としては以下のものがある。

* 服用期間、実服用日数
* 服用開始日
* １回量と１日量
* 外用部位
* RP番号、薬剤番号
* 処方箋番号（オーダーID）
* 投与方法、投与経路
* 入外区分
* 調剤指示以外の薬剤単位、RP単位のコメント
* 不均等投与
* 隔日投与、曜日指定投与


## その他、参考文献・リンク等
1. HL7, FHIR MedicationDispense Resource, [http://hl7.org/fhir/MedicationDispense.html](http://hl7.org/fhir/MedicationDispense.html)
1. 保健医療福祉情報システム工業会, JAHIS 処方データ交換規約 Ver.3.0C, [https://www.jahis.jp/standard/detail/id=564](https://www.jahis.jp/standard/detail/id=564)
1. 日本医療情報学会MERIT-9研究会, 医療情報交換規約運用指針、MERIT-9 処方オーダver 1.0, [http://merit-9.mi.hama-med.ac.jp/jahis/SHOHOU.pdf](http://merit-9.mi.hama-med.ac.jp/jahis/SHOHOU.pdf)
1. 保健医療福祉情報システム工業会, JAHISデータ交換規約（共通編）Ver.1.1, [https://www.jahis.jp/standard/detail/id=125](https://www.jahis.jp/standard/detail/id=125)
1. 保健医療福祉情報システム工業会, JAHIS注射データ交換規約Ver.2.1C, [https://www.jahis.jp/standard/detail/id=590](https://www.jahis.jp/standard/detail/id=590)
1. 児玉 義憲、[hl7v2-to-fhir, 
https://github.com/Acedia-Belphegor/hl7v2-to-fhir/](https://github.com/Acedia-Belphegor/hl7v2-to-fhir/)
1. Mike Henderson, 日本HL7協会監修、「HL7メッセージ交換」、第2版、インナービジョン社、2013年
1. 一般社団法人医療情報システム開発センター, 医薬品HOT コードマスター, [http://www2.medis.or.jp/hcode/](http://www2.medis.or.jp/hcode/)
1. 日本医療情報学会、SS-MIX2仕様書・ガイドライン, [http://www.jami.jp/jamistd/ssmix2.php](http://www.jami.jp/jamistd/ssmix2.php)
1. 保健医療福祉情報システム工業会, JAHIS電子処方箋実装ガイドVer.1.2, [https://www.jahis.jp/standard/detail/id=774](https://www.jahis.jp/standard/detail/id=774)
1. 令和２年度厚⽣労働科学特別研究事業「診療情報提供書, 電⼦処⽅箋等の電⼦化医療⽂書の相互運⽤性確保のための標準規格の開発研究」研究班, 電子処方箋HL7 FHIR記述仕様書案, [https://std.jpfhir.jp/](https://std.jpfhir.jp/)
