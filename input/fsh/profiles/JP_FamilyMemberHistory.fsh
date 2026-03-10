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
* . ^short = "Information about patient's relatives, relevant for patient. 患者に関連する家族の情報（家族歴）"
* . ^definition = "Significant health conditions for a person related to the patient relevant in the context of care for the patient.  
患者の診療に関連する、患者家族の重要な健康状態に関する情報。"
* patient only Reference(JP_Patient)
* reasonReference only Reference(QuestionnaireResponse or DocumentReference or JP_AllergyIntolerance or JP_Condition or JP_Observation_Common or JP_DiagnosticReport_Common)
// Extension 参照宣言
* relationship.extension contains JP_FamilyMemberHistory_Relationship_SiblingOrder named SiblingOrder ..1


// ==============================
//   Extension 定義
// ==============================
//-------------------------------
// JP_FamilyMemberHistory_Relationship_SiblingOrder
//-------------------------------

Extension: JP_FamilyMemberHistory_Relationship_SiblingOrder
Id: jp-familymemberhistory-relationship-siblingorder
Title: "JP Core FamilyMemberHistory Sibling Order Extension"
Description: "同胞内出生順をFamilyMemberHistoryに付記するための拡張。"
* ^url = $JP_FamilyMemberHistory_Relationship_SiblingOrder
* ^status = #active
* ^date = "2025-12-01"
* ^context.type = #element
* ^context.expression = "FamilyMemberHistory.relationship"
* . ^short = "同胞内出生順"
* . ^definition = "FamilyMemberHistoryのrelationship（続柄）と組み合わせて、関連する家族構成員の同胞内出生順と性別同胞内出生順名称を表現する拡張。同胞内の順位を整数で、性別の同胞内の出生順の名称（長男、長女、次男、次女など）をCodeableConceptで表現する。日常の臨床では家族の氏名は聴取されずに続柄で記述され、また、関係者全員の生年月日や年齢を聴取できない場合が多いことを想定している。また、遺伝学的血統図は対象外である。本実装ガイド（Version 1.2.0）の範囲外であるが、 参考として[Genetic Pedigreeプロファイル](https://hl7.org/fhir/R4/familymemberhistory-genetic.html)を参照すること。"
* url = $JP_FamilyMemberHistory_Relationship_SiblingOrder (exactly)
* extension contains
birthOrder ..1 MS and
birthOrderLabel ..1 MS
//
* extension[birthOrder] ^short = "同胞内出生順（整数）"
* extension[birthOrder] ^definition = "同胞内の出生順を表す数値。関連する家族構成員の全員を聴取できず、年齢または生年月日が不明な場合に、出生順（1、2、3…）を表現するために用いる。"
* extension[birthOrder].value[x] only integer
* extension[birthOrder].value[x] ^minValueInteger = 1
//
* extension[birthOrderLabel] ^short = "性別同胞内出生順名称（コード値）"
* extension[birthOrderLabel] ^definition = "同胞内の出生順を、性別を考慮した呼称（例：長男、長女、次男、次女）で表す。国際化対応の対応のため、designation により対象者の出身国の用語を追加定義できる。"
* extension[birthOrderLabel].value[x] only CodeableConcept
* extension[birthOrderLabel].valueCodeableConcept from $JP_SiblingBirthOrderByGender_VS (preferred)