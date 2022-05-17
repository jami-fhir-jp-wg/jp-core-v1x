Profile: JP_FamilyMemberHistory
Parent: FamilyMemberHistory
Id: jp-familymemberhistory
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_FamilyMemberHistory"
* ^status = #draft
* instantiatesCanonical ^definition = "The URL pointing to a FHIR-defined protocol, guideline, orderset or other definition that is adhered to in whole or in part by this FamilyMemberHistory. （よくわからない）"
* instantiatesUri ^definition = "The URL pointing to an externally maintained protocol, guideline, orderset or other definition that is adhered to in whole or in part by this FamilyMemberHistory.（よくわからない）"
* status from FamilyHistoryStatus (required)
* status ^short = "partial | completed | entered-in-error | health-unknown（部分的｜完全｜記録エラー｜健康状態不明）"
* status ^definition = "A code specifying the status of the record of the family history of a specific family member. 家族歴の記録のステータス。記録が部分的なものか完全なものかなど。"
* dataAbsentReason ^definition = "Describes why the family member's history is not available. 1)subject-unknown：患者が対象の家族のことを知らない（例：患者は養子のため実親を知らない）, 2)withheld：患者が家族歴の共有を拒否, 3)unable-to-obtain：患者から聞き取れない（例：患者が意識不明）, 4)deferred：患者は今は知らないが、後日共有するつもりである。"
* patient only Reference(JP_Patient)
* patient ^definition = "The person who this history concerns. 患者リソース（JP_Patient）への参照。"
* date ^definition = "The date (and possibly time) when the family member history was recorded or last updated. この家族歴の最終更新日。"
* name ^definition = "This will either be a name or a description; e.g. \"Aunt Susan\", \"my cousin with the red hair\". 対象の家族の呼び名。例えば「スーザンおばさん」、「赤毛のいとこ」。"
* relationship ^definition = "The type of relationship this person has to the patient (father, mother, brother etc.). 患者と家族との関係の種類（父、母、兄弟など）"
* sex ^short = "male | female | other | unknown（男性｜女性｜その他｜不明）"
* sex ^definition = "The birth sex of the family member.（＊リスクアセスメント目的のためバイオロジカルな性別が良いだろう）"
* sex ^binding.strength = #extensible
* sex ^binding.description = "Codes describing the sex assigned at birth as documented on the birth registration.（出生届に記載されている性別）"
* born[x] ^definition = "The actual or approximate date of birth of the relative. 家族の実際もしくは凡その生年月日。"
* age[x] ^definition = "The age of the relative at the time the family member history is recorded. 家族歴が記録された時点の親族の年齢。"
* age[x] ^requirements = "While age can be calculated from date of birth, sometimes recording age directly is more natural for clinicians. 年齢は生年月日から計算できるが、臨床医にとっては年齢を直接記録する方が自然な場合もある。"
* estimatedAge ^definition = "If true, indicates that the age value specified is an estimated value. 年齢が推定かどうか。"
* deceased[x] ^definition = "Deceased flag or the actual or approximate age of the relative at the time of death for the family member history record. 死亡フラグ／家族の死亡時の実年齢／おおよその年齢。"
* reasonCode ^definition = "Describes why the family member history occurred in coded or textual form. 家族歴を聴取した理由となる疾患（患者が有する疾患）"
* reasonReference only Reference(QuestionnaireResponse or DocumentReference or JP_AllergyIntolerance or JP_Condition or JP_Observation_Common or JP_DiagnosticReport_Common)
* reasonReference ^definition = "Indicates a Condition, Observation, AllergyIntolerance, or QuestionnaireResponse that justifies this family member history event. この家族歴が聴取されたきっかけとなったFHIRリソースへの参照。"
* note ^definition = "This property allows a non condition-specific note to the made about the related person. Ideally, the note would be in the condition property, but this is not always possible. この家族に関するメモ。"
* condition ^definition = "The significant Conditions (or condition) that the family member had. This is a repeating section to allow a system to represent more than one condition per resource, though there is nothing stopping multiple resources - one per condition. この家族が持っていた疾患（または状態）。"