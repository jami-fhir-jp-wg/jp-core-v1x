Instance: jp-medicationrequest-injection-example-2
InstanceOf: MedicationRequest
Title: "点滴注射"
Usage: #example
* meta.profile = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationRequest_Injection"
* contained[0] = jp-medicationrequest-injection-medication-example-2
* contained[+] = jp-medicationrequest-injection-bodystructure-example-2
* identifier[0].system = "urn:oid:1.2.392.100495.20.3.11"
* identifier[=].value = "123456789012345"
* identifier[+].system = "urn:oid:1.2.392.100495.20.3.81"
* identifier[=].value = "123456789012345_01_001"
* status = #active
* intent = #order
* category[0] = http://terminology.hl7.org/CodeSystem/v2-0482#I "入院患者オーダ"
* category[+] = http://jpfhir.jp/Common/CodeSystem/merit9-category#IHP "入院処方"
* category[+] = http://jpfhir.jp/Common/CodeSystem/JHSI0001#FTP "定時処方"
* medicationReference = Reference(jp-medicationrequest-injection-medication-example-2)
* medicationReference.type = "Medication"
* subject = Reference(Patient/jp-patient-example-1)
* authoredOn = "2016-07-01"
* requester = Reference(urn:uuid:70c503af-b04b-4104-8c18-1bf97766927c)
* requester.type = "PractitionerRole"
* insurance = Reference(urn:uuid:02222cfc-81c0-4a45-a8bd-50b814f885ae)
* insurance.type = "Coverage"
* dosageInstruction.extension.url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationRequestLine"
* dosageInstruction.extension.valueCodeableConcept = http://hl7fhir.jp/medication/99ILL#01 "主管"
* dosageInstruction.timing.repeat.boundsPeriod.start = "2016-07-01T08:00:00+09:00"
* dosageInstruction.timing.repeat.boundsPeriod.end = "2016-07-01T13:00:00+09:00"
* dosageInstruction.site.extension.url = "http://hl7.org/fhir/StructureDefinition/bodySite"
* dosageInstruction.site.extension.valueReference = Reference(urn:uuid:2726417c-4d80-4bd3-8175-109d8e26379b)
* dosageInstruction.site.extension.valueReference.type = "BodyStructure"
* dosageInstruction.route = urn:oid:1.2.392.100495.20.2.35#30 "静脈注射"
* dosageInstruction.method = urn:oid:1.2.392.100495.20.2.34#3 "注射"
* dosageInstruction.doseAndRate[0].doseQuantity.value = 510
* dosageInstruction.doseAndRate[=].doseQuantity.unit = "ミリリッター"
* dosageInstruction.doseAndRate[+].rateRatio.numerator.value = 102
* dosageInstruction.doseAndRate[=].rateRatio.numerator.unit = "ml"
* dosageInstruction.doseAndRate[=].rateRatio.denominator.value = 1
* dosageInstruction.doseAndRate[=].rateRatio.denominator.unit = "h"