// ==============================
//   Profile定義
// ==============================
Profile: JP_Observation_PhysicalExam
Parent: JP_Observation_Common
Id: jp-observation-physicalexam
Title: "JP Core Observation PhysicalExam Profile"
Description: "このプロファイルはObservationリソースに対して、身体所見のデータを送受信するための制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_PhysicalExam"
* ^status = #active
* ^date = "2022-10-24"
* . ^short = "身体所見に関する測定や簡単な観察事実（assertion）"
* . ^definition = "身体所見に関する測定や簡単な観察事実"
* . ^comment = "身体所見に関するObservation（検査測定や観察事実）の制約プロフィール"
* category 1..
* category ^slicing.discriminator.type = #pattern
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category contains exam 1..1
* category[exam] = $observation-category#exam
* category ^comment = "In addition to the required category valueset, this element allows various categorization schemes based on the owner’s definition of the category and effectively multiple categories can be used at once.  The level of granularity is defined by the category concepts in the value set.\r\n\r\n【JP Core仕様】基底仕様のカテゴリ「exam」固定とする"
* code ^comment = "*All* code-value and, if present, component.code-component.value pairs need to be taken into account to correctly understand the meaning of the observation.\r\n\r\n【JP Core仕様】所見の有無を表すコード（固定値）"
* code from JP_PhysicalExamCode_VS (preferred)
* code.coding ^slicing.discriminator.type = #pattern
* code.coding ^slicing.discriminator.path = "$this"
* code.coding ^slicing.rules = #open
* code.coding contains physicalExamCode 0..1
* code.coding[physicalExamCode] = $JP_PhysicalExamCode_CS#physical-findings "Physical Findings"
* code.coding[physicalExamCode] ^short = "身体所見項目コード。本ユースケースにおける項目コード推奨値をスライスにて示している。【詳細参照】"
* code.coding[physicalExamCode] ^definition = "身体所見項目コード。本ユースケースにおける項目コード推奨値をスライスにて示している。"
* code.coding[physicalExamCode] ^comment = "推奨項目コードは必須ではない、派生先によるコード体系を作成し割り振ることを否定しない"
* subject 1..
* subject only Reference(JP_Patient)
* subject ^comment = "One would expect this element to be a cardinality of 1..1. The only circumstance in which the subject can be missing is when the observation is made by a device that does not know the patient. In this case, the observation SHALL be matched to a patient through some context/channel matching technique, and at this point, the observation should be updated.\r\n\r\n【JP Core仕様】患者"
* encounter ^comment = "This will typically be the encounter the event occurred within, but some events may be initiated prior to or after the official completion of an encounter but still be tied to the context of the encounter (e.g. pre-admission laboratory tests).\r\n\r\n【JP Core仕様】診察"
* effective[x] only dateTime or Period
* effective[x] ^comment = "At least a date should be present unless this observation is a historical report.  For recording imprecise or \"fuzzy\" times (For example, a blood glucose measurement taken \"after breakfast\") use the [Timing](datatypes.html#timing) datatype which allow the measurement to be tied to regular life events.\r\n\r\n【JP Core仕様】effectiveDateTime：医療者が確認した日時\r\n\r\neffectivePeriod：医療者が確認した期間"
* valueCodeableConcept from $v2-0136 (preferred)
* valueCodeableConcept ^short = "所見の有無（Y or N）を指定する"
* bodySite from JP_ObservationPhysicalExamBodySite_VS (preferred)
* bodySite ^comment = "ICD-11"
* method from JP_ObservationPhysicalExamMethod_VS (preferred)
* method ^comment = "MEDIS症状・所見マスターの「診察方法」"
* hasMember only Reference(JP_Observation_Common or QuestionnaireResponse or MolecularSequence or JP_Observation_PhysicalExam)
* hasMember ^comment = "When using this element, an observation will typically have either a value or a set of related resources, although both may be present in some cases.  For a discussion on the ways Observations can assembled in groups together, see [Notes](observation.html#obsgrouping) below.  Note that a system may calculate results from [QuestionnaireResponse](questionnaireresponse.html)  into a final score and represent the score as an Observation.\r\n\r\n【JP Core仕様】関連する参照リソースにJP_Observation_PhysicalExamを追加"
* derivedFrom only Reference(DocumentReference or ImagingStudy or Media or QuestionnaireResponse or JP_Observation_Common or MolecularSequence or JP_Observation_PhysicalExam)
* derivedFrom ^comment = "All the reference choices that are listed in this element can represent clinical observations and other measurements that may be the source for a derived value.  The most common reference will be another Observation.  For a discussion on the ways Observations can assembled in groups together, see [Notes](observation.html#obsgrouping) below.\r\n\r\n【JP Core仕様】導出元の参照リソースにJP_Observation_PhysicalExamを追加"
* component ^comment = "For a discussion on the ways Observations can be assembled in groups together see [Notes](observation.html#notes) below.\r\n\r\n【JP Core仕様】具体的な所見を記載する"
* component ^short = "所見有り（valueCodeableConceptがY）の場合に、具体的な所見をコード、または文字列で記載する"
* component.code from JP_PhysicalExamCode_VS (preferred)
* component.code ^comment = "*All* code-value and  component.code-component.value pairs need to be taken into account to correctly understand the meaning of the observation.\r\n\r\n【JP Core仕様】具体的な所見を表すコード（固定値）"
* component.code.coding ^slicing.discriminator.type = #pattern
* component.code.coding ^slicing.discriminator.path = "$this"
* component.code.coding ^slicing.rules = #open
* component.code.coding contains physicalExamCode 0..1
* component.code.coding[physicalExamCode] = $JP_PhysicalExamCode_CS#detailed-physical-findings "Detailed Physical Findings"
* component.code.coding[physicalExamCode] ^short = "身体所見項目コード。本ユースケースにおける項目コード推奨値をスライスにて示している。【詳細参照】"
* component.code.coding[physicalExamCode] ^definition = "身体所見項目コード。本ユースケースにおける項目コード推奨値をスライスにて示している。"
* component.code.coding[physicalExamCode] ^comment = "推奨項目コードは必須ではない、派生先によるコード体系を作成し割り振ることを否定しない"
