Instance:  jp-procedure-example-1
InstanceOf: JP_Procedure
Title:   "JP Core Procedure Basic Example"
Usage:  #example
* status = #completed
* category
  * coding
    * system = "http://jpfhir.jp/fhir/Common/CodeSystem/***"
    * code = #surgical
    * display = "手術処置"
  * text = "・・・"
* code
  * coding
    * system = "http://jpfhir.jp/fhir/Common/CodeSystem/JP_ProcedureCodes_CS"
    * code = #demo_cataract_surgery
  * text = "・・・"
* subject
  * reference = "Patient/jp-patient-example-1"
  * display = "山田 太郎"
* performedDateTime = "2021-08-24"
