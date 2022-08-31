ValueSet: JP_Department_SsMix3Digits_VS
Id: jp-department-ssmix3digits-vs
Title: "JP Core Department SS-MIX 3Digits ValueSet"
Description: "SS-MIX統一診療科コード(３桁)の値セット"
* ^url = $JP_Department_SsMix3Digits_VS
* ^status = #draft
* include codes from system $JP_Department_SsMix_CS where concept descendent-of #3Digits

