病理診断レポート（JP Core DiagnosticReport Pathology Profile）の利用にあたっては、以下の点に注意すること。

## 必須要素と推奨事項

### MustSupport

このプロファイルでは、以下の要素がMustSupportとして定められている。

- basedOn : オーダ情報への参照
- category : レポートの分野（病理）を示すコード
- subject : 対象患者情報 
- effectiveDateTime : 診断レポートの作成日時
- issued : レポート確定日時
- performer : 病理診断を実施した医師
- resultsInterpreter : 診断レポートの確定者
- specimen : 検体情報への参照
- result : 病理診断による観察結果（診断、所見など）の情報
- imagingStudy : レポートに添付されるDICOM画像の参照先
- media.link : レポートに添付される非DICOM画像の参照先
- conclusion : 病理診断の要約結論
- conclusionCode : 病理診断レポートの要約結論を表すコード
- presentedForm : レポート本体（全体のイメージあるいは所見等のテキスト）

## 注意事項

### text

JP Core V1.2からは、診断、所見などの観察結果についてはDomainResourceのtext要素ではなく、原則としてresult要素が参照するObservationリソースに格納する方針に改めたので注意されたい。

従って、V1.2以降では、.text要素に記述した内容はレポートの内容に対する簡易的な表示には利用されるが、サーバ上での検索性は担保されない可能性を考慮して実装することを推奨する。
また、所見（findings）や診断の結果（diagnosis）は対応するObservationリソースに内容が保持されるので、全文検索等の目的で構造化された情報を利用する場合はこれらを参照すること。

<img src="observation_pathology_structure.png" width="100%" alt="病理診断レポートObservationの構造"/>

### category

病理分野のDiagnosticReportでは.category要素の第1コードは「LP29708-2」（Pathology）とすること。

### code

病理分野の診断レポートを分類するためのコードを設定する。JP_DocumentCodes_Pathology_VSから適切なコードを選択すること（例：「33717-0」（病理診断報告書））。

### specimen

病理診断においては検体情報が重要な要素となるため、specimen要素を使用して検体情報を関連付けることを強く推奨する。JP Core Specimenリソースを参照すること。

### result

病理診断による観察結果（診断、所見など）を記録するObservationリソースを参照する。JP Core Observation Pathologyプロファイルを適用したObservationリソースを使用すること。

病理診断では、以下のような階層構造での情報記録を推奨する：
- 最終診断
- 肉眼所見
- 組織所見
- 特殊染色所見
- 免疫組織化学所見

### imagingStudy

病理診断でDICOM形式の顕微鏡画像を使用する場合、JP Core ImagingStudy Pathologyプロファイルを適用したImagingStudyリソースを参照する。

### media

病理診断でDICOM以外の形式の画像を使用する場合、JP Core Media Pathologyプロファイルを適用したMediaリソースを参照する。

### 時間の指定

病理診断レポートにおいて時間に関連する要素は以下のとおりである：

- effectiveDateTime：病理診断を実施した日時
- issued：病理診断レポートが確定された日時

### 参照画像

ImagingStudyやmediaは多少オーバーラップするが、使用される目的が異なる。用途に応じて使い分けること。DiagnosticReportではDICOM画像への参照としてImagingStudyが利用され、キー画像としてmediaが参照される。

## 利用方法

### 必須検索パラメータ

病理診断レポートの検索で必須となるパラメータ：

| コンフォーマンス | パラメータ    | 型     | 説明                        | 表現型                             | 例                                                                    |
| --------------- | ------------ | ------ | --------------------------- | ---------------------------------- | -------------------------------------------------------------------- |
| SHALL           | identifier   | token  | レポートID                   | DiagnosticReport.identifier        | GET [base]/DiagnosticReport?identifier=12345                        |
| SHALL           | patient      | reference | 対象患者                     | DiagnosticReport.subject          | GET [base]/DiagnosticReport?patient=Patient/123                     |
| SHOULD          | category     | token  | レポート種別                  | DiagnosticReport.category         | GET [base]/DiagnosticReport?category=LP29708-2                      |
| SHOULD          | code         | token  | レポートを示すコード          | DiagnosticReport.code             | GET [base]/DiagnosticReport?code=33717-0                            |
| SHOULD          | date         | date   | レポート作成日                | DiagnosticReport.effectiveDateTime | GET [base]/DiagnosticReport?date=2025-08-14                         |
| SHOULD          | status       | token  | レポートのステータス          | DiagnosticReport.status           | GET [base]/DiagnosticReport?status=final                            |
| MAY             | specimen     | reference | 検体情報                     | DiagnosticReport.specimen         | GET [base]/DiagnosticReport?specimen=Specimen/123                   |
| MAY             | result       | reference | 観察結果                     | DiagnosticReport.result           | GET [base]/DiagnosticReport?result=Observation/123                  |
