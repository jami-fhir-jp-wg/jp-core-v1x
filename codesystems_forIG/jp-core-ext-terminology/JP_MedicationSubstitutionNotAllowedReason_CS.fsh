CodeSystem: JP_MedicationSubstitutionNotAllowedReason_CS
Id: jp-medicationsubstitutionnotallowedreason-cs
Title: "JP Core Medication Substitution Not Allowed Reason CodeSystem"
Description: "後発医薬品変更不可区分のコードシステム 厚労省電子処方CDA規格別表8 後発品変更不可コード"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[=].value = "urn:oid:1.2.392.100495.20.2.41"
* ^url = $JP_MedicationSubstitutionNotAllowedReason_CS
* ^version = "1.0.0"
* ^status = #active
* ^experimental = false
* ^date = "2023-06-26"
* ^caseSensitive = true
* ^content = #complete

* #0 "変更可"
* #1 "後発品変更不可"
* #2 "剤形変更不可"
* #3 "含量規格変更不可"
