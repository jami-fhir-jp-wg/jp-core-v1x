Instance: jp-coverage-example-1
InstanceOf: JP_Coverage
Title: "JP Core Coverage 健康保険証"
Description: "健康保険証"
Usage: #example
* status = #active
* identifier[insuredIdentifier].extension[insuredPersonSymbol].valueString = "宮 6"
* identifier[insuredIdentifier].extension[insuredPersonNumber].valueString = "1-2"
* identifier[insuredIdentifier].extension[insuredPersonSubNumber].valueString = "01"
* identifier[insuredIdentifier].value = "宮 6・1-2（枝番）01"
* identifier[insuredIdentifier].period.start = "2022-01-04"
* payor = Reference(jp-organization-example-payer)
* beneficiary = Reference(Patient/jp-patient-example-1)
* type = http://terminology.hl7.org/CodeSystem/v3-ActCode#PUBLICPOL
