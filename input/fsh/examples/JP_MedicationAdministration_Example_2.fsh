Instance: jp-medicationadministration-example-2
InstanceOf: JP_MedicationAdministration
Title: "JP MedicationAdministration 投薬中止"
Description: "投薬中止"
Usage: #example
* meta.profile = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationAdministration"
* extension[0].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_RequestDepartment"
* extension[=].valueCodeableConcept = urn:oid:1.2.392.100495.20.2.51#01 "内科"
* extension[+].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Requester"
* extension[=].valueReference = Reference(Practitioner/jp-practionner-example-male-1) "埼玉 一郎"
* extension[+].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_RequestAuthoredOn"
* extension[=].valueDateTime = "2016-08-25T00:00:00+09:00"
* identifier[0].system = "http://www.example.com/fhir/order-number"
* identifier[=].value = "12345678"
* identifier[+].system = "urn:oid:1.2.392.100495.20.3.81"
* identifier[=].value = "1"
* identifier[+].system = "urn:oid:1.2.392.100495.20.3.82"
* identifier[=].value = "2"
* status = #stopped
* category = http://terminology.hl7.org/CodeSystem/v2-0482#I "Inpatient Order"
* medicationCodeableConcept = urn:oid:1.2.392.100495.20.2.74#110626901 "パンスポリンＴ錠１００ １００ｍｇ"
* subject = Reference(Patient/jp-patient-example-1)
* effectiveDateTime = "2016-08-25T08:30:00+09:00"
* request = Reference(MedicationRequest/jp-medicationrequest-example-2)