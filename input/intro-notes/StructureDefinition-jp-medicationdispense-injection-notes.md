
### 必須要素
次のデータ項目は必須（データが存在しなければならない）である。

MedicationDispense リソースは、次の要素を持たなければならない。
- status : ステータスは必須である
- medication : 医薬品の識別情報は必須でありmedicationReference.referenceが必ず存在しなければならない、JP Coreでは注射の医薬品情報は単一薬剤の場合もMedicationリソースとして記述し、MedicationDispense.contained属性に内包しmedicationCodeableConceptは使用しない
- subject : 患者の参照情報は必須であり、subject.referenceないしsubject.identifierが必ず存在しなければならない
- whenHandedOver : 払い出し日時は必須である

MedicationDispense リソースに内包されるMedicationリソースでは、次の要素を持たなければならない。
- ingredient.itemCodeableConcept : 医薬品の識別情報であり、JP Coreでは必須である
- ingredient.strength : 医薬品の投与量であり、JP Coreでは必須である

### Extensions定義
JP Core MedicationDispense Injectionプロファイルで使用される拡張は次の通りである。

|拡張|説明|定義|値型|
|:----|:----|:----|:----|
|調剤結果|薬剤単位の調剤結果|[JP_MedicationDispense_Preparation]|CodeableConcept|
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


### 用語定義
HL7 FHIRの基底規格では、薬剤コードをはじめとして、剤形などでSNOMED CTが使われているが、日本ではライセンスの問題もあり普及していない。代替としてJAHIS注射データ交換規約やSS-MIX2で使われている用語集を採用した。

HL7 ver 2系では用語集を識別するコーディングシステム名(以下、「CS名」）は文字列であったが、FHIRではURIを指定する必要があるため、それぞれにURIを割り当てた。以下に使用する用語集のCS名とURI表記を列記する。


|分類|CS名|URI|
|---------|----|---------------------------|
|医薬品|HOT7|urn:oid:1.2.392.200119.4.403.2|
|医薬品|HOT9|urn:oid:1.2.392.200119.4.403.1|
|医薬品|HOT13|urn:oid:1.2.392.200119.4.402.1|
|医薬品|YJコード|urn:oid:1.2.392.100495.20.1.73|
|剤形|MERIT-9(剤形)|http://jpfhir.jp/fhir/core/CodeSystem/JP_MedicationFormMERIT9_CS|
|薬品単位|MERIT-9(単位）|urn:oid:1.2.392.100495.20.2.101|
|力価区分|処方情報 HL7FHIR 記述仕様(力価区分)|urn:oid:1.2.392.100495.20.2.22|
|用法|JAMI処方・注射オーダ標準用法規格(用法コード) |urn:oid:1.2.392.200250.2.2.20|
|頓用条件|MERIT-9(頓用指示)|http://jpfhir.jp/fhir/core/CodeSystem/JP_MedicationAsNeededConditionMERIT9_CS|
|投与部位|JAMI処方・注射オーダ標準用法規格(部位コード)|urn:oid:1.2.392.200250.2.2.20.32|
|投与部位|HL7 V2(HL7表0550)|http://terminology.hl7.org/CodeSystem/v2-0550|
|投与部位(修飾子)|HL7 V2(HL7表0495)|http://terminology.hl7.org/CodeSystem/v2-0495|
|投与装置|HL7 V2(使用者定義表0164)|http://terminology.hl7.org/CodeSystem/v2-0164|
|投与方法|JAMI処方・注射オーダ標準用法規格(基本用法区分)|urn:oid:1.2.392.200250.2.2.20.30|
|投与手技|HL7 V2(使用者定義表0165)|http://terminology.hl7.org/CodeSystem/v2-0165|
|投与手技|JAMI処方・注射オーダ標準用法規格(用法詳細区分)|urn:oid:1.2.392.200250.2.2.20.40|
|投与手技|JAHIS注射データ交換規約Ver.2.1C(JHSI表0003)|http://jpfhir.jp/fhir/core/CodeSystem/JHSI0003|
|投与経路|HL7 V2(使用者定義表0162)|http://terminology.hl7.org/CodeSystem/v2-0162|
|入外区分|HL7 V2(HL7表0482)|http://terminology.hl7.org/CodeSystem/v2-0482|

### 項目の追加
日本国内の電子カルテシステムでの注射オーダの運用に合わせ、以下の項目を追加した。

* 調剤結果の追加（拡張「JP_MedicationDispense_Preparation」を使用）
* RP番号の追加（identifierを使用）
* 薬剤番号（拡張「JP_Medication_Ingredient_DrugNo」を使用）
* 施用番号の追加（dosageInstruction.sequenceを使用）
* ⼒価区分の追加（拡張「JP_Medication_IngredientStrength_StrengthType」を使用）

## 利用方法

#### Search Parameter一覧

| コンフォーマンス | パラメータ    | 型     | 例                                                           |
| ---------------- | ------------- | ------ | ------------------------------------------------------------ |
| SHALL            | identifier    | token  | GET [base]/MedicationDispense?identifier=http://myhospital.com/fhir/medication\|1234567890 |
| SHOULD            | patient      | reference | GET [base]/MedicationDispense?patient=123456   |
| SHOULD           | patient,whenhandedover | reference,date  | GET [base]/MedicationDispense?patient=123456&whenhandedover=eq2013-01-14 |
| MAY           | whenhandedover,whenprepared,context,code,performer| date,date,token,token,token | GET [base]/MedicationDispense?code=urn:oid:1.2.392.200119.4.403.1\|105271807  |

##### 必須検索パラメータ

次の検索パラメータは必須でサポートされなければならない。

1. identifier 検索パラメータを使用して、オーダIDなどの識別子によるMedicationRequestの検索をサポートしなければならない（SHALL）

   ```
   GET [base]/MedicationDispense?identifier={system|}[code]
   ```

   例：

   ```
   GET [base]/MedicationDispense?identifier=http://myhospital.com/fhir/medication|1234567890
   ```

   指定された識別子に一致するMedicationDispenseリソースを含むBundleを検索する。
   

##### 推奨検索パラメータ

次の検索パラメータをサポートすることが望ましい。

1. patient 検索パラメータを使用して、患者のリファレンス情報によるMedicationDispenseの検索をサポートすることが望ましい（**SHOULD**）

   ```
   GET [base]/MedicationDispense?patient=[id]
   GET [base]/MedicationDispense?patient=[url]
   ```

   例：

   ```
   GET [base]/MedicationDispense?patient=123456
   ```

   リソースIDが123456の患者のMedicationDispenseリソースを含むBundleを検索する。

1. patient,whenhandedover 検索パラメータを使用して、患者のリファレンス情報と払い出し日によるMedicationDispenseの検索をサポートすることが望ましい（**SHOULD**）

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

追加検索パラメータは定義しない。

#### Operation一覧

JP Core MedicationDispense Injection リソースに対して使用される操作は次の通りである。

- $everything：[base]/MedicationDispense/[id]/$everything

  - この操作が呼び出された特定のMedicationDispenseに関連する全ての情報を返す
    

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
ホリゾン注射液１０ｍｇ１アンプルを左腕に静脈注射する処方例をFHIRで表現する場合のサンプルを示す。

-[**調剤実施 注射薬**][jp-medicationdispense-injection-example-1]


## 注意事項

### 記述の単位について
MedicationDispenseは薬剤をCodeableConceptとして1つまでしか持つか、Medicationリソースのreferenceをもつことしかできない。したがって、複数の薬剤を同一のRp番号で表現する場合にはMedicationDispenseを繰り返すか、複数の薬剤をまとめたMedication Resourceのインスタンスを参照することとなる。ワーキンググループでの検討の結果、注射の場合は複数の薬剤をまとめたMedicationリソースのインスタンスをcontained属性に内包した上で参照することとした。

１オーダ内に複数のRpがある場合には、MedicationDispenseを繰り返し、identifier属性にオーダ番号、Rp番号をそれぞれ持つことでリソース間の関係性がわかるようにする。

１オーダ内にRpごとに複数の施用（投薬）を持つことができるシステムの場合は、今回の調剤に対する施用の情報をdosageInstruction要素で記述する。該当の施用の投与タイミングを dosageInstruction.timing で指定し、施用番号を dosageInstruction.sequenceで記述する。

### 投与薬剤と調剤量の記述方法
投与薬剤と調剤量は、RP内の薬剤が１薬剤の場合も混注などで複数の薬剤を含む場合も、すべての薬剤を記述したMedicationリソースを contained 属性に内包し、それをMedicationRequest.medicationReference属性で参照するようにする。
Medicationリソースのingredient.itemCodeableConcept要素にCodeableConcept型で各薬剤の識別情報を記述し、ingredient.strength.numerator要素に１回あたりの含有量を記述する。薬剤を識別するコードはHOT7、HOT9、YJコード、⼀般処⽅名マスターを推奨するが、ローカルコードを使用してもよい。含有量の単位コードは MERIT-9を使用する。ingredient.strength.denominatorには固定値「１回」をMERIT-9を使用して指定する。
dosageInstruction.doseAndRate.doseQuantity要素には、情報が得られる場合には全体の容量をUCUM("http://unitsofmeasure.org")を使用してmL単位で指定する。

「ソリタ－Ｔ３号輸液５００ｍＬ １本」と「アドナ注（静脈用）50mg／10mL  １アンプル」計510mLを指示する場合のインスタンス例を示す。

```json
"contained": [
  {
    "resourceType": "Medication",
    "id": "jp-medicationrequest-injection-medication-example-2",
    "meta": {
      "profile": [
        "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Medication"
      ]
    },
    "status": "active",
    "ingredient": [
      {
        "itemCodeableConcept": {
          "coding": [
            {
              "system": "urn:oid:1.2.392.200119.4.403.1",
              "code": "107750602",
              "display": "ソリタ－Ｔ３号輸液５００ｍＬ"
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
      },
      {
        "itemCodeableConcept": {
          "coding": [
            {
              "system": "urn:oid:1.2.392.200119.4.403.1",
              "code": "108010001",
              "display": "アドナ注（静脈用）５０ｍｇ"
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
  }
],
...
"medicationReference": {
  "reference": "#jp-medicationrequest-injection-medication-example-2"
},
```

### 調剤容量の記述方法
調剤量に対する容量はquantity要素にSimpleQuantity型で記録する。単位コードはUCUM("http://unitsofmeasure.org")を使用する。

調剤量に対する容量が510mLになる場合のインスタンス例を以下に示す。

```json
"quantity": {
  "value": 510,
  "unit": "mL",
  "system": "http://unitsofmeasure.org",
  "code": "mL"
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
調剤結果で使用するコードは、特に推奨するものはない。

薬剤単位の調剤結果を表すインスタンス例を示す。
```json
"extension": [
  {
    "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationDispense_Preparation",
    "valueCodeableConcept": {
      "text" : "5mLに溶解して2mL抜きとる"
    }
  } 
],

```

### 疑義照会の内容
調剤時に行った疑義照会の内容は、note要素にAnnotation型で記述する。

### 調剤時の特記事項（コメントなど）
調剤時の特記事項（コメントなど）も、note要素にAnnotation型で記述する。

### 薬剤処方の各種指示情報の記述方法について
調剤の基となった薬剤処方の用法などの情報は、特に記述のない限り JP Core MedicationRequest Injection と同様の記述方法とする。該当する項目としては以下のものがある。

* RP番号、薬剤番号、施用番号
* 処方箋番号（オーダID）
* 投与方法、投与手技、投与経路、投与ライン、投与装置
* 入外区分
* あいまい指示、頓用指示
* 投与開始日時、投与終了日時


## その他、参考文献・リンク等
1. HL7, FHIR MedicationDispense Resource, [https://hl7.org/fhir/R4/MedicationDispense.html](https://hl7.org/fhir/R4/MedicationDispense.html)
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
