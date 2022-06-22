Instance: jp-medicationrequest-injection-example-1
InstanceOf: JP_MedicationRequest_Injection
Title: "JP MedicationRequest Injection ワンショット静脈注射"
Description: "ホリゾン注射液１０ｍｇ１アンプルを左腕に静脈注射"
Usage: #example
* contained[0] = jp-medicationrequest-injection-medication-example-1
* contained[+] = jp-medicationrequest-injection-bodystructure-example-1
* contained[+] = jp-medicationrequest-injection-device-example-1
* contained[+] = jp-practionner-example-female-1
* contained[+] = jp-patient-example-1
* identifier[0].system = "http://jpfhir.jp/fhir/Common/IdSystem/resourceInstance-identifier"
* identifier[=].value = "1234567890.1.1"
* identifier[+].system = "urn:oid:1.2.392.100495.20.3.81"
* identifier[=].value = "1"
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
* dosageInstruction.extension.url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DosageInstruction_Device"
* dosageInstruction.extension.valueReference = Reference(Device/jp-medicationrequest-injection-device-example-1)
* dosageInstruction.additionalInstruction = urn:oid:1.2.392.200250.2.2.20.22#1 "ワンショット"
* dosageInstruction.text = "ワンショット 静脈注射 静脈内 左腕"
* dosageInstruction.timing.repeat.boundsPeriod.start = "2016-07-01T10:00:00+09:00"
* dosageInstruction.site.extension.url = "http://hl7.org/fhir/StructureDefinition/bodySite"
* dosageInstruction.site.extension.valueReference = Reference(BodyStructure/jp-medicationrequest-injection-bodystructure-example-1)
* dosageInstruction.route = http://jpfhir.jp/fhir/ePrescription/CodeSystem/route-codes#IV "静脈内"
* dosageInstruction.method = urn:oid:1.2.392.200250.2.2.20.40#30 "静脈注射"
* dosageInstruction.doseAndRate.doseQuantity.value = 2
* dosageInstruction.doseAndRate.doseQuantity.unit = "mL"
* dosageInstruction.doseAndRate.doseQuantity.system = "urn:oid:1.2.392.100495.20.2.101"
* dosageInstruction.doseAndRate.doseQuantity.code = #mL
* dosageInstruction.doseAndRate.type = urn:oid:1.2.392.100495.20.2.22#1