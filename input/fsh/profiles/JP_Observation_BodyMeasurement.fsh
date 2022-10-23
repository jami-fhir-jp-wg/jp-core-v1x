// ==============================
//   Profile 定義
// ==============================
Profile: JP_Observation_BodyMeasurement
Parent: JP_Observation_Common
Id: jp-observation-bodymeasurement
Title: "JP Core Observation BodyMeasurement Profile"
Description: "このプロファイルはObservationリソースに対して、身体計測のデータを送受信するための制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_BodyMeasurement"
* ^status = #active
* ^date = "2022-10-24"
* . ^short = "身体計測に関する測定や簡単な観察事実（assertion）"
* . ^definition = "患者の身体計測に関する測定と簡単な観察事実（assertion）。"
* . ^comment = "身体計測に関するObservation（検査測定や観察事実）の制約プロフィール"
* category 1..
* category from JP_ObservationBodyMeasurementCategory_VS (preferred)
* category ^comment = "MEDISの看護実践用語標準マスター＜看護観察編＞の大分類１．バイタルサイン・基本情報、中分類2．身体計測の「焦点」"
* code from JP_ObservationBodyMeasurementCode_VS (preferred)
* code ^comment = "MEDISの看護実践用語標準マスター＜看護観察編＞の大分類１．バイタルサイン・基本情報、中分類2．身体計測の「観察名称」"
* subject 1..
* subject only Reference(JP_Patient)
* subject ^comment = "One would expect this element to be a cardinality of 1..1. The only circumstance in which the subject can be missing is when the observation is made by a device that does not know the patient. In this case, the observation SHALL be matched to a patient through some context/channel matching technique, and at this point, the observation should be updated.\r\n\r\n【JP Core仕様】患者"
* encounter ^comment = "This will typically be the encounter the event occurred within, but some events may be initiated prior to or after the official completion of an encounter but still be tied to the context of the encounter (e.g. pre-admission laboratory tests).\r\n\r\n【JP Core仕様】診察"
* effective[x] only dateTime or Period
* effective[x] ^comment = "At least a date should be present unless this observation is a historical report.  For recording imprecise or \"fuzzy\" times (For example, a blood glucose measurement taken \"after breakfast\") use the [Timing](datatypes.html#timing) datatype which allow the measurement to be tied to regular life events.\r\n\r\n【JP Core仕様】effectiveDateTime：医療者が確認した日時\r\n\r\neffectivePeriod：医療者が確認した期間"
* hasMember only Reference(JP_Observation_Common or QuestionnaireResponse or MolecularSequence or JP_Observation_BodyMeasurement)
* hasMember ^comment = "When using this element, an observation will typically have either a value or a set of related resources, although both may be present in some cases.  For a discussion on the ways Observations can assembled in groups together, see [Notes](observation.html#obsgrouping) below.  Note that a system may calculate results from [QuestionnaireResponse](questionnaireresponse.html)  into a final score and represent the score as an Observation.\r\n\r\n【JP Core仕様】関連する参照リソースにJP_Observation_BodyMeasurementを追加"
* derivedFrom only Reference(DocumentReference or ImagingStudy or Media or QuestionnaireResponse or JP_Observation_Common or MolecularSequence or JP_Observation_BodyMeasurement)
* derivedFrom ^comment = "All the reference choices that are listed in this element can represent clinical observations and other measurements that may be the source for a derived value.  The most common reference will be another Observation.  For a discussion on the ways Observations can assembled in groups together, see [Notes](observation.html#obsgrouping) below.\r\n\r\n【JP Core仕様】導出元の参照リソースにJP_Observation_BodyMeasurementを追加"