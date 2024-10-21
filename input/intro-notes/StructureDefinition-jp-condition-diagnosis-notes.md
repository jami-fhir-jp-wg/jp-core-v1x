### 必須要素

本プロファイルに準拠するためには、次の項目の値が存在しなければならない。

- subject : 本リソースを所有する患者

### Extensions定義

本プロファイルで定義された拡張は次の通りである。

|拡張|説明|定義|値型|
|:----|:----|:----|:----|
|病名修飾語|病名の前置修飾語を格納する拡張<br/>《code配下》|[JP_Condition_DiseasePrefixModifier]|CodeableConcept|
|病名修飾語|病名の後置修飾語を格納する拡張<br/>《code配下》|[JP_Condition_DiseasePostfixModifier]|CodeableConcept|

### 用語定義
HL7 FHIRの基底規格では、病名コードなどでSNOMED CTが使われているが、日本ではライセンスの問題もあり普及していない。代替としてJAHIS病名情報データ交換規約やSS-MIX2で使われている用語集を採用した。（★他に参照すべき標準規格はあるか★）

HL7 V2系では用語集を識別するコーディングシステム名（以下、「CS名」）は文字列であったが、FHIRではURIを指定する必要があるため、それぞれにURIを割り当てた。以下に使用する用語集のCS名とURI表記を列記する。

|分類|用語集|CS名|URI|
|-----|----|----|---------------------------|
|病名|MEDIS ICD10対応標準病名マスター(管理番号)|MDCDX2|urn:oid:1.2.392.200119.4.101.2|
|病名|MEDIS ICD10対応標準病名マスター(交換用コード)|MDCDX2|urn:oid:1.2.392.200119.4.101.6|
|病名|ICD-10|ICD10|http://jpfhir.jp/fhir/core/CodeSystem/JP_ConditionDisaseCodeICD10_CS|
|病名|ICD-11|ICD11|http://jpfhir.jp/fhir/core/CodeSystem/JP_ConditionDisaseCodeICD11_CS|
|病名|レセプト電算用傷病名マスター|(なし)|http://jpfhir.jp/fhir/core/CodeSystem/JP_ConditionDisaseCodeReceipt_CS|
|病名修飾語|MEDIS ICD10対応標準病名マスター(修飾語管理番号)|MDCDX2|urn:oid:1.2.392.200119.4.201.2|
|病名修飾語|MEDIS ICD10対応標準病名マスター(修飾語交換用コード)|MDCDX2|urn:oid:1.2.392.200119.4.201.5|
|病名修飾語|レセプト電算用修飾語マスター|(なし)|http://jpfhir.jp/fhir/core/CodeSystem/JP_ConditionDiseaseModifierReceipt_CS|
|転帰区分|HL7表0241|HL70241|hhttp://jpfhir.jp/fhir/core/CodeSystem/HL70241|
|転帰区分|JHSD表0006|JHSD0006|http://jpfhir.jp/fhir/core/CodeSystem/JHSD0006|
|転帰区分|レセプト電算システム転帰区分コード|(なし)|http://jpfhir.jp/fhir/core/CodeSystem/JP_ConditionDiseaseOutcomeReceipt_CS|

### 制約一覧

本プロファイルで追加定義された制約はない。

### 項目の追加
本プロファイルで追加された項目は以下の通りである。

* 転帰区分（clinicalStatusを使用）
* 発症日（病名開始日）(onset[x]を使用)
* 転帰日（病名終了日）(abatement[x]を使用)
* 病名修飾語（拡張「DiseasePrefixModifier」「DiseasePostfixModifier」を使用）

## 利用方法

### OperationおよびSearch Parameter 一覧

#### Search Parameter一覧

| コンフォーマンス    | パラメータ                   | 型         | 例                                                                                 |
| ---------------- | -------------------------- |  --------- | ---------------------------------------------------------------------------------- |
| SHALL            | identifier                 | token      | GET [base]/Condition?identifier=http://myhospital.com/fhir/condition\|123 |
| SHOULD           | patient                    | reference  | GET [base]/Condition?patient=Patient/123                                        |
| MAY              | patient,onset-date         | reference,date | GET [base]/Condition?patient=Patient/123&onset-date=ge2021-08-24             |
| MAY              | patient,clinical-status     | reference,code | GET [base]/Condition?patient=Patient/123&clinical-status=active              |
| MAY              | patient,verification-status | reference,code | GET [base]/Condition?patient=Patient/123&verification-status=confirmed       |
| MAY              | patient,category           | reference,code | GET [base]/Condition??patient=Patient/123&category=problem-list-item    |

##### 必須検索パラメータ

本プロファイルに準拠するためには、以下の検索パラメータをサポートしなければならない（SHALL）

1. 検索パラメータidentifierを指定し、レコードIDなどの識別子によりConditionを検索

   ```
   GET [base]/Condition?identifier={system|}[code]
   ```
   例：
   ```
   GET [base]/Condition?identifier=http://myhospital.com/fhir/condition|123
   ```
   
   指定された識別子に一致するConditionリソースを含むBundleを検索する。

##### 推奨検索パラメータ

本プロファイルに準拠するためには、以下の検索パラメータをサポートすることが推奨される（SHOULD）

1. 検索パラメータpatientを指定し、該当するすべてのConditionを検索

   ```
   GET [base]/Condition?patient={reference}
   ```
   例：
   ```
   GET [base]/Condition?patient=Patient/123
   ```
   
   指定された患者のすべてのConditionリソースを含むBundleを検索する。

##### 追加検索パラメータ

オプションとして次の検索パラメータをサポートすることができる（MAY）

1. 検索パラメータpatientとonset-dateを指定し、該当するすべてのConditionを検索

      * dateに対する次の比較演算子のサポートを含む: gt,lt,ge,le
      * AND検索のオプションのサポートを含む (例えば.onset-date=[date]&onset-date=[date]]&...)
      
      ```
      GET [base]/Condition?patient={reference}&onset-date={gt|lt|ge|le}[date]{&onset-&date={gt|lt|ge|le}[date]&...}
      ```
      例：
      ```
      GET [base]/Condition?patient=Patient/123&onset-date=ge2021-08-24
      ```
   
      指定された患者および発症日のすべてのConditionを含むBundleを検索する。

2. 検索パラメータpatientとclinical-statusを指定し、該当するすべてのConditionを検索

      * OR検索のサポートを含む(例えば clinical-status={system\|}[code],{system\|}[code],...)
      
      ```
      GET [base]/Condition?patient={reference}&clinical-status={system|}[code]{,{system|}[code],...}
      ```
      例：
      ```
      GET [base]/Condition?patient=Patient/123&clinical-status=active
      ```
      ```
      GET [base]/Condition?patient=Patient/123&clinical-status=http://hl7.org/fhir/ValueSet/condition-clinical|active
      ```
   
      指定された患者およびステータスのすべてのConditionを含むBundleを検索する。

3. 検索パラメータpatientとverification-statusを指定し、該当するすべてのConditionを検索

      ```
      GET [base]/Condition?patient={reference}&verification-status={system|}[code]
      ```
      例：
      ```
      GET [base]/Condition?patient=Patient/123&verification-status=confirmed
      ```
      ```
      GET [base]/Condition?patient=Patient/123&verification-status=http://hl7.org/fhir/ValueSet/condition-ver-status|confirmed
      ```
   
      指定された患者および確認状態のすべてのConditionを含むBundleを検索する。

4. 検索パラメータpatientとcategoryを指定し、該当するすべてのConditionを検索

      ```
      GET [base]/Condition?patient={reference}&category={system|}[code]
      ```  
      例：
      ```
      GET [base]/Condition?patient=Patient/123&category=claim-diagnosis
      ``` 
      ```
      GET [base]/Condition?patient=Patient/123&category=http://hl7.org/fhir/ValueSet/condition-category|problem-list-item
      ``` 

      指定された患者およびカテゴリーのすべてのConditionを含むBundleを検索する。

##### オプション検索パラメータ 

 本プロファイルで追加定義されたオプション検索パラメータはない。

#### サンプル

* [**病名（過敏性大腸炎の初期疾患）**][jp-condition-diagnosis-example-1]

## 注意事項
### 病名の識別コードと名称について
病名を識別するコードと名称は、Condition.code要素に、CodeableConcept型を使用して記録する。標準コードとしては、MEDIS ICD10対応標準病名マスターの交換用コード（"urn:oid:1.2.392.200119.4.101.6"）、ICD-10（"http://jpfhir.jp/fhir/core/CodeSystem/JP_ConditionDisaseCodeICD10_CS"）、レセプト電算用傷病名マスター（"http://jpfhir.jp/fhir/core/CodeSystem/JP_ConditionReceiptCode_CS"）を推奨する。CodeableConcept型はcoding要素を繰り返すことが可能なので、１つの病名の識別情報を複数のコードシステムで記述してもよい。
また、Condition.code.text には修飾情報を含めた病名のフルテキストを記述する。

「急性化膿性虫垂炎の疑い」の場合のインスタンス例を示す。
```json
"code": {
  "coding": [ { 
    "system": "http://terminology.sample.com/CodeSystem/disease/1311234567", 
    "code": "MD03981", 
    "display": "急性化膿性虫垂炎" 
  }, { 
    "system": "urn:oid:1.2.392.200119.4.101.6", 
    "code": "HR19", 
    "display": "急性化膿性虫垂炎" 
  }, { 
    "system": "http://jpfhir.jp/fhir/core/CodeSystem/JP_ConditionDisaseCodeICD10_CS", 
    "code": "K358", 
    "display": "急性化膿性虫垂炎" 
  }, { 
    "system": "http://jpfhir.jp/fhir/core/CodeSystem/JP_ConditionReceiptCode_CS", 
    "code": "5409004", 
    "display": "急性化膿性虫垂炎" 
  } ], 
  "text": "急性化膿性虫垂炎の疑い" 
},
```

### 病名修飾語について
病名修飾語は「急性」「過敏性」「症候群」などの修飾を病名に付加するためのものであり、Condition.code要素に対して定義した拡張「JP_Condition_DiseasePrefixModifier」「JP_Condition_DiseasePostfixModifier」を使用し、CodeableConcept型を使用して記録する。標準コードとしては、MEDIS ICD10対応標準病名マスターの修飾語交換用コード（"urn:oid:1.2.392.200119.4.102.5"）ないしレセプト電算資システム用修飾語コード("http://jpfhir.jp/fhir/core/CodeSystem/JP_ConditionDiseaseModifierReceipt_CS")を推奨する。この拡張を繰り返すことにより、複数の修飾語を記述することができる。

「過敏性大腸炎の初期疾患」の場合のインスタンス例を示す。（★適用順序が分からないがよいか？★）
```json
"code": {
  "extension": [ {
    "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Condition_DiseasePrefixModifier",
    "valueCodeableConcept": {
      "coding": [ { 
        "system": "urn:oid:1.2.392.200119.4.102.5", 
        "code": "3216", 
        "display": "過敏性" 
      } ],
      "text": "過敏性"
    }
  }, {
    "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Condition_DiseasePostfixModifier",
    "valueCodeableConcept": {
      "coding": [ { 
        "system": "urn:oid:1.2.392.200119.4.102.5", 
        "code": "1111", 
        "display": "の初期" 
      } ],
      "text": "の初期"
    }
  }, {
    "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Condition_DiseasePostfixModifier",
    "valueCodeableConcept": {
      "coding": [ { 
        "system": "urn:oid:1.2.392.200119.4.102.5", 
        "code": "08MV", 
        "display": "疾患" 
      } ],
      "text": "疾患"
    }
  } ],
  "coding": [ { 
    "system": "http://terminology.sample.com/CodeSystem/disease/1311234567", 
    "code": "MD13062", 
    "display": "大腸炎" 
  }, { 
    "system": "urn:oid:1.2.392.200119.4.101.6", 
    "code": "VSES", 
    "display": "大腸炎" 
  } ], 
  "text": "過敏性大腸炎の初期疾患" 
},
```

### 発症日（病名開始日）、転帰日（病名終了日）の記述方法
病名や症状などの発症日（病名や症状が始まった日）および転帰日（病名や症状が治まった日）は、それぞれCondition.onset[x]要素およびCondition.abatement[x]要素を使用して記述する。発症日や転帰日が不明の場合、代わりに病名開始日（当該病名の診療を開始した日）や病名終了日（当該病名の診療を終了した日）を記載してもよい。
dateTime, Age, Period, Range, string の５種類のデータ型を選択でき、情報の精度に応じて様々な記述方法が可能である。
abatement[x]要素はCondition.clinicalStatus要素の値が"resolved","remission","inactive"の場合のみ記述できることに注意すること。

「2023-09-01」に発症し、「2023-09-23」に転帰した場合のインスタンス例を示す。
```json
"onsetDateTime": "2023-09-01",
"abatementDateTime": "2023-09-23",
```

「2023年6月から7月」に発症した場合のインスタンス例を示す。
```json
"onsetPeriod": {
  "start": "2023-06",
  "end": "2023-07"
},
```

「15歳」の時に発症した場合のインスタンス例を示す。
```json
"onsetAge": {
  "value": 15,
  "unit": "years",
  "system": "http://unitsofmeasure.org",
  "code": "a"
},
```

### 転帰区分の記述方法
転帰区分は、Condition.clinicalStatus要素を使用し、CodeableConcept型で記載する。使用するコードは、Requiredレベルでバインディングされている値セット ("http://terminology.hl7.org/ValueSet/condition-clinical") の他、HL7V2.ｘで定義されているHL7表0241 ("http://jpfhir.jp/fhir/core/CodeSystem/HL70241") およびJAHIS病名情報データ交換規約Ver.3.1Cで定義されているJHSD表0006 ("http://jpfhir.jp/fhir/core/CodeSystem/JHSD0006")の併用ないしレセプト電算用転帰区分コード（"http://jpfhir.jp/fhir/core/CodeSystem/JP_ConditionDiseaseOutcomeReceipt_CS"）が標準コードとして使用できる。
なお、記述する転帰区分は、abatement[x]に記述した時点、ないしabatement[x]がない場合は出力時点での情報とする。

「寛解」の場合のインスタンス例を示す。
```json
"clinicalStatus": {
  "coding": [ { 
    "system": "http://terminology.hl7.org/CodeSystem/condition-clinical", 
    "code": "remission", 
    "display": "Remission" 
  }, { 
    "system": "http://jpfhir.jp/fhir/core/CodeSystem/JHSD0006", 
    "code": "M", 
    "display": "寛解" 
  }, { 
    "system": "http://terminology.sample.com/CodeSystem/disease-outcome", 
    "code": "2", 
    "display": "寛解" 
  } ], 
  "text": "寛解" 
},
```

### 疑い病名の記述方法
疑い病名かどうかは、Condition.verificationStatus要素に、CodeableConcept型を使用して記録する。コードは、Requiredレベルでバインディングされている値セット（"http://hl7.org/fhir/ValueSet/condition-ver-status"）を使用し、確定病名の場合は"confirmed"、疑い病名の場合は"unconfirmed"をセットする。
また、疑い病名の場合はCondition.code.textの末尾を「～の疑い」とする。

「急性化膿性虫垂炎の疑い」の場合のインスタンス例を示す。
```json
"verificationStatus": {
  "coding": [ { 
    "system": "http://terminology.hl7.org/CodeSystem/condition-ver-status", 
    "code": "unconfirmed", 
    "display": "Unconfirmed" 
  } ]
},
...
"code": {
  "coding": [ { 
    "system": "http://terminology.sample.com/CodeSystem/disease/1311234567", 
    "code": "MD03981", 
    "display": "急性化膿性虫垂炎" 
  }, { 
    "system": "urn:oid:1.2.392.200119.4.101.6", 
    "code": "HR19", 
    "display": "急性化膿性虫垂炎" 
  } ], 
  "text": "急性化膿性虫垂炎の疑い" 
},
```

## その他、参考文献・リンク等

1. JAHIS 病名情報データ交換規約Ver.3.1C [https://www.jahis.jp/files/user/04_JAHIS%20standard/18-003_JAHIS病名情報データ交換規約%20Ver.3.1C.pdf](https://www.jahis.jp/files/user/04_JAHIS standard/18-003_JAHIS病名情報データ交換規約 Ver.3.1C.pdf)
2. ICD-10 [https://terminology.hl7.org/2.1.0/CodeSystem-icd10.html](https://terminology.hl7.org/2.1.0/CodeSystem-icd10.html)

{% include markdown-link-references.md %}