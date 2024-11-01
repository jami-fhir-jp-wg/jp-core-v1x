Instance: jp-coverage-example-1
InstanceOf: JP_Coverage
Title: "JP Core Coverage Example 健康保険証"
Description: "健康保険証"
Usage: #example
* contained[+] = jp-organization-example-assigner
* status = #active
* extension[0].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Coverage_InsuredPersonSymbol"
* extension[=].valueString = "あいう"
* extension[+].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Coverage_InsuredPersonNumber"
* extension[=].valueString = "１８７"
* extension[+].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Coverage_InsuredPersonSubNumber"
* extension[=].valueString = "00"
* identifier[insuranceIdentifier].system = "http://jpfhir.jp/fhir/clins/Idsystem/JP_Insurance_memberID"
* identifier[insuranceIdentifier].value = "00012345:あいう:１８７:05"
* identifier[insuranceIdentifier].assigner = Reference(Organization/jp-organization-example-assigner)
* subscriberId = "あいう:１８７"
* dependent = "05"
* payor = Reference(Organization/jp-organization-example-assigner)
* beneficiary = Reference(Patient/jp-patient-example-1)
* type = http://terminology.hl7.org/CodeSystem/v3-ActCode#PUBLICPOL



Instance: jp-organization-example-assigner
InstanceOf: JP_Organization
Title: "JP Core Organization Example ひまわり健康保険組合"
Description: "あじさい健康保険組合"
Usage: #inline
* type = http://terminology.hl7.org/CodeSystem/organization-type#pay "Payer"
* name = "あじさい健康保険組合"
* identifier[insurerNumber].system = "urn:oid:1.2.392.100495.20.3.61"
* identifier[insurerNumber].value = "12345"

