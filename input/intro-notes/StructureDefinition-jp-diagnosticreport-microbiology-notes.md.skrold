### 必須要素
本プロファイルでは、次の要素を持たなければならない。

 - status : 診断レポートのステータスは必須である。http://hl7.org/fhir/diagnostic-report-status　よりひとつを選択する。final：完成レポート、cancelled：取り消しレポート、partial：部分作成レポート（不完全）など。
 - category : レポートを作成した臨床分野、部門、または診断サービスを分類するコード。LP7819-8 "微生物検査" 固定、必須。
 - code : レポート種別コード。system："http://jpfhir.jp/fhir/core/CodeSystem/JP_DocumentCodes_CS"　code: "18725-2" 　display: "微生物学的検査報告書" 　固定、必須。

### Extensions定義
 本プロファイルで追加定義された拡張はない。

### 制約一覧
本プロファイルでは、以下の制約を満たさなければならない。

|id|レベル|位置|説明|式|
|---|---|---|---|---|
|1|Warning|DiagnosticReport.result.reference|微生物検査の場合（categoryが'Microbiology'）.referenceが存在する必要がある。|DiagnosticReport.category.code='MB' implies DiagnosticReport.result.reference.exists()|

## 利用方法

### OperationおよびSearch Parameter 一覧

#### Search Parameter一覧

微生物学的検査結果ユースケースのSearch Parameter一覧は共通情報プロファイルとは異なり以下の通りである。

| コンフォーマンス | パラメータ | 型 | 説明 | 表現型 |　例　|
| --- | --- | --- | --- | --- | --- |
| SHALL | identifier | token  | レポートに割り当てられた識別子 | DiagnosticReport.identifier | GET [base]/DiagnosticReport?identifier=http://myhospital.com/fhir/diagnosticreport-id-system\|1234567890 |
| MAY | based-on | reference | オーダ情報への参照 | DiagnosticReport.basedOn ([ServiceRequest](https://hl7.org/fhir/R4/servicerequest.html)) | GET [base]/DiagnosticReport?based-on=ServiceRequest/12345 |
| SHOULD | category | token | レポート種別 | DiagnosticReport.category ([JP Core DiagnosticReport Category ValueSet][JP_DiagnosticReportCategory_VS]) (デフォルト：[LP7819-8](https://loinc.org/LP7819-8/)) | GET [base]/DiagnosticReport?category=LP7819-8 |
| SHOULD | date | date | レポート作成日 | DiagnosticReport.effectiveDate | GET [base]/DiagnosticReport?date=le2020-12-31 |
| SHOULD | patient | reference | レポートの対象患者 | DiagnosticReport.subject.where(resolve() is Patient) ([Patient][JP_Patient]) | GET [base]/DiagnosticReport?patient=123 |

### サンプル

* [**一般細菌検査レポート**][jp-diagnosticreport-microbiology-example-1]


## 注意事項
### 微生物検査結果　培養・同定と感受性のネスト構造

次のDiagnosticReportリソースの例は、関連するObservationを使用して、1レベルと2レベルのネストされた菌および感受性パネルを備えた培養・同定結果と感受性結果の例を示す。

<!-- ![](intoronotes-resources/observation_microbiology_structure.PNG) -->
<img src="intoronotes-resources/observation_microbiology_structure.PNG" width="100%" alt="培養・同定と感受性のネスト構造"/>

## その他、参考文献・リンク等

1. 厚生労働省院内感染対策サーベイランス事業 [(https://janis.mhlw.go.jp/)](https://janis.mhlw.go.jp/)
1. FHIR BaseのDiagnosticReportサンプル(Micro Isolate and Sensitivities) [DiagnosticReport-Examples#Micro Isolate and Sensitivities](https://hl7.org/fhir/R4/diagnosticreport-examples.html#10.3.7.1.1)


{% include markdown-link-references.md %}
