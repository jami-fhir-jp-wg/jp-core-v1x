Instance: jp-medicationrequest-injection-example-1
InstanceOf: JP_MedicationRequest_Injection
Title: "JP Core MedicationRequest Injection Example 注射処方指示 ワンショット静脈注射"
Description: "注射処方指示 ホリゾン注射液１０ｍｇワンショット静脈注射"
Usage: #example
* contained[0] = jp-medicationrequest-injection-medication-example-1
* contained[+] = jp-medicationrequest-injection-bodystructure-example-1
* identifier[rpNumber].system = "urn:oid:1.2.392.100495.20.3.81"
* identifier[rpNumber].value = "1"
* identifier[requestIdentifier].system = "http://jpfhir.jp/fhir/core/IdSystem/resourceInstance-identifier"
* identifier[requestIdentifier].value = "1234567890.1"
* status = #active
* intent = #order
* category[0] = http://terminology.hl7.org/CodeSystem/v2-0482#I "Inpatient Order"
* category[+] = $JP_MedicationCategoryMERIT9_CS#IHP "入院処方"
* category[+] = http://jpfhir.jp/fhir/core/CodeSystem/JHSI0001#FTP "定時処方"
* medicationReference = Reference(Medication/jp-medicationrequest-injection-medication-example-1)
* subject = Reference(Patient/jp-patient-example-1)
* authoredOn = "2016-07-01T09:28:17+09:00"
* requester = Reference(Practitioner/jp-practitioner-example-female-1)
* insurance = Reference(Coverage/jp-coverage-example-1)
* dosageInstruction.additionalInstruction = urn:oid:1.2.392.200250.2.2.20.22#I1100000 "１日おき"
* dosageInstruction.text = "静脈注射 静脈内 左腕 １日おき"
* dosageInstruction.timing.repeat.boundsPeriod.start = "2016-07-01T10:00:00+09:00"
* dosageInstruction.site.extension.url = $bodySite
* dosageInstruction.site.extension.valueReference = Reference(BodyStructure/jp-medicationrequest-injection-bodystructure-example-1)
* dosageInstruction.route = $JP_MedicationRouteHL70162_CS#IV "静脈内"
* dosageInstruction.method = urn:oid:1.2.392.200250.2.2.20.40#30 "静脈注射"
* dosageInstruction.doseAndRate.doseQuantity.value = 2
* dosageInstruction.doseAndRate.doseQuantity.unit = "mL"
* dosageInstruction.doseAndRate.doseQuantity.system = "http://unitsofmeasure.org"
* dosageInstruction.doseAndRate.doseQuantity.code = #mL
* dosageInstruction.doseAndRate.type = $JP_MedicationIngredientStrengthStrengthType_CS#1

Instance: jp-medicationrequest-injection-example-2
InstanceOf: JP_MedicationRequest_Injection
Title: "JP Core MedicationRequest Injection Example 注射処方指示 点滴注射"
Description: "点滴注射"
Usage: #example
* contained[0] = jp-medicationrequest-injection-medication-example-2
* contained[+] = jp-medicationrequest-injection-bodystructure-example-2
* contained[+] = jp-medicationrequest-injection-device-example-2
* identifier[rpNumber].system = "urn:oid:1.2.392.100495.20.3.81"
* identifier[rpNumber].value = "2"
* identifier[requestIdentifier].system = "http://jpfhir.jp/fhir/core/IdSystem/resourceInstance-identifier"
* identifier[requestIdentifier].value = "1234567890.2.1"
* status = #active
* intent = #order
* category[0] = http://terminology.hl7.org/CodeSystem/v2-0482#I "Inpatient Order"
* category[+] = $JP_MedicationCategoryMERIT9_CS#IHP "入院処方"
* category[+] = http://jpfhir.jp/fhir/core/CodeSystem/JHSI0001#FTP "定時処方"
* medicationReference = Reference(Medication/jp-medicationrequest-injection-medication-example-2)
* subject = Reference(Patient/jp-patient-example-1)
* authoredOn = "2016-07-01T07:28:17+09:00"
* requester = Reference(Practitioner/jp-practitioner-example-female-1)
* insurance = Reference(Coverage/jp-coverage-example-1)
* dosageInstruction.extension[0].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationDosage_Device"
* dosageInstruction.extension[=].valueReference = Reference(Device/jp-medicationrequest-injection-device-example-2)
* dosageInstruction.extension[+].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationDosage_Line"
* dosageInstruction.extension[=].valueCodeableConcept = $JP_MedicationExampleLine_CS#01 "末梢ルート"
* dosageInstruction.text = "主管 静脈注射 左腕"
* dosageInstruction.timing.repeat.boundsPeriod.start = "2016-07-01T08:00:00+09:00"
* dosageInstruction.timing.repeat.boundsPeriod.end = "2016-07-01T13:00:00+09:00"
* dosageInstruction.site.extension.url = $bodySite
* dosageInstruction.site.extension.valueReference = Reference(BodyStructure/jp-medicationrequest-injection-bodystructure-example-2)
* dosageInstruction.route = $JP_MedicationRouteHL70162_CS#IV "静脈内"
* dosageInstruction.method = urn:oid:1.2.392.200250.2.2.20.30#3 "注射"
* dosageInstruction.doseAndRate.doseQuantity = 510 'mL' "mL"
* dosageInstruction.doseAndRate.rateRatio.numerator = 102 'mL' "mL"
* dosageInstruction.doseAndRate.rateRatio.denominator = 1 'h' "時間"

Instance: jp-medicationrequest-injection-medication-example-1
InstanceOf: JP_Medication
Title: "JP Core Medication Example ホリゾン注射液"
Description: "ホリゾン注射液"
Usage: #inline
* status = #active
* ingredient.extension.url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Medication_Ingredient_DrugNo"
* ingredient.extension.valueInteger = 1
* ingredient.itemCodeableConcept = $JP_MedicationCodeHOT9_CS#100558502 "ホリゾン注射液１０ｍｇ"
* ingredient.strength.extension.url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Medication_IngredientStrength_StrengthType"
* ingredient.strength.extension.valueCodeableConcept = $JP_MedicationIngredientStrengthStrengthType_CS#1 "製剤量"
* ingredient.strength.numerator = 1 urn:oid:1.2.392.100495.20.2.101#AMP "アンプル"
* ingredient.strength.denominator = 1 urn:oid:1.2.392.100495.20.2.101#TIME "回"

Instance: jp-medicationrequest-injection-medication-example-2
InstanceOf: JP_Medication
Title: "JP Core Medication Example ソリタ－＋アドナ注"
Description: "ソリタ－＋アドナ注"
Usage: #inline
* status = #active
* ingredient[0].itemCodeableConcept = $JP_MedicationCodeHOT9_CS#107750603 "ソリタ－Ｔ３号輸液５００ｍＬ"
* ingredient[=].strength.extension.url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Medication_IngredientStrength_StrengthType"
* ingredient[=].strength.extension.valueCodeableConcept = $JP_MedicationIngredientStrengthStrengthType_CS#1 "製剤量"
* ingredient[=].strength.numerator = 1 urn:oid:1.2.392.100495.20.2.101#HON "本"
* ingredient[=].strength.denominator = 1 urn:oid:1.2.392.100495.20.2.101#TIME "回"
* ingredient[+].itemCodeableConcept = $JP_MedicationCodeHOT9_CS#108010002 "アドナ注（静脈用）５０ｍｇ／１０ｍＬ"
* ingredient[=].strength.extension.url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Medication_IngredientStrength_StrengthType"
* ingredient[=].strength.extension.valueCodeableConcept = $JP_MedicationIngredientStrengthStrengthType_CS#1 "製剤量"
* ingredient[=].strength.numerator = 1 urn:oid:1.2.392.100495.20.2.101#AMP "アンプル"
* ingredient[=].strength.denominator = 1 urn:oid:1.2.392.100495.20.2.101#TIME "回"

Instance: jp-medicationrequest-injection-bodystructure-example-1
InstanceOf: BodyStructure
Title: "BodyStructure Example 左腕"
Description: "左腕"
Usage: #inline
* location = http://terminology.hl7.org/CodeSystem/v2-0550#ARM "Arm"
* locationQualifier = http://terminology.hl7.org/CodeSystem/v2-0495#L "Left"
* patient = Reference(Patient/jp-patient-example-1)

Instance: jp-medicationrequest-injection-bodystructure-example-2
InstanceOf: BodyStructure
Title: "BodyStructure Example 右腕"
Description: "右腕"
Usage: #inline
* location = http://terminology.hl7.org/CodeSystem/v2-0550#ARM "Arm"
* locationQualifier = http://terminology.hl7.org/CodeSystem/v2-0495#R "Right"
* patient = Reference(Patient/jp-patient-example-1)

Instance: jp-medicationrequest-injection-device-example-2
InstanceOf: Device
Title: "Device Example 点滴ポンプ"
Description: "点滴ポンプ"
Usage: #inline
* type = http://terminology.hl7.org/CodeSystem/v2-0164#IVP "IV Pump"