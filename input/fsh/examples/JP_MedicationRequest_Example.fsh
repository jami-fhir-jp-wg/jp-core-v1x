Instance: jp-medicationrequest-example-1
InstanceOf: JP_MedicationRequest
Title: "JP Core MedicationRequest Example 内服処方指示 ムコダイン錠２５０ｍｇ"
Description: "内服処方指示 ムコダイン錠２５０ｍｇ"
Usage: #example
* identifier[rpNumber].system = "urn:oid:1.2.392.100495.20.3.81"
* identifier[rpNumber].value = "1"
* identifier[orderInRp].system = "urn:oid:1.2.392.100495.20.3.82"
* identifier[orderInRp].value = "1"
* identifier[requestIdentifier].system = "http://jpfhir.jp/fhir/core/IdSystem/resourceInstance-identifier"
* identifier[requestIdentifier].value = "1234567890.1.1"
* intent = #order
* status = #active
* medicationCodeableConcept = $JP_MedicationCodeHOT9_CS#103835401 "ムコダイン錠２５０ｍｇ"
* subject = Reference(Patient/jp-patient-example-1)
* authoredOn = "2020-04-01T12:28:17+09:00"
* dosageInstruction.extension[0].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationDosage_PeriodOfUse"
* dosageInstruction.extension[=].valuePeriod.start = "2020-04-01"
* dosageInstruction.extension[+].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationDosage_UsageDuration"
* dosageInstruction.extension[=].valueDuration = 3 'd' "日"
* dosageInstruction.text = "内服・経口・１日３回朝昼夕食後"
* dosageInstruction.timing.code = urn:oid:1.2.392.200250.2.2.20.20#1013044400000000 "内服・経口・１日３回朝昼夕食後"
* dosageInstruction.route = $JP_MedicationRouteHL70162_CS#PO "口"
* dosageInstruction.method = urn:oid:1.2.392.200250.2.2.20.40#10 "経口"
* dosageInstruction.doseAndRate.type = $JP_MedicationIngredientStrengthStrengthType_CS#1 "製剤量"
* dosageInstruction.doseAndRate.doseQuantity = 1 urn:oid:1.2.392.100495.20.2.101#TAB "錠"
* dosageInstruction.doseAndRate.rateRatio.numerator = 3 urn:oid:1.2.392.100495.20.2.101#TAB "錠"
* dosageInstruction.doseAndRate.rateRatio.denominator = 1 http://unitsofmeasure.org#d "日"
* dispenseRequest.quantity = 9 urn:oid:1.2.392.100495.20.2.101#TAB "錠"
* dispenseRequest.expectedSupplyDuration = 3 http://unitsofmeasure.org#d "日"

Instance: jp-medicationrequest-example-2
InstanceOf: JP_MedicationRequest
Title: "JP Core MedicationRequest Example 内服処方指示 パンスポリンＴ錠１００ １００ｍｇ"
Description: "内服処方指示 パンスポリンＴ錠１００ １００ｍｇ"
Usage: #example
* identifier[rpNumber].system = "urn:oid:1.2.392.100495.20.3.81"
* identifier[rpNumber].value = "2"
* identifier[orderInRp].system = "urn:oid:1.2.392.100495.20.3.82"
* identifier[orderInRp].value = "2"
* identifier[requestIdentifier].system = "http://jpfhir.jp/fhir/core/IdSystem/resourceInstance-identifier"
* identifier[requestIdentifier].value = "1234567890.1.2"
* intent = #order
* status = #active
* medicationCodeableConcept = $JP_MedicationCodeHOT9_CS#110926901 "パンスポリンＴ錠１００ １００ｍｇ"
* subject = Reference(Patient/jp-patient-example-1)
* authoredOn = "2020-04-01T12:28:17+09:00"
* dosageInstruction.extension[0].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationDosage_PeriodOfUse"
* dosageInstruction.extension[=].valuePeriod.start = "2020-04-01"
* dosageInstruction.extension[+].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationDosage_UsageDuration"
* dosageInstruction.extension[=].valueDuration = 3 'd' "日"
* dosageInstruction.text = "内服・経口・１日３回朝昼夕食後"
* dosageInstruction.timing.code = urn:oid:1.2.392.200250.2.2.20.20#1013044400000000 "内服・経口・１日３回朝昼夕食後"
* dosageInstruction.route = $JP_MedicationRouteHL70162_CS#PO "口"
* dosageInstruction.method = urn:oid:1.2.392.200250.2.2.20.40#10 "経口"
* dosageInstruction.doseAndRate.type = $JP_MedicationIngredientStrengthStrengthType_CS#1 "製剤量"
* dosageInstruction.doseAndRate.doseQuantity = 2 urn:oid:1.2.392.100495.20.2.101#TAB "錠"
* dosageInstruction.doseAndRate.rateRatio.numerator = 6 urn:oid:1.2.392.100495.20.2.101#TAB "錠"
* dosageInstruction.doseAndRate.rateRatio.denominator = 1 http://unitsofmeasure.org#d "日"
* dispenseRequest.quantity = 18 urn:oid:1.2.392.100495.20.2.101#TAB "錠"
* dispenseRequest.expectedSupplyDuration = 3 http://unitsofmeasure.org#d "日"