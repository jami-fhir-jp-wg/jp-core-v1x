// ==============================
//   CodeSystem 定義
// ==============================
CodeSystem: JP_ProcedureCodes_CS
Id: jp-procedurecodes-cs
Title: "JP ProcedureCodes CodeSystem"
* ^url = "http://jpfhir.jp/fhir/common/CodeSystem/JP_ProcedureCodes_CS"
* ^status = #draft
* ^date = "2022-03-25"
* ^caseSensitive = true
* ^content = #complete

// ==============================
//   ValueSet 定義
// ==============================
ValueSet: JP_ProcedureCodes_VS
Id: jp-procedurecodes-vs
Title: "JP ProcedureCodes ValueSet"
* ^url = "http://jpfhir.jp/fhir/common/ValueSet/JP_ProcedureCodes_VS"
* ^status = #draft
* ^date = "2022-03-25"
* include codes from system JP_ProcedureCodes_CS