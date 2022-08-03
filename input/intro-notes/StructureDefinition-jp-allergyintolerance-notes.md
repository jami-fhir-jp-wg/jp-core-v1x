### 必須要素

本プロファイルに準拠するためには、次の項目の値が存在しなければならない。

- patient : 本リソースを有する患者。

### Extensions定義

- Extensions定義はない。

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

- オプション検索パラメータはない。

#### Operation一覧

- Operation一覧はない。

## 注意事項

- Negated Allergies and Intolerances. [https://hl7.org/fhir/R4/allergyintolerance.html#9.1.3.3](https://hl7.org/fhir/R4/allergyintolerance.html#9.1.3.3)

## その他、参考文献・リンク等

- 特になし。



