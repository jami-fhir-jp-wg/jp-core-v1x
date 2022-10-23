// ==============================
//   Profile 定義
// ==============================
Profile: JP_Condition
Parent: Condition
Id: jp-condition
Title: "JP Core Condition Profile"
Description: "このプロファイルはConditionリソースに対して、患者の健康状態に関するデータを送受信するための共通の制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Condition"
* ^status = #active
* ^date = "2022-10-24"
* . ^short = "Detailed information about conditions, problems or diagnoses. 患者の臨床状態、問題、または診断に関する詳細な情報"
* . ^definition = "A clinical condition, problem, diagnosis, or other event, situation, issue, or clinical concept that has risen to a level of concern.\r\n\r\n健康上の懸念となるレベルに達した、身体的、精神的、社会的な負の状態(condition)や問題（problem／issue）、医療者による診断(diagnosis)、生じたイベント(event)、置かれている状況(situation)、臨床的概念(clinical concept)。"
* text ^short = "Text summary of the resource, for human interpretation. このリソースを人間が解釈するためのテキスト要約"
* clinicalStatus ^short = "active | recurrence | relapse | inactive | remission | resolved （アクティブ | 再発 | 再燃 | インアクティブ | 寛解 | 完治）"
* clinicalStatus ^definition = "The clinical status of the condition.\r\n\r\nこの患者状態の臨床的ステータス（アクティブか否かなど）"
* category ^short = "problem-list-item | encounter-diagnosis（プロブレムリスト | 一時的な診断）"
* verificationStatus ^short = "unconfirmed | provisional | differential | confirmed | refuted | entered-in-error（十分に確認されていない | 暫定的 | 鑑別的 | 十分な根拠で存在 | 十分な根拠で否定 | 誤記載）"
* verificationStatus ^definition = "The verification status to support the clinical status of the condition.\r\n\r\n この患者状態が存在するかどうかの検証状況。"
* severity from $JP_ConditionSeverity_VS (preferred)
* severity ^short = "Subjective severity of condition. この患者状態の重症度。このプロファイルは、HL70421 Severity of Illness Codeで表現"
* severity ^definition = "A subjective assessment of the severity of the condition as evaluated by the clinician.\r\n\r\n医療者によって評価されたこの患者状態の重症度。"
* severity ^comment = "Coding of the severity with a terminology is preferred, where possible.\r\n可能な限り、ターミノロジを用いて重症度をコーディングすることが好ましい。\r\n\r\n このプロファイルではHL70421 Severity of Illness Code（MI 軽度, MO 中度, SE 重度）を採用。"
* code ^short = "Identification of the condition, problem or diagnosis. この患者状態の識別コード"
* bodySite ^short = "Anatomical location, if relevant. もし関連するのであれば、その人体部位"
* subject only Reference(JP_Patient)
* subject ^short = "Who has the condition? 誰がこの状態を有するか"
* encounter only Reference(JP_Encounter)
* encounter ^short = "Encounter created as part of. この患者状態の記録が作成された受療の状況（外来、入院、救急、在宅など）"
* encounter ^definition = "The Encounter during which this Condition was created or to which the creation of this record is tightly associated.\r\n\r\nこの患者状態の記録やレコード作成に関連する受療の状況（外来、入院、救急、在宅など）"
* onset[x] ^short = "Estimated or actual date,  date-time, or age. この患者状態のオンセット。推定もしくは実際の日付、日時、年齢"
* onset[x] ^definition = "Estimated or actual date or date-time  the condition began, in the opinion of the clinician.\r\n\r\n臨床医の判断における、本状態が始まったと推定される、または実際に始まった日または日時。"
* onset[x] ^comment = "Age is generally used when the patient reports an age at which the Condition began to occur.\r\n\r\n年齢は一般的に、患者が症状が発生し始めた年齢を報告したケースで使用される。"
* abatement[x] ^short = "When in resolution/remission. この状態はいつ治癒／寛解／軽快したか"
* recordedDate ^short = "Date record was first recorded. この患者状態が初めて記録された日時"
* recordedDate ^definition = "The recordedDate represents when this particular Condition record was created in the system, which is often a system-generated date.\r\n\r\nこの患者状態の記録がシステムで作成された日時を表し、多くの場合、システムが生成した日付である。"
* recorder only Reference(JP_Practitioner or JP_PractitionerRole or JP_Patient or RelatedPerson)
* recorder ^short = "Who recorded the condition. 誰がこの患者状態を記録したか"
* recorder ^definition = "Individual who recorded the record and takes responsibility for its content.\r\n\r\nこの患者状態を記録しその内容に責任を持つ個人。"
* asserter only Reference(JP_Patient or RelatedPerson or JP_Practitioner or JP_PractitionerRole)
* asserter ^short = "Person who asserts this condition. この患者状態の情報源"
* asserter ^definition = "Individual who is making the condition statement.\r\n\r\nこの患者状態に関する情報の発生源または取得元。"
* stage ^short = "Stage/grade, usually assessed formally. この患者状態のステージやグレード。通常は正式に評価されたもの"
* stage ^definition = "Clinical stage or grade of a condition. May include formal severity assessments.\r\n\r\n病状の臨床病期またはグレード。正式な重症度評価を含む場合がある。"
* stage.assessment only Reference(ClinicalImpression or JP_DiagnosticReport_Common or JP_Observation_Common)
* evidence ^short = "Supporting evidence. 患者状態の存在に関する根拠"
* evidence ^definition = "Supporting evidence / manifestations that are the basis of the Condition's verification status, such as evidence that confirmed or refuted the condition.\r\n\r\n患者状態を確認または否定した証拠など、状態の検証ステータスの裏付けとなる症状や兆候。"
* note ^short = "Additional information about the Condition. この患者状態に関する追加情報"
* note ^definition = "Additional information about the Condition. This is a general notes/comments entry for description of the Condition, its diagnosis and prognosis.\r\nこの患者状態に関する追加情報。これは、状態の説明、診断、予後に関するメモやコメントである。"
