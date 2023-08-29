CodeSystem: JP_MedicationMethodJAMIBasicUsage_CS
Id: jp-medication-method-jami-basic-usage-cs
Title: "JP Core Medication JAMI Basic Usage Type CodeSystem"
Description: "JAMI標準用法規格表１基本用法区分のコードシステム"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[=].value = "urn:oid:1.2.392.200250.2.2.20.30"
* ^url = $JP_MedicationMethodJAMIBasicUsage_CS
* ^version = "1.0.0"
* ^status = #active
* ^experimental = false
* ^date = "2023-06-26"
* ^caseSensitive = true
* ^valueSet = $JP_MedicationMethodJAMIBasicUsage_VS
* ^content = #complete
* ^copyright = "Copyright Japan Association of Medical Informatics (JAMI)  一般社団法人日本医療情報学会 https://www.jami.jp/jamistd/"
* ^publisher = "一般社団法人日本医療情報学会"
* ^contact.name = "一般社団法人日本医療情報学会"
* #1 "内服"
* #2 "外用"
* #3 "注射"
* #4 "注入"
