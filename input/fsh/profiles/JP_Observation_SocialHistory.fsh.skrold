// ==============================
//   Profile 定義
// ==============================
Profile: JP_Observation_SocialHistory
Parent: JP_Observation_Common
Id: jp-observation-socialhistory
Title: "JP Core Observation SocialHistory Profile"
Description: "このプロファイルはObservationリソースに対して、生活背景のデータを送受信するための制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_SocialHistory"
* ^status = #active
* ^date = "2023-06-26"
* . ^short = "生活背景の情報"
* . ^definition = "生活背景の情報"
* . ^comment = "生活背景に関するObservation（収集したり観察した事実など）の制約プロフィール"
* category 1..
* category ^slicing.discriminator[+].type = #value
* category ^slicing.discriminator[=].path = "coding.system"
* category ^slicing.rules = #open
* category contains socialHistory 1..1
* category[socialHistory] from JP_SimpleObservationCategory_VS (required)
* category[socialHistory].coding.system = $JP_SimpleObservationCategory_CS (exactly)
* category[socialHistory].coding.code 1..
* category[socialHistory].coding.code = $JP_SimpleObservationCategory_CS#social-history (exactly)
* category ^comment = "【JP Core仕様】基底仕様のカテゴリ「social-history」固定とする"
* code from JP_ObservationSocialHistoryCode_VS (preferred)
* code ^comment = "MEDISのJ-MIXの「生活背景情報」（※宗教を除く）"
* subject 1..
* subject only Reference(JP_Patient)
* subject ^comment = "【JP Core仕様】患者"
* effective[x] only dateTime or Period
* effective[x] ^comment = "【JP Core仕様】effectiveDateTime：医療者が確認した日時  
effectivePeriod：医療者が確認した期間"
* value[x] only Quantity or CodeableConcept or string
* value[x] ^comment = "【JP Core仕様】文字列、コード、数値に限定する"
* derivedFrom only Reference(DocumentReference or ImagingStudy or Media or QuestionnaireResponse or JP_Observation_Common or MolecularSequence or JP_Observation_SocialHistory)
* derivedFrom ^comment = "【JP Core仕様】導出元の参照リソースにJP_Observation_SocialHistoryを追加"