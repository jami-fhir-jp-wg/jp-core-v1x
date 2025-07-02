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
* ^date = "2025-07-04"
* . ^short = "身体計測に関する測定や簡単な観察事実（assertion）"
* . ^definition = "患者の身体計測に関する測定と簡単な観察事実（assertion）。"
* . ^comment = "身体計測に関するObservation（検査測定や観察事実）の制約プロフィール"
* category 1..
* category contains
    second 0..*
* category[first].coding.code = #body-measurement (exactly)
* category[second] from $JP_ObservationBodyMeasurementCategory_VS (preferred)
* category[second].coding.system = $JP_ObservationBodyMeasurementCategory_CS
* category[second] ^comment = "MEDISの看護実践用語標準マスター＜看護観察編＞の大分類１．バイタルサイン・基本情報、中分類2．身体計測の「焦点」"
* code from JP_ObservationBodyMeasurementCode_VS (preferred)
* code ^comment = "MEDISの看護実践用語標準マスター＜看護観察編＞の大分類１．バイタルサイン・基本情報、中分類2．身体計測の「観察名称」"
* subject 1..
* subject only Reference(JP_Patient)
* subject ^comment = "【JP Core仕様】患者"
* encounter ^comment = "【JP Core仕様】診察"
* effective[x] only dateTime or Period
* effective[x] ^comment = "【JP Core仕様】effectiveDateTime：医療者が確認した日時  
effectivePeriod：医療者が確認した期間"
* hasMember only Reference(JP_Observation_Common or QuestionnaireResponse or MolecularSequence or JP_Observation_BodyMeasurement)
* hasMember ^comment = "【JP Core仕様】関連する参照リソースにJP_Observation_BodyMeasurementを追加"
* derivedFrom only Reference(DocumentReference or ImagingStudy or Media or QuestionnaireResponse or JP_Observation_Common or MolecularSequence or JP_Observation_BodyMeasurement)
* derivedFrom ^comment = "【JP Core仕様】導出元の参照リソースにJP_Observation_BodyMeasurementを追加"