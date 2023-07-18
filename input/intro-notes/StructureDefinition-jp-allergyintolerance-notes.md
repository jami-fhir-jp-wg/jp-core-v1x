### 必須要素

本プロファイルに準拠するためには、次の項目の値が存在しなければならない。

- patient : 本リソースを所有する患者

### Extensions定義

 本プロファイルで追加定義された拡張はない。

## 利用方法

### OperationおよびSearch Parameter 一覧

#### Search Parameter一覧

| コンフォーマンス | パラメータ    | 型     | 例                                                           |
| ---------------- | ------------- | ------ | ------------------------------------------------------------ |
| SHALL            | identifier    | token      | GET [base]/AllergyIntolerance?identifier=http://myhospital.com/fhir/allergyintolerance\|123 |
| SHOULD           | patient       | reference  | GET [base]/AllergyIntolerance?patient=Patient/123 |
| MAY              | patient,date  | reference,date | GET [base]/AllergyIntolerance?patient=Patient/123&date=ge2021-08-24 |
| MAY              | patient,clinicalstatus | reference,code | GET [base]/AllergyIntolerance?patient=Patient/123&clinicalstatus=active |
| MAY              | patient,verificationstatus | reference,code | GET [base]/AllergyIntolerance?patient=Patient/123&verificationstatus=confirmed |
| MAY              | patient,type | reference,code | GET [base]/AllergyIntolerance?patient=Patient/123&type=allergy |
| MAY              | patient,category | reference,code | GET [base]/AllergyIntolerance?patient=Patient/123&category=food |
| MAY              | patient,criticality | reference,code | GET [base]/AllergyIntolerance?patient=Patient/123&criticality=high |

##### 必須検索パラメータ

本プロファイルに準拠するためには、以下の検索パラメータをサポートしなければならない（**SHALL**）

1. 検索パラメータidentifierを指定し、レコードIDなどの識別子によりAllergyIntoleranceを検索

   ```
   GET [base]/AllergyIntolerance?identifier={system|}[code]
   ```
   例：
   ```
   GET [base]/AllergyIntolerance?identifier=http://myhospital.com/fhir/allergyintolerance|123
   ```

   指定された識別子に一致するAllergyIntoleranceリソースを含むBundleを検索する。

##### 推奨検索パラメータ

本プロファイルに準拠するためには、以下の検索パラメータをサポートすることが推奨される（SHOULD）

1. 検索パラメータpatientを指定し、該当するすべてのAllergyIntoleranceを検索

   ```
   GET [base]/AllergyIntolerance?patient={reference}
   ```
   例：
   ```
   GET [base]/AllergyIntolerance?patient=Patient/123
   ```

   指定された患者のすべてのAllergyIntoleranceを含むBundleを返却する。

##### 追加検索パラメータ

オプションとして次の検索パラメータをサポートすることができる（MAY）

1. 検索パラメータpatientとdateの組みを指定し、該当するすべてのAllergyIntoleranceを検索

    * dateに対する次の比較演算子のサポートを含む: gt,lt,ge,le
    * AND検索のオプションのサポートを含む (例えば.date=[date]&date=[date]]&...)
    
    ```
    GET [base]/AllergyIntolerance?patient={reference}&date={gt|lt|ge|le}[date]{&date={gt|lt|ge|le}[date]&...}
    ```
    例：
    ```
    GET [base]/AllergyIntolerance?patient=Patient/123&date=ge2021-08-24
    ```
    
    指定された患者および日付のすべてのAllergyIntoleranceを含むBundleを返却する。

2. 検索パラメータpatientとclinicalstatusの組みを指定し、該当するすべてのAllergyIntoleranceを検索

    * OR検索のサポートを含む(例えば clinicalstatus={system\|}[code],{system\|}[code],...)
    
    ```
    GET [base]/AllergyIntolerance?patient={reference}&clinicalstatus={system|}[code]{,{system|}[code],...}
    ```
    例：
    ```
    GET [base]/AllergyIntolerance?patient=Patient/123&clinicalstatus=active
    ```
    ```
    GET [base]/AllergyIntolerance?patient=Patient/123&clinicalstatus=http://hl7.org/fhir/ValueSet/allergyintoleranceclinical|active
    ```
    
    指定された患者およびステータスのすべてのAllergyIntoleranceを含むBundleを返却する。

3. 検索パラメータpatientとverificationstatus組みを指定し、該当するすべてのAllergyIntoleranceを検索

    * OR検索のサポートを含む(例えば verificationstatus={system\|}[code],{system\|}[code],...)
    
    ```
    GET [base]/AllergyIntolerance?patient={reference}&verificationstatus={system|}[code]{,{system|}[code],...}
    ```
    例：
    ```
    GET [base]/AllergyIntolerance?patient=Patient/123&verificationstatus=confirmed
    ```
    ```
    GET [base]/AllergyIntolerance?patient=Patient/123&verificationstatus=http://hl7.org/fhir/ValueSet/allergyintoleranceverification|confirmed
    ```
    
    指定された患者およびステータスのすべてのAllergyIntoleranceを含むBundleを返却する。

4. 検索パラメータpatientとtype組みを指定し、該当するすべてのAllergyIntoleranceを検索

    * OR検索のサポートを含む(例えば type={system\|}[code],{system\|}[code],...)
    
    ```
    GET [base]/AllergyIntolerance?patient={reference}&type={system|}[code]{,{system|}[code],...}
    ```
    例：
    ```
    GET [base]/AllergyIntolerance?patient=Patient/123&type=allergy
    ```
    ```
    GET [base]/AllergyIntolerance?patient=Patient/123&category=http://hl7.org/fhir/ValueSet/allergy-intolerance-type|allergy
    ```
    
    指定された患者およびステータスのすべてのAllergyIntoleranceを含むBundleを返却する。

5. 検索パラメータpatientとcategory組みを指定し、該当するすべてのAllergyIntoleranceを検索

    * OR検索のサポートを含む(例えば category={system\|}[code],{system\|}[code],...)
    
    ```
    GET [base]/AllergyIntolerance?patient={reference}&category={system|}[code]{,{system|}[code],...}
    ```
    例：
    ```
    GET [base]/AllergyIntolerance?patient=Patient/123&category=food
    ```
    ```
    GET [base]/AllergyIntolerance?patient=Patient/123&category=http://hl7.org/fhir/ValueSet/condition-category|food
    ``` 
  
  指定された患者およびステータスのすべてのAllergyIntoleranceを含むBundleを返却する。

1. 検索パラメータpatientとcriticality組みを指定し、該当するすべてのAllergyIntoleranceを検索

    * OR検索のサポートを含む(例えば criticality={system\|}[code],{system\|}[code],...)
    
      ```
      GET [base]/AllergyIntolerance?patient={reference}&criticality={system|}[code]{,{system|}[code],...}
      ```
      例：
      ```
      GET [base]/AllergyIntolerance?patient=Patient/123&&criticality=high
      ```
      ```
      GET [base]/AllergyIntolerance?patient=Patient/123&criticality=http://hl7.org/fhir/ValueSet/allergy-intolerance-criticality|high
      ```
      
      指定された患者およびステータスのすべてのAllergyIntoleranceを含むBundleを返却する。

##### オプション検索パラメータ 

 本プロファイルで追加定義されたオプション検索パラメータはない。

#### サンプル

* [**食物アレルギー（小麦）**][jp-allergyintolerance-example-1]

## 注意事項

- 例えば、患者に「既知のアレルギー・なし」が記録されている状態で、新規に「カニアレルギー・あり」の記録を追加する際には「既知のアレルギー・なし」の記録を削除すべきである。同様に、患者に「カニアレルギー・あり」が記録されている状態で「既知のアレルギー・なし」を記録しようとした際には、システムはこの矛盾を検出するべきである。
- アレルギーの否定を表現する方法について。本プロファイルが継承するプロファイル（AllergyIntolerance R4.0.1）では「既知のアレルギー・なし」を表現するために、No known allergy（SNOMED-CT:716186003）等を用いることが例示されている。一方で、本プロファイルの要素であるcodeのバインド先として例示するJP Core AllergyIntolerance Value Setには「既知のアレルギー・なし」等に相当する表現がない。そのため、本プロファイルを継承するプロファイルが、JP Core AllergyIntolerance Value Setを利用する場合には、否定されたアレルギーを表現するために、アレルギーの有無を区別する要素を追加するなどの措置を取ることを想定している。なお、本プロファイルはこのValue Setの利用を要求・推奨するものではないため、他のValue Setを使う選択肢もある。
- いずれについても詳細は、[Negated Allergies and Intolerances](https://hl7.org/fhir/R4/allergyintolerance.html#9.1.3.3)を参照のこと。
{% include markdown-link-references.md %}