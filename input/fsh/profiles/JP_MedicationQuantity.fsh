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



