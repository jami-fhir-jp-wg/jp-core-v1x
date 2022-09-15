// ==============================
//   DataType 定義
// ==============================
Profile: JP_MedicationRange
Parent: Range
Id: jp-medicationrange
Title: "JP Core Medication Range DataType"
Description: "このプロファイルはRange DataTypeに対して、薬剤量の上限下限に関する定義を行なったものである"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationRange"
* ^status = #draft
* ^date = "2022-03-16"
* . ^short = "薬剤の単位指定された上限下限量"
* . ^definition = "薬剤の単位指定された上限下限量"
* . ^comment = "薬剤の上限量、下限量の範囲を持っている。単位指定された数量を割り当てている。"
* extension contains JP_Medication_IngredientStrength_StrengthType named strengthType 0..1
* low only JP_MedicationSimpleQuantity
* low ^short = "薬剤の下限量"
* high only JP_MedicationSimpleQuantity
* low ^short = "薬剤の上限量"
