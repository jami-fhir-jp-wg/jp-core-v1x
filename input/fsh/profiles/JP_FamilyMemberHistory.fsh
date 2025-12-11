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

//extension 参照宣言
* extension contains 
    JP_FamilyMemberHistory_SiblingOrder named siblingOrder 0..1 MS and genderedSiblingOrder 0..1 MS

// ==============================
//   Extension 定義
// ==============================
//-------------------------------
// JP_FamilyMemberHistory_SiblingOrder
//-------------------------------

Extension: JP_FamilyMemberHistory_SiblingOrder
Id: jp-familymemberhistory-siblingorder
Title: "JP Core FamilyMemberHistory Sibling Order Extension"
Description: "同胞内出生順（長男、長女など）をFamilyMemberHistoryに付記するための拡張。同胞はvalueは CodeableConcept で、JP_SiblingOrder_VS のコード（SO1, SO1F など）を推奨する。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_FamilyMemberHistory_SiblingOrder"
* ^status = #active
* ^date = "2025-12-01"
* ^context.type = #element
* ^context.expression = "FamilyMemberHistory"
* . ^short = "同胞内出生順"
* . ^definition = "FamilyMemberHistory リソース全体に対して、関連する家族成員の同胞内出生順を表現する拡張。日本語での表現（長男、長女、次男など）を CodeableConcept で提供する。この拡張は社会学的・文化的文脈で利用され、医学的な遺伝情報とは独立している。家系図はスコープ外。"
* url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_FamilyMemberHistory_SiblingOrder" (exactly)
* extension contains 
    siblingOrder 0..1 MS and 
    genderedSiblingOrder 0..1 MS
* extension[siblingOrder] ^short = "同胞内出生順（整数）"
* extension[siblingOrder] ^definition = "同胞内での出生順を表現した数値。性別に関係なく、単純に出生順を示す。例えば、男、男、女の出生順の場合、長男は1、次男は2、長女は3など。"
* extension[siblingOrder].value[x] only integer
* extension[siblingOrder].value[x] ^minValueInteger = 1
* extension[genderedSiblingOrder] ^short = "性別同胞内出生順"
* extension[genderedSiblingOrder] ^definition = "同胞内での出生順を性別に表現した用語。用語で出生順が表現されており、用語選択のみで表現される（例：長男、長女など）。"
* extension[genderedSiblingOrder].value[x] only CodeableConcept
* extension[genderedSiblingOrder].valueCodeableConcept from $JP_GenderedSiblingOrder_VS (preferred)
