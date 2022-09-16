// ==============================
// JP_MedicationRatio_Amount DataType
// ==============================
Profile: JP_MedicationRatio_Amount
Parent: Ratio
Id: jp-medicationratio-amount
Title: "JP Core Medication Ratio Amount DataType"
Description: "このプロファイルはRatio Amount DataTypeに対して、日本の薬剤単位を割り当てた派生型である。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationRatio_Amount"
* ^status = #draft
* ^date = "2022-03-16"
* . ^short = "パッケージあたり薬剤の投与量"
* . ^definition = "パッケージあたり薬剤の投与量"
* . ^comment = "パッケージあたり薬剤の投与量について薬剤単位をバインディングした型である。"
* numerator only JP_MedicationQuantity
* numerator ^short = "投与量"
* denominator only JP_MedicationQuantity
* denominator ^short = "パッケージ量"

// ==============================
// JP_MedicationRatio_DosePerPeriod DataType
// ==============================
Profile: JP_MedicationRatio_DosePerPeriod
Parent: Ratio
Id: jp-medicationratio-doseperperiod
Title: "JP Core Medication Rate Ratio DataType"
Description: "このプロファイルはRatio DataTypeに対して、日本の薬剤単位を割り当てた派生型である。単位時間内での薬剤の容量を記述する"
* ^status = #draft
* ^date = "2022-03-16"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationRatio_DosePerPeriod"
* . ^short = "単位時間内での薬剤の容量"
* . ^definition = "単位時間内での薬剤の容量"
* numerator only JP_MedicationQuantity
* numerator ^short = "投与量"
* numerator ^definition = "投与量"
* numerator.value ^short = "投与量"
* numerator.value ^definition = "投与量"
* numerator.unit ^short = "投与量の単位"
* numerator.unit ^definition = "投与量の単位。"
* denominator ^short = "単位時間"
* denominator ^definition = "単位時間"
* denominator.value ^short = "単位時間"
* denominator.value ^definition = "単位時間"
* denominator.unit ^short = "単位時間の単位"
* denominator.unit ^definition = "単位時間の単位。UCUMを使用する。"
* denominator.system from $units-of-time (preferred)
* denominator.system ^short = "UCUMを識別するURL。"
* denominator.system ^definition = "UCUMを識別するURL。固定値。"
* denominator.code from $units-of-time (preferred)

// ==============================
// JP_MedicationRatio_DosePerDay DataType
// ==============================
Profile: JP_MedicationRatio_DosePerDay
Parent: JP_MedicationRatio_DosePerPeriod
Id: jp-medicationratio-doseperday
Title: "JP Core Medication Rate Ratio DosePerDay DataType"
Description: "このプロファイルはRatio  DataTypeに対して、日本の薬剤単位を割り当てた派生型である。単位時間内での薬剤の容量を記述する"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationRatio_DosePerDay"
* ^status = #draft
* ^date = "2022-03-16"
* . ^short = "１日当たりでの薬剤の投入量"
* . ^definition = "１日当たりでの薬剤の投入量"
* numerator only JP_MedicationQuantity
* numerator ^short = "投与量"
* numerator ^definition = "投与量"
* numerator.value ^short = "投与量"
* numerator.value ^definition = "投与量"
* numerator.unit ^short = "投与量の単位"
* numerator.unit ^definition = "投与量の単位。"
* denominator ^short = "単位時間"
* denominator ^definition = "単位時間"
* denominator.value = 1 (exactly)
* denominator.value ^short = "単位時間(１日)"
* denominator.value ^definition = "単位時間(１日)固定"
* denominator.unit ^short = "単位時間の単位"
* denominator.unit ^definition = "単位時間の単位。UCUMを使用する。"
* denominator.unit = "日" (exactly)
* denominator.system = "http://unitsofmeasure.org" (exactly)
* denominator.system ^short = "UCUMを識別するURL。"
* denominator.system ^definition = "UCUMを識別するURL。固定値。"
* denominator.code from $units-of-time (required)
* denominator.code = #d (exactly)
