Instance: jp-medicationrequest-injection-example-1
InstanceOf: MedicationRequest
Title: "ワンショット静脈注射"
Description: "ホリゾン注射液１０ｍｇ１アンプルを左腕に静脈注射"
Usage: #example
* meta.profile = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationRequest_Injection"
* contained[0] = jp-medicationrequest-injection-medication-example-1
* contained[+] = jp-medicationrequest-injection-bodystructure-example-1
* contained[+] = jp-medicationrequest-injection-device-example-1
* identifier[0].system = "urn:oid:1.2.392.100495.20.3.11"
* identifier[=].value = "123456789012345"
* identifier[+].system = "urn:oid:1.2.392.100495.20.3.81"
* identifier[=].value = "123456789012345_01_001"
* status = #active
* intent = #order
* category[0] = http://terminology.hl7.org/CodeSystem/v2-0482#I "入院患者オーダ"
* category[+] = http://jpfhir.jp/Common/CodeSystem/merit9-category#IHP "入院処方"
* category[+] = http://jpfhir.jp/Common/CodeSystem/JHSI0001#FTP "定時処方"
* medicationReference = Reference(jp-medicationrequest-injection-medication-example-1)
* medicationReference.type = "Medication"
* subject = Reference(Patient/jp-patient-example-1)
* authoredOn = "2016-07-01"
* requester = Reference(urn:uuid:b598aedf-28fb-406a-b38e-250d3e92ac60)
* requester.type = "PractitionerRole"
* insurance = Reference(urn:uuid:df0ebf6d-e527-49d4-bce2-0885045a7afd)
* insurance.type = "Coverage"
* dosageInstruction.extension.url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DosageInstruction_Device"
* dosageInstruction.extension.valueReference = Reference(jp-medicationrequest-injection-device-example-1)
* dosageInstruction.extension.valueReference.type = "Device"
* dosageInstruction.additionalInstruction = urn:oid:1.2.392.200250.2.2.20.45#1 "ワンショット"
* dosageInstruction.timing.repeat.boundsPeriod.start = "2016-07-01T10:00:00+09:00"
* dosageInstruction.site.extension.url = "http://hl7.org/fhir/StructureDefinition/bodySite"
* dosageInstruction.site.extension.valueReference = Reference(jp-medicationrequest-injection-bodystructure-example-1)
* dosageInstruction.site.extension.valueReference.type = "BodyStructure"
* dosageInstruction.route = urn:oid:2.16.840.1.113883.3.1937.777.10.5.162#IV "静脈内"
* dosageInstruction.method = urn:oid:1.2.392.200250.2.2.20.40#30 "静脈注射"
* dosageInstruction.doseAndRate.doseQuantity = 2 'mL' "mL"