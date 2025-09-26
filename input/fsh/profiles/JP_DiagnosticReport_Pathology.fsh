// ==============================
//   Profile 定義
// ==============================
Profile: JP_DiagnosticReport_Pathology
Parent: JP_DiagnosticReport_Common
Id: jp-diagnosticreport-pathology
Title: "JP Core DiagnosticReport Pathology Profile"
Description: "このプロファイルはDiagnosticReportリソースに対して、病理検査レポートのデータを送受信するための制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_DiagnosticReport_Pathology"
* ^status = #active
* ^date = "2025-01-15"
* . ^short = "病理検査レポート。病理診断、肉眼所見、顕微鏡所見等を含む診断レポート。"
* . ^definition = "病理検査レポート。病理診断、肉眼所見、顕微鏡所見等を含む診断レポート。"
* text ^short = "病理診断の要約所見を中心としたhuman-readableなnarrativeデータを格納することを推奨する。【詳細参照】"
* text ^definition = "病理診断の要約所見を中心としたhuman-readableなnarrativeデータを格納することを推奨する。"
* text ^comment = "レポートの詳細はpresentedForm要素に格納されるレポート本体での確認を前提とする。"
* identifier MS
* identifier ^short = "病理診断番号など、施設内で診断レポートを一意に識別するためのID。"
* identifier ^definition = "病理診断番号など、施設内で診断レポートを一意に識別するためのID。"
* basedOn MS
* basedOn ^short = "病理検査依頼オーダ情報。【詳細参照】"
* basedOn ^definition = "病理検査依頼オーダ情報。"
* basedOn ^comment = "通常、依頼元となるServiceRequestリソースを参照する。"
* status MS
* status ^short = "診断レポートのステータス。【詳細参照】"
* status ^definition = "診断レポートのステータス。"
* status ^comment = "「preliminary」（作成中、未確定、未承認）もしくは 「final」（作成完了、確定済、承認済）、「amended」（修正版）を指定する。"
* category MS
* category 1..*
* category ^slicing.discriminator.type = #value
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category ^slicing.ordered = false
* category contains pathology 1..1
* category ^short = "診断レポートの分野を表すコード。"
* category ^definition = "診断レポートの分野を表すコード。"
* category[pathology] MS
* category[pathology] ^short = "病理診断レポートを示すコード。【詳細参照】"
* category[pathology] ^definition = "病理診断レポートを示すコード。"
* category[pathology] ^comment = "JP_DiagnosticReportCategory_VSの中から「LP7839-6」（病理）を指定する。"
* category[pathology] from $JP_DiagnosticReportCategory_VS (required)
* category[pathology].coding.system = $Loinc_CS (exactly)
* category[pathology].coding.code 1..
* category[pathology].coding.code = $Loinc_CS#LP7839-6 (exactly)
* code MS
* code from JP_DocumentCodes_Pathology_VS (extensible)
* code ^short = "病理診断レポートを分類するためのコード。【詳細参照】"
* code ^definition = "病理診断レポートを分類するためのコード。"
* code ^comment = "LOINC等から適切な病理レポートのコードを指定する（例：「60568-3」（病理診断報告書）、「22637-3」（病理診断））。"
* subject MS
* subject only Reference(JP_Patient)
* subject ^short = "診断レポートの対象患者に関する情報。【詳細参照】"
* subject ^definition = "診断レポートの対象患者に関する情報。"
* subject ^comment = "JP Core Patientリソースを参照する。"
* encounter only Reference(JP_Encounter)
* encounter ^short = "この診断レポートに関連する受診情報。【詳細参照】"
* encounter ^definition = "この診断レポートに関連する受診情報。"
* encounter ^comment = "JP Core Encounterリソースを参照する。"
* effective[x] MS
* effective[x] only dateTime
* effective[x] ^short = "病理診断日時。【詳細参照】"
* effective[x] ^definition = "病理診断日時。"
* effective[x] ^comment = "通常は診断確定日時を指定する。"
* issued MS
* issued ^short = "レポート発行日時。【詳細参照】"
* issued ^definition = "レポート発行日時。"
* issued ^comment = "StatusがFinalになった日時を指定する。"
* performer MS
* performer only Reference(JP_Practitioner or JP_PractitionerRole or JP_Organization)
* performer ^short = "病理診断を実施した病理医。【詳細参照】"
* performer ^definition = "病理診断を実施した病理医。"
* performer ^comment = "通常、JP Core Practitionerリソースを参照する。"
* resultsInterpreter MS
* resultsInterpreter only Reference(JP_Practitioner or JP_PractitionerRole or JP_Organization)
* resultsInterpreter ^short = "病理診断レポートの確定者（通常は指導医）。【詳細参照】"
* resultsInterpreter ^definition = "病理診断レポートの確定者（通常は指導医）。"
* resultsInterpreter ^comment = "通常、JP Core Practitionerリソースを参照し、最終的な診断責任者を示す。"
* specimen MS
* specimen 1..*
* specimen only Reference(JP_Specimen_Pathology)
* specimen ^short = "この診断レポートの検体に関する情報。【詳細参照】"
* specimen ^definition = "この診断レポートの検体に関する情報。"
* specimen ^comment = "JP Core Specimen Pathologyリソースを参照する。病理検査では必須。"
* result MS
* result only Reference(JP_Observation_Pathology)
* result ^short = "病理所見（肉眼所見、顕微鏡所見、免疫染色結果等）の情報。【詳細参照】"
* result ^definition = "病理所見（肉眼所見、顕微鏡所見、免疫染色結果等）の情報。詳細はJP_Observation_Pathologyの実装ガイドを参照。"
* imagingStudy MS
* imagingStudy only Reference(JP_ImagingStudy_Pathology)
* imagingStudy ^short = "WSI（Whole Slide Imaging）画像に関する情報。【詳細参照】"
* imagingStudy ^definition = "WSI（Whole Slide Imaging）画像に関する情報。"
* imagingStudy ^comment = "JP Core ImagingStudy Pathologyリソースを参照する。WSIがある場合に使用。"
* media ^short = "診断レポートに関連づけられたメディアに関する情報。【詳細参照】"
* media ^definition = "診断レポートに関連づけられたメディアに関する情報。"
* media ^comment = "主に、レポートに添付されるキー画像（肉眼写真、顕微鏡写真等）を指す。"
* media.comment ^short = "メディアに関するコメント。【詳細参照】"
* media.comment ^definition = "メディアに関するコメント。"
* media.comment ^comment = "画像の説明や撮影条件等を記載する。"
* media.link MS
* media.link only Reference(JP_Media_Pathology)
* media.link ^short = "メディアの参照先。"
* media.link ^definition = "メディアの参照先。"
* conclusion MS
* conclusion ^short = "病理診断の総合所見・結論。【詳細参照】"
* conclusion ^definition = "病理診断の総合所見・結論。"
* conclusion ^comment = "最終的な病理診断をテキストで記載する。"
* conclusionCode MS
* conclusionCode from JP_PathologyDiagnosis_VS (example)
* conclusionCode ^short = "病理診断を表すコード。【詳細参照】"
* conclusionCode ^definition = "病理診断を表すコード。"
* conclusionCode ^comment = "SNOMED CT、ICD-O-3等の標準コードを使用することを推奨する。"
* presentedForm MS
* presentedForm ^short = "病理診断レポート本体。【詳細参照】"
* presentedForm ^definition = "病理診断レポート本体。"
* presentedForm ^comment = "病理診断レポート本体をPDF形式等で添付する。"

// ==============================
//   Extension 定義
// ==============================
Extension: JP_DiagnosticReport_Pathology_SpecimenReceivedTime
Parent: Extension
Id: jp-diagnosticreport-pathology-specimenreceivedtime
Title: "JP Core DiagnosticReport Pathology Specimen Received Time Extension"
Description: "病理部門での検体受付日時を表す拡張"
* ^url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_DiagnosticReport_Pathology_SpecimenReceivedTime"
* ^status = #active
* ^date = "2025-01-15"
* ^context.type = #element
* ^context.expression = "DiagnosticReport"
* url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_DiagnosticReport_Pathology_SpecimenReceivedTime" (exactly)
* value[x] only dateTime
* value[x] ^short = "検体受付日時"
* value[x] ^definition = "病理部門で検体を受け付けた日時"