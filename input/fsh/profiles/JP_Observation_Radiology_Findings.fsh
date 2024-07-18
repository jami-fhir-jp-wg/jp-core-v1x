// ==============================
//   Profile 定義
// ==============================
Profile: JP_Observation_Radiology_Findings
Parent: Observation
Id: jp-observation-radiology-findings
Title: "JP Core Observation Common Profile"
Description: "このプロファイルはObservationリソースに対して、データを送受信するための共通の制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_Radiology_Findings"
* ^status = #active
* ^date = "2024-7-18"
* . ^short = "画像診断レポートの所見（findings）"
* . ^definition = "放射線画像検査に対する画像診断レポートの所見の内容（findings）。"
* . ^comment = "画像診断レポートの所見（findings）に対応するObservationプロファイル"
* basedOn only 	Reference(ServiceRequest)
* basedOn ^comment = "このObservationが生成されることになった画像検査に関するオーダ情報"
* partOf only Reference(JP_ImagingStudy_Radiology)
* partOf ^comment = "このObservation（所見）が生成される元になった画像検査"
* category from $JP_SimpleObservationCategory_VS (preferred)
* category ^comment = "このObservationを分類するコード。(imaging)が指定される。"
//* category = $Loinc_CS#18782-3  "Radiology Study observation (narrative)" (exactly)
* category.coding.system = $Loinc_CS (exactly)
* category.coding.code 1..
* category.coding.code = $Loinc_CS#18782-3 (exactly)
* code ^comment = "observation(所見)を表すLOINCコード。18782-3, Radiology Study observation (narrative)が指定される。"
* subject only Reference(JP_Patient)
* subject ^comment = "このObservationの対象となる患者。"
* effective[x] only dateTime
* effective[x] ^comment = "所見が生成された日時(DateTime)。"
* issued ^comment = "所見が確定された日時(DateTime)。参照元のDiagnosticReportの日時と一致する必要がある。"
* performer only Reference(JP_Practitioner or JP_PractitionerRole or JP_Organization)
* performer ^comment = "所見を生成した医療者。通常は読影医。"
* value[x] only string
* value[x] ^comment = "所見の内容。"
* note ^comment = "診断報告所の所見に記載されないコメント等。"
* note ^requirements = "フリーテキストの追加情報を記載できるが、汎用的な利用は想定されない。"
* hasMember only Reference(JP_Observation_Common)
* hasMember ^comment = "レポートの所見に関連する計測値等をObservationで保持する場合、ここに指定する。"
* derivedFrom only Reference(JP_ImagingStudy_Radiology)
* derivedFrom ^comment = "この所見の元となった画像検査。"
