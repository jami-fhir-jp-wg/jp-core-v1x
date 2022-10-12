ValueSet: JP_Department_SsMix2Digits_VS
Id: jp-department-ssmix2digits-vs
Title: "JP Core Department SS-MIX 2Digits ValueSet"
Description: "SS-MIX統一診療科コード(２桁)の値セット"
* ^url = $JP_Department_SsMix2Digits_VS
* ^status = #active
* ^experimental = false
* ^date = "2022-09-26"
* ^copyright = "Copyright Japan Association of Medical Informatics (JAMI)  一般社団法人日本医療情報学会"

* include codes from system $JP_Department_SsMix_CS where concept descendent-of #2Digits

ValueSet: JP_Department_SsMix3Digits_VS
Id: jp-department-ssmix3digits-vs
Title: "JP Core Department SS-MIX 3Digits ValueSet"
Description: "SS-MIX統一診療科コード(３桁)の値セット"
* ^url = $JP_Department_SsMix3Digits_VS
* ^status = #active
* ^experimental = false
* ^date = "2022-09-26"
* ^copyright = "Copyright Japan Association of Medical Informatics (JAMI)  一般社団法人日本医療情報学会"

* include codes from system $JP_Department_SsMix_CS where concept descendent-of #3Digits

ValueSet: JP_Department_SsMix_VS
Id: jp-department-ssmix-vs
Title: "JP Core Department SS-MIX ValueSet"
Description: "SS-MIX統一診療科コードの値セット"
* ^url = $JP_Department_SsMix_VS
* ^status = #active
* ^experimental = false
* ^date = "2022-09-26"
* ^copyright = "Copyright Japan Association of Medical Informatics (JAMI)  一般社団法人日本医療情報学会"

* include codes from system $JP_Department_SsMix_CS

