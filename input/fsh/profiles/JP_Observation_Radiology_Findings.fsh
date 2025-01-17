// ==============================
//   Profile 定義
// ==============================
Profile: JP_Observation_Radiology_Findings
Parent: JP_Observation_Common
Id: jp-observation-radiology-findings
Title: "JP Core Observation Radiology Findings Profile"
Description: "このプロファイルはDiagnosticReport_Radiologyリソースに関連する画像診断報告書の「所見」データを送受信するための共通の制約と拡張を定めたものである。"
* ^url = $JP_Observation_Radiology_Findings
* ^status = #active
* ^date = "2024-12-30"
* . ^short = "画像診断レポートの所見（findings）"
* . ^definition = "放射線画像検査に対する画像診断レポートの所見の内容（findings）。"
* . ^comment = "画像診断レポートの所見（findings）に対応するObservationプロファイル"
* ^copyright = "Copyright JED-Project、JAHIS、日本医療情報学会NeXEHRS課題研究会FHIR日本実装検討WG  
This material contains content from LOINC (http://loinc.org). LOINC is copyright © 1995+, Regenstrief Institute, Inc. and the Logical Observation Identifiers Names and Codes (LOINC) Committee and is available at no cost under the license at http://loinc.org/license. LOINC® is a registered United States trademark of Regenstrief Institute, Inc"
* identifier MS
* basedOn only 	Reference(ServiceRequest)
* basedOn ^comment = "このObservationが生成されることになった画像検査に関するオーダ情報"
* partOf only Reference(JP_ImagingStudy_Radiology)
* partOf ^comment = "このObservation（所見）が生成される元になった画像検査"
* category[first] MS
* category[first] ^comment = "このObservationを分類するコード。(imaging)が指定される。"
* category[first].coding.code = $JP_SimpleObservationCategory_CS#imaging (exactly)
//* code = $Loinc_CS#18782-3  "Radiology Study observation (narrative)" (exactly)
* code.coding.system = $Loinc_CS (exactly)
* code.coding.code = $Loinc_CS#18782-3 (exactly)
* code ^comment = "observation(所見)を表すLOINCコード。18782-3, Radiology Study observation (narrative)が指定される。"
* subject MS
* subject only Reference(JP_Patient)
* subject ^comment = "このObservationの対象となる患者。"
* effective[x] only dateTime
* effective[x] ^comment = "所見が生成された日時(DateTime)。"
* issued ^comment = "所見が確定された日時(DateTime)。参照元のDiagnosticReportの日時と一致する必要がある。"
* performer only Reference(JP_Practitioner or JP_PractitionerRole or JP_Organization)
* performer ^comment = "所見を生成した医療者。通常は読影医。"
* value[x] MS
* value[x] only string
* value[x] ^comment = "所見の内容。"
* note ^comment = "診断報告所の所見に記載されないコメント等。"
* note ^requirements = "フリーテキストの追加情報を記載できるが、汎用的な利用は想定されない。"
* hasMember only Reference(JP_Observation_Common)
* hasMember ^comment = "レポートの所見に関連する計測値等をObservationで保持する場合、ここに指定する。"
* derivedFrom only Reference(JP_ImagingStudy_Radiology)
* derivedFrom ^comment = "この所見の元となった画像検査。"
