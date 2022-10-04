### 必須要素

本プロファイルに準拠するためには、次の項目の値が存在しなければならない。

- subject : 本リソースを所有する患者

### Extensions定義

 本プロファイルで追加定義された拡張はない。

## 利用方法

### OperationおよびSearch Parameter 一覧

#### Search Parameter一覧

| コンフォーマンス    | パラメータ                   | 型         | 例                                                                                 |
| ---------------- | -------------------------- |  --------- | ---------------------------------------------------------------------------------- |
| SHALL            | identifier                 | token      | GET [base]/Condition?identifier=http://myhospital.com/fhir/condition\|123 |
| SHOULD           | patient                    | reference  | GET [base]/Condition?patient=Patient/123                                        |
| MAY              | patient,onset-date         | reference,date | GET [base]/Condition?patient=Patient/123&onset-date=ge2021-08-24             |
| MAY              | patient,clinical-status     | reference,code | GET [base]/Condition?patient=Patient/123&clinical-status=active              |
| MAY              | patient,verificationstatus | reference,code | GET [base]/Condition?patient=Patient/123&verificationstatus=confirmed       |
| MAY              | patient,category           | reference,code | GET [base]/Condition??patient=Patient/123&category=food                  |

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

1. 検索パラメータpatientとdateを指定し、該当するすべてのConditionを検索

      * dateに対する次の比較演算子のサポートを含む: gt,lt,ge,le
      * AND検索のオプションのサポートを含む (例えば.date=[date]&date=[date]]&...)
      
      ```
      GET [base]/Condition?patient={reference}&date={gt|lt|ge|le}[date]{&date={gt|lt|ge|le}[date]&...}
      ```
      例：
      ```
      GET [base]/Condition?patient=Patient/123&date=ge2021-08-24
      ```
   
      指定された患者および日付のすべてのConditionを含むBundleを検索する。

2. 検索パラメータpatientとclinicalstatusを指定し、該当するすべてのConditionを検索

      * OR検索のサポートを含む(例えば clinicalstatus={system\|}[code],{system\|}[code],...)
      
      ```
      GET [base]/Condition?patient={reference}&clinicalstatus={system|}[code]{,{system|}[code],...}
      ```
      例：
      ```
      GET [base]/Condition?patient=Patient/123&clinicalstatus=active
      ```
      ```
      GET [base]/Condition?patient=Patient/123&clinicalstatus=http://hl7.org/fhir/ValueSet/condition-clinical|active
      ```
   
      指定された患者およびステータスのすべてのConditionを含むBundleを検索する。

3. 検索パラメータpatientとverificationstatusを指定し、該当するすべてのConditionを検索

      * OR検索のサポートを含む(例えば verificationstatus={system\|}[code],{system\|}[code],...)
      
      ```
      GET [base]/Condition?patient={reference}&verificationstatus={system|}[code]{,{system|}[code],...}
      ```
      例：
      ```
      GET [base]/Condition?patient=Patient/123&verificationstatus=confirmed
      ```
      ```
      GET [base]/Condition?patient=Patient/123&verificationstatus=http://hl7.org/fhir/ValueSet/condition-ver-status|confirmed
      ```
   
      指定された患者およびステータスのすべてのConditionを含むBundleを検索する。

4. 検索パラメータpatientとcategoryを指定し、該当するすべてのConditionを検索

      * OR検索のサポートを含む(例えば category={system\|}[code],{system\|}[code],...)

      ```
      GET [base]/Condition?patient={reference}&category={system|}[code]{,{system|}[code],...}
      ```  
      例：
      ```
      GET [base]/Condition?patient=Patient/123&category=claim-diagnosis
      ``` 
      ```
      GET [base]/Condition?patient=Patient/123&category=http://hl7.org/fhir/ValueSet/condition-category|claim-diagnosis
      ``` 

      指定された患者およびステータスのすべてのConditionを含むBundleを検索する。

##### オプション検索パラメータ 

 本プロファイルで追加定義されたオプション検索パラメータはない。

#### サンプル

* [**病名（直腸癌）**][jp-condition-example-1]

## 注意事項

- Condition.codeについての補足。現時点では、患者の状態を包括的に含む適当な日本語用語集がないと考え、基底のValue Setを継承するにとどめている。そのため、本プロファイルを継承するプロファイルがその用途に応じて、MEDIS標準病名マスタやICD-11などをCode SystemとするValue Setを独自に設定することを想定している。

## その他、参考文献・リンク等

1. HL70421 Severity of Illness Code ... JAHIS データ交換規約（共通編）Ver1.3 p.119 [https://www.jahis.jp/files/user/04_JAHIS%20standard/22-003_JAHIS%20データ交換規約（共通編）Ver.1.3.pdf](https://www.jahis.jp/files/user/04_JAHIS%20standard/22-003_JAHIS%20データ交換規約（共通編）Ver.1.3.pdf)

{% include markdown-link-references.md %}