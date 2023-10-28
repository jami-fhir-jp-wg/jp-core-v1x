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
* ^date = "2023-06-26"
* . ^short = "身体所見に関する測定や簡単な観察事実（assertion）"
* . ^definition = "身体所見に関する測定や簡単な観察事実"
* . ^comment = "身体所見に関するObservation（検査測定や観察事実）の制約プロフィール"
* category 1..
* category ^slicing.discriminator[+].type = #value
* category ^slicing.discriminator[=].path = "coding.system"
* category ^slicing.rules = #open
* category contains physicalExam 1..1
* category[physicalExam] from JP_SimpleObservationCategory_VS (required)
* category[physicalExam].coding.system = $JP_SimpleObservationCategory_CS (exactly)
* category[physicalExam].coding.code 1..
* category[physicalExam].coding.code = $JP_SimpleObservationCategory_CS#exam (exactly)
* category ^comment = "【JP Core仕様】基底仕様のカテゴリ「exam」固定とする"
* code ^comment = "【JP Core仕様】所見の有無を表すコード（固定値）"
* code from JP_PhysicalExamCode_VS (preferred)
* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "system"
* code.coding ^slicing.rules = #open
* code.coding contains physicalExamCode 0..1
* code.coding[physicalExamCode] from JP_PhysicalExamCode_VS (required)
* code.coding[physicalExamCode].system = $JP_PhysicalExamCode_CS (exactly)
* code.coding[physicalExamCode].code 1..
* code.coding[physicalExamCode].code = $JP_PhysicalExamCode_CS#physical-findings  (exactly)
* code.coding[physicalExamCode].display = "Physical Findings"
* code.coding[physicalExamCode] ^short = "身体所見項目コード。本ユースケースにおける項目コード推奨値をスライスにて示している【詳細参照】"
* code.coding[physicalExamCode] ^definition = "身体所見項目コード。本ユースケースにおける項目コード推奨値をスライスにて示している。"
* code.coding[physicalExamCode] ^comment = "推奨項目コードは必須ではない、派生先によるコード体系を作成し割り振ることを否定しない"
* subject 1..
* subject only Reference(JP_Patient)
* subject ^comment = "【JP Core仕様】患者"
* encounter ^comment = "【JP Core仕様】診察"
* effective[x] only dateTime or Period
* effective[x] ^comment = "【JP Core仕様】effectiveDateTime：医療者が確認した日時  
effectivePeriod：医療者が確認した期間"
* valueCodeableConcept from $v2-0136 (preferred)
* valueCodeableConcept ^short = "所見の有無（Y or N）を指定する"
* bodySite from JP_ObservationPhysicalExamBodySite_VS (preferred)
* bodySite ^comment = "ICD-11"
* method from JP_ObservationPhysicalExamMethod_VS (preferred)
* method ^comment = "MEDIS症状・所見マスターの「診察方法」"
* hasMember only Reference(JP_Observation_Common or QuestionnaireResponse or MolecularSequence or JP_Observation_PhysicalExam)
* hasMember ^comment = "【JP Core仕様】関連する参照リソースにJP_Observation_PhysicalExamを追加"
* derivedFrom only Reference(DocumentReference or ImagingStudy or Media or QuestionnaireResponse or JP_Observation_Common or MolecularSequence or JP_Observation_PhysicalExam)
* derivedFrom ^comment = "【JP Core仕様】導出元の参照リソースにJP_Observation_PhysicalExamを追加"
* component ^comment = "【JP Core仕様】具体的な所見を記載する"
* component ^short = "所見有り（valueCodeableConceptがY）の場合に、具体的な所見をコード、または文字列で記載する"
* component.code from JP_PhysicalExamCode_VS (preferred)
* component.code ^comment = "【JP Core仕様】具体的な所見を表すコード（固定値）"
* component.code.coding ^slicing.discriminator.type = #value
* component.code.coding ^slicing.discriminator.path = "system"
* component.code.coding ^slicing.rules = #open
* component.code.coding contains physicalExamCode 0..1
* component.code.coding[physicalExamCode] from JP_PhysicalExamCode_VS (required)
* component.code.coding[physicalExamCode].system = $JP_PhysicalExamCode_CS (exactly)
* component.code.coding[physicalExamCode].code 1..
* component.code.coding[physicalExamCode].code = $JP_PhysicalExamCode_CS#detailed-physical-findings (exactly)
* component.code.coding[physicalExamCode].display = "Detailed Physical Findings"
* component.code.coding[physicalExamCode] ^short = "身体所見項目コード。本ユースケースにおける項目コード推奨値をスライスにて示している【詳細参照】"
* component.code.coding[physicalExamCode] ^definition = "身体所見項目コード。本ユースケースにおける項目コード推奨値をスライスにて示している。"
* component.code.coding[physicalExamCode] ^comment = "推奨項目コードは必須ではない、派生先によるコード体系を作成し割り振ることを否定しない"
