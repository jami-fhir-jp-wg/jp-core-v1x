// ==============================
//   CodeSystem 定義
// ==============================
CodeSystem: JP_ProcedureCodes_CS
Id: jp-procedurecodes-cs
Title: "JP ProcedureCodes CodeSystem"
* ^url = "http://jpfhir.jp/fhir/Common/CodeSystem/JP_ProcedureCodes_CS"
* ^status = #draft
* ^date = "2022-03-25"
* ^caseSensitive = true
* ^content = #complete
*  #demo_cataract_surgery "白内障手術"

// CodeSystem: JP_ProcedureCategory_CS_Test
// Id: jp-procedurecategory-cs
// Title: "JP Procedure Category CodeSystem"
// Description: "Procedure Categoryの日本国内でのコードセット"
// * ^url = "http://jpfhir.jp/fhir/Common/CodeSystem/JP_ProcedureCategory_CS"
// * ^status = #draft
// * ^date = "2022-05-06"
// * #psychiatry "Psychiatry procedure or service"
//     "精神疾患に対する施術もしくはサービス"
// * #counselling "Counselling"
//     "カウンセリング"
// * #surgical "Surgical procedure"
//     "手術および処置"
// * #diagnostic "Diagnostic procedure"
//     "診断のための行為"
// * #chiropractic "Chiropractic manipulation"
//     "整体に関する施術"
// * #social "Social service procedure"
//     "社会的な行為"
// * #document "Document procedure"
//     "文書作成に関する行為"
// * #management "Medical management procedure"
//     "各種患者の疾病管理"

// ==============================
//   ValueSet 定義
// ==============================
ValueSet: JP_ProcedureCodes_VS
Id: jp-procedurecodes-vs
Title: "JP ProcedureCodes ValueSet"
* ^url = "http://jpfhir.jp/fhir/Common/ValueSet/JP_ProcedureCodes_VS"
* ^status = #draft
* ^date = "2022-03-25"
* include codes from system JP_ProcedureCodes_CS

// ValueSet: JP_ProcedureCategory_VS_Test
// Id: jp-procedurecategory-vs
// Title: "JP ProcedureCodes ValueSet"
// * ^url = "http://jpfhir.jp/fhir/Common/ValueSet/JP_ProcedureCategory_VS"
// * ^status = #draft
// * ^date = "2022-05-06"
// * include codes from system JP_ProcedureCategory_CS