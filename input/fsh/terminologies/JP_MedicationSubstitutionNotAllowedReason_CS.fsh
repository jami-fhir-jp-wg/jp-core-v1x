CodeSystem: JP_MedicationSubstitutionNotAllowedReason_CS
Id: jp-medication-substitution-not-allowed-reason-cs
Title: "JP Core Medication Substitution Not Allowed Reason CodeSystem"
Description: "後発医薬品変更不可区分のコードシステム"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[=].value = "urn:oid:1.2.392.100495.20.2.41"
* ^url = $JP_MedicationSubstitutionNotAllowedReason_CS
* ^status = #active
* ^date = "2022-09-26"
* ^caseSensitive = true
* ^content = #complete
* #0    "変更可"
* #1    "後発品変更不可"
* #2    "剤形変更不可"
* #3    "含量規格変更不可"
