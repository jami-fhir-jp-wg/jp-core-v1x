ValueSet: JP_AllergyIntolerance_VS
Id: jp-allergyintolerance-vs
Title: "JP Core AllergyIntolerance ValueSet"
Description: "アレルギー・不耐症に関連するアレルゲン値セット"
* ^url = $JP_AllergyIntolerance_VS
* ^status = #active
* ^experimental = false
* ^date = "2023-06-26"
* include codes from system $JP_JfagyFoodAllergen_CS
* include codes from system $JP_JfagyNonFoodNonMedicationAllergen_CS
* include codes from system $JP_JfagyMedicationAllergen_CS
