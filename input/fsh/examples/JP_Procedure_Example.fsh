Instance:  jp-procedure-example-1
InstanceOf: JP_Procedure
Title:   "JP Core Procedure Example 処置（抜糸）"
Description: "前額部に創傷処置を施術しフォローアップとして縫合糸の除去を予定している例"
Usage:  #example
* status = #in-progress
* category
  * coding
    * system = "http://jpfhir.jp/fhir/Common/CodeSystem/JP_ProcedureCategoryCodes_CS"
    * code = #JPPCC004
    * display = "外科的処置"
  * text = "創傷処置"
* code
  * coding
    * system = "http://jpfhir.jp/fhir/Common/CodeSystem/JP_ProcedureCodesMedical_CS"
    * code = #140000610
  * text = "創傷処置（１００ｃｍ２未満）"
* subject
  * reference = "Patient/jp-patient-example-1"
  * display = "山田 太郎"
* performedDateTime = "2022-08-03"
* bodySite
  * text = "前額部"
* outcome
  * coding
    * system = "http://jpfhir.jp/fhir/Common/ValueSet/JP_ProcedureOutcomeCodes_CS"
    * code = #JPPOC001
    * display = "成功"
* followUp
  * text = "縫合糸の除去"
