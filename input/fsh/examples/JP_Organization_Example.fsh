Instance: jp-organization-example-payer
InstanceOf: JP_Organization
Title: "JP Core Organization ひまわり健康保険組合"
Description: "ひまわり健康保険組合"
Usage: #example
* type = http://terminology.hl7.org/CodeSystem/organization-type#pay "Payer"
* name = "ひまわり健康保険組合"
* identifier[+].system = "urn:oid:1.2.392.100495.20.3.61"
* identifier[=].value = "7654321"

Instance: jp-organization-example-clinic
InstanceOf: JP_Organization
Title: "JP Core Organization クリニック"
Description: "クリニック"
Usage: #example
* extension[0].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Organization_PrefectureNo"
* extension[=].valueIdentifier.system = "urn:oid:1.2.392.100495.20.3.21"
* extension[=].valueIdentifier.value = "13"
* extension[+].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Organization_InsuranceOrganizationCategory"
* extension[=].valueIdentifier.system = "urn:oid:1.2.392.100495.20.3.22"
* extension[=].valueIdentifier.value = "1"
* extension[+].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Organization_InsuranceOrganizationNo"
* extension[=].valueIdentifier.system = "urn:oid:1.2.392.100495.20.3.23"
* extension[=].valueIdentifier.value = "1234567"
* identifier[+].system = "http://jpfhir.jp/fhir/Common/IdSystem/insurance-medical-institution-no"
* identifier[=].value = "1234567"
* name = "太郎花子クリニック"
* address.line = "東京都文京区向丘３−２−１"
* address.city = "文京区"
* address.state = "東京都"
* address.country = "JPN"
