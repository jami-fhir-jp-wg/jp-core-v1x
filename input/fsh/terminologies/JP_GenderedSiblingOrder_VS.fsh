ValueSet: JP_GenderedSiblingOrder_VS
Id: jp-genderedsiblingorder-vs
Title: "JP Core Gendered Sibling Order ValueSet"
Description: "同性同胞内での出生順を表すValueSet。JP_GenderedSiblingOrder_CS のジェンダー別コードを包含します。"
* ^url = "http://jpfhir.jp/fhir/core/ValueSet/JP_GenderedSiblingOrder_VS"
* ^status = #active
* ^experimental = false
* ^date = "2025-12-01"

// Include all gendered sibling order codes
* include codes $JP_GenderedSiblingOrder_CS#GSO1_M
* include codes $JP_GenderedSiblingOrder_CS#GSO1_F
* include codes $JP_GenderedSiblingOrder_CS#GSO2_M
* include codes $JP_GenderedSiblingOrder_CS#GSO2_F
* include codes $JP_GenderedSiblingOrder_CS#GSO3_M
* include codes $JP_GenderedSiblingOrder_CS#GSO3_F
* include codes $JP_GenderedSiblingOrder_CS#GSO4_M
* include codes $JP_GenderedSiblingOrder_CS#GSO4_F
* include codes $JP_GenderedSiblingOrder_CS#GSO5_M
* include codes $JP_GenderedSiblingOrder_CS#GSO5_F
* include codes $JP_GenderedSiblingOrder_CS#GSO6_M
* include codes $JP_GenderedSiblingOrder_CS#GSO6_F
* include codes $JP_GenderedSiblingOrder_CS#GSO7_M
* include codes $JP_GenderedSiblingOrder_CS#GSO7_F
* include codes $JP_GenderedSiblingOrder_CS#GSO8_M
* include codes $JP_GenderedSiblingOrder_CS#GSO8_F
* include codes $JP_GenderedSiblingOrder_CS#GSO9_M
* include codes $JP_GenderedSiblingOrder_CS#GSO9_F
* include codes $JP_GenderedSiblingOrder_CS#GSO10_M
* include codes $JP_GenderedSiblingOrder_CS#GSO10_F
