Instance: jp-medicationdispense-example-1
InstanceOf: JP_MedicationDispense
Title: "JP Core MedicationDispense Example 調剤実施 内服薬"
Description: "調剤実施 内服薬"
Usage: #example
* identifier[rpNumber].system = "urn:oid:1.2.392.100495.20.3.81"
* identifier[rpNumber].value = "1"
* identifier[orderInRp].system = "urn:oid:1.2.392.100495.20.3.82"
* identifier[orderInRp].value = "1"
* identifier[requestIdentifier].system = "http://jpfhir.jp/fhir/core/IdSystem/resourceInstance-identifier"
* identifier[requestIdentifier].value = "1234567890.1.1"
* status = #completed
* category = http://terminology.hl7.org/CodeSystem/v2-0482#I "Inpatient Order"
* medicationCodeableConcept = $JP_MedicationCodeHOT9_CS#103835401 "ムコダイン錠２５０ｍｇ"
* subject = Reference(Patient/jp-patient-example-1)
* performer.function = http://terminology.hl7.org/CodeSystem/medicationdispense-performer-function#packager "Packager"
* performer.actor = Reference(Practitioner/jp-practitioner-example-male-1)
* quantity = 9 urn:oid:1.2.392.100495.20.2.101#TAB "錠"
* daysSupply = 7 http://unitsofmeasure.org#d "日"
* whenPrepared = "2021-10-07T10:47:19+09:00"
* whenHandedOver = "2021-10-07T10:55:23+09:00"
* destination = Reference(Location/jp-location-example-ward)
* note.text = "後発品へ変更可能か依頼医のＡ医師に確認したところ、患者の希望により不可との回答あり。"
* dosageInstruction.text = "内服・経口・１日３回朝昼夕食後"
* dosageInstruction.timing.code = urn:oid:1.2.392.200250.2.2.20.20#1013044400000000 "内服・経口・１日３回朝昼夕食後"
* dosageInstruction.route = http://jpfhir.jp/fhir/core/CodeSystem/route-codes#PO "口"
* dosageInstruction.method = urn:oid:1.2.392.200250.2.2.20.40#10 "経口"
* dosageInstruction.doseAndRate.type = urn:oid:1.2.392.100495.20.2.22#1 "製剤量"
* dosageInstruction.doseAndRate.doseQuantity = 1 urn:oid:1.2.392.100495.20.2.101#TAB "錠"
* dosageInstruction.doseAndRate.rateRatio.numerator = 3 urn:oid:1.2.392.100495.20.2.101#TAB "錠"
* dosageInstruction.doseAndRate.rateRatio.denominator = 1 http://unitsofmeasure.org#d "日"
* substitution.wasSubstituted = true
* substitution.type = http://terminology.hl7.org/CodeSystem/v3-substanceAdminSubstitution#G "generic composition"
* substitution.reason = http://terminology.hl7.org/CodeSystem/v3-ActReason#RR "regulatory requirement"