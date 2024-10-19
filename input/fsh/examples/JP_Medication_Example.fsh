Instance: jp-medication-example-1
InstanceOf: JP_Medication
Title: "JP Core Medication Example ホリゾン注射液１０ｍｇ"
Description: "ホリゾン注射液１０ｍｇ"
Usage: #example
* status = #active
* ingredient.extension.url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Medication_Ingredient_DrugNo"
* ingredient.extension.valueInteger = 1
* ingredient.itemCodeableConcept = $JP_MedicationCodeHOT9_CS#100558502 "ホリゾン注射液１０ｍｇ"
* ingredient.strength.extension.url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Medication_IngredientStrength_StrengthType"
* ingredient.strength.extension.valueCodeableConcept = $JP_MedicationIngredientStrengthStrengthType_CS#1 "製剤量"
* ingredient.strength.numerator = 1 $JP_MedicationUnitMERIT9_CS#AMP "アンプル"

Instance: jp-medication-example-2
InstanceOf: JP_Medication
Title: "JP Core Medication Example ソリタ－＋アドナ注"
Description: "ソリタ－＋アドナ注"
Usage: #example
* status = #active
* ingredient[0].itemCodeableConcept = $JP_MedicationCodeHOT9_CS#107750603 "ソリタ－Ｔ３号輸液５００ｍＬ"
* ingredient[=].strength.numerator = 1 $JP_MedicationUnitMERIT9_CS#HON "本"
* ingredient[+].itemCodeableConcept = $JP_MedicationCodeHOT9_CS#108010002 "アドナ注（静脈用）５０ｍｇ／１０ｍＬ"
* ingredient[=].strength.numerator = 1 $JP_MedicationUnitMERIT9_CS#AMP "アンプル"


