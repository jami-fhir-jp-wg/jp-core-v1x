Instance: jp-organization-example-payer
InstanceOf: JP_Organization
Title: "JP Core Organization Example ひまわり健康保険組合"
Description: "ひまわり健康保険組合"
Usage: #example
* type = http://terminology.hl7.org/CodeSystem/organization-type#pay "Payer"
* name = "ひまわり健康保険組合"
* identifier[insurerNumber].system = "urn:oid:1.2.392.100495.20.3.61"
* identifier[insurerNumber].value = "7654321"

Instance: jp-organization-example-clinic
InstanceOf: JP_Organization
Title: "JP Core Organization Example クリニック"
Description: "太郎花子クリニック"
Usage: #example
* extension[0].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Organization_PrefectureNo"
* extension[=].valueCoding = $JP_PrefectureNumber_CS#13
* extension[+].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Organization_InsuranceOrganizationCategory"
* extension[=].valueCoding = $JP_MedicalFeeScoreType_CS#1
* extension[+].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Organization_InsuranceOrganizationNo"
* extension[=].valueIdentifier.system = "urn:oid:1.2.392.100495.20.3.23"
* extension[=].valueIdentifier.value = "1234567"
* identifier[[medicalInstitutionCode].system = "http://jpfhir.jp/fhir/core/IdSystem/insurance-medical-institution-no"
* identifier[[medicalInstitutionCode].value = "1311234567"
* name = "太郎花子クリニック"
* address.line = "東京都文京区本郷Ｘ−Ｘ−Ｘ"
* address.city = "文京区"
* address.state = "東京都"
* address.country = "JPN"


Instance: jp-organization-example-hospital
InstanceOf: JP_Organization
Title: "JP Core Organization Example 病院"
Description: "健康第一病院"
Usage: #example
* extension[0].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Organization_PrefectureNo"
* extension[=].valueCoding = $JP_PrefectureNumber_CS#13
* extension[+].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Organization_InsuranceOrganizationCategory"
* extension[=].valueCoding = $JP_MedicalFeeScoreType_CS#1
* extension[+].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Organization_InsuranceOrganizationNo"
* extension[=].valueIdentifier.system = "urn:oid:1.2.392.100495.20.3.23"
* extension[=].valueIdentifier.value = "9876543"
* identifier[medicalInstitutionCode].system = "http://jpfhir.jp/fhir/core/IdSystem/insurance-medical-institution-no"
* identifier[medicalInstitutionCode].value = "1319876543"
* name = "健康第一病院"
* address.line = "東京都文京区本郷Ｙ−Ｙ−Ｙ"
* address.city = "文京区"
* address.state = "東京都"
* address.country = "JPN"

Instance: jp-organization-example-inspection
InstanceOf: JP_Organization
Title: "JP Core Organization Example ＡＢＣ検査株式会社"
Description: "ＡＢＣ検査株式会社"
Usage: #example
* type = http://terminology.hl7.org/CodeSystem/organization-type#team "Organizational team"
* name = "ひまわりＡＢＣ検査株式会社健康保険組合"
* identifier[@default].system = "http://abc-hospital.local/fhir/Organization/localcode"
* identifier[@default].value = "000-000-000"