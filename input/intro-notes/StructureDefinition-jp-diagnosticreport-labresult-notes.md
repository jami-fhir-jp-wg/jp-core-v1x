### 必須要素
DiagnosticReportリソースは、次の要素を持たなければならない。

 - status︓検体検査情報項目の状態は必須である
 - code︓何の検体検査情報項目であるかを示すため必須である


### Extensions定義

 本プロファイルで追加定義された拡張はない。

<!--
## 注意事項
(全体に対する注意事項等、その他の部分について記載します。）## 
-->

## 利用方法

### OperationおよびSearch Parameter 一覧
#### Search Parameter一覧

| コンフォーマンス | パラメータ    | 型     | 例                                                           |
| ---------------- | ------------- | ------ | ------------------------------------------------------------ |
| SHOULD | patient,category | reference  | `GET [base]/DiagnosticReport?patient=123&category=LAB` |
| SHOULD | patient,category,based-on | reference,reference  | `GET [base]/DiagnosticReport?patient=123&category=LAB&based-on=ServiceRequest/456` |
| SHOULD | patient,category,date | reference,date  | `GET [base]/Observation?patient=123&category=LAB&date=le2020-12-31` |

##### 必須検索パラメータ

必須（**SHALL**）としての検索項目は定義しない。

##### 推奨検索パラメータ

次の検索パラメータはサポートすることが推奨される。（**SHOULD**）

1. 臨床での検索：subject = Patient（対象患者）、category(対象レポートカテゴリ)を指定した検索をサポートすることが望ましい。（**SHOULD**）


patient,categoryの各検索パラメータに一致するObservationリソースを含むBundleを取得することができる。

   ```
   GET [base]/DiagnosticReport?patient={reference}&category={token}
   ```

   例：

   ```
   GET [base]/DiagnosticReport?patient=123&category=LAB
   ```

2. 臨床での検索：subject = Patient（対象患者）、category(対象レポートカテゴリ)、based-on (検査オーダの依頼科)を指定した検索をサポートすることが望ましい。（**SHOULD**）

patient,category,based-onの各検索パラメータに一致するObservationリソースを含むBundleを取得することができる。

   ```
   GET [base]/DiagnosticReport?patient={reference}&category={token}&based-on={reference}
   ```

   例：

   ```
   GET [base]/DiagnosticReport?patient=123&category=LAB&based-on=ServiceRequest/456
   ```

3. 臨床での検索：subject = Patient（対象患者）、category(対象レポートカテゴリ)、date(レポート作成日)を指定した検索をサポートすることが望ましい。（**SHOULD**）


patient,category,dateの各検索パラメータに一致するObservationリソースを含むBundleを取得することができる。

   ```
   GET [base]/DiagnosticReport?patient={reference}&category={token}&date={date}
   ```

   例：

   ```
   GET [base]/DiagnosticReport?patient=123&category=LAB&date=2021-11-08
   ```

##### オプション検索パラメータ

 本プロファイルで追加定義されたオプション検索パラメータはない。

### サンプル

* [**検体検査レポート（血液）**][jp-diagnosticreport-labresult-example-1]

{% include markdown-link-references.md %}