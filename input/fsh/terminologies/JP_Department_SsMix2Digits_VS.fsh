ValueSet: JP_Department_SsMix2Digits_VS
Id: jp-department-ssmix2digits-vs
Title: "JP Core Department SS-MIX 2Digits ValueSet"
Description: "SS-MIX統一診療科コード(２桁)の値セット"
* ^url = $JP_Department_SsMix2Digits_VS
* ^status = #draft
* include codes from system $JP_Department_SsMix_CS where concept descendent-of #2Digits

