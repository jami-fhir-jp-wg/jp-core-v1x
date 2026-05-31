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
* extension contains JP_FamilyMemberHistory_BirthOrder named BirthOrderLabel ..1


// ==============================
//   Extension 定義
// ==============================
//-------------------------------
// JP_FamilyMemberHistory_BirthOrderLabel
//-------------------------------
Extension: JP_FamilyMemberHistory_BirthOrderLabel
Id: jp-familymemberhistory-birthorderlabel
Title: "JP Core FamilyMemberHistory Birth Order Label Extension"
Description: "続柄（relationship）を補足し、家族内で用いられる出生順に基づく呼称（長男、二男、長女、二女など）を表現する。"
* ^url = $JP_FamilyMemberHistory_BirthOrderLabel
* ^status = #active
* ^date = "2025-12-01"
* ^context.type = #element
* ^context.expression = "FamilyMemberHistory"
* . ^short = "出生順（呼称）"
* . ^definition = "FamilyMemberHistoryにおいて、対象となる家族構成員について、家族内で用いられる出生順に基づく呼称を表現する。これは、患者との続柄そのものを置き換えるものではなく、FamilyMemberHistory.relationshipで表現される続柄を補足する情報である。日常の臨床では家族の氏名まで聴取されずに、長女、二男などの呼称で記述され、関係者全員の生年月日や年齢も聴取できない場合が多いことを想定している。"
* url = $JP_FamilyMemberHistory_BirthOrderLabel (exactly)
* value[x] only CodeableConcept
* value[x] ^short = "出生順呼称（CodeableConcept）"
* value[x] ^definition = "出生順の呼称（長男、長女、二男、二女）を表す。国際化対応の対応のため、designation により対象者の出身国の用語を追加定義できる。"
* valueCodeableConcept from $JP_BirthOrderLabel_VS (preferred)
