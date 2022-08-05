Instance: jp-medicationrequest-injection-example-1
InstanceOf: JP_MedicationRequest_Injection
Title: "JP Core MedicationRequest Injection ワンショット静脈注射"
Description: "ホリゾン注射液１０ｍｇ１アンプルを左腕に静脈注射"
Usage: #example
* contained[0] = jp-medicationrequest-injection-medication-example-1
* contained[+] = jp-medicationrequest-injection-bodystructure-example-1
* contained[+] = jp-medicationrequest-injection-device-example-1
* identifier[rpNumber].system = "urn:oid:1.2.392.100495.20.3.81"
* identifier[rpNumber].value = "1"
* identifier[orderInRp].system = "urn:oid:1.2.392.100495.20.3.82"
* identifier[orderInRp].value = "2"
* identifier[requestIdentifier].system = "http://jpfhir.jp/fhir/Common/IdSystem/resourceInstance-identifier"
* identifier[requestIdentifier].value = "1234567890.1.1"
* status = #active
* intent = #order
* category[0] = http://terminology.hl7.org/CodeSystem/v2-0482#I "Inpatient Order"
* category[+] = http://jpfhir.jp/Common/CodeSystem/merit9-category#IHP "入院処方"
* category[+] = http://jpfhir.jp/Common/CodeSystem/JHSI0001#FTP "定時処方"
* medicationReference = Reference(Medication/jp-medicationrequest-injection-medication-example-1)
* subject = Reference(Patient/jp-patient-example-1)
* authoredOn = "2016-07-01T09:28:17+09:00"
* requester = Reference(Practitioner/jp-practionner-example-female-1)
* insurance = Reference(Coverage/jp-coverage-example-1)
* dosageInstruction.extension.url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DosageInstruction_Device"
* dosageInstruction.extension.valueReference = Reference(Device/jp-medicationrequest-injection-device-example-1)
* dosageInstruction.additionalInstruction = urn:oid:1.2.392.200250.2.2.20.22#1 "ワンショット"
* dosageInstruction.text = "ワンショット 静脈注射 静脈内 左腕"
* dosageInstruction.timing.repeat.boundsPeriod.start = "2016-07-01T10:00:00+09:00"
* dosageInstruction.site.extension.url = "http://hl7.org/fhir/StructureDefinition/bodySite"
* dosageInstruction.site.extension.valueReference = Reference(BodyStructure/jp-medicationrequest-injection-bodystructure-example-1)
* dosageInstruction.route = http://jpfhir.jp/fhir/Common/CodeSystem/route-codes#IV "静脈内"
* dosageInstruction.method = urn:oid:1.2.392.200250.2.2.20.40#30 "静脈注射"
* dosageInstruction.doseAndRate.doseQuantity.value = 2
* dosageInstruction.doseAndRate.doseQuantity.unit = "mL"
* dosageInstruction.doseAndRate.doseQuantity.system = "urn:oid:1.2.392.100495.20.2.101"
* dosageInstruction.doseAndRate.doseQuantity.code = #mL
* dosageInstruction.doseAndRate.type = urn:oid:1.2.392.100495.20.2.22#1

Instance: jp-medicationrequest-injection-example-2
InstanceOf: JP_MedicationRequest_Injection
Title: "JP Core MedicationRequest Injection 点滴注射"
Description: "点滴注射"
Usage: #example
* contained[0] = jp-medicationrequest-injection-medication-example-2
* contained[+] = jp-medicationrequest-injection-bodystructure-example-2
* identifier[rpNumber].system = "urn:oid:1.2.392.100495.20.3.81"
* identifier[rpNumber].value = "2"
* identifier[orderInRp].system = "urn:oid:1.2.392.100495.20.3.82"
* identifier[orderInRp].value = "2"
* identifier[requestIdentifier].system = "http://jpfhir.jp/fhir/Common/IdSystem/resourceInstance-identifier"
* identifier[requestIdentifier].value = "1234567890.2.1"
* status = #active
* intent = #order
* category[0] = http://terminology.hl7.org/CodeSystem/v2-0482#I "Inpatient Order"
* category[+] = http://jpfhir.jp/Common/CodeSystem/merit9-category#IHP "入院処方"
* category[+] = http://jpfhir.jp/Common/CodeSystem/JHSI0001#FTP "定時処方"
* medicationReference = Reference(Medication/jp-medicationrequest-injection-medication-example-2)
* subject = Reference(Patient/jp-patient-example-1)
* authoredOn = "2016-07-01T07:28:17+09:00"
* requester = Reference(Practitioner/jp-practionner-example-female-1)
* insurance = Reference(Coverage/jp-coverage-example-1)
* dosageInstruction.extension.url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DosageInstruction_Line"
* dosageInstruction.extension.valueCodeableConcept = http://hl7fhir.jp/medication/99ILL#01 "主管"
* dosageInstruction.text = "主管 静脈注射 左腕"
* dosageInstruction.timing.repeat.boundsPeriod.start = "2016-07-01T08:00:00+09:00"
* dosageInstruction.timing.repeat.boundsPeriod.end = "2016-07-01T13:00:00+09:00"
* dosageInstruction.site.extension.url = "http://hl7.org/fhir/StructureDefinition/bodySite"
* dosageInstruction.site.extension.valueReference = Reference(BodyStructure/jp-medicationrequest-injection-bodystructure-example-2)
* dosageInstruction.route = http://jpfhir.jp/fhir/Common/CodeSystem/route-codes#30 "静脈注射"
* dosageInstruction.method = urn:oid:1.2.392.100495.20.2.34#3 "注射"
* dosageInstruction.doseAndRate.type = urn:oid:1.2.392.100495.20.2.22#1
* dosageInstruction.doseAndRate.doseQuantity.value = 510
* dosageInstruction.doseAndRate.doseQuantity.unit = "ミリリッター"
* dosageInstruction.doseAndRate.rateRatio.numerator.value = 102
* dosageInstruction.doseAndRate.rateRatio.numerator.unit = "mL"
* dosageInstruction.doseAndRate.rateRatio.denominator.value = 1
* dosageInstruction.doseAndRate.rateRatio.denominator.unit = "日"

Instance: jp-medicationrequest-injection-medication-example-1
InstanceOf: JP_Medication
Title: "JP Medication ホリゾン注射液"
Description: "ホリゾン注射液"
Usage: #inline
* status = #active
* ingredient.extension.url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Medication_Ingredient_DrugNo"
* ingredient.extension.valueInteger = 1
* ingredient.itemCodeableConcept = urn:oid:1.2.392.100495.20.2.74#100558502 "ホリゾン注射液１０ｍｇ"
* ingredient.strength.extension.url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Medication_IngredientStrength_StrengthType"
* ingredient.strength.extension.valueCodeableConcept = urn:oid:1.2.392.100495.20.2.22#1 "製剤量"
* ingredient.strength.numerator = 1 urn:oid:1.2.392.100495.20.2.101#AMP "アンプル"
* ingredient.strength.denominator = 1 urn:oid:1.2.392.100495.20.2.101#KAI "回"

Instance: jp-medicationrequest-injection-medication-example-2
InstanceOf: JP_Medication
Title: "JP Medication ソリタ－＋アドナ注"
Description: "ソリタ－＋アドナ注"
Usage: #inline
* status = #active
* ingredient[0].itemCodeableConcept = urn:oid:1.2.392.100495.20.2.74#107750602 "ソリタ－Ｔ３号輸液５００ｍＬ"
* ingredient[=].strength.numerator = 1 urn:oid:1.2.392.100495.20.2.101#HON "本"
* ingredient[=].strength.denominator = 1 urn:oid:1.2.392.100495.20.2.101#KAI "回"
* ingredient[+].itemCodeableConcept = urn:oid:1.2.392.100495.20.2.74#108010001 "アドナ注（静脈用）５０ｍｇ"
* ingredient[=].strength.numerator = 1 urn:oid:1.2.392.100495.20.2.101#AMP "アンプル"
* ingredient[=].strength.denominator = 1 urn:oid:1.2.392.100495.20.2.101#KAI "回"

Instance: jp-medicationrequest-injection-bodystructure-example-1
InstanceOf: BodyStructure
Title: "BodyStructure 左腕"
Description: "左腕"
Usage: #inline
* location = http://terminology.hl7.org/CodeSystem/v2-0550#ARM "Arm"
* locationQualifier = http://terminology.hl7.org/CodeSystem/v2-0495#L "Left"
* patient = Reference(Patient/jp-patient-example-1)

Instance: jp-medicationrequest-injection-bodystructure-example-2
InstanceOf: BodyStructure
Title: "BodyStructure 右腕"
Description: "右腕"
Usage: #inline
* location = http://terminology.hl7.org/CodeSystem/v2-0550#ARM "Arm"
* locationQualifier = http://terminology.hl7.org/CodeSystem/v2-0495#R "Right"
* patient = Reference(Patient/jp-patient-example-1)

Instance: jp-medicationrequest-injection-device-example-1
InstanceOf: Device
Title: "シリンジ"
Description: "シリンジ"
Usage: #inline
* type = http://jpfhir.jp/medication/99ILL#01 "シリンジ"