
### 必須要素
次のデータ項目は必須（データが存在しなければならない）である。

MedicationStatement リソースは、次の要素を持たなければならない。
- status : ステータスは必須である
- medicationCodeableConcept : 医薬品の識別情報は必須であり、medicationCodeableConcept.coding.system, medicationCodeableConcept.coding.code, medicationCodeableConcept.coding.display が必ず存在しなければならない
- subject :患者の参照情報は必須であり、subject.referenceないしsubject.identifierが必ず存在しなければならない

### Extensions定義

本プロファイルで追加定義された拡張はない。

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
|剤形|MERIT-9(剤形)|http://jpfhir.jp/fhir/core/CodeSystem/JP_MedicationFormMERIT9_CS |
|薬品単位|MERIT-9(単位）|urn:oid:1.2.392.100495.20.2.101|
|力価区分|処方情報 HL7FHIR 記述仕様(力価区分)|urn:oid:1.2.392.100495.20.2.22|
|用法|JAMI処方・注射オーダ標準用法規格(用法コード)|urn:oid:1.2.392.200250.2.2.20.20|
|用法|JAMI処方・注射オーダ標準用法規格(補足用法コード)|urn:oid:1.2.392.200250.2.2.20.22|
|部位|JAMI処方・注射オーダ標準用法規格(部位コード)|urn:oid:1.2.392.200250.2.2.20.32|
|投与方法|JAMI処方・注射オーダ標準用法規格(基本用法区分)|urn:oid:1.2.392.200250.2.2.20.30|
|投与経路|HL7 V2(使用者定義表0162)|http://terminology.hl7.org/CodeSystem/v2-0162|
|入外区分|HL7V2(HL7表0482)|http://terminology.hl7.org/CodeSystem/v2-0482|

## 利用方法

#### Search Parameter一覧

| コンフォーマンス | パラメータ    | 型     | 例                                                           |
| ---------------- | ------------- | ------ | ------------------------------------------------------------ |
| SHALL            | identifier    | token  | GET [base]/MedicationStatement?identifier=http://myhospital.com/fhir/medication\|1234567890 |
| SHOULD            | patient      | reference | GET [base]/MedicationStatement?patient=123456   |
| SHOULD           | patient,whenhandedover | referenece,date  | GET [base]/MedicationStatement?patient=123456&whenhandedover=eq2013-01-14 |
| MAY           | whenhandedover,whenprepared,context,code,performer| date,date,token,token,token | GET [base]/MedicationStatement?code=urn:oid:1.2.392.200119.4.403.1\|105271807  |

##### 必須検索パラメータ

次の検索パラメータは必須でサポートされなければならない。

1. identifier 検索パラメータを使用して、オーダIDなどの識別子によるMedicationRequestの検索をサポートしなければならない（SHALL）

   ```
   GET [base]/MedicationStatement?identifier={system|}[code]
   ```

   例：

   ```
   GET [base]/MedicationStatement?identifier=http://myhospital.com/fhir/medication|1234567890
   ```

   指定された識別子に一致するMedicationStatementリソースを含むBundleを検索する。
   

##### 推奨検索パラメータ

次の検索パラメータをサポートすることが望ましい。

1. patient 検索パラメータを使用して、患者のリファレンス情報によるMedicationStatementの検索をサポートすることが望ましい（**SHOULD**）

   ```
   GET [base]/MedicationStatement?patient=[id]
   GET [base]/MedicationStatement?patient=[url]
   ```

   例：

   ```
   GET [base]/MedicationStatement?patient=123456
   ```

   リソースIDが123456の患者のMedicationStatementリソースを含むBundleを検索する。

1. patient,whenhandedover 検索パラメータを使用して、患者のリファレンス情報と払い出し日によるMedicationStatementの検索をサポートすることが望ましい（**SHOULD**）

   ```
   GET [base]/MedicationStatement?patient=[id]&whenhandedover=[date]
   GET [base]/MedicationStatement?patient=[url]&whenhandedover=[date]
   ```

   例：

   ```
   GET [base]/MedicationStatement?patient=123456&whenhandedover=eq2013-01-14
   ```

   リソースIDが123456の患者の2013-01-14に払い出されたMedicationStatementリソースを含むBundleを検索する。


##### 追加検索パラメータ 

追加検索パラメータは定義しない。

#### Operation一覧

JP Core MedicationStatement リソースに対して使用される操作は次の通りである。

- $everything：[base]/MedicationStatement/[id]/$everything

  - この操作が呼び出された特定のMedicationStatementに関連する全ての情報を返す
    

#### Operation 詳細

##### $everything 操作

この操作は、この操作が呼び出された特定のMedicationStatementリソースに関連する全ての情報を返す。応答は "searchset" タイプのBundleリソースである。サーバは、少なくとも、識別されたMedicationStatementコンパートメントに含まれる全てのリソースと、それらから参照されるすべてのリソースを返すことが望ましい。

この操作の公式なURLは以下である。

```
http://hl7.jp/fhir/OperationDefinition/MedicationStatement-everything
```

URL: [base]/MedicationStatement/[id]/$everything

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

リクエスト：単一のMedicationStatementに関連する全てのリソースを取得する。

```
GET [base]/MedicationStatement/1234567890/$everything
[some headers]
```

レスポンス：指定されたMedicationStatementに関連する全てのリソースを返す。

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
      "fullUrl": "http://example.org/fhir/MedicationStatement/1234567890",
      "resource": {
        "resourceType": "MedicationStatement",

          ・・・

       },
    }
  ]
}  
```

### サンプル
下記の内容の処方に従って調剤する例をFHIRで表現する場合のサンプルを示す。

<!-- - [**調剤実施 内服薬**][jp-medicationdispense-example-1] -->
- TBD

## 注意事項

### 記述の単位について
MedicationStatementは薬剤をCodeableConceptとして1つまでしか持つか、Medication Resourceのreferenceをもつことしかできない。
したがって、複数の薬剤を同一のRp番号で表現する場合にはMedicationStatementを繰り返すか、複数の薬剤をまとめたMedication Resouceのインスタンスを参照することとなる。
ワーキンググループでの検討の結果、冗長とはなるがidentifierにRp番号と薬剤番号を記録することとし、MedicationStatementを繰り返すことで表現する方法を推奨することとした。

### 医薬品の記述方法
医薬品はmedicationCodeableConceptで記述する。
医療用医薬品の場合、医薬品コードはMedicationRequest等と同様のコード表を使用してcoding要素に記述する。また、患者からの情報提供で具体的な医薬品の鑑別が不可能な場合は、coding要素を省略してtext要素に記述する。
一般用医薬品(OTC医薬品等)の場合、適切なコード表が存在しないため、text要素に記述する。

#### 医療用医薬品
```json
"medicationCodeableConcept": {
  "coding": [
    {
      "system": "urn:oid:1.2.392.200119.4.403.1",
      "code": "105271807",
      "display": "プレドニン錠５ｍｇ"
    }
  ]
}
```

#### 一般用医薬品、鑑別不可能な医薬品等
```json
"medicationCodeableConcept": {
  "text": "バファリンＡ"
}
```

### 服用日時
薬が服用された（または服用される予定の）日時をeffectiveDateTime or effectivePeriod要素に[RFC3339](https://datatracker.ietf.org/doc/html/rfc3339)形式で記述する。
タイムゾーンはJST(+09:00)を指定する。

開始日時、終了日時が明確である場合はeffectivePeriodに記述する。
```json
"effectivePeriod": {
  "start": "2022-07-01T08:00:00+09:00",
  "end": "2022-07-14T18:00:00+09:00"
}
```
開始日時しか存在せず終了日時が明確でない場合、effectivePeriodのstartとendに同じ値を記述するか、effectiveDateTime要素に記述する。
```json
"effectiveDateTime": "2022-08-25T08:30:00+09:00"
```

### 服用申告日時
情報提供者により服用が申告された日時は、dateAsserted要素にdateTime型で記述する。
```json
"dateAsserted": "2022-08-25T08:35:59+09:00"
```

### 情報提供者
服用情報の提供者を、informationSource要素にReference型でリソースの参照情報を記述する。

情報提供者の種別 | リソース
:--- | :---
患者自身 | Patient
患者の家族、またはキーパーソン等 | RelatedPerson
医療従事者（紹介医等） | Practitioner, PractitionerRole
施設等（情報提供担当者が明確でない場合） | Organization
 
```json
"informationSource" : {
  "reference": "RelatedPerson/123456",
  "display": "患者 花子（母親）"
}
```

### 派生元情報
服薬情報の派生元となった処方(MedicationRequest)、調剤情報(MedicationDispense)等が存在する場合、derivedFrom要素にReference型でリソースの参照情報を記述する。

```json
"derivedFrom" : {
  "reference": "MedicationRequest/123456"
}
```

### 服用理由（対象疾患等）
この投薬の理由、対象疾患などを、reasonCode要素にCodeableConcept型で記述する。
服用理由で使用するコードは、MEDIS標準病名マスター 病名交換用コード("urn:oid:1.2.392.200119.4.101.6")を推奨する。

```json
"reasonCode": {
  "coding": [
    {
      "system": "urn:oid:1.2.392.200119.4.101.6",
      "code": "B0EF",
      "display": "持続腹痛"
    }
  ]
}
```

### 用法・用量
医薬品の用法・用量をdosage要素で記述する。
dosage要素の記述ルールについては、MedicationRequestリソースを参照のこと。

### 服薬情報に関する特記事項
服薬情報の特記事項（コメントなど）は、note要素にAnnotation型で記述する。

### 薬剤処方の各種指示情報の記述方法について
調剤の基となった薬剤処方の用法などの情報は、特に記述のない限り JP Core MedicationRequest と同様の記述方法とする。該当する項目としては以下のものがある。

* 服用期間、実服用日数
* 服用開始日
* １回量と１日量
* 外用部位
* RP番号、薬剤番号
* 処方箋番号（オーダID）
* 投与方法、投与経路
* 入外区分
* 調剤指示以外の薬剤単位、RP単位のコメント
* 不均等投与
* 隔日投与、曜日指定投与

## その他、参考文献・リンク等
1. HL7, FHIR MedicationDispense Resource, [http://hl7.org/fhir/R4/medicationstatement.html](http://hl7.org/fhir/R4/medicationstatement.html)
1. 保健医療福祉情報システム工業会, JAHIS電子版お薬手帳データフォーマット仕様書Ver.2.4, [https://www.jahis.jp/standard/detail/id=715](https://www.jahis.jp/standard/detail/id=715)
1. 日本医療情報学会, 退院時サマリー HL7FHIR 記述仕様 (第1版), [https://std.jpfhir.jp/stddoc/eDischargeSummaryFHIR_v1x.pdf](https://std.jpfhir.jp/stddoc/eDischargeSummaryFHIR_v1x.pdf)
1. 日本医療情報学会, 診療情報提供書 HL7FHIR 記述仕様 (第1版), [https://std.jpfhir.jp/stddoc/eReferralFHIR_v1x.pdf](https://std.jpfhir.jp/stddoc/eReferralFHIR_v1x.pdf)

{% include markdown-link-references.md %}