Instance: jp-medicationdispense-example-1
InstanceOf: JP_MedicationDispense
Title: "JP Core MedicationDispense Example 内服薬調剤実施"
Description: "内服薬調剤実施"
Usage: #example
// * extension.url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DosageInstruction_UsageDuration"
// * extension.valueDuration = 3 'd' "日"
* identifier[0].system = "http://www.sample.com/fhir/medication-dispense"
* identifier[=].value = "1234567890"
* identifier[+].system = "urn:oid:1.2.392.100495.20.3.81"
* identifier[=].value = "1"
* identifier[+].system = "urn:oid:1.2.392.100495.20.3.82"
* identifier[=].value = "1"
* status = #completed
* category = http://terminology.hl7.org/CodeSystem/v2-0482#I "Inpatient Order"
* medicationCodeableConcept = urn:oid:1.2.392.200119.4.403.1#103835401 "ムコダイン錠２５０ｍｇ"
* subject = Reference(Patient/jp-patient-example-1)
* performer.function = http://terminology.hl7.org/CodeSystem/medicationdispense-performer-function#packager "Packager"
* performer.actor = Reference(Practitioner/jp-practitioner-example-male-1)
* quantity = 9 urn:oid:1.2.392.100495.20.2.101#TAB "錠"
* whenPrepared = "2021-10-07T10:47:19+09:00"
* whenHandedOver = "2021-10-07T10:55:23+09:00"
* destination = Reference(Location/jp-location-example-ward)
* note.text = "後発品へ変更可能か依頼医のＡ医師に確認したところ、患者の希望により不可との回答あり。"
* dosageInstruction.text = "内服・経口・１日３回朝昼夕食後"
* dosageInstruction.timing.code = urn:oid:1.2.392.200250.2.2.20.20#1013044400000000 "内服・経口・１日３回朝昼夕食後"
* dosageInstruction.route = urn:oid:2.16.840.1.113883.3.1937.777.10.5.162#PO "口"
* dosageInstruction.method = urn:oid:1.2.392.200250.2.2.20.40#10 "経口"
* dosageInstruction.doseAndRate.type = urn:oid:1.2.392.100495.20.2.22#1 "製剤量"
* dosageInstruction.doseAndRate.doseQuantity = 1 urn:oid:1.2.392.100495.20.2.101#TAB "錠"
* dosageInstruction.doseAndRate.rateRatio.numerator = 3 urn:oid:1.2.392.100495.20.2.101#TAB "錠"
* dosageInstruction.doseAndRate.rateRatio.denominator = 1 'd' "日"
* substitution.wasSubstituted = true
* substitution.type = http://terminology.hl7.org/CodeSystem/v3-substanceAdminSubstitution#G "generic composition"
* substitution.reason = http://terminology.hl7.org/CodeSystem/v3-ActReason#RR "regulatory requirement"