Instance: jp-medicationadministration-example-1
InstanceOf: JP_MedicationAdministration
Title: "JP Core MedicationAdministration Example 投薬実施 ムコダイン錠２５０ｍｇ"
Description: "投薬実施 ムコダイン錠２５０ｍｇ"
Usage: #example
* meta.profile = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationAdministration"
* extension[0].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_RequestDepartment"
* extension[=].valueCodeableConcept = $JP_Department_SsMix_CS#01 "内科"
* extension[+].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Requester"
* extension[=].valueReference = Reference(Practitioner/jp-practitioner-example-female-1) "東京 春子"
* extension[+].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_RequestAuthoredOn"
* extension[=].valueDateTime = "2016-08-25T00:00:00+09:00"
* extension[+].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Location"
* extension[=].valueReference = Reference(Location/jp-location-example-ward) "09A病棟 021病室 4ベッド"
* identifier[rpNumber].system = "urn:oid:1.2.392.100495.20.3.81"
* identifier[rpNumber].value = "1"
* identifier[orderInRp].system = "urn:oid:1.2.392.100495.20.3.82"
* identifier[orderInRp].value = "1"
* identifier[requestIdentifier].system = "http://jpfhir.jp/fhir/core/IdSystem/resourceInstance-identifier"
* identifier[requestIdentifier].value = "1234567890.1.1"
* status = #completed
* category = $JP_MedicationFeeScoreCategory_CS#medication "投薬"
* medicationCodeableConcept = $JP_MedicationCodeHOT9_CS#103835401 "ムコダイン錠２５０ｍｇ"
* subject = Reference(Patient/jp-patient-example-1)
* effectiveDateTime = "2016-08-25T08:30:00+09:00"
* performer.function = http://terminology.hl7.org/CodeSystem/med-admin-perform-function#performer "Performer"
* performer.actor = Reference(Practitioner/jp-practitioner-example-female-1) "福岡 花子"
* request = Reference(MedicationRequest/jp-medicationrequest-example-1)
* dosage.route = $JP_MedicationMethodJAMIDetailUsage_CS#10 "経口"
* dosage.method = $JP_MedicationMethodJAMIBasicUsage_CS#1 "内服"
* dosage.dose = 1 $JP_MedicationUnitMERIT9_CS#TAB "錠"

Instance: jp-medicationadministration-example-2
InstanceOf: JP_MedicationAdministration
Title: "JP Core MedicationAdministration Example 投薬中止 パンスポリンＴ錠１００ １００ｍｇ"
Description: "投薬中止 パンスポリンＴ錠１００ １００ｍｇ"
Usage: #example
* meta.profile = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationAdministration"
* extension[0].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_RequestDepartment"
* extension[=].valueCodeableConcept = $JP_Department_SsMix_CS#01 "内科"
* extension[+].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Requester"
* extension[=].valueReference = Reference(Practitioner/jp-practitioner-example-male-1) "大阪 一郎"
* extension[+].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_RequestAuthoredOn"
* extension[=].valueDateTime = "2016-08-25T00:00:00+09:00"
* identifier[rpNumber].system = "urn:oid:1.2.392.100495.20.3.81"
* identifier[rpNumber].value = "1"
* identifier[orderInRp].system = "urn:oid:1.2.392.100495.20.3.82"
* identifier[orderInRp].value = "1"
* identifier[requestIdentifier].system = "http://jpfhir.jp/fhir/core/IdSystem/resourceInstance-identifier"
* identifier[requestIdentifier].value = "1234567890.1.1"
* status = #stopped
* category = $JP_MedicationFeeScoreCategory_CS#medication "投薬"
* medicationCodeableConcept = $JP_MedicationCodeHOT9_CS#110926901 "パンスポリンＴ錠１００ １００ｍｇ"
* subject = Reference(Patient/jp-patient-example-1)
* effectiveDateTime = "2016-08-25T08:30:00+09:00"
* request = Reference(MedicationRequest/jp-medicationrequest-example-2)
