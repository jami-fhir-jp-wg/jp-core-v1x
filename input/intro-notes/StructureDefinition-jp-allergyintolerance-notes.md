### 必須要素

本プロファイルに準拠するためには、次の項目の値が存在しなければならない。

- code : アレルギーまたは不耐性の種類を示すコード。
- patient : 本リソースを有する患者。

### Extensions定義

- Extensions定義はない

### 用語定義


| Path                            | 定義                               | バインディング強度 | バリューセット |
| ------------------------------- | ---------------------------------- | ------------------ | -------------- |
|AllergyIntolerance.clinicalStatus| このアレルギー・不耐性の臨床的なステータス。 | Required          | active, inactive, resolved </br> http://hl7.org/fhir/ValueSet/allergyintolerance-clinical |
|AllergyIntolerance.verificationStatus| 特定された物質（医薬品を含む）に対する反応の傾向や潜在的なリスクに関連する確実性。 | Required | unconfirmed, confirmed, refuted, entered-in-error </br> http://hl7.org/fhir/ValueSet/allergyintolerance-verification |
|AllergyIntolerance.type| 副作用リスクの原因にある生理学的メカニズムの種類 | Required | allergy, intolerance </br> http://hl7.org/fhir/ValueSet/allergy-intolerance-type |
|AllergyIntolerance.category| 特定された原因物質のカテゴリ | Required |  jp_food, jp_medication, jp_environment_others </br> http://jpfhir.jp/fhir/CodeSystem/*** (予定)| 
|AllergyIntolerance.criticality| 特定されたアレルギー物質に対する反応の、潜在的な臨床的危害または深刻さの推定 | Required | low, high, unable-to-assess </br> http://hl7.org/fhir/ValueSet/allergy-intolerance-criticality |
|AllergyIntolerance.code| アレルゲンのコード | Example | <a href="https://docs.google.com/spreadsheets/d/1BhL5XbaxycmGLRHzh-kdTvOrdPJ8-SZPOYvrOiL1pLE/edit#gid=1994452004" target="_blank"> JPCoreアレルギー用語（JFAGY） </a> </br> http://jpfhir.jp/fhir/CodeSystem/*** (予定)|
|AllergyIntolerance.reaction.substance| アレルギー不耐症の原因と考えられた特定の物質（医薬品を含む）の識別情報 | Example | 未定 | 
|AllergyIntolerance.reaction.manifestation| 有害事象イベントにおいて観測される、または関連する臨床症状および/または兆候 |Example | 未定 |
|AllergyIntolerance.reaction.severity|有害事象イベントの重症度の臨床評価 | Required | mild, moderate, seevere </br> http://hl7.org/fhir/ValueSet/reaction-event-severity |
|AllergyIntolerance.reaction.exposureRoute| 被験者が物質にさらされた経路の説明 | Example | 未定 <a href="https://docs.google.com/spreadsheets/d/1ry7_dtM4CS_dh6BC7AGRUPm8SKrswnkBfuh8uu1MspQ/edit#gid=0" target="_blank"> （参考用：SNOMEDの和訳） </a> </br> http://jpfhir.jp/fhir/CodeSystem/*** (予定)　 |

### 制約一覧

- 制約はない

## 利用方法

### インタラクション一覧

| コンフォーマンス | インタラクション                            |
| ---------------- | ------------------------------------------- |
| SHALL（必須）    | search-type、read                        |
| SHOULD（推奨）   | vread、history-instance                  |
| MAY（利用可能）  | create、update、patch、delete、history-type |

### OperationおよびSearch Parameter 一覧

#### Search Parameter一覧

| コンフォーマンス | パラメータ    | 型     | 例                                                           |
| ---------------- | ------------- | ------ | ------------------------------------------------------------ |
| SHALL            | patient    | reference  | GET [base]/AllergyIntolerance?patient=123456 |
| SHALL            | patient,date | reference,date | GET [base]/AllergyIntolerance?patient=123456&date=ge2021-08-24 |
| SHOULD           | patient,clinicalstatus | reference,code | GET [base]/AllergyIntolerance?patient=123456&clinicalstatus=active |
| SHOULD           | patient,verificationstatus | reference,code | GET [base]/AllergyIntolerance?patient=123456&verificationstatus=confirmed |
| SHOULD           | patient,type | reference,code | GET [base]/AllergyIntolerance?patient=123456&type=allergy |
| SHOULD           | patient,category | reference,code | GET [base]/AllergyIntolerance?patient=123456&category=jp_food |
| SHOULD           | patient,criticality | reference,code | GET [base]/AllergyIntolerance?patient=123456&criticality=high |

##### 必須検索パラメータ

本プロファイルに準拠するためには、以下の検索パラメータをサポートしなければならない（SHALL）。

1. 検索パラメータpatientを指定し、該当するすべてのAllergyIntoleranceを検索。

   http
   GET [base]/AllergyIntolerance?patient={Type/}[id]

   
   例：

   http
   GET [base]/AllergyIntolerance?patient=123456
   

   指定された患者のすべてのAllergyIntoleranceを含むBundleを返却する。

2. 検索パラメータpatientとdateの組みを指定し、該当するすべてのAllergyIntoleranceを検索。

  * dateに対する次の比較演算子のサポートを含む: gt,lt,ge,le
  * AND検索のオプションのサポートを含む (例えば.date=[date]&date=[date]]&...)
    http
    GET [base]/AllergyIntolerance?patient={Type/}[id]&date={gt|lt|ge|le}[date]{&date={gt|lt|ge|le}[date]&...}
    

    例：

    http
    GET [base]/AllergyIntolerance?patinet=123456&date=ge2021-08-24
    

    指定された患者および日付のすべてのAllergyIntoleranceを含むBundleを返却する。


##### 推奨検索パラメータ

本プロファイルに準拠するためには、以下の検索パラメータをサポートすることが推奨（SHOULD）される。

1. 検索パラメータpatientとclinicalstatusの組みを指定し、該当するすべてのAllergyIntoleranceを検索。
  * OR検索のサポートを含む(例えば clinicalstatus={system|}[code],{system|}[code],...)

    http
    GET [base]/AllergyIntolerance?patient={Type/}[id]&clinicalstatus={system|}[code]{,{system|}[code],...}
    

    例：

    http
    GET [base]/AllergyIntolerance?patient=123456&clinicalstatus=active
    

    http
    GET [base]/AllergyIntolerance?patient=123456&clinicalstatus=http://hl7.org/fhir/ValueSet/allergyintoleranceclinical|active
    

    指定された患者およびステータスのすべてのAllergyIntoleranceを含むBundleを返却する。

2. 検索パラメータpatientとverificationstatus組みを指定し、該当するすべてのAllergyIntoleranceを検索。
  * OR検索のサポートを含む(例えば verificationstatus={system|}[code],{system|}[code],...)

    http
    GET [base]/AllergyIntolerance?patient={Type/}[id]&verificationstatus={system|}[code]{,{system|}[code],...}
    

    例：

    http
    GET [base]/AllergyIntolerance?patient=123456&verificationstatus=confirmed
    

    http
    GET [base]/AllergyIntolerance?patient=123456&verificationstatus=http://hl7.org/fhir/ValueSet/allergyintoleranceverification|confirmed
    

    指定された患者およびステータスのすべてのAllergyIntoleranceを含むBundleを返却する。

3. 検索パラメータpatientとtype組みを指定し、該当するすべてのAllergyIntoleranceを検索。
  * OR検索のサポートを含む(例えば type={system|}[code],{system|}[code],...)

    http
    GET [base]/AllergyIntolerance?patient={Type/}[id]&type={system|}[code]{,{system|}[code],...}
    

    例：

    http
    GET [base]/AllergyIntolerance?patient=123456&type=allergy
    

    http
    GET [base]/AllergyIntolerance?patient=123456&category=http://hl7.org/fhir/ValueSet/allergy-intolerance-type|allergy
    

    指定された患者およびステータスのすべてのAllergyIntoleranceを含むBundleを返却する。

4. 検索パラメータpatientとcategory組みを指定し、該当するすべてのAllergyIntoleranceを検索。
  * OR検索のサポートを含む(例えば category={system|}[code],{system|}[code],...)

    http
    GET [base]/AllergyIntolerance?patient={Type/}[id]&category={system|}[code]{,{system|}[code],...}
    

    例：

    http
    GET [base]/AllergyIntolerance?patient=123456&category=jp_food
    

    http
    GET [base]/AllergyIntolerance?patient=123456&category=http://jpfhir.jp/fhir/CodeSystem/***|jp_food
    

    指定された患者およびステータスのすべてのAllergyIntoleranceを含むBundleを返却する。

5. 検索パラメータpatientとcriticality組みを指定し、該当するすべてのAllergyIntoleranceを検索。
  * OR検索のサポートを含む(例えば criticality={system|}[code],{system|}[code],...)

    http
    GET [base]/AllergyIntolerance?patient={Type/}[id]&criticality={system|}[code]{,{system|}[code],...}
    

    例：

    http
    GET [base]/AllergyIntolerance?patient=123456&criticality=high
    

    http
    GET [base]/AllergyIntolerance?patient=123456&criticality=http://hl7.org/fhir/ValueSet/allergy-intolerance-criticality|high
    

    指定された患者およびステータスのすべてのAllergyIntoleranceを含むBundleを返却する。

##### オプション検索パラメータ 

- オプション検索パラメータはない

#### Operation一覧

- Operation一覧はない

## 注意事項

- 未定

## その他、参考文献・リンク等

- 未定



