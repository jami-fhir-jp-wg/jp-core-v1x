#### 検索パラメータ

検索パラメータの一覧である。[共通の検索パラメータ](https://hl7.org/fhir/R4/search.html#all)も利用される。

| コンフォーマンス | パラメータ | 型 | 説明 | 表現型 |
| --- | --- | --- | --- | --- |
| MAY | based-on | reference | オーダ情報への参照 | DiagnosticReport.basedOn ([CarePlan](https://www.hl7.org/fhir/R4/careplan.html), [MedicationRequet][JP_MedicationRequest], [NutritionOrder](https://www.hl7.org/fhir/R4/nutritionorder.html), [ServiceRequest](https://hl7.org/fhir/R4/servicerequest.html), [ImuunizationRecommendation](https://www.hl7.org/fhir/R4/immunizationrecommendation.html) |
| MAY | category | token | レポート種別 | DiagnosticReport.category ([ValueSet](https://hl7.org/fhir/R4/valueset-diagnostic-service-sections.html)) |
| MAY | code | token | レポート全体を示すコード | DiagnosticReport.code |
| MAY | conclusion | token | コード化されたレポートの conclusion (interpretation/impression) | DiagnosticReport.conclusionCode |
| MAY | date | date | レポート作成日 | DiagnosticReport.effectiveDate |
| MAY | encounter | reference | オーダが発行された際の Encounter | DiagnosticReport.encounter ([Encounter][JP_Encounter]) |
| SHALL | identifier | token | レポートの identifier（識別子） | DiagnosticReport.identifier |
| SHOULD | issued | date | レポート発行日（確定日） | DiagnosticReport.issued |
| MAY | media | reference | 画像への参照 | DiagnosticReport.media.link ([Media](https://www.hl7.org/fhir/R4/media.html)) |
| SHOULD | patient | reference | レポートの対象患者 | DiagnosticReport.subject.where(resolve() is Patient) ([Patient][JP_Patient]) |
| SHOULD | performer | reference | レポート確定者 | DiagnosticReport.performer ([Practitioner][JP_Practitioner]) |
| MAY | result | reference | 関連する検査結果 (検体検査結果など) | DiagnosticReport.result ([Observation][JP_Observation_LabResult])|
| MAY | results-interpreter | reference | レポートの記述者 | DiagnosticReport.resultsInterpreter ([Practitioner][JP_Practitioner]) |
| MAY | specimen | reference | specimenの詳細 | DiagnosticReport.Specimen ([specimen](https://www.hl7.org/fhir/R4/specimen.html))|
| SHOULD | status | token | レポートの状態 | DiagnosticReport.status |

#### 必須検索パラメータ

次の検索パラメータは必須でサポートされなければならない。

1. identifier 検索パラメータを使用して、オーダIDなどの識別子によるDiagnosticReportの検索をサポートしなければならない（**SHALL**）

   ```
   GET [base]/DiagnosticReport?identifier={system|}[code]
   ```

   例：

   ```
   GET [base]/DiagnosticReport?identifier=http://myhospital.com/fhir/diagnosticreport-id-system|1234567890
   ```

   指定された識別子に一致するDiagnosticReportリソースを含むBundleを検索する。
## 利用方法

各ユースケースのプロファイルを参照のこと。

{% include markdown-link-references.md %}