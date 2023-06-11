### 必須要素
本プロファイルでは、次の要素を持たなければならない。

 - status : 検体検査情報項目の状態は必須である
 - category : レポートを作成した臨床分野、部門、または診断サービスを分類するコード。LP7819-8 "微生物検査" 固定
 - code : このリソースは何の検体検査情報項目であるかを示すため必須である

### Extensions定義
 本プロファイルで追加定義された拡張はない。

## 利用方法

### OperationおよびSearch Parameter 一覧

#### Search Parameter一覧

微生物学的検査結果ユースケースのSearch Parameter一覧は共通情報プロファイルとは異なり以下の通りである。

| コンフォーマンス | パラメータ | 型 | 説明 | 表現型 |　例　|
| --- | --- | --- | --- | --- | --- |
| SHALL | identifier | token  | レポートに割り当てられた識別子 | DiagnosticReport.identifier | GET [base]/DiagnosticReport?ET [base]/Patient?identifier=http://abc.hosptal\|123456 |
| MAY | based-on | reference | オーダ情報への参照 | DiagnosticReport.basedOn ([ServiceRequest](https://hl7.org/fhir/R4/servicerequest.html)) | `GET [base]/DiagnosticReport?based-on=ServiceRequest/12345` |
| SHOULD | category | token | レポート種別 | DiagnosticReport.category ([JP Core DiagnosticReport Category ValueSet][JP_DiagnosticReportCategory_VS]) (デフォルト：[LP7819-8](https://loinc.org/LP7819-8/)) | `GET [base]/DiagnosticReport?category=LP7819-8` |
| SHOULD | date | date | レポート作成日 | DiagnosticReport.effectiveDate |  |  |
| SHOULD | patient | reference | レポートの対象患者 | DiagnosticReport.subject.where(resolve() is Patient) ([Patient][JP_Patient]) | |

### サンプル

* [**一般細菌検査レポート**][jp-diagnosticreport-microbiology-example-1]


## 注意事項
### 微生物検査結果　培養・同定と感受性のネスト構造

次のDiagnosticReportリソースの例は、関連するObservationを使用して、1レベルと2レベルのネストされた菌および感受性パネルを備えた培養・同定結果と感受性結果の例を示す。
![](intoronotes-resources/observation_microbiology_structure.PNG)

## その他、参考文献・リンク等



{% include markdown-link-references.md %}
