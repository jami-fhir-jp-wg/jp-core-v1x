Instance: jp-medicationdispense-injection-example-1
InstanceOf: MedicationDispense
Title: "注射薬調剤実施"
Usage: #example
* meta.profile = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationDispense_Injection"
* contained[0] = jp-medicationdispense-injection-medication-example-1
* contained[+] = jp-medicationdispense-injection-bodystructure-example-1
* contained[+] = jp-medicationdispense-injection-device-example-1
* identifier[0].system = "http://www.sample.com/fhir/medication-dispense"
* identifier[=].value = "1234567890"
* identifier[+].system = "urn:oid:1.2.392.100495.20.3.81"
* identifier[=].value = "1"
* identifier[+].system = "urn:oid:1.2.392.100495.20.3.82"
* identifier[=].value = "1"
* status = #completed
* category = http://terminology.hl7.org/CodeSystem/v2-0482#I "入院患者オーダ"
* medicationReference = Reference(jp-medicationdispense-injection-medication-example-1)
* medicationReference.type = "Medication"
* subject = Reference(Patient/jp-patient-example-1)
* performer.function = http://terminology.hl7.org/CodeSystem/medicationdispense-performer-function#packager "Packager"
* performer.actor = Reference(Practitioner/01234567)
* quantity = 2 'mL' "mL"
* whenPrepared = "2021-10-07T10:47:19+09:00"
* whenHandedOver = "2021-10-07T10:55:23+09:00"
* destination = Reference(Location/12A)
* dosageInstruction.extension.url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DosageInstruction_Device"
* dosageInstruction.extension.valueReference = Reference(jp-medicationdispense-injection-device-example-1)
* dosageInstruction.extension.valueReference.type = "Device"
* dosageInstruction.additionalInstruction = urn:oid:1.2.392.200250.2.2.20.45#1 "ワンショット"
* dosageInstruction.timing.repeat.boundsPeriod.start = "2016-07-01T10:00:00+09:00"
* dosageInstruction.site.extension.url = "http://hl7.org/fhir/StructureDefinition/bodySite"
* dosageInstruction.site.extension.valueReference = Reference(jp-medicationdispense-injection-bodystructure-example-1)
* dosageInstruction.site.extension.valueReference.type = "BodyStructure"
* dosageInstruction.route = urn:oid:2.16.840.1.113883.3.1937.777.10.5.162#IV "静脈内"
* dosageInstruction.method = urn:oid:1.2.392.200250.2.2.20.40#30 "静脈注射"
* dosageInstruction.doseAndRate.doseQuantity = 2 'mL' "mL"