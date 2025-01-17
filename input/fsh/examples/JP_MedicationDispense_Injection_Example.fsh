Instance: jp-medicationdispense-injection-example-1
InstanceOf: JP_MedicationDispense_Injection
Title: "JP Core MedicationDispense Injection Example 調剤実施 注射薬"
Description: "調剤実施 注射薬"
Usage: #example
* contained[0] = jp-medicationdispense-injection-medication-example-1
* contained[+] = jp-medicationdispense-injection-bodystructure-example-1
* identifier[rpNumber].system = $JP_Medication_RPGroupNumber
* identifier[rpNumber].value = "1"
* identifier[requestIdentifier].system = $JP_IdSystem_PrescriptionDocumentID
* identifier[requestIdentifier].value = "1234567890.1"
* status = #completed
* category = http://terminology.hl7.org/CodeSystem/v2-0482#I "Inpatient Order"
* medicationReference = Reference(jp-medicationdispense-injection-medication-example-1)
* subject = Reference(Patient/jp-patient-example-1)
* performer.function = http://terminology.hl7.org/CodeSystem/medicationdispense-performer-function#packager "Packager"
* performer.actor = Reference(Practitioner/jp-practitioner-example-female-1)
* quantity = 2 'mL' "mL"
* whenPrepared = "2021-10-07T10:47:19+09:00"
* whenHandedOver = "2021-10-07T10:55:23+09:00"
* destination = Reference(Location/jp-location-example-ward)
* dosageInstruction.additionalInstruction = $JP_MedicationUsageJAMIAdditional_CS#I1100000 "１日おき"
* dosageInstruction.timing.repeat.boundsPeriod.start = "2016-07-01T10:00:00+09:00"
* dosageInstruction.text = "ワンショット 静脈注射 静脈内"
* dosageInstruction.site.extension.url = $bodySite
* dosageInstruction.site.extension.valueReference = Reference(jp-medicationdispense-injection-bodystructure-example-1)
* dosageInstruction.site.extension.valueReference.type = "BodyStructure"
* dosageInstruction.route = $JP_MedicationRouteHL70162_CS#IV "静脈内"
* dosageInstruction.method = $JP_MedicationMethodJAMIDetailUsage_CS#30 "静脈注射"
* dosageInstruction.doseAndRate.doseQuantity = 2 'mL' "mL"

Instance: jp-medicationdispense-injection-medication-example-1
InstanceOf: JP_Medication
Usage: #inline
* status = #active
* ingredient[+].extension.url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Medication_Ingredient_DrugNo"
* ingredient[=].extension.valueInteger = 1
* ingredient[=].itemCodeableConcept = $JP_MedicationCodeHOT9_CS#100558502 "ホリゾン注射液１０ｍｇ"
* ingredient[=].strength.extension.url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Medication_IngredientStrength_StrengthType"
* ingredient[=].strength.extension.valueCodeableConcept = $JP_MedicationIngredientStrengthStrengthType_CS#1 "製剤量"
* ingredient[=].strength.numerator = 1 $JP_MedicationUnitMERIT9_CS#AMP "アンプル"
* ingredient[=].strength.denominator = 1 $JP_MedicationUnitMERIT9_CS#TIME "回"


Instance: jp-medicationdispense-injection-bodystructure-example-1
InstanceOf: BodyStructure
Title: "BodyStructure 左腕"
Description: "左腕"
Usage: #inline
* location = http://terminology.hl7.org/CodeSystem/v2-0550#ARM "Arm"
* locationQualifier = http://terminology.hl7.org/CodeSystem/v2-0495#L "Left"
* patient = Reference(Patient/jp-patient-example-1)
