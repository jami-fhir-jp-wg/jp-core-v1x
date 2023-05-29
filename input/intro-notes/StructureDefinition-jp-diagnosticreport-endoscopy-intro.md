本プロファイルは、DiagnosticReportリソースを使用して、内視鏡による診断/治療の根拠となる内容や、検査/手技中に撮影された画像や動画などのデータを共通の「報告書(レポート)」として記録、検索、取得するために、最低限遵守すべき制約を取り纏めたものである。

## 背景および想定シナリオ

本プロファイルは、以下のようなユースケースを想定している。
- オーダをもとに実施された内視鏡検査レポートの保存
- 他のリソースからの内視鏡検査レポートの参照

## スコープ

DiagnosticReportリソースを使用して表現した内視鏡検査レポートには、診断内容に加え、いくつかの所見、検査/手技中に撮影された画像、テキストおよびコード化された解釈、テンプレート化された報告書などが含まれる。

典型的な利用方法としては、PDFやxml形式で作成された報告書をDiagnosticReport.presentedForm要素に格納するとともに、DiagnosticReport.conclusion要素に診断要約を記載する。検査中に撮影された画像や動画は、DICOM形式であればimagingStudyを参照、DICOM以外の形式であればDiagnosticReport.media要素にMediaリソースへのリンクとして保持する。

なお、報告書の見読性、検索の汎用性を確保するために、所見を中心とした報告書の主要な内容についてはDomainResourceであるDiagnosticReport.text要素にテキスト形式で格納することが望ましい。

<h3>注記</h3>

* 消化器内視鏡検査レポートについては、[日本消化器内視鏡学会](https://jges.net/)が推進する[JED (Japan Endoscopy Database) Project](https://jedproject.jges.net/)に準拠していることが強く推奨される 
* Non-DICOM画像を取り扱うMediaプロファイルはJP Coreで未定義のため、FHIR基底を参照されたい


## プロファイル定義


{% include markdown-link-references.md %}
