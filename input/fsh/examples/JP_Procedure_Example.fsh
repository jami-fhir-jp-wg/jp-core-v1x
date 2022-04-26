Instance:  jp-procedure-example1
InstanceOf: JP_Procedure
Title:   "JP Core Procedure Example1"
Usage:  #example
* status = #completed
* category
  * coding
    * system = "http://terminology.hl7.org/CodeSystem/procedurecategory"
    * code = #srg
    * display = "手術処置"
  * text = "・・・"
* code
  * coding
    * system = "http://jpfhir.jp/fhir/CodeSystem/Procedure"
    * code = #1234567
    * display = "・・・"
  * text = "・・・"
* subject
  * reference = "Patient/jp-patient-example1"
  * display = "・・・・"
* performedDateTime = "2021-08-24"
