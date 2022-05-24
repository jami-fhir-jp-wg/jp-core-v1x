// ==============================
//   Profile 定義
// ==============================
Profile: JP_FamilyMemberHistory
Parent: FamilyMemberHistory
Id: jp-familymemberhistory
Title: "JP Core FamilyMemberHistory Profile"
Description: "このプロファイルはFamilyMemberHistoryリソースに対して、データを送受信するための共通の制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_FamilyMemberHistory"
* ^status = #draft
* ^date = "2022-05-17"
* . ^short = "Information about patient's relatives, relevant for patient. 患者の親族に関する情報のうち、患者に関連する情報（家族歴）"
* . ^definition = "Significant health conditions for a person related to the patient relevant in the context of care for the patient."
* . ^comment = ".."
* identifier 0..*
* identifier ^short = "External Id(s) for this record."
* identifier ^definition = "Business identifiers assigned to this family member history by the performer or other systems which remain constant as the resource is updated and propagates from server to server."
* identifier ^comment = "This is a business identifier, not a resource identifier (see [discussion](resource.html#identifiers)).  It is best practice for the identifier to only appear on a single resource instance, however business practices may occasionally dictate that multiple resource instances with the same identifier can exist - possibly even with different resource types.  For example, multiple Patient and a Person resource instance might share the same social insurance number."
* identifier ^requirements = "Allows identification of the family member history as it is known by various participating systems and in a way that remains consistent across servers."
* instantiatesCanonical 0..*
* instantiatesCanonical ^definition = "The URL pointing to a FHIR-defined protocol, guideline, orderset or other definition that is adhered to in whole or in part by this FamilyMemberHistory. （よくわからない）"
* instantiatesUri only uri
* instantiatesUri 0..*
* instantiatesUri ^definition = "The URL pointing to an externally maintained protocol, guideline, orderset or other definition that is adhered to in whole or in part by this FamilyMemberHistory.（よくわからない）"
* status 1..1
* status only code
* status from FamilyHistoryStatus (required)
* status ^short = "partial | completed | entered-in-error | health-unknown（部分的｜完全｜記録エラー｜健康状態不明）"
* status ^definition = "A code specifying the status of the record of the family history of a specific family member. 家族歴の記録のステータス。記録が部分的なものか完全なものかなど。"
* dataAbsentReason 0..1
* dataAbsentReason only CodeableConcept
* dataAbsentReason from FamilyHistoryAbsentReason (example)
* dataAbsentReason ^short = "subject-unknown | withheld | unable-to-obtain | deferred"
* dataAbsentReason ^definition = "Describes why the family member's history is not available. 1)subject-unknown：患者が対象の家族のことを知らない（例：患者は養子のため実親を知らない）, 2)withheld：患者が家族歴の共有を拒否, 3)unable-to-obtain：患者から聞き取れない（例：患者が意識不明）, 4)deferred：患者は今は知らないが、後日共有するつもりである。"
* dataAbsentReason ^comment = "Not all terminology uses fit this general pattern. In some cases, models should not use CodeableConcept and use Coding directly and provide their own structure for managing text, codings, translations and the relationship between elements and pre- and post-coordination."
* patient 1..1
* patient only Reference(JP_Patient)
* patient ^definition = "The person who this history concerns. 患者リソース（JP_Patient）への参照。"
* date 0..1
* date only dateTime
* date ^definition = "The date (and possibly time) when the family member history was recorded or last updated. この家族歴の最終更新日。"
* name 0..1
* name only string
* name ^definition = "This will either be a name or a description; e.g. \"Aunt Susan\", \"my cousin with the red hair\". 対象の家族の呼び名。例えば「スーザンおばさん」、「赤毛のいとこ」。"
* relationship 1..1
* relationship only CodeableConcept
* relationship from v3.FamilyMember (example)
* relationship ^definition = "The type of relationship this person has to the patient (father, mother, brother etc.). 患者と家族との関係の種類（父、母、兄弟など）"
* sex 0..1
* sex only CodeableConcept
* sex from AdministrativeGender (extensible)
* sex ^short = "male | female | other | unknown（男性｜女性｜その他｜不明）"
* sex ^definition = "The birth sex of the family member.（＊リスクアセスメント目的のためバイオロジカルな性別が良いだろう）"
* sex ^binding.description = "Codes describing the sex assigned at birth as documented on the birth registration.（出生届に記載されている性別）"
* born[x] 0..1
* born[x] only Period or date or string
* born[x] ^definition = "The actual or approximate date of birth of the relative. 家族の実際もしくは凡その生年月日。"
* age[x] 0..1
* age[x] only Age or Range or string
* age[x] ^definition = "The age of the relative at the time the family member history is recorded. 家族歴が記録された時点の親族の年齢。"
* age[x] ^requirements = "While age can be calculated from date of birth, sometimes recording age directly is more natural for clinicians. 年齢は生年月日から計算できるが、臨床医にとっては年齢を直接記録する方が自然な場合もある。"
* estimatedAge 0..1
* estimatedAge only boolean
* estimatedAge ^definition = "If true, indicates that the age value specified is an estimated value. 年齢が推定かどうか。"
* deceased[x] 0..1
* deceased[x] only boolean or Age or Range or date or string
* deceased[x] ^definition = "Deceased flag or the actual or approximate age of the relative at the time of death for the family member history record. 死亡フラグ／家族の死亡時の実年齢／おおよその年齢。"
* reasonCode 0..*
* reasonCode only CodeableConcept
* reasonCode from SNOMEDCTClinicalFindings (example)
* reasonCode ^definition = "Describes why the family member history occurred in coded or textual form. 家族歴を聴取した理由となる疾患（患者が有する疾患）"
* reasonReference 0..*
* reasonReference only Reference(QuestionnaireResponse or DocumentReference or JP_AllergyIntolerance or JP_Condition or JP_Observation_Common or JP_DiagnosticReport_Common)
* reasonReference ^definition = "Indicates a Condition, Observation, AllergyIntolerance, or QuestionnaireResponse that justifies this family member history event. この家族歴が聴取されたきっかけとなったFHIRリソースへの参照。"
* note 0..*
* note only Annotation
* note ^definition = "This property allows a non condition-specific note to the made about the related person. Ideally, the note would be in the condition property, but this is not always possible. この家族に関するメモ。"
* condition 0..1
* condition only BackboneElement
* condition ^definition = "The significant Conditions (or condition) that the family member had. This is a repeating section to allow a system to represent more than one condition per resource, though there is nothing stopping multiple resources - one per condition. この家族が持っていた疾患（または状態）。"
* condition.code 1..1
* condition.code only CodeableConcept
* condition.code from Condition/Problem/DiagnosisCodes (example)
* condition.code ^definition = "The actual condition specified. Could be a coded condition (like MI or Diabetes) or a less specific string like 'cancer' depending on how much is known about the condition and the capabilities of the creating system."
* condition.outcome 0..1
* condition.outcome only CodeableConcept
* condition.outcome from ConditionOutcomeCodes (example)
* condition.outcome ^definition = "Indicates what happened following the condition. If the condition resulted in death, deceased date is captured on the relation."
* condition.contributedToDeath 0..1
* condition.contributedToDeath only boolean
* condition.contributedToDeath ^definition = "This condition contributed to the cause of death of the related person. If contributedToDeath is not populated, then it is unknown."
* condition.onset[x] 0..1
* condition.onset[x] only Age or Range or Period or string
* condition.onset[x] ^definition = "Either the age of onset, range of approximate age or descriptive string can be recorded. For conditions with multiple occurrences, this describes the first known occurrence."
* condition.note 0..*
* condition.note only Annotation
* condition.note ^definition = "An area where general notes can be placed about this specific condition."
