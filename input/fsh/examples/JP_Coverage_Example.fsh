Instance: jp-coverage-example-1
InstanceOf: JP_Coverage
Title: "JP Core Coverage 健康保険証"
Description: "健康保険証"
Usage: #example
* status = #active
* extension[0].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Coverage_InsuredPersonSymbol"
* extension[=].valueString = "0000"
* extension[+].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Coverage_InsuredPersonNumber"
* extension[=].valueString = "0000"
* extension[+].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Coverage_InsuredPersonSubNumber"
* extension[=].valueString = "01"
* payor = Reference(Organization/jp-organization-example-payer)
* beneficiary = Reference(Patient/jp-patient-example-1)
* type = http://terminology.hl7.org/CodeSystem/v3-ActCode#PUBLICPOL
