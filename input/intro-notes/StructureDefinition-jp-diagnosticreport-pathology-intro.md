このプロファイルはDiagnosticReportリソースを使用して、病理診断の根拠となる内容や、顕微鏡検査中に撮影された画像などのデータを共通の「報告書(レポート)」として記録、検索、取得するために、最低限遵守すべき制約を取り纏めたものである。

## 背景および想定シナリオ

本プロファイルは、以下のようなユースケースを想定している。

- オーダをもとに実施された病理診断レポートの保存
- 他のリソースからの病理診断レポートの参照
- 組織診断、細胞診断の結果の記録と参照
- 病理画像の記録と参照
- 検体情報との関連付け

## スコープ

DiagnosticReportリソースを使用して表現した病理診断レポートには、診断内容に加え、いくつかの所見、顕微鏡検査中に撮影された画像、テキストおよびコード化された解釈、テンプレート化された報告書などが含まれる。

典型的な利用方法としては、PDFやxml形式で作成された報告書をDiagnosticReport.presentedForm要素に格納するとともに、DiagnosticReport.result要素が参照する[JP Core Observation Pathology][JP_Observation_Pathology]リソースに観察結果（診断、所見など）の情報を、DiagnosticReport.conclusion要素に診断要約を記載する。検査中に撮影された画像や動画は、DICOM形式であればimagingStudyを参照、DICOM以外の形式であればDiagnosticReport.media要素にMediaリソースへのリンクとして保持する。

### 注記

病理診断においては、検体情報（Specimen）が重要な要素となるため、DiagnosticReport.specimen要素を使用して検体情報を関連付けることを強く推奨する。

## 関連するプロファイル

本プロファイルは、以下のリソースとの組み合わせで使用されることが想定される。

- [JP Core Observation Pathology][JP_Observation_Pathology]：病理診断による観察結果
- [JP Core ImagingStudy Pathology][JP_ImagingStudy_Pathology]：病理診断で撮影されたDICOM画像
- [JP Core Media Pathology][JP_Media_Pathology]：病理診断で撮影されたNon-DICOM画像
- [JP Core Specimen][JP_Specimen]：検体情報
- [JP Core Patient][JP_Patient]：患者情報
- [JP Core Practitioner][JP_Practitioner]：病理医情報

## プロファイル定義

[プロファイル定義を参照][JP_DiagnosticReport_Pathology]
