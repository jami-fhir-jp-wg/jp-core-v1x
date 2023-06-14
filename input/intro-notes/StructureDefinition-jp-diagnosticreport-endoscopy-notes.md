
### 必須要素

次のデータ項目は必須（**SHALL**）である。

- status : レポートの状態・進捗状況
- category : レポートを作成した臨床分野、部門、または診断サービスを分類するコード。"LP7796-8" Endoscopy 固定
- code : レポートの種別。SS-MIX2 拡張ストレージ構成の説明と構成ガイドライン Ver1.2h（本実装ガイドライン制定時の最新版） 「別紙：標準文書コード表」の標準コード（LOINCコード）から指定

  
### MustSupport

次の要素に関する情報が送信システムに存在する場合、その要素がサポートされなければならないことを意味する（**Must Support**）。

- basedOn : ServiceRequest（オーダを表すリソースへの参照）
- subject : 患者リソース（Patient）への参照。殆どの場合存在するが、緊急検査等で患者リソースが確定していない場合が想定される
- effectiveDateTime : レポート作成日時
- issued : レポート確定日時
- performer : 内視鏡検査を実施した医師
- resultInterpreter : レポートの確定者
- imagingStudy : レポートに添付されるキー画像の参照先（DICOMフォーマット）
- link : レポートに添付されるキー画像の参照先（非DICOMフォーマット）
- conclusion : 総合診断としての要約結論
- conclusionCode : 内視鏡診断レポートの要約結論を表すコード
- presentedForm : レポート本体（全体のイメージあるいは所見等のテキスト）


### Extensions定義

 本プロファイルで追加定義された拡張はない。

## 注意事項

### text

依頼情報や患者基本情報などを含むレポート全体のデータは、presentedForm要素に、base64で符号化されたバイナリデータとして格納される。
そのため、主にレポートの見読性と検索性の向上を目的に、DiagnosticReportのDomainResourceの1つであるtext要素に、所見を中心としたhuman-readableな[narrative](https://www.hl7.org/fhir/R4/narrative.html)データを格納することを推奨する。
(レポートの詳細はpresentedForm要素に格納されるレポート本体での確認を前提とする)

### category

[JP Core Diagnostic Report Category ValueSet][JP_DiagnosticReportCategory_VS]の中から"Endoscopy"を表すLOINC Part Codeである`LP7796-8`を指定する。

### code

[JP Core Document Codes Endoscopy ValueSet][JP_DocumentCodes_Endoscopy_VS] の中から適切な内視鏡分野の報告書のコードを指定する。より粒度の細かい報告書のコードを選ぶこと。
 - 例：上部消化管内視鏡報告書：`18751-8`

該当する適切な報告書コードが登録されていない場合は、"内視鏡検査報告書"を表す`19805-1`を指定する。

### conclusionCode

消化器内視鏡においては、[日本消化器内視鏡学会](https://www.jges.net/)が推進する[JED (Japan Endoscopy Database) Project](https://jedproject.jges.net/)で定義されている[JED用語](https://jedproject.jges.net/about/terms-about/)のコード値を設定することを強く推奨する。[JP Core Conclusion Code JED ValueSet][JP_ConclusionCodesJed_VS]として参照する。


### 時間の指定

このプロファイルのリソースでは、effective[x]エレメントにはレポート作成時間を[dateTime](https://www.hl7.org/fhir/R4/datatypes.html#dateTime)で格納する。


### 参照画像

レポートに添付されるキー画像が、DICOMフォーマットの場合は[JP Core ImagingStudy Endoscopy Profile][JP_ImagingStudy_Endoscopy]リソースから参照し、非DICOMフォーマットの場合media要素のlinkから参照する。

## 利用方法

### OperationおよびSearch Parameter一覧

#### Search Parameter一覧

本プロファイルで再定義された検索パラメータの一覧である。[DiagnosticReport共通の検索パラメータ][JP_DiagnosticReport_Common]が利用されるが、重複するものについては以下の定義に従うこと。

| コンフォーマンス | パラメータ | 型 | 説明 | 表現型 |　例　|
| --- | --- | --- | --- | --- | --- |
| MAY | based-on | reference | オーダ情報への参照 | DiagnosticReport.basedOn ([ServiceRequest](https://hl7.org/fhir/R4/servicerequest.html)) | GET [base]/DiagnosticReport?based-on=ServiceRequest/12345 |
| SHOULD | category | token | レポート種別 | DiagnosticReport.category ([JP Core DiagnosticReport Category ValueSet][JP_DiagnosticReportCategory_VS]) (デフォルト：[LP7796-8](https://loinc.org/LP7796-8/)) | GET [base]/DiagnosticReport?category=LP7796-8 |
| SHOULD | code | token | レポート全体を示すコード | DiagnosticReport.code ([JP Core DocumentCodes Endoscopy ValueSet][JP_DocumentCodes_Endoscopy_VS])  | GET [base]/DiagnosticReport?code=18751-8 |
| MAY | conclusionCode | token | 内視鏡診断レポートの要約結論 | DiagnosticReport.conclusionCode ([JP Core Conclusion Code JED ValueSet][JP_ConclusionCodesJed_VS])  | GET [base]/DiagnosticReport?conclusionCode=Z2B32104 |


なお、検索パラメータは複合的に利用できる。詳細は[Search - Chained parameters](https://www.hl7.org/fhir/R4/search.html#chaining)を参照すること。

　例：
```
GET [base]/DiagnosticReport?patient=123&category=LP7796-8
```

#### 操作詳細

##### 必須検索パラメータ

本プロファイルで必須（**SHALL**）として定義された検索項目はない。

##### オプション検索パラメータ

本プロファイルで追加定義されたオプション検索パラメータはない。
 
#### サンプル

* [**上部消化管検査レポート**][jp-diagnosticreport-endoscopy-example-1]

## その他、参考文献・リンク等

本プロファイルそのものの定義には影響しないが、presentedFormに格納するレポートのコンテンツを作成するレポーティングシステムにおいて、標準化に関する参考資料となる。
1. [JAHIS 診療文書構造化記述規約 共通編 Ver.2.0](https://www.jahis.jp/standard/detail/id=729)
2. [JAHIS 内視鏡検査レポート構造化記述規約 Ver.1.0](https://www.jahis.jp/standard/detail/id=824)

また、消化器内視鏡検査レポートについては、[日本消化器内視鏡学会](https://www.jges.net/)が推進する[JED (Japan Endoscopy Database) Project](https://jedproject.jges.net/)に準拠していることが強く推奨（**SHOULD**）される。

{% include markdown-link-references.md %}
{% include external-link-reference.md %}
