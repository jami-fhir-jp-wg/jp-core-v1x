// ==============================
//   Profile 定義
// ==============================
Profile: JP_Observation_VitalSigns
Parent: JP_Observation_Common
Id: jp-observation-vitalsigns
Title: "JP Core Observation VitalSigns Profile"
Description: "このプロファイルはObservationリソースに対して、バイタルサインのデータを送受信するための制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_VitalSigns"
* ^status = #active
* ^date = "2024-12-30"
* . ^short = "バイタルサインに関する測定や簡単な観察事実（assertion）"
* . ^definition = "バイタルサインに関する測定と簡単な観察事実（assertion）。"
* . ^comment = "バイタルサインに関するObservation（検査測定や観察事実）の制約プロフィール"
* category 1..
* category contains
    second 0..*
* category[first].coding.code = $JP_SimpleObservationCategory_CS#vital-signs (exactly)
* category[second] from JP_ObservationVitalSignsCategory_VS (preferred)
* category[second].coding.system = $JP_ObservationVitalSignsCategory_CS (exactly)
* category[second] ^comment = "MEDISの看護実践用語標準マスター＜看護観察編＞の大分類１．バイタルサイン・基本情報、中分類１．バイタルサインの「焦点」"
* code from JP_ObservationVitalSignsCode_VS (preferred)
* code ^comment = "MEDISの看護実践用語標準マスター＜看護観察編＞の大分類１．バイタルサイン・基本情報、中分類１．バイタルサインの「観察名称」"
* subject 1..
* subject only Reference(JP_Patient)
* subject ^comment = "【JP Core仕様】患者"
* encounter ^comment = "【JP Core仕様】診察"
* effective[x] only dateTime or Period
* effective[x] ^comment = "【JP Core仕様】effectiveDateTime：医療者が確認した日時  
effectivePeriod：医療者が確認した期間"
* hasMember only Reference(JP_Observation_Common or QuestionnaireResponse or MolecularSequence or JP_Observation_VitalSigns)
* hasMember ^comment = "【JP Core仕様】関連する参照リソースにJP_Observation_VitalSignsを追加"
* derivedFrom only Reference(DocumentReference or ImagingStudy or Media or QuestionnaireResponse or JP_Observation_Common or MolecularSequence or JP_Observation_VitalSigns)
* derivedFrom ^comment = "【JP Core仕様】導出元の参照リソースにJP_Observation_VitalSignsを追加"
* component.code from JP_ObservationVitalSignsCode_VS (preferred)
 