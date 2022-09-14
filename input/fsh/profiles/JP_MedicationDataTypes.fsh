// ==============================
//   DataType 定義
// ==============================
Profile: JP_MedicationQuantity
Parent: Quantity
Id: jp-medicationquantity
Title: "JP Core Medication Quantity DataType"
Description: "このプロファイルはQuantity DataTypeに対して、薬剤量に関する定義を行なったものである"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationQuantity"
* ^status = #draft
* ^date = "2022-03-16"
* . ^short = "薬剤に関する数量と単位を定めたデータイプ"
* . ^definition = "薬剤に関する数量と単位を定めたデータイプ"
* . ^comment = "薬剤に関する数量と単位を定めている。ValueおよびCodeを必須としている。単位についてはMERIT9医薬品単位略号の利用を推進している。(**SHOULD**)"
* value 1..
* value ^short = "（精度が暗示された）数値"
* value ^definition = "計測された量。精度を含めた値が暗示される。"
* value ^comment = "暗示された精度については常に尊重すべきである。貨幣計算では制度に関する独自のルールがある（会計についての標準的な教科書を参照すること）。"
* comparator ^short = "< | <= | >= | > - 値の解釈法"
* comparator ^definition = "実際の値が計測して示された値よりも大きいのか小さいのかなど、値がどのように解釈され、表現されるのかを示している。たとえば、もし、comparatorエレメントが\"<\"であれば、実際の値は示された値よりも小さい(<)。"
* comparator ^comment = "FHIRの文字列は1MB以上の大きさとなってなはらない(SHALL NOT)。"
* comparator ^requirements = "計測法に制限があって値が<5ug/L や >400mg/L として示されるような場合でも値を扱えるようなフレームワークが必要である。"
* unit ^short = "単位表現"
* unit ^definition = "人間にも可読な単位表現"
* unit ^comment = "FHIRの文字列は1MB以上の大きさとなってなはらない(SHALL NOT)。"
* unit ^requirements = "コンテキストによってさまざまな単位の表現がある。固定された特定の表現が求められることがある。たとえば、mcgはmicrogramを表す。"
* system from JP_MedicationUnitMERIT9_VS (preferred)
* system ^short = "コード化された単位表現を規定するシステム"
* system ^definition = "単位をコード化して表現するシステムについてのID。"
* system ^comment = "以下参照。 http://en.wikipedia.org/wiki/Uniform_resource_identifier"
* system ^requirements = "システムによって定義される単位のコードを把握しておく必要がある。"
* code 1..
* code from JP_MedicationUnitMERIT9_VS (preferred)
* code ^short = "単位のコード化された形式、【JP Core仕様】MERIT9医薬品単位略号マスタコードを推奨"
* code ^definition = "単位のコード化された形式、【JP Core仕様】MERIT9医薬品単位略号マスタコードを推奨(**SHOULD**)"
* code ^comment = "単位のコード化された形式、【JP Core仕様】MERIT9医薬品単位略号マスタコードを推奨(**SHOULD**)されるが、ローカルコード等を利用することも可能とする"


Profile: JP_MedicationSimpleQuantity
Parent: SimpleQuantity
Id: jp-medicationsimplequantity
Title: "JP Core Medication Quantity DataType"
Description: "このプロファイルはQuantity DataTypeに対して、薬剤量に関する定義を行なったものである"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationSimpleQuantity"
* ^status = #draft
* ^date = "2022-03-16"
* . ^short = "薬剤に関する数量と単位を定めた簡易データイプ"
* . ^definition = "薬剤に関する数量と単位を定めた簡易データイプ"
* . ^comment = "薬剤に関する簡易的な数量と単位を定めている。ValueおよびCodeを必須とし、comparatorは記述不可。単位についてはMERIT9医薬品単位略号の利用を推進している。(**SHOULD**)"
* value 1..
* value ^short = "（精度が暗示された）数値"
* value ^definition = "計測された量。精度を含めた値が暗示される。"
* value ^comment = "暗示された精度については常に尊重すべきである。貨幣計算では制度に関する独自のルールがある（会計についての標準的な教科書を参照すること）。"
* unit ^short = "単位表現"
* unit ^definition = "人間にも可読な単位表現"
* unit ^comment = "FHIRの文字列は1MB以上の大きさとなってなはらない(SHALL NOT)。"
* unit ^requirements = "コンテキストによってさまざまな単位の表現がある。固定された特定の表現が求められることがある。たとえば、mcgはmicrogramを表す。"
* system from JP_MedicationUnitMERIT9_VS (preferred)
* system ^short = "コード化された単位表現を規定するシステム"
* system ^definition = "単位をコード化して表現するシステムについてのID。"
* system ^comment = "以下参照。 http://en.wikipedia.org/wiki/Uniform_resource_identifier"
* system ^requirements = "システムによって定義される単位のコードを把握しておく必要がある。"
* code 1..
* code from JP_MedicationUnitMERIT9_VS (preferred)
* code ^short = "単位のコード化された形式、【JP Core仕様】MERIT9医薬品単位略号マスタコードを推奨"
* code ^definition = "単位のコード化された形式、【JP Core仕様】MERIT9医薬品単位略号マスタコードを推奨(**SHOULD**)"
* code ^comment = "単位のコード化された形式、【JP Core仕様】MERIT9医薬品単位略号マスタコードを推奨(**SHOULD**)されるが、ローカルコード等を利用することも可能とする"


Profile: JP_MedicationRatio
Parent: Ratio
Id: jp-medicationratio
Title: "JP Core Medication Ratio DataType"
Description: "このプロファイルはRatio DataTypeに対して、日本の薬剤単位を割り当てた派生型である。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationRatio"
* ^status = #draft
* ^date = "2022-03-16"
* . ^short = "単位時間あたり薬剤の投与量"
* . ^definition = "単位時間あたり薬剤の投与量"
* . ^comment = "単位時間あたり薬剤の投与量について薬剤単位をバインディングした型である。"
* extension contains JP_Medication_IngredientStrength_StrengthType named strengthType 0..1
* numerator only JP_MedicationQuantity
* numerator ^short = "投与量"

Profile: JP_MedicationRateRatio
Parent: Ratio
Id: jp-medicationrateratio
Title: "JP Core Medication Rate Ratio DataType"
Description: "このプロファイルはRatio DataTypeに対して、日本の薬剤単位を割り当てた派生型である。単位時間内での薬剤の容量（体積）を記述する"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationRateRatio"
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
