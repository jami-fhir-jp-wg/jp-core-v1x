CodeSystem: JP_Loic_display
Id: jp-loinc-display
Title: "Japanese supplement for CodeSystem Loinc"
Description: "http://loinc.orgに日本語displayを追加"
* ^url = "http://jpfhir.jp/core/terminology/CodeSystemJPDisplay/Loinc"
* ^title = "http://loinc.orgに日本語displayを追加"

* ^version = "1.4.0"
* ^status = #active
* ^content = #supplement
// * ^caseSensitive = true
* ^experimental = false
* ^publisher = "（一社）日本医療情報学会"
* ^copyright = "（一社）日本医療情報学会. CC BY-ND 4.0"

* ^supplements = "http://loinc.org"

* ^concept[+].code = #LP29684-5
* ^concept[=].designation[+].language = #ja
* ^concept[=].designation[=].value = "放射線"

* ^concept[+].code = #LP29693-6
* ^concept[=].designation[+].language = #ja
* ^concept[=].designation[=].value = "検体検査"

* ^concept[+].code = #LP7796-8 
* ^concept[=].designation[+].language = #ja
* ^concept[=].designation[=].value = "内視鏡"

* ^concept[+].code = #LP7819-8 
* ^concept[=].designation[+].language = #ja
* ^concept[=].designation[=].value = "微生物検査"

* ^concept[+].code = #18725-2
* ^concept[=].designation[+].language = #ja
* ^concept[=].designation[=].value = "微生物学検査"
