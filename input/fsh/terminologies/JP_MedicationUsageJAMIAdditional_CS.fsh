CodeSystem: JP_MedicationUsageJAMIAdditional_CS
Id: jp-medication-usage-jami-additional-cs
Title: "JP Core Medication JAMI Additional Usage CodeSystem"
Description: "JAMI標準用法規格補足用法コードのコードシステム"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[=].value = "urn:oid:1.2.392.200250.2.2.20.22"
* ^url = $JP_MedicationUsageJAMIAdditional_CS
* ^status = #active
* ^experimental = false
* ^date = "2022-09-26"
* ^caseSensitive = true
* ^content = #fragment
* #I1100000 "１日おき"
* #W0100100 "月曜日、木曜日"
* #D0AK0000 "毎月10日、20日"
* #DCAKU000 "12月10日、12月20日、12月30日"
* #D1FU0000 "1月15日、1月30日"
* #D0148BFI "毎月1日、4日、8日、11日、15日、18日"
* #D0MPT000 "毎月22日、25日、29日"
* #CW100000 "週１回"
