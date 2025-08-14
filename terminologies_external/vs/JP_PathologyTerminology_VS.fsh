// ValueSets for Pathology diagnosis

ValueSet: JP_PathologyDiagnosis_VS
Id: jp-pathology-diagnosis-vs
Title: "JP Core Pathology Diagnosis ValueSet"
Description: "病理診断で使用される診断コードのValueSet"
* ^url = "http://jpfhir.jp/fhir/core/ValueSet/JP_PathologyDiagnosis_VS"
* ^status = #active
* ^experimental = false
* ^date = "2025-08-14"
* include codes from system $JP_PathologyTerminology_CS where concept is-a #tissue-diagnosis
* include codes from system $JP_PathologyTerminology_CS where concept is-a #cytology-diagnosis
* include codes from system $JP_PathologyTerminology_CS where concept is-a #morphology

ValueSet: JP_PathologySpecimenType_VS
Id: jp-pathology-specimen-type-vs
Title: "JP Core Pathology Specimen Type ValueSet"
Description: "病理診断で使用される標本種別のValueSet"
* ^url = "http://jpfhir.jp/fhir/core/ValueSet/JP_PathologySpecimenType_VS"
* ^status = #active
* ^experimental = false
* ^date = "2025-08-14"
* include codes from system $JP_PathologyTerminology_CS where concept is-a #specimen-type

ValueSet: JP_PathologyStaining_VS
Id: jp-pathology-staining-vs
Title: "JP Core Pathology Staining ValueSet"
Description: "病理診断で使用される染色方法のValueSet"
* ^url = "http://jpfhir.jp/fhir/core/ValueSet/JP_PathologyStaining_VS"
* ^status = #active
* ^experimental = false
* ^date = "2025-08-14"
* include codes from system $JP_PathologyTerminology_CS where concept is-a #staining

ValueSet: JP_PathologyOrgan_VS
Id: jp-pathology-organ-vs
Title: "JP Core Pathology Organ ValueSet"
Description: "病理診断で使用される臓器分類のValueSet"
* ^url = "http://jpfhir.jp/fhir/core/ValueSet/JP_PathologyOrgan_VS"
* ^status = #active
* ^experimental = false
* ^date = "2025-08-14"
* include codes from system $JP_PathologyTerminology_CS where concept is-a #organ

ValueSet: JP_PathologyObservationCode_VS
Id: jp-pathology-observation-code-vs
Title: "JP Core Pathology Observation Code ValueSet"
Description: "病理観察で使用されるコードのValueSet"
* ^url = "http://jpfhir.jp/fhir/core/ValueSet/JP_PathologyObservationCode_VS"
* ^status = #active
* ^experimental = false
* ^date = "2025-08-14"
* $Loinc_CS#33717-0 "Pathology report"
* $Loinc_CS#60568-3 "Pathology Synoptic report"
* $Loinc_CS#22634-0 "Pathology report final diagnosis"
* $Loinc_CS#22637-3 "Pathology report microscopic observation"
* $Loinc_CS#22636-5 "Pathology report gross observation"

ValueSet: JP_DocumentCodes_Pathology_VS
Id: jp-document-codes-pathology-vs
Title: "JP Core Document Codes Pathology ValueSet"
Description: "病理レポートで使用される文書コードのValueSet"
* ^url = "http://jpfhir.jp/fhir/core/ValueSet/JP_DocumentCodes_Pathology_VS"
* ^status = #active
* ^experimental = false
* ^date = "2025-08-14"
* $Loinc_CS#11526-1 "Pathology study"
* $Loinc_CS#60567-5 "Pathology Synoptic report"
* $Loinc_CS#33717-0 "Pathology report"
