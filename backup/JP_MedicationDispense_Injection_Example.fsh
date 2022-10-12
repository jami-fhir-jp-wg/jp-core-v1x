Instance: jp-medicationdispense-injection-example-1
InstanceOf: JP_MedicationDispense_Injection
Title: "JP Core MedicationDispense Injection Example 調剤実施 注射薬"
Description: "調剤実施 注射薬"
Usage: #example
* contained[0] = jp-medicationdispense-injection-medication-example-1
* contained[+] = jp-medicationdispense-injection-bodystructure-example-1
* identifier[rpNumber].system = "urn:oid:1.2.392.100495.20.3.81"
* identifier[rpNumber].value = "1"
* identifier[requestIdentifier].system = "http://jpfhir.jp/fhir/core/IdSystem/resourceInstance-identifier"
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
* dosageInstruction.additionalInstruction = urn:oid:1.2.392.200250.2.2.20.22#I1100000 "１日おき"
* dosageInstruction.timing.repeat.boundsPeriod.start = "2016-07-01T10:00:00+09:00"
* dosageInstruction.text = "ワンショット 静脈注射 静脈内"
* dosageInstruction.site.extension.url = $bodySite
* dosageInstruction.site.extension.valueReference = Reference(jp-medicationdispense-injection-bodystructure-example-1)
* dosageInstruction.site.extension.valueReference.type = "BodyStructure"
* dosageInstruction.route = http://jpfhir.jp/fhir/core/CodeSystem/route-codes#IV "静脈内"
* dosageInstruction.method = urn:oid:1.2.392.200250.2.2.20.40#30 "静脈注射"
* dosageInstruction.doseAndRate.doseQuantity = 2 'mL' "mL"

Instance: jp-medicationdispense-injection-medication-example-1
InstanceOf: JP_Medication
Usage: #inline
* status = #active
* ingredient.extension.url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Medication_Ingredient_DrugNo"
* ingredient.extension.valueInteger = 1
* ingredient.itemCodeableConcept = urn:oid:1.2.392.200119.4.403.1#100558502 "ホリゾン注射液１０ｍｇ"
* ingredient.strength.extension.url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Medication_IngredientStrength_StrengthType"
* ingredient.strength.extension.valueCodeableConcept = urn:oid:1.2.392.100495.20.2.22#1 "製剤量"
* ingredient.strength.numerator = 1 urn:oid:1.2.392.100495.20.2.101#AMP "アンプル"
* ingredient.strength.denominator = 1 urn:oid:1.2.392.100495.20.2.101#TIME "回"

Instance: jp-medicationdispense-injection-bodystructure-example-1
InstanceOf: BodyStructure
Title: "BodyStructure 左腕"
Description: "左腕"
Usage: #inline
* location = http://terminology.hl7.org/CodeSystem/v2-0550#ARM "Arm"
* locationQualifier = http://terminology.hl7.org/CodeSystem/v2-0495#L "Left"
* patient = Reference(Patient/jp-patient-example-1)
