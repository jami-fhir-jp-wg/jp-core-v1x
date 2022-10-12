ValueSet: JP_MedicationCode_VS
Id: jp-medicationcode-vs
Title: "JP Core MedicationCode ValueSet"
Description: "医薬品処方コードの値セット"
* ^url = $JP_MedicationCode_VS
* ^status = #active
* ^experimental = false
* ^date = "2022-09-26"
* ^copyright = "Copyright 厚生労働省 & MEDIS-DC 医療情報システム開発センター & （株）医薬情報研究所"

* include codes from system $JP_MedicationCodeCommon_CS
* include codes from system $JP_MedicationCodeHOT13_CS
* include codes from system $JP_MedicationCodeHOT7_CS
* include codes from system $JP_MedicationCodeHOT9_CS
* include codes from system $JP_MedicationCodeYJ_CS
