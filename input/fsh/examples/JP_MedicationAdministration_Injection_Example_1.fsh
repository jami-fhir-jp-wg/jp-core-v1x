Instance: jp-medicationadministration-injection-example-1
InstanceOf: MedicationAdministration
Title: "ワンショット静脈注射（実施）"
Usage: #example
* meta.profile = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationAdministration_Injection"
* contained[0] = jp-medicationadministration-injection-medication-example-1
* contained[+] = jp-medicationadministration-injection-bodystructure-example-1
* contained[+] = jp-medicationadministration-injection-device-example-1
* extension[0].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_RequestDepartment"
* extension[=].valueCodeableConcept = urn:oid:1.2.392.100495.20.2.51#01 "内科"
* extension[+].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Requester"
* extension[=].valueReference = Reference(Practitioner/2) "医師 一郎"
* extension[+].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_RequestAuthoredOn"
* extension[=].valueDateTime = "2016-07-01T00:00:00+09:00"
* extension[+].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Location"
* extension[=].valueReference = Reference(Location/1) "09A病棟 021病室 4ベッド"
* identifier[0].system = "http://www.example.com/fhir/order-number"
* identifier[=].value = "123456789012345"
* identifier[+].system = "urn:oid:1.2.392.100495.20.3.81"
* identifier[=].value = "1"
* identifier[+].system = "urn:oid:1.2.392.100495.20.3.82"
* identifier[=].value = "1"
* status = #completed
* category = http://terminology.hl7.org/CodeSystem/v2-0482#I "入院患者オーダ"
* medicationReference = Reference(jp-medicationadministration-injection-medication-example-1)
* medicationReference.type = "Medication"
* subject = Reference(Patient/jp-patient-example-1)
* effectivePeriod.start = "2016-07-01T10:05:21+09:00"
* effectivePeriod.end = "2016-07-01T10:05:21+09:00"
* performer.function = http://terminology.hl7.org/CodeSystem/med-admin-perform-function#performer "Performer"
* performer.actor = Reference(Practitioner/1) "看護 花子"
* request = Reference(MedicationRequest/jp-medicationrequest-injection-example-1)
* device = Reference(jp-medicationadministration-injection-device-example-1) "シリンジ"
* dosage.extension.url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Dosage_DosageComment"
* dosage.extension.valueString = "痙攣が発生したため、主治医に確認の上実施しました"
* dosage.site.extension[0].url = "http://hl7.org/fhir/StructureDefinition/bodySite"
* dosage.site.extension[=].valueReference = Reference(jp-medicationadministration-injection-bodystructure-example-1) "右腕"
* dosage.site.extension[+].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Site_SiteComment"
* dosage.site.extension[=].valueString = "左利きのため"
* dosage.route = http://terminology.hl7.org/CodeSystem/v2-0162#IV "静脈内"
* dosage.method.extension.url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Method_MethodComment"
* dosage.method.extension.valueString = "１分ほどかけて緩徐に行いました"
* dosage.method = http://jpfhir.jp/medication/99ILL#101 "静注(末梢)"
* dosage.dose = 2 'mL' "mL"