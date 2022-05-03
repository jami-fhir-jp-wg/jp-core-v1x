// ==============================
//   CodeSystem 定義
// ==============================
CodeSystem: JP_AllergyIntoleranceCategoryCodes_CS
Id: jp-allergyintolerancecategorycodes-cs
Title: "JP AllergyIntoleranceCategoryCodes CodeSystem"
* ^url = "http://jpfhir.jp/fhir/Common/CodeSystem/JP_AllergyIntoleranceCategoryCodes_CS"
* ^status = #draft
* ^date = "2022-03-25"
* ^caseSensitive = true
* ^content = #complete
* #food "food" "食品を原因とするアレルギー"
* #medication "medication" "医薬品を原因とするアレルギー"
* #environment "environment" "生活環境因子を原因とするアレルギー"
* #others "others" "それ以外を原因とするアレルギー"

// ==============================
//   ValueSet 定義
// ==============================
ValueSet: JP_AllergyIntoleranceCategoryCodes_VS
Id: jp-allergyintolerancecategorycodes-vs
Title: "JP AllergyIntoleranceCategoryCodes ValueSet"
* ^url = "http://jpfhir.jp/fhir/Common/ValueSet/JP_AllergyIntoleranceCategoryCodes_VS"
* ^status = #draft
* ^date = "2022-03-25"
* include codes from system JP_AllergyIntoleranceCategoryCodes_CS
