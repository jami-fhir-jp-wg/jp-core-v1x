Instance:  jp-procedure-example
InstanceOf: JP_Procedure
Title:   "JP Core Procedure Example"
Usage:  #example
* id = "example"
* status = #completed
* category
  * coding
    * system = "http://jpfhir.jp/fhir/CodeSystem/procedurecategory"
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
  * reference = "Patient/example"
  * display = "・・・・"
* performedDateTime = "2021-08-24"
