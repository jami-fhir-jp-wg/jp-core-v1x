// ==============================
//   Profile 定義
// ==============================
Profile: JP_Observation_Radiology_Impression
Parent: JP_Observation_Common
Id: jp-observation-radiology-impression
Title: "JP Core Observation Radiology Impression Profile"
Description: "このプロファイルはDiagnosticReport_Radiologyリソースに関連する画像診断報告書の「インプレッション」データを送受信するための共通の制約と拡張を定めたものである"
* ^url = $JP_Observation_Radiology_Impression
* ^status = #active
* ^date = "2024-12-30"
* . ^short = "画像診断レポートの結論（インプレッション）"
* . ^definition = "放射線画像検査に対する画像診断レポートの所見の結論（インプレッション）。"
* . ^comment = "画像診断レポートの結論（インプレッション）に対応するObservationプロファイル"
* ^copyright = "Copyright JED-Project、JAHIS、日本医療情報学会NeXEHRS課題研究会FHIR日本実装検討WG  
This material contains content from LOINC (http://loinc.org). LOINC is copyright © 1995+, Regenstrief Institute, Inc. and the Logical Observation Identifiers Names and Codes (LOINC) Committee and is available at no cost under the license at http://loinc.org/license. LOINC® is a registered United States trademark of Regenstrief Institute, Inc"
* identifier MS
* basedOn only 	Reference(ServiceRequest)
* basedOn ^comment = "このObservationが生成されることになった画像検査に関するオーダ情報"
* partOf only Reference(JP_ImagingStudy_Radiology)
* partOf ^comment = "このObservation（インプレッション）が生成される元になった画像検査"
* category[first] MS
* category[first] ^comment = "このObservationを分類するコード。(imaging)が指定される。"
* category[first].coding.code = $JP_SimpleObservationCategory_CS#imaging (exactly)
//* code = $Loinc_CS#19005-8  "Radiology Imaging study [Impression] (narrative)" (exactly)
* code.coding.system = $Loinc_CS (exactly)
* code.coding.code = $Loinc_CS#19005-8 (exactly)
* code ^comment = "observation(インプレッション)を表すLOINCコード。19005-8, Radiology Imaging study [Impression] (narrative)が指定される。"
* subject MS
* subject only Reference(JP_Patient)
* subject ^comment = "このObservationの対象となる患者。"
* effective[x] only dateTime
* effective[x] ^comment = "「結論」が生成された日時(DateTime)。"
* issued ^comment = "「結論」が確定された日時(DateTime)。参照元のDiagnosticReportの日時と一致する必要がある。"
* performer only Reference(JP_Practitioner or JP_PractitionerRole or JP_Organization)
* performer ^comment = "「結論」を生成した医療者。通常は読影医。"
* value[x] MS
* value[x] only string
* value[x] ^comment = "「結論」の内容。"
* note ^comment = "診断報告書の「結論」に記載されないコメント等。"
* note ^requirements = "フリーテキストの追加情報を記載できるが、汎用的な利用は想定されない。"
* derivedFrom only Reference(JP_ImagingStudy_Radiology)
* derivedFrom ^comment = "この「結論」の元となった画像検査。"
