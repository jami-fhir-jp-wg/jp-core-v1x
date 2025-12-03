ValueSet: JP_GenderedBirthOrder_VS
Id: jp-genderedbirthorder-vs
Title: "JP Core Gendered Birth Order ValueSet"
Description: "同性同胞内での出生順を表すValueSet。JP_GenderedBirthOrder_CS のジェンダー別コードを包含します。"
* ^url = "http://jpfhir.jp/fhir/core/ValueSet/JP_GenderedBirthOrder_VS"
* ^status = #active
* ^experimental = false
* ^date = "2025-12-01"

// Include all gendered birth order codes
* include codes $JP_GenderedBirthOrder_CS#GBO1_M
* include codes $JP_GenderedBirthOrder_CS#GBO1_F
* include codes $JP_GenderedBirthOrder_CS#GBO2_M
* include codes $JP_GenderedBirthOrder_CS#GBO2_F
* include codes $JP_GenderedBirthOrder_CS#GBO3_M
* include codes $JP_GenderedBirthOrder_CS#GBO3_F
* include codes $JP_GenderedBirthOrder_CS#GBO4_M
* include codes $JP_GenderedBirthOrder_CS#GBO4_F
* include codes $JP_GenderedBirthOrder_CS#GBO5_M
* include codes $JP_GenderedBirthOrder_CS#GBO5_F
* include codes $JP_GenderedBirthOrder_CS#GBO6_M
* include codes $JP_GenderedBirthOrder_CS#GBO6_F
* include codes $JP_GenderedBirthOrder_CS#GBO7_M
* include codes $JP_GenderedBirthOrder_CS#GBO7_F
* include codes $JP_GenderedBirthOrder_CS#GBO8_M
* include codes $JP_GenderedBirthOrder_CS#GBO8_F
* include codes $JP_GenderedBirthOrder_CS#GBO9_M
* include codes $JP_GenderedBirthOrder_CS#GBO9_F
* include codes $JP_GenderedBirthOrder_CS#GBO10_M
* include codes $JP_GenderedBirthOrder_CS#GBO10_F
