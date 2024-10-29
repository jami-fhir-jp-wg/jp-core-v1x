本プロファイルは、DiagnosticReportリソースを使用して、内視鏡による診断/治療の根拠となる内容や、検査/手技中に撮影された画像や動画などのデータを共通の「報告書(レポート)」として記録、検索、取得するために、最低限遵守すべき制約を取り纏めたものである。

## 背景および想定シナリオ

本プロファイルは、以下のようなユースケースを想定している。
- オーダをもとに実施された内視鏡検査レポートの保存
- 他のリソースからの内視鏡検査レポートの参照

## スコープ

DiagnosticReportリソースを使用して表現した内視鏡検査レポートには、診断内容に加え、いくつかの所見、検査/手技中に撮影された画像、テキストおよびコード化された解釈、テンプレート化された報告書などが含まれる。

典型的な利用方法としては、PDFやxml形式で作成された報告書をDiagnosticReport.presentedForm要素に格納するとともに、DiagnosticReport.result要素が参照する[JP Core Observation Endoscopy][JP_Observation_Endoscopy]リソースに観察結果（診断、所見など）の情報を、DiagnosticReport.conclusion要素に診断要約を記載する。検査中に撮影された画像や動画は、DICOM形式であればimagingStudyを参照、DICOM以外の形式であればDiagnosticReport.media要素にMediaリソースへのリンクとして保持する。


### 注記


* 消化器内視鏡検査レポートについては、[日本消化器内視鏡学会](https://jges.net/)が推進する[JED (Japan Endoscopy Database) Project](https://jedproject.jges.net/)に準拠していることが強く推奨される。
* 2024年11月現在、JED用語のLOINC(http://loinc.org)コードを申請中である。現在、同一用語に対して異なるローカルコードが割り振られている箇所が存在するが、LOINCコード取得時に名寄せする予定である。

#### V1.2における更新箇所

JP Core V1.1.2では、報告書の見読性、検索の汎用性を確保するために、所見を中心とした報告書の主要な内容についてはDiagnosticReportのDomainResourceの1つであるtext要素にテキスト形式で格納することを推奨していたが、多くのクラウドシステムではDomainResource.textを検索対象とできない可能性があることが判明した。検索性を担保するために、JP Core V1.2以降では、US Coreの運用方法に倣い、DiagnosticReport.result要素が参照する[JP Core Observation Endoscopy][JP_Observation_Endoscopy]リソースに、診断レポートの一部となる内視鏡検査、治療による観察結果（診断、所見など）の情報を記載し、検索対象のリソースとして用いることとした。

## プロファイル定義


{% include markdown-link-references.md %}
