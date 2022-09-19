CodeSystem: JP_MedicationMethodJAMIBasicUsage_CS
Id: jp-medication-method-jami-basic-usage-cs
Title: "JP Core Medication JAMI Basic Usage Type CodeSystem"
Description: "JAMI標準用法規格表１基本用法区分のコードシステム"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[=].value = "urn:oid:1.2.392.200250.2.2.20.30"
* ^url = $JP_MedicationMethodJAMIBasicUsage_CS
* ^status = #active
* ^date = "2022-09-26"
* ^caseSensitive = true
* ^valueSet = $JP_MedicationMethodJAMIBasicUsage_VS
* ^content = #complete
* #1    "内服"
* #2    "外用"
* #3    "注射"
* #4    "注入"
