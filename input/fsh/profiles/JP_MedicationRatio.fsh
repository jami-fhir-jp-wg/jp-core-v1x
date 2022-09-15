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
* extension contains JP_Medication_IngredientStrength_StrengthType named strengthType 0..1
* numerator only JP_MedicationQuantity
* numerator ^short = "投与量"
* denominator only JP_MedicationQuantity
* denominator ^short = "パッケージ量"

Profile: JP_MedicationRatio_DosePerPeriod
Parent: Ratio
Id: jp-medicationratio-doseperperiod
Title: "JP Core Medication Rate Ratio DataType"
Description: "このプロファイルはRatio DataTypeに対して、日本の薬剤単位を割り当てた派生型である。単位時間内での薬剤の容量（体積）を記述する"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationRatio_DosePerPeriod"
* . ^short = "単位時間内での薬剤の容量（体積）"
* . ^definition = "単位時間内での薬剤の容量（体積）"
* . ^comment = "【JP Core仕様】単位時間内での薬剤の容量（体積）、すなわち投与速度を記述する。単位はUCUMを使用する。"
* . ^requirements = "患者の体内に導入される、あるいはされた薬剤の速度を指定する。一般的には、たとえば1時間あたり100mlあるいは100ml/hrのように注射の速度を示す。たとえば、500mlを2時間でというように、単位時間あたりの速さを表現することもできる。その他、200マイクログラム/minや200マイクログラム/1分, 1 リットル/8時間のような表現もできる。しばしば、投与速度を投与総量/ 投与総時間で表ような場合に投与時間が明示される（たとえば、500ml/2時間という場合は、投与時間が2時間であることを示している）。しかしながら、投与速度で投与時間が明示されない場合（たとえば、250ml/毎時)は、timing.repeat.durationが注射の総投与時間を示すためには必要となる。"
* extension contains 
    JP_Medication_IngredientStrength_StrengthType named strengthType 0..1 and
    JP_MedicationAdministration_DosageRate_RateComment named rateComment ..*
* numerator only JP_MedicationQuantity
* numerator ^short = "投与量（体積）"
* numerator ^definition = "投与量（体積）"
* numerator.value ^short = "投与量（体積）"
* numerator.value ^definition = "投与量（体積）"
* numerator.unit ^short = "投与量（体積）の単位"
* numerator.unit ^definition = "投与量（体積）の単位。"
* denominator ^short = "単位時間"
* denominator ^definition = "単位時間"
* denominator.value ^short = "単位時間"
* denominator.value ^definition = "単位時間"
* denominator.unit from http://unitsofmeasure.org (preferred)
* denominator.unit ^short = "単位時間の単位"
* denominator.unit ^definition = "単位時間の単位。UCUMを使用する。"
* denominator.system from http://unitsofmeasure.org (preferred)
* denominator.system ^short = "UCUMを識別するURL。"
* denominator.system ^definition = "UCUMを識別するURL。固定値。"