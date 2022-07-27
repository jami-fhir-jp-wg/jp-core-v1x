Instance: jp-coverage-example-1
InstanceOf: JP_Coverage
Title: "JP Core Coverage 健康保険証"
Description: "健康保険証"
Usage: #example
* status = #active
* identifier[insuredIdentifier].extension[insuredPersonSymbol].url = $JP_Coverage_InsuredPersonSymbol
* identifier[insuredIdentifier].extension[insuredPersonSymbol].valueString = "宮６"
* identifier[insuredIdentifier].extension[insuredPersonNumber].url = $JP_Coverage_InsuredPersonNumber
* identifier[insuredIdentifier].extension[insuredPersonNumber].valueString = "1-2"
* identifier[insuredIdentifier].extension[insuredPersonSubNumber].url = $JP_Coverage_InsuredPersonSubNumber
* identifier[insuredIdentifier].extension[insuredPersonSubNumber].valueString = "01"
* identifier[insuredIdentifier].system = $insured-identifier
* identifier[insuredIdentifier].value = "宮 6・1-2（枝番）01"
* payor = Reference(jp-organization-example-payer)
* beneficiary = Reference(Patient/jp-patient-example-1)
* type = http://terminology.hl7.org/CodeSystem/v3-ActCode#PUBLICPOL
