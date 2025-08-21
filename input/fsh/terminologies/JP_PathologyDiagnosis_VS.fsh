// ==============================
//   ValueSet 定義
// ==============================
ValueSet: JP_PathologyDiagnosis_VS
Id: jp-pathologydiagnosis-vs
Title: "JP Core Pathology Diagnosis ValueSet"
Description: "病理診断で使用する診断コードの値セット"
* ^url = "http://jpfhir.jp/fhir/core/ValueSet/JP_PathologyDiagnosis_VS"
* ^status = #active
* ^experimental = false
* ^date = "2025-01-15"
* include codes from system $SnomedCT_CS where concept is-a #116148006 "Tissue specimen from lung (specimen)"
* include codes from system $SnomedCT_CS where concept is-a #91723000 "Anatomical pathology procedure (procedure)"
* include codes from system $ICD10_CS

// ==============================
//   ValueSet 定義
// ==============================
ValueSet: JP_DocumentCodes_Pathology_VS
Id: jp-documentcodes-pathology-vs
Title: "JP Core Document Codes Pathology ValueSet"
Description: "病理レポートの文書タイプを表すコードの値セット"
* ^url = "http://jpfhir.jp/fhir/core/ValueSet/JP_DocumentCodes_Pathology_VS"
* ^status = #active
* ^experimental = false
* ^date = "2025-01-15"
* $Loinc_CS#60568-3 "Pathology Synoptic report"
* $Loinc_CS#22637-3 "Pathology report final diagnosis Narrative"
* $Loinc_CS#22636-5 "Pathology report microscopic observation Narrative"
* $Loinc_CS#22634-0 "Pathology report gross observation Narrative"
* $Loinc_CS#11526-1 "Pathology study"
* $Loinc_CS#33746-9 "Pathology report gross observation Narrative - Reported"