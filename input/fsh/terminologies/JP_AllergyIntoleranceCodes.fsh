// ==============================
//   CodeSystem 定義
// ==============================
CodeSystem: JP_AllergyIntoleranceCodes_CS
Id: jp-allergyintolerancecodes-cs
Title: "JP AllergyIntoleranceCodes CodeSystem"
* ^url = "http://jpfhir.jp/fhir/Common/CodeSystem/JP_AllergyIntoleranceCodes_CS"
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
ValueSet: JP_AllergyIntoleranceCodes_VS
Id: jp-allergyintolerancecodes-vs
Title: "JP AllergyIntoleranceCodes ValueSet"
* ^url = "http://jpfhir.jp/fhir/Common/ValueSet/JP_AllergyIntoleranceCodes_VS"
* ^status = #draft
* ^date = "2022-03-25"
* include codes from system JP_AllergyIntoleranceCodes_CS
