ValueSet: JP_AllergyIntolerance_VS
Id: jp-allergyintolerance-vs
Title: "JP Core AllergyIntolerance ValueSet"
Description: "アレルギー・不耐症に関連するアレルゲンコード"
* ^url = $JP_AllergyIntolerance_VS
* ^status = #draft
* include codes from system JP_JfagyFoodAllergen_CS
* include codes from system JP_JfagyNonFoodNonMedicationAllergen_CS
* include codes from system JP_JfagyMedicationAllergen_CS