CodeSystem: JP_MedicationCodeHOT9_CS
Id: jp-medicationcode-hot9-cs
Title: "JP Core MedicationCode HOT9 CodeSystem"
Description: "医薬品HOT9コードのコードシステム"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[=].value = "urn:oid:1.2.392.200119.4.403.1"
* ^identifier[+].system = "urn:ietf:rfc:3986"
* ^identifier[=].value = "urn:oid:1.2.392.100495.20.2.74"
* ^url = $JP_MedicationCodeHOT9_CS
* ^status = #active
* ^date = "2022-09-26"
* ^caseSensitive = true
// * ^valueSet = $JP_MedicationCodeHOT9_VS
* ^content = #fragment

// TODO: Terminology Serverに移動したら削除する　（HOT9医薬品コード追加）
* #100558502 "ホリゾン注射液１０ｍｇ"
* #103835401 "ムコダイン錠２５０ｍｇ"
* #107750602 "ソリタ－Ｔ３号輸液５００ｍＬ"
* #108010001 "アドナ注（静脈用）５０ｍｇ／１０ｍＬ"
* #110626901 "パンスポリンＴ錠１００ １００ｍｇ"
* #182110901 "コミナティ筋注"
