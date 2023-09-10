// ==============================
//   Profile 定義
// ==============================
Profile: JP_DiagnosticReport_Endoscopy
Parent: JP_DiagnosticReport_Common
Id: jp-diagnosticreport-endoscopy
Title: "JP Core DiagnosticReport Endoscopy Profile"
Description: "このプロファイルはDiagnosticReportリソースに対して、内視鏡を使用して実施された検査、治療に関わるデータを送受信するための制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_DiagnosticReport_Endoscopy"
* ^status = #active
* ^date = "2023-06-26"
* . ^short = "内視鏡を使用して実施された検査、治療に関する診断レポート。"
* . ^definition = "内視鏡を使用して実施された検査、治療に関する診断レポート。"
* text ^short = "主にレポートの見読性と検索性の向上を目的に、所見を中心としたhuman-readableなnarrativeデータを格納することを推奨する。【詳細参照】"
* text ^definition = "主にレポートの見読性と検索性の向上を目的に、所見を中心としたhuman-readableなnarrativeデータを格納することを推奨する。"
* text ^comment = "レポートの詳細はpresentedForm要素に格納されるレポート本体での確認を前提とする。"
* identifier ^short = "製品またはシステムが管理する、施設内で診断レポートを一意に識別するためのID。"
* identifier ^definition = "製品またはシステムが管理する、施設内で診断レポートを一意に識別するためのID。"
* basedOn ^short = "他のシステムから依頼されたオーダ情報。【詳細参照】"
* basedOn ^definition = "他のシステムから依頼されたオーダ情報。"
* basedOn ^comment = "通常、依頼元となるServiceRequestリソースを参照する。他のシステムと連携していない場合は参照不要。"
* status ^short = "診断レポートのステータス。【詳細参照】"
* status ^definition = "診断レポートのステータス。"
* status ^comment = "「preliminary」（作成中、未確定、未承認）もしくは 「final」（作成完了、確定済、承認済）を指定する。"
* category MS
* category ^short = "診断レポートの分野を表すコード。"
* category ^definition = "診断レポートの分野を表すコード。"
* category ^slicing.discriminator.type = #value
// #patternでなく#valueでよいはずだが、#valueだと警告"For the complex type CodeableConcept, consider using a pattern rather than a fixed value to avoid over-constraining the instance"が出る。
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category ^slicing.ordered = false
* category contains endoscopy 1..1
* category[endoscopy] ^short = "診断レポートの分野を表すコード。【詳細参照】"
* category[endoscopy] ^definition = "診断レポートの分野を表すコード。"
* category[endoscopy] ^comment = "JP_DiagnosticReportCategory_VSの中から「LP7796-8」（Endoscopy（内視鏡））を指定する。"
* category[endoscopy] from $JP_DiagnosticReportCategory_VS (required)
//* category[endoscopy] = $Loinc_CS#LP7796-8 "内視鏡" (exactly)
* category[endoscopy] = $Loinc_CS#LP7796-8 

* code from $JP_DocumentCodes_Endoscopy_VS (extensible)
* code ^short = "内視鏡分野の診断レポートを分類するためのコード。【詳細参照】"
* code ^definition = "内視鏡分野の診断レポートを分類するためのコード。"
* code ^comment = "JP_DocumentCodes_Endoscopy_VSの中から適切な内視鏡分野の報告書のコードを指定する（例：「18751-8」（上部消化管内視鏡報告書））。該当する適切な報告書のコードが登録されていない場合は、「19805-1」（内視鏡検査報告書）を指定する。"
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
* performer ^short = "内視鏡検査、治療を実施した医師。【詳細参照】"
* performer ^definition = "内視鏡検査、治療を実施した医師。"
* performer ^comment = "JP Core Practitionerリソースを参照する。"
* resultsInterpreter MS
* resultsInterpreter only Reference(JP_Practitioner or JP_PractitionerRole or JP_Organization)
* resultsInterpreter ^short = "通常、この診断レポートの確定者。【詳細参照】"
* resultsInterpreter ^definition = "通常、この診断レポートの確定者。"
* resultsInterpreter ^comment = "通常、JP Core Practitionerリソースを参照する。"
* specimen ^short = "この診断レポートの検体に関する情報。【詳細参照】"
* specimen ^definition = "この診断レポートの検体に関する情報。"
* specimen ^comment = "内視鏡では省略してよい。"
* result ^short = "この診断レポートの一部となるObservationに関する情報。"
* result ^definition = "この診断レポートの一部となるObservationに関する情報。"
* imagingStudy MS
* imagingStudy only Reference(JP_ImagingStudy_Endoscopy)
* imagingStudy ^short = "診断レポートに関連づけれられたDICOM画像検査に関する情報。【詳細参照】"
* imagingStudy ^definition = "診断レポートに関連づけれられたDICOM画像検査に関する情報。"
* imagingStudy ^comment = "JP Core ImagingStudy Endoscopyリソースを参照する。"
* media ^short = "診断レポートに関連づけられたメディアに関する情報。【詳細参照】"
* media ^definition = "診断レポートに関連づけられたメディアに関する情報。"
* media ^comment = "主に、レポートに添付されるキー画像を指す。"
* media.comment ^short = "メディアに関するコメント。【詳細参照】"
* media.comment ^definition = "メディアに関するコメント。"
* media.comment ^comment = "内視鏡では省略してよい。"
* media.link MS
* media.link ^short = "メディアの参照先。"
* media.link ^definition = "メディアの参照先。"
* conclusion MS
* conclusion ^short = "総合診断に相当する要約結論。【詳細参照】"
* conclusion ^definition = "総合診断に相当する要約結論。"
* conclusion ^comment = "テキストで可能な限り記載する。"
* conclusionCode MS
* conclusionCode from $JP_ConclusionCodesJed_VS (example)
* conclusionCode ^short = "内視鏡診断レポートの要約結論を表す1つ以上のコード。【詳細参照】"
* conclusionCode ^definition = "内視鏡診断レポートの要約結論を表す1つ以上のコード。"
* conclusionCode ^comment = "JED Project（https://jedproject.jges.net/）が対象とする検査種別については、指定された質的診断コードを使用することを強く推奨する。"
* presentedForm MS
* presentedForm ^short = "診断レポート本体。【詳細参照】"
* presentedForm ^definition = "診断レポート本体。"
* presentedForm ^comment = "診断レポート本体をPDF形式やxml形式などで添付する（フォーマットは不問）。"