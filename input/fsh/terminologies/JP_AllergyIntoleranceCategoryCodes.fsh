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
* #jp_food "jp_food" "食品を原因とするアレルギー"
* #jp_medication "jp_medication" "医薬品を原因とするアレルギー"
* #jp_environment_others "jp_environment_others" "食品と医薬品以外を原因とするアレルゲン（主に生活や環境に由来するアレルゲン）"

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
