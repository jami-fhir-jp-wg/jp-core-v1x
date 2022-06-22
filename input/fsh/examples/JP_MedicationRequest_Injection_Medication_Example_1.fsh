Instance: jp-medicationrequest-injection-medication-example-1
InstanceOf: JP_Medication
Title: "JP Medication ホリゾン注射液"
Description: "ホリゾン注射液"
Usage: #example
* status = #active
* ingredient.extension.url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Medication_Ingredient_DrugNo"
* ingredient.extension.valueInteger = 1
* ingredient.itemCodeableConcept = urn:oid:1.2.392.100495.20.2.74#100558502 "ホリゾン注射液１０ｍｇ"
* ingredient.strength.extension.url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Medication_IngredientStrength_StrengthType"
* ingredient.strength.extension.valueCodeableConcept = urn:oid:1.2.392.100495.20.2.22#1 "製剤量"
* ingredient.strength.numerator = 1 urn:oid:1.2.392.100495.20.2.101#AMP "アンプル"
* ingredient.strength.denominator = 1 urn:oid:1.2.392.100495.20.2.101#KAI "回"