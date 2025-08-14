// ==============================
//   Profile 定義
// ==============================
Profile: JP_DiagnosticReport_Pathology
Parent: JP_DiagnosticReport_Common
Id: jp-diagnosticreport-pathology
Title: "JP Core DiagnosticReport Pathology Profile"
Description: "このプロファイルはDiagnosticReportリソースに対して、病理診断に関わるデータを送受信するための制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_DiagnosticReport_Pathology"
* ^status = #active
* ^date = "2025-08-14"
* . ^short = "病理診断に関する診断レポート。"
* . ^definition = "病理診断に関する診断レポート。"
* text ^short = "主にレポートの見読性と検索性の向上を目的に、所見を中心としたhuman-readableなnarrativeデータを格納することを推奨する。【詳細参照】"
* text ^definition = "主にレポートの見読性と検索性の向上を目的に、所見を中心としたhuman-readableなnarrativeデータを格納することを推奨する。"
* text ^comment = "レポートの詳細はpresentedForm要素に格納されるレポート本体での確認を前提とする。"
* identifier ^short = "製品またはシステムが管理する、施設内で診断レポートを一意に識別するためのID。"
* identifier ^definition = "製品またはシステムが管理する、施設内で診断レポートを一意に識別するためのID。"
* basedOn MS
* basedOn ^short = "他のシステムから依頼されたオーダ情報。【詳細参照】"
* basedOn ^definition = "他のシステムから依頼されたオーダ情報。"
* basedOn ^comment = "通常、依頼元となるServiceRequestリソースを参照する。他のシステムと連携していない場合は参照不要。"
* status ^short = "診断レポートのステータス。【詳細参照】"
* status ^definition = "診断レポートのステータス。"
* status ^comment = "「preliminary」（作成中、未確定、未承認）もしくは 「final」（作成完了、確定済、承認済）を指定する。"
* category MS
* category 1..*
* category ^slicing.discriminator.type = #value
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category ^slicing.ordered = false
* category contains first 1..1
* category ^short = "診断レポートの分野を表すコード。"
* category ^definition = "診断レポートの分野を表すコード。"
* category[first] MS
* category[first] ^short = "診断レポートの分野を表すコード。【詳細参照】"
* category[first] ^definition = "診断レポートの分野を表すコード。"
* category[first] ^comment = "JP_DiagnosticReportCategory_VSの中から「LP29708-2」（Pathology（病理））を指定する。"
* category[first] from $JP_DiagnosticReportCategory_VS (required)
* category[first].coding.system = $Loinc_CS (exactly)
* category[first].coding.code 1.. 
* category[first].coding.code = $Loinc_CS#LP29708-2 (exactly)
* code from JP_DocumentCodes_Pathology_VS (extensible)
* code ^short = "病理分野の診断レポートを分類するためのコード。【詳細参照】"
* code ^definition = "病理分野の診断レポートを分類するためのコード。"
* code ^comment = "JP_DocumentCodes_Pathology_VSの中から適切な病理分野の報告書のコードを指定する（例：「33717-0」（病理診断報告書））。"
* subject MS
* subject only Reference(JP_Patient)
* subject ^short = "診断レポートの対象患者に関する情報。【詳細参照】"
* subject ^definition = "診断レポートの対象患者に関する情報。"
* subject ^comment = "JP Core Patientリソースを参照する。"
* encounter only Reference(JP_Encounter)
* encounter ^short = "この診断レポートを書くきっかけとなった情報。【詳細参照】"
* encounter ^definition = "この診断レポートを書くきっかけとなった情報。"
* encounter ^comment = "JP Core Encounterリソースを参照する。"
* effective[x] MS
* effective[x] only dateTime
* effective[x] ^short = "診断レポートの作成日時。【詳細参照】"
* effective[x] ^definition = "診断レポートの作成日時。"
* effective[x] ^comment = "DateTimeを採用する。"
* issued MS
* issued ^short = "レポート確定日時。【詳細参照】"
* issued ^definition = "レポート確定日時。"
* issued ^comment = "StatusがFinalになった日時を指定する。"
* performer MS
* performer only Reference(JP_Practitioner)
* performer ^short = "病理診断を実施した医師。【詳細参照】"
* performer ^definition = "病理診断を実施した医師。"
* performer ^comment = "JP Core Practitionerリソースを参照する。"
* resultsInterpreter MS
* resultsInterpreter only Reference(JP_Practitioner or JP_PractitionerRole or JP_Organization)
* resultsInterpreter ^short = "通常、この診断レポートの確定者。【詳細参照】"
* resultsInterpreter ^definition = "通常、この診断レポートの確定者。"
* resultsInterpreter ^comment = "通常、JP Core Practitionerリソースを参照する。"
* specimen MS
* specimen only Reference(JP_Specimen)
* specimen ^short = "この診断レポートの検体に関する情報。【詳細参照】"
* specimen ^definition = "この診断レポートの検体に関する情報。"
* specimen ^comment = "病理診断では検体情報が重要な要素となるため、JP Core Specimenリソースを参照する。"
* result MS
* result only Reference(JP_Observation_Pathology)
* result ^short = "この診断レポートの一部となる病理診断による観察結果（診断、所見など）の情報。【詳細参照】"
* result ^definition = "この診断レポートの一部となる病理診断による観察結果（診断、所見など）の情報。詳細はJP_Observation_Pathologyの実装ガイドを参照"
* imagingStudy MS
* imagingStudy only Reference(JP_ImagingStudy_Pathology)
* imagingStudy ^short = "診断レポートに関連づけられたDICOM画像検査に関する情報。【詳細参照】"
* imagingStudy ^definition = "診断レポートに関連づけられたDICOM画像検査に関する情報。"
* imagingStudy ^comment = "JP Core ImagingStudy Pathologyリソースを参照する。病理診断では顕微鏡画像などが該当する。"
* media ^short = "診断レポートに関連づけられたメディアに関する情報。【詳細参照】"
* media ^definition = "診断レポートに関連づけられたメディアに関する情報。"
* media ^comment = "主に、レポートに添付される病理画像を指す。"
* media.comment ^short = "メディアに関するコメント。【詳細参照】"
* media.comment ^definition = "メディアに関するコメント。"
* media.comment ^comment = "画像の説明や染色方法などを記載してよい。"
* media.link MS
* media.link only Reference(JP_Media_Pathology)
* media.link ^short = "メディアの参照先。"
* media.link ^definition = "メディアの参照先。"
* conclusion MS
* conclusion ^short = "病理診断の要約結論。【詳細参照】"
* conclusion ^definition = "病理診断の要約結論。"
* conclusion ^comment = "テキストで可能な限り記載する。"
* conclusionCode MS
* conclusionCode from JP_PathologyDiagnosis_VS (example)
* conclusionCode ^short = "病理診断レポートの要約結論を表す1つ以上のコード。【詳細参照】"
* conclusionCode ^definition = "病理診断レポートの要約結論を表す1つ以上のコード。"
* conclusionCode ^comment = "標準化された病理診断コードが利用可能な場合は使用することを推奨する。"
* presentedForm MS
* presentedForm ^short = "診断レポート本体。【詳細参照】"
* presentedForm ^definition = "診断レポート本体。"
* presentedForm ^comment = "診断レポート本体をPDF形式やxml形式などで添付する（フォーマットは不問）。"
