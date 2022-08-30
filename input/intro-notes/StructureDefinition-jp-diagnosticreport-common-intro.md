## 背景および想定シナリオ

DiagnosticReport（検査レポート）リソースは、患者、患者のグループ、デバイス、場所、および/またはこれらから派生した検体に対する検査結果と解釈について記載されるリソースである。DiagnosticReportリソースに対する主な用途（プロファイル）は以下の通りである。

- 検体検査
- 細菌検査
- 放射線検査
- 病理検査
- 歯科口腔検査

本プロファイルは、これらプロファイルに共通となる制約、拡張などのプロファイル定義と利用方法等について記述している。

なお、DiagnosticReportリソースは蓄積された結果の表示（例えば過去および現在のレポートの結果一覧の表示）をサポートしていない。連続的に作成された詳細な構造化レポートを完全にサポートすることは現時点ではできておらず、将来のリリースで実現するように計画されている。

また、DiagnosticReportリソースは、FHIRのワークフロー([Workflowを参照](https://www.hl7.org/fhir/R4/workflow.html)）の観点からは、「イベント」リソースの１つである。このリソース（DiagnosticReport）を、[イベントリソース](https://www.hl7.org/fhir/R4/workflow.html#event)のワークフローパターンに合わせることは、OrdersやObservation Workgroupが意図するところである。

## スコープ
多くの診断プロセスは、Observation（検査、観察）とDiagnosticReport（検査レポート）を生成する手続きである点に留意する必要がある。多くの場合、Observationを作成するために明示的に手続きの発行を要しないが、診断手順がどのように実行されたかについての詳細な関心がある場合、[Procedure](https://www.hl7.org/fhir/R4/procedure.html)リソースが行為を記述するために使用される。

[Observation](https://www.hl7.org/fhir/R4/observation.html)リソースとは 対照的に、DiagnosticReportリソースには通常、追加の臨床コンテキスト、いくつかの小さな所見のまとめ、画像、画像レポート、テキストおよびコード化された解釈、テンプレート化された診断報告書などが含まれる。検査レポート、病理レポート、および画像レポートは、DiagnosticReportリソースを使用して表す必要がある。Observationリソースは、特定の検査におけるいくつかの小さな所見のまとめを提供するためにDiagnosticReportから参照される。

高度に構造化されたレポートがある場合は、データとワークフローをサポートするDiagnosticReportを使用する。診断調査のリクエストに関する詳細は、さまざまな「リクエスト」リソース（[ServiceRequestなど](https://www.hl7.org/fhir/R4/servicerequest.html)）に取り込まれ、レポートを臨床ワークフローに接続できるようにする。組織診、剖検などにおいて、少ないワークフローでナラティブに書き起こされるレポートの場合は、[Compositionリソース](https://www.hl7.org/fhir/R4/composition.html)の方が適切である。

レポートに関連する医用画像や汎用画像、およびキー画像は、DiagnosticReportリソースで参照される。詳細でかつ実際の画像インスタンスは、DiagnosticReport.mediaエレメントを使用して検査レポートで直接参照するか、DiagnosticReport.ImagingStudyエレメントを介して、特定の患者のDICOM画像検査またはDICOMインスタンスのセットで生成されたコンテンツを表す[ImagingStudyリソース](https://www.hl7.org/fhir/R4/imagingstudy.html)を間接的に参照することができる。

## プロファイル定義

{% include markdown-link-references.md %}