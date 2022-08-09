// ==============================
//   Profile定義
// ==============================
Profile: JP_Observation_PhysicalExam
Parent: JP_Observation_Common
Id: jp-observation-physicalexam
Title: "JP Core Observation PhysicalExam Profile"
Description: "このプロファイルはObservationリソースに対して、身体所見のデータを送受信するための制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_PhysicalExam"
* ^status = #draft
* . ^short = "身体所見に関する測定や簡単な観察事実（assertion）"
* . ^definition = "身体所見に関する測定や簡単な観察事実"
* . ^comment = "身体所見に関するObservation（検査測定や観察事実）の制約プロフィール"
* category 1..
* category ^slicing.discriminator.type = #pattern
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category contains exam 1..1
* category[exam] = $observation-category#exam
* category ^comment = "In addition to the required category valueset, this element allows various categorization schemes based on the owner’s definition of the category and effectively multiple categories can be used at once.  The level of granularity is defined by the category concepts in the value set.\r\n\r\n【JP仕様】<br/>\r\n基底仕様のカテゴリ「exam」固定とする"
* code = $JP_PhysicalExamCodes_CS#physical-findings "Physical Findings" (exactly)
* code from JP_PhysicalExamCodes_VS (required)
* code ^comment = "*All* code-value and, if present, component.code-component.value pairs need to be taken into account to correctly understand the meaning of the observation.\r\n\r\n【JP仕様】<br/>\r\n所見の有無を表すコード（固定値）"
* subject 1..
* subject only Reference(JP_Patient)
* subject ^comment = "One would expect this element to be a cardinality of 1..1. The only circumstance in which the subject can be missing is when the observation is made by a device that does not know the patient. In this case, the observation SHALL be matched to a patient through some context/channel matching technique, and at this point, the observation should be updated.\r\n\r\n【JP仕様】<br/>\r\n患者"
* encounter ^comment = "This will typically be the encounter the event occurred within, but some events may be initiated prior to or after the official completion of an encounter but still be tied to the context of the encounter (e.g. pre-admission laboratory tests).\r\n\r\n【JP仕様】<br/>\r\n診察"
* effective[x] only dateTime or Period
* effective[x] ^comment = "At least a date should be present unless this observation is a historical report.  For recording imprecise or \"fuzzy\" times (For example, a blood glucose measurement taken \"after breakfast\") use the [Timing](datatypes.html#timing) datatype which allow the measurement to be tied to regular life events.\r\n\r\n【JP仕様】<br/>\r\neffectiveDateTime：医療者が確認した日時<br/>\r\neffectivePeriod：医療者が確認した期間"
* value[x] only CodeableConcept
* value[x] from $v2-0136 (required)
* value[x] ^comment = "An observation may have; 1)  a single value here, 2)  both a value and a set of related or component values,  or 3)  only a set of related or component values. If a value is present, the datatype for this element should be determined by Observation.code.  A CodeableConcept with just a text would be used instead of a string if the field was usually coded, or if the type associated with the Observation.code defines a coded value.  For additional guidance, see the [Notes section](observation.html#notes) below.\r\n\r\n【JP仕様】<br/>\r\nコードに限定する"
* value[x] ^binding.description = "Codes specifying either Yes or No used in fields containing binary answers generally user-specified."
* bodySite from $observation-bodySite (preferred)
* bodySite ^comment = "ICD-11"
* method from $observation-method (preferred)
* method ^comment = "Only used if not implicit in code for Observation.code.\r\n\r\n【JP仕様】<br/>\r\n症状・所見マスターの「診察方法」を基にバリューセットを定義する<br/>\r\n具体的なコードについてはSWG6と連携して決定する必要がある（TBD）"
* hasMember only Reference(JP_Observation_Common or QuestionnaireResponse or MolecularSequence or JP_Observation_PhysicalExam)
* hasMember ^comment = "When using this element, an observation will typically have either a value or a set of related resources, although both may be present in some cases.  For a discussion on the ways Observations can assembled in groups together, see [Notes](observation.html#obsgrouping) below.  Note that a system may calculate results from [QuestionnaireResponse](questionnaireresponse.html)  into a final score and represent the score as an Observation.\r\n\r\n【JP仕様】<br/>\r\n関連する参照リソースにJP_Observation_PhysicalExamを追加"
* derivedFrom only Reference(DocumentReference or ImagingStudy or Media or QuestionnaireResponse or JP_Observation_Common or MolecularSequence or JP_Observation_PhysicalExam)
* derivedFrom ^comment = "All the reference choices that are listed in this element can represent clinical observations and other measurements that may be the source for a derived value.  The most common reference will be another Observation.  For a discussion on the ways Observations can assembled in groups together, see [Notes](observation.html#obsgrouping) below.\r\n\r\n【JP仕様】<br/>\r\n導出元の参照リソースにJP_Observation_PhysicalExamを追加"
* component ^comment = "For a discussion on the ways Observations can be assembled in groups together see [Notes](observation.html#notes) below.\r\n\r\n【JP仕様】<br/>\r\n具体的な所見を記載する"
* component.code = $JP_PhysicalExamCodes_CS#detailed-physical-findings "Detailed Physical Findings" (exactly)
* component.code from JP_PhysicalExamCodes_VS (required)
* component.code ^comment = "*All* code-value and  component.code-component.value pairs need to be taken into account to correctly understand the meaning of the observation.\r\n\r\n【JP仕様】<br/>\r\n具体的な所見を表すコード（固定値）"
* component.value[x] only CodeableConcept or string