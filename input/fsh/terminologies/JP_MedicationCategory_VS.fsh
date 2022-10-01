ValueSet: JP_MedicationCategory_VS
Id: jp-medication-category-vs
Title: "JP Core Medication Oral/External Category ValueSet"
Description: "内服・外用の処方区分コードの値セット"
* ^url = $JP_MedicationCategory_VS
* ^status = #active
* ^experimental = false
* ^date = "2022-09-26"
* include codes from system $JP_MedicationCategoryMERIT9_CS
* include codes from system $JP_MedicationCategoryJHSP0007_CS
* include codes from system http://terminology.hl7.org/CodeSystem/v2-0482
