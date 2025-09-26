// ==============================
//   CodeSystem 定義
// ==============================
CodeSystem: JP_ObservationCategory_CS
Id: jp-observationcategory-cs
Title: "JP Core Observation Category CodeSystem"
Description: "Observationカテゴリ用のコードシステム（病理追加）"
* ^url = "http://jpfhir.jp/fhir/core/CodeSystem/JP_ObservationCategory_CS"
* ^status = #active
* ^experimental = false
* ^date = "2025-01-15"
* ^caseSensitive = true
* ^content = #complete
* #pathology "Pathology" "病理検査"

// ==============================
//   ValueSet 定義
// ==============================
ValueSet: JP_ObservationPathologyCode_VS
Id: jp-observationpathologycode-vs
Title: "JP Core Observation Pathology Code ValueSet"
Description: "病理検査の観察項目を表すコードの値セット"
* ^url = "http://jpfhir.jp/fhir/core/ValueSet/JP_ObservationPathologyCode_VS"
* ^status = #active
* ^experimental = false
* ^date = "2025-01-15"
* $Loinc_CS#22634-0 "Pathology report gross observation Narrative"
* $Loinc_CS#22635-7 "Pathology report microscopic observation Narrative"
* $Loinc_CS#22637-3 "Pathology report final diagnosis Narrative"
* $Loinc_CS#22636-5 "Pathology report microscopic observation - Specimen Narrative"
* $Loinc_CS#33746-9 "Pathology report gross observation Narrative - Reported"
* $Loinc_CS#19139-5 "Pathology report immunohistochemistry Narrative"
* $Loinc_CS#50398-7 "Narrative diagnostic report [Interpretation] Cytology"
* $Loinc_CS#85699-7 "Autopsy report"