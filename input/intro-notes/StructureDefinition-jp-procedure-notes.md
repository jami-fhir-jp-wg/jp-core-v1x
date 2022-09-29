### 必須要素 

本プロファイルに準拠するためには、次の項目の値が存在しなければならない。

- status : 処置のステータス
- subject : 処置が実施された対象の人

### Extensions定義

 本プロファイルで追加定義された拡張はない。

## 利用方法

### OperationおよびSearch Parameter 一覧

#### Search Parameter一覧

| コンフォーマンス    | パラメータ     | 型      | 例                                                           |
| ---------------- | ------------- | ------ | ------------------------------------------------------------ |
| SHALL            | identifier    | token          | GET [base]/Procedure?identifier=http://myhospital.com/fhir/procedure\|123 |
| SHOULD           | patient       | reference      | GET [base]/Procedure?patient=123 |
| MAY              | patient,date  | reference,date | GET [base]/Procedure?patient=123&date=ge2021-08-24 |

##### 必須検索パラメータ

本プロファイルに準拠するためには、以下の検索パラメータをサポートしなければならない（SHALL）

1. 検索パラメータidentifierを指定し、レコードIDなどの識別子によりProcedureを検索

   ```
   GET [base]/Procedure?identifier={system|}[code]
   ```
   例：
   ```
   GET [base]/Procedure?identifier=http://myhospital.com/fhir/procedure|123
   ```
   
   指定された識別子に一致するProcedureリソースを含むBundleを検索する。

##### 推奨検索パラメータ

本プロファイルに準拠するためには、以下の検索パラメータをサポートすることが推奨される（**SHOULD**）

1. 検索パラメータpatientとdateを指定し、該当するすべてのProcedureを検索

      * dateに対する次の比較演算子のサポートを含む: gt,lt,ge,le
      * AND検索のオプションのサポートを含む (例えば.date=[date]&date=[date]]&...)
      
      ```
      GET [base]/Procedure?patient={reference}&date={gt|lt|ge|le}[date]{&date={gt|lt|ge|le}[date]&...}
      ```
      例：
      ```
      GET [base]/Procedure?patient=Patient/123&date=ge2021-08-24
      ```

      指定された患者および日付のすべてのProcedureを含むBundleを検索する。

##### 追加検索パラメータ

オプションとして次の検索パラメータをサポートすることができる（MAY）

1. 検索パラメータpatientとstatusを指定し、該当するすべてのProcedureを検索

      * OR検索のサポートを含む(例えば status={system\|}[code],{system\|}[code],...)

      ```
      GET [base]/Procedure?patient={reference}&status={system|}[code]{,{system|}[code],...}
      ```
      例：
      ```
      GET [base]/Procedure?patient=Patient/123&status=completed
      ```
   
      指定された患者およびステータスのすべてのProcedureを含むBundleを検索する。

2. 検索パラメータpatientとcodeとdateを指定し、該当するすべてのProcedureを検索

      * OR検索のオプションのサポートを含む (例えば code={system\|}[code],{system\|}[code],...)
      * dateに対する次の比較演算子のサポートを含む:gt,lt,ge,le
      * AND検索のオプションのサポートを含む (例えばdate=[date]&date=[date]]&...)

      ```
      GET [base]/Procedure?patient={reference}&code={system|}[code]{,{system|}[code],...}&date={gt|lt|ge|le}[date]{&date={gt|lt|ge|le}[date]&...}
      ```
      例：
      ```
      GET [base]/Procedure?patient=Patient/123&date=ge2019-01-14T00:00:00Z&code=http://jpfhir.jp/fhir/core/ValueSet/JP_ProcedureCodesMedical_VS|140000610
      ```
   
      指定された患者および日付およびプロシージャコードのすべてのProcedureを含むBundleを検索する。

##### オプション検索パラメータ 

 本プロファイルで追加定義されたオプション検索パラメータはない。

#### サンプル

* [**処置（抜糸）**][jp-procedure-example-1]

## その他、参考文献・リンク等

1. ICHI(International Classification of Health Interventions) [https://icd.who.int/dev11/l-ichi/en](https://icd.who.int/dev11/l-ichi/en)

{% include markdown-link-references.md %}