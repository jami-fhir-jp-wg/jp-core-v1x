Alias: $dummy = http://jpfhir.jp/fhir/core/ValueSet/JP_MedicationCategory_VS

// ==============================
//   Profile 定義
// ==============================
Profile: JP_ImagingStudy_Endoscopy
Parent: ImagingStudy
Id: jp-imagingstudy-endoscopy
Title: "JP Core ImagingStudy Endoscopy Profile"
Description: "このプロファイルはImagingStudyリソースに対して、主に内視鏡検査で撮影された画像に関わるデータを送受信するための制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_ImagingStudy_Endoscopy"
* ^status = #active
* ^date = "2024-11-18"
* . ^short = "内視鏡を使用したDICOM画像検査に関する情報"
//* modality from $JP_DICOMModality_VS (required)
* modality from $dummy (required)
//* subject MS
//* subject only Reference(JP_Patient)
//* encounter only Reference(JP_Encounter)
//* referrer only Reference(JP_Practitioner)
//* interpreter only Reference(JP_Practitioner)
//* procedureReference only Reference(JP_Procedure)
//* procedureCode from http://playbook.radlex.org/playbook/SearchRadlexAction (extensible)
* procedureCode from $dummy (extensible)
//* location only Reference(JP_Location)
//* reasonCode from $JP_ReasonCodesJed_VS (example)
* reasonCode from $dummy (example)
//* reasonReference only Reference(JP_DiagnosticReport_Endoscopy)
//* series.modality MS
//* series.modality from $JP_DICOMModality_VS (required)
* series.modality from $dummy (required)
//* series.bodySite from JP_ImagingStudy_Radiology_BodySite_VS (example)
* series.bodySite from $dummy (example)
//* series.instance.uid MS
//* series.instance.sopClass MS
