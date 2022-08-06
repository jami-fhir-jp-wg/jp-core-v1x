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
* ^date = "2022-07-31"
* . ^short = "Information about patient's relatives, relevant for patient. 患者の親族に関する情報のうち、患者の診療に関連する情報（家族歴）"
* . ^definition = "Significant health conditions for a person related to the patient relevant in the context of care for the patient.\r\n\r\n患者の診療に関連する患者家族の疾患。"
* status ^short = "partial | completed | entered-in-error | health-unknown （部分的 | 完全 | 記録エラー | 健康状態不明）"
* status ^definition = "A code specifying the status of the record of the family history of a specific family member.\r\n\r\n家族歴の記録のステータス。記録が部分的なものか完全なものかなど。"
* dataAbsentReason ^short = "subject-unknown | withheld | unable-to-obtain | deferred (対象家族を知らない | 情報の提供を拒否 | 聞き出すことができない | 後日情報を提供できる)"
* dataAbsentReason ^definition = "Describes why the family member's history is not available.\r\n\r\n1)subject-unknown:患者が対象の家族のことを知らない（例:患者は養子のため実親を知らない）\r\n\r\n2)withheld:患者が家族歴の共有を拒否\r\n\r\n3)unable-to-obtain:患者から聞き取れない（例：患者が意識不明）\r\n\r\n4)deferred:患者は今は知らないが、後日共有するつもりである"
* patient only Reference(JP_Patient)
* patient ^definition = "The person who this history concerns.\r\n\r\nこの家族歴を有する患者。"
* date ^definition = "The date (and possibly time) when the family member history was recorded or last updated.\r\n\r\nこの家族歴の最終更新日。"
* name ^definition = "This will either be a name or a description; e.g. \"Aunt Susan\", \"my cousin with the red hair\".\r\n\r\n対象の家族の呼び名。例えば「スーザンおばさん」「赤毛のいとこ」。"
* relationship ^definition = "The type of relationship this person has to the patient (father, mother, brother etc.). \r\n\r\n患者と家族との関係の種類（父、母、兄弟など）"
* sex ^short = "male | female | other | unknown（男性 | 女性 | その他 | 不明）"
* sex ^definition = "The birth sex of the family member.\r\n\r\n家族の出生時の性別。"
* sex ^binding.description = "Codes describing the sex assigned at birth as documented on the birth registration.\r\n\r\n出生届に記載される出生時に割り当てられた性別。"
* born[x] ^definition = "The actual or approximate date of birth of the relative.\r\n\r\n家族の実際もしくは凡その生年月日。"
* age[x] ^definition = "The age of the relative at the time the family member history is recorded.\r\n\r\n家族歴が記録された時点のその家族の年齢。"
* age[x] ^requirements = "While age can be calculated from date of birth, sometimes recording age directly is more natural for clinicians.\r\n\r\n年齢は生年月日から計算できるが、臨床医にとっては年齢を直接記録する方が自然な場合もある。"
* estimatedAge ^definition = "If true, indicates that the age value specified is an estimated value.\r\n\r\nこの年齢が推定かどうか。"
* deceased[x] ^definition = "Deceased flag or the actual or approximate age of the relative at the time of death for the family member history record.\r\n\r\n死亡フラグ/家族の死亡時の実年齢/おおよその年齢。"
* reasonCode ^definition = "Describes why the family member history occurred in coded or textual form.\r\n\r\n家族歴を聴取した理由となる疾患（患者が有する疾患）"
* reasonReference only Reference(QuestionnaireResponse or DocumentReference or JP_AllergyIntolerance or JP_Condition or JP_Observation_Common or JP_DiagnosticReport_Common)
* reasonReference ^definition = "Indicates a JP_Condition, JP_Observation, JP_AllergyIntolerance, or JP_QuestionnaireResponse JP_Observation_Common, or JP_DiagnosticReport_Common that justifies this family member history event.\r\n\r\nこの家族歴が聴取されたきっかけとなったFHIRリソースへの参照。"
* note ^definition = "This property allows a non condition-specific note to the made about the related person. Ideally, the note would be in the condition property, but this is not always possible.\r\n\r\nこの家族に関するメモ。"
* condition ^definition = "The significant Conditions (or condition) that the family member had. This is a repeating section to allow a system to represent more than one condition per resource, though there is nothing stopping multiple resources - one per condition.\r\n\r\nこの家族が持っていた疾患。"
* condition.code ^definition = "The actual condition specified. Could be a coded condition (like MI or Diabetes) or a less specific string like 'cancer' depending on how much is known about the condition and the capabilities of the creating system.\r\n\r\n指定された実際の状態。その状態についてどの程度知られているか、また作成システムの能力に応じて、コード化された状態（MIや糖尿病など）、または「癌」のようなあまり特定されない文字列になる可能性がある。"
* condition.outcome ^definition = "Indicates what happened following the condition. If the condition resulted in death, deceased date is captured on the relation.\r\n\r\nその状態の後に何が起こったかを示す。その結果、死亡した場合は、死亡した日付が関連に記録される。"
* condition.contributedToDeath ^definition = "This condition contributed to the cause of death of the related person. If contributedToDeath is not populated, then it is unknown.\r\n\r\nこの状態は、関連者の死因に寄与した。contributedToDeath が入力されていない場合は、不明である。"
* condition.onset[x] ^definition = "Either the age of onset, range of approximate age or descriptive string can be recorded. For conditions with multiple occurrences, this describes the first known occurrence.\r\n\r\n発症年齢、おおよその年齢範囲、記述文字列のいずれかを記録することができる。複数回発生する疾患については、最初に知られている発生を記述する。"
* condition.note ^definition = "An area where general notes can be placed about this specific condition.\r\n\r\nこの家族の疾患についての一般的なメモ。"
