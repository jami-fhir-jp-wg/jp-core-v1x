// ==============================
//   Profile 定義
// ==============================
Profile: JP_FamilyMemberHistory
Parent: FamilyMemberHistory
Id: jp-familymemberhistory
Title: "JP Core FamilyMemberHistory Profile"
Description: "このプロファイルはFamilyMemberHistoryリソースに対して、データを送受信するための共通の制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_FamilyMemberHistory"
* ^status = #active
* ^date = "2024-12-30"
* . ^short = "Information about patient's relatives, relevant for patient. 患者の家族に関する情報のうち、患者に関連する情報（家族歴）"
* . ^definition = "Significant health conditions for a person related to the patient relevant in the context of care for the patient.  
患者の診療に関連する、患者家族の疾患に関する情報。"
* patient only Reference(JP_Patient)
* reasonReference only Reference(QuestionnaireResponse or DocumentReference or JP_AllergyIntolerance or JP_Condition or JP_Observation_Common or JP_DiagnosticReport_Common)
// Extension 参照宣言
* extension contains JP_FamilyMemberHistory_GenogramBasedSiblingOrder named genogramBasedSiblingOrder ..1


// ==============================
//   Extension 定義
// ==============================
//-------------------------------
// JP_FamilyMemberHistory_SiblingOrder
//-------------------------------

Extension: JP_FamilyMemberHistory_GenogramBasedSiblingOrder
Id: jp-familymemberhistory-genogrambasedsiblingorder
Title: "JP Core FamilyMemberHistory Sibling Order Extension"
Description: "同胞内順位をFamilyMemberHistoryに付記するための拡張。"
* ^url = $JP_FamilyMemberHistory_GenogramBasedSiblingOrder
* ^status = #active
* ^date = "2025-12-01"
* ^context.type = #element
* ^context.expression = "FamilyMemberHistory"
* . ^short = "同胞内出生順"
* . ^definition = "FamilyMemberHistoryのrelationship（続柄）と組み合わせて、関連する家族構成員の同胞内出生順と性別同胞内出生順を表現する拡張。同胞内の順位を整数で、性別の同胞内の出生順の名称（長男、長女、次男、次女など）を CodeableConcept で表現する。特に、ジェノグラム（家族図）のように社会的・文化的文脈で利用される。また、日常の臨床では家族の氏名が聴取されずに続柄で記述され、家族全員の生年月日や年齢を聴取できない場合が多いことを想定している。遺伝学的血統図は対象外である。本実装ガイド（Version 1.2.0）の範囲外であるが、 参考としてGenetic Pedigreeプロファイルを参照すること。"
* url = $JP_FamilyMemberHistory_GenogramBasedSiblingOrder (exactly)
* extension contains
siblingBirthOrder ..1 MS and
genderedSiblingBirthOrder ..1 MS
//
* extension[siblingBirthOrder] ^short = "同胞内出生順（整数）"
* extension[siblingBirthOrder] ^definition = "同胞内での出生順を表現した数値。家族歴の聴取が不完全な場合、年齢や生年月日が不明な場合に、同胞内の出生順（1、2、3、、）を表現するために用いる。"
* extension[siblingBirthOrder].value[x] only integer
* extension[siblingBirthOrder].value[x] ^minValueInteger = 1
//
* extension[genderedSiblingBirthOrder] ^short = "性別同胞内出生順名称（コード値）"
* extension[genderedSiblingBirthOrder] ^definition = "同胞内の性別の出生順名称。日本語は、長男、長女、次男、次女など、designationにより出身国の用語を追加定義することで国際化にも対応。"
* extension[genderedSiblingBirthOrder].value[x] only CodeableConcept
* extension[genderedSiblingBirthOrder].valueCodeableConcept from $JP_GenderedSiblingBirthOrder_VS (preferred)