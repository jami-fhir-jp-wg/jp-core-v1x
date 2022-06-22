Instance: jp-medicationrequest-injection-example-2
InstanceOf: JP_MedicationRequest_Injection
Title: "JP MedicationRequest Injection 点滴注射"
Description: "点滴注射"
Usage: #example
* identifier[0].system = "http://jpfhir.jp/fhir/Common/IdSystem/resourceInstance-identifier"
* identifier[=].value = "1234567890.2.1"
* identifier[+].system = "urn:oid:1.2.392.100495.20.3.81"
* identifier[=].value = "2"
* identifier[+].system = "urn:oid:1.2.392.100495.20.3.82"
* identifier[=].value = "2"
* status = #active
* intent = #order
* category[0] = http://terminology.hl7.org/CodeSystem/v2-0482#I "Inpatient Order"
* category[+] = http://jpfhir.jp/Common/CodeSystem/merit9-category#IHP "入院処方"
* category[+] = http://jpfhir.jp/Common/CodeSystem/JHSI0001#FTP "定時処方"
* medicationReference = Reference(Medication/jp-medicationrequest-injection-medication-example-1)
* subject = Reference(Patient/jp-patient-example-1)
* authoredOn = "2016-07-01"
* requester = Reference(Practitioner/jp-practionner-example-female-1)
* insurance = Reference(Coverage/jp-coverage-example-1)
* dosageInstruction.extension.url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DosageInstruction_Line"
* dosageInstruction.extension.valueCodeableConcept = http://hl7fhir.jp/medication/99ILL#01 "主管"
* dosageInstruction.text = "主管 静脈注射 左腕"
* dosageInstruction.timing.repeat.boundsPeriod.start = "2016-07-01T08:00:00+09:00"
* dosageInstruction.timing.repeat.boundsPeriod.end = "2016-07-01T13:00:00+09:00"
* dosageInstruction.site.extension.url = "http://hl7.org/fhir/StructureDefinition/bodySite"
* dosageInstruction.site.extension.valueReference = Reference(BodyStructure/jp-medicationrequest-injection-bodystructure-example-2)
* dosageInstruction.route = http://jpfhir.jp/fhir/ePrescription/CodeSystem/route-codes#30 "静脈注射"
* dosageInstruction.method = urn:oid:1.2.392.100495.20.2.34#3 "注射"
* dosageInstruction.doseAndRate.type = urn:oid:1.2.392.100495.20.2.22#1
* dosageInstruction.doseAndRate.doseQuantity.value = 510
* dosageInstruction.doseAndRate.doseQuantity.unit = "ミリリッター"
* dosageInstruction.doseAndRate.rateRatio.numerator.value = 102
* dosageInstruction.doseAndRate.rateRatio.numerator.unit = "mL"
* dosageInstruction.doseAndRate.rateRatio.denominator.value = 1
* dosageInstruction.doseAndRate.rateRatio.denominator.unit = "日"