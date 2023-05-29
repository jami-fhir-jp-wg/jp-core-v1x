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
* ^date = "2022-10-24"
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
* category[socialHistory].coding.code = $JP_SimpleObservationCategory_CS#social-history (exactly)
* category ^comment = "In addition to the required category valueset, this element allows various categorization schemes based on the owner’s definition of the category and effectively multiple categories can be used at once.  The level of granularity is defined by the category concepts in the value set.\r\n\r\n【JP Core仕様】基底仕様のカテゴリ「social-history」固定とする"
* code from JP_ObservationSocialHistoryCode_VS (preferred)
* code ^comment = "MEDISのJ-MIXの「生活背景情報」（※宗教を除く）"
* subject 1..
* subject only Reference(JP_Patient)
* subject ^comment = "One would expect this element to be a cardinality of 1..1. The only circumstance in which the subject can be missing is when the observation is made by a device that does not know the patient. In this case, the observation SHALL be matched to a patient through some context/channel matching technique, and at this point, the observation should be updated.\r\n\r\n【JP Core仕様】患者"
* effective[x] only dateTime or Period
* effective[x] ^comment = "At least a date should be present unless this observation is a historical report.  For recording imprecise or \"fuzzy\" times (For example, a blood glucose measurement taken \"after breakfast\") use the [Timing](datatypes.html#timing) datatype which allow the measurement to be tied to regular life events.\r\n\r\n【JP Core仕様】effectiveDateTime：医療者が確認した日時\r\n\r\neffectivePeriod：医療者が確認した期間"
* value[x] only Quantity or CodeableConcept or string
* value[x] ^comment = "An observation may have; 1)  a single value here, 2)  both a value and a set of related or component values,  or 3)  only a set of related or component values. If a value is present, the datatype for this element should be determined by Observation.code.  A CodeableConcept with just a text would be used instead of a string if the field was usually coded, or if the type associated with the Observation.code defines a coded value.  For additional guidance, see the [Notes section](observation.html#notes) below.\r\n\r\n【JP Core仕様】文字列、コード、数値に限定する"
* derivedFrom only Reference(DocumentReference or ImagingStudy or Media or QuestionnaireResponse or JP_Observation_Common or MolecularSequence or JP_Observation_SocialHistory)
* derivedFrom ^comment = "All the reference choices that are listed in this element can represent clinical observations and other measurements that may be the source for a derived value.  The most common reference will be another Observation.  For a discussion on the ways Observations can assembled in groups together, see [Notes](observation.html#obsgrouping) below.\r\n\r\n【JP Core仕様】導出元の参照リソースにJP_Observation_SocialHistoryを追加"