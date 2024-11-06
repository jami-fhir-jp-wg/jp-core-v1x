Instance: jp-medicationstatement-injection-example-1
InstanceOf: JP_MedicationStatement_Injection
Title: "JP Core MedicationStatement Injection Example 投与申告情報 ソリタ－＋アドナ注"
Description: "投与申告情報 ソリタ－＋アドナ注"
Usage: #example
* contained[0] = jp-medicationstatement-injection-medication-example-1
* contained[+] = jp-medicationstatement-injection-bodystructure-example-1
* contained[+] = jp-medicationstatement-injection-device-example-1
* status = #completed
* medicationReference = Reference(Medication/jp-medicationstatement-injection-medication-example-1)
* subject = Reference(Patient/jp-patient-example-1)
* effectivePeriod.start = "2020-04-01T00:00:00+09:00"
* effectivePeriod.end = "2020-04-14T00:00:00+09:00"
* dateAsserted = "2020-05-01T12:28:17+09:00"
* informationSource = Reference(Patient/jp-patient-example-1)
* derivedFrom = Reference(MedicationRequest/jp-medicationrequest-injection-example-2)
* reasonCode = urn:oid:1.2.392.200119.4.101.6#TQ7A "急性気管支炎"
* dosage.extension[device].valueReference = Reference(Device/jp-medicationstatement-injection-device-example-1)
* dosage.extension[line].valueCodeableConcept.coding = $JP_MedicationExampleLine_CS#01 "末梢ルート"
* dosage.text = "主管 静脈注射 左腕"
* dosage.timing.repeat.boundsPeriod.start = "2016-07-01T08:00:00+09:00"
* dosage.timing.repeat.boundsPeriod.end = "2016-07-01T13:00:00+09:00"
* dosage.site.extension.url = $bodySite
* dosage.site.extension.valueReference = Reference(BodyStructure/jp-medicationstatement-injection-bodystructure-example-1)
* dosage.route = $JP_MedicationRouteHL70162_CS#IV "静脈内"
* dosage.method = $JP_MedicationMethodJAMIBasicUsage_CS#3 "注射"
* dosage.doseAndRate.doseQuantity = 510 'mL' "mL"
* dosage.doseAndRate.rateRatio.numerator = 102 'mL' "mL"
* dosage.doseAndRate.rateRatio.denominator = 1 'h' "時間"

Instance: jp-medicationstatement-injection-medication-example-1
InstanceOf: JP_Medication
Title: "JP Core Medication Example ソリタ－＋アドナ注"
Description: "ソリタ－＋アドナ注"
Usage: #inline
* status = #active
* ingredient[0].itemCodeableConcept = $JP_MedicationCodeHOT9_CS#107750603 "ソリタ－Ｔ３号輸液５００ｍＬ"
* ingredient[=].strength.extension.url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Medication_IngredientStrength_StrengthType"
* ingredient[=].strength.extension.valueCodeableConcept = $JP_MedicationIngredientStrengthStrengthType_CS#1 "製剤量"
* ingredient[=].strength.numerator = 1 $JP_MedicationUnitMERIT9_CS#HON "本"
* ingredient[=].strength.denominator = 1 $JP_MedicationUnitMERIT9_CS#TIME "回"
* ingredient[+].itemCodeableConcept = $JP_MedicationCodeHOT9_CS#108010002 "アドナ注（静脈用）５０ｍｇ／１０ｍＬ"
* ingredient[=].strength.extension.url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Medication_IngredientStrength_StrengthType"
* ingredient[=].strength.extension.valueCodeableConcept = $JP_MedicationIngredientStrengthStrengthType_CS#1 "製剤量"
* ingredient[=].strength.numerator = 1 $JP_MedicationUnitMERIT9_CS#AMP "アンプル"
* ingredient[=].strength.denominator = 1 $JP_MedicationUnitMERIT9_CS#TIME "回"

Instance: jp-medicationstatement-injection-bodystructure-example-1
InstanceOf: BodyStructure
Title: "BodyStructure Example 左腕"
Description: "左腕"
Usage: #inline
* location = http://terminology.hl7.org/CodeSystem/v2-0550#ARM "Arm"
* locationQualifier = http://terminology.hl7.org/CodeSystem/v2-0495#L "Left"
* patient = Reference(Patient/jp-patient-example-1)

Instance: jp-medicationstatement-injection-device-example-1
InstanceOf: Device
Title: "Device Example 点滴ポンプ"
Description: "点滴ポンプ"
Usage: #inline
* type = http://terminology.hl7.org/CodeSystem/v2-0164#IVP "IV Pump"