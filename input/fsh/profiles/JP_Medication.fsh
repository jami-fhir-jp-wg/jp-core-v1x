// ==============================
//   Profile 定義
// ==============================
Profile: JP_Medication
Parent: Medication
Id: jp-medication
Title: "JP Core Medication Profile"
Description: "このプロファイルはMedicationリソースに対して、主に薬剤データを送受信するための基礎となる制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Medication"
* ^status = #active
* ^date = "2022-09-26"
* . ^short = "Medication Resourceの定義"
* . ^definition = "This resource is primarily used for the identification and definition of a medication for the purposes of prescribing, dispensing, and administering a medication as well as for making statements about medication use.\r\n\r\nこのResourceは薬剤を処方し、払い出し（調剤）、その投与を定義し、IDを付与するためにまず利用され、薬剤の使用状態を示すためにも使われる。"
// extension 参照宣言
* ingredient.extension contains JP_Medication_Ingredient_DrugNo named drugNo ..*
* ingredient.strength.extension contains JP_Medication_IngredientStrength_StrengthType named strengthType ..*
* id ^short = "このアーチファクトに対する論理ID"
* id ^definition = "リソースに対するURLとして使われるリソースの論理ID。この値は一度割り当てられたら変更されることはない。"
* id ^comment = "ResourceにIDがない時期は、create操作のためにサーバにResourceが送信されている時期だけである。"
* identifier ^short = "この薬剤に関する業務用のID"
* identifier ^definition = "この薬剤に関する業務用のID"
* identifier ^comment = "IDとしてシリアルナンバーを使うこともできる。"
* code from $JP_MedicationCode_VS (preferred)
* code ^short = "この薬剤を特定するコード"
* code ^definition = "A code (or set of codes) that specify this medication, or a textual description if no code is available. Usage note: This could be a standard medication code such as a code from RxNorm, SNOMED CT, IDMP etc. It could also be a national or local formulary code, optionally with translations to other code systems.\r\n\r\nこの薬剤を指定するコード。該当するコードがない場合はテキスト表記。\r\n使用法について注記：日本ではHOTコードを利用することが推奨される。一般的な薬剤コードとしてRxNorm、SNOMD CT, IDMPなど標準的な医薬品コードを使うことができる。国や地域に特有のローカルコードも使うことができ、他のコードに変換することもできる。"
* code ^comment = "使われるコンテキストによるが、ユーザ(処方や調剤などを行った人）によって実際にコードが選択されたのであれば、coding.userSelectedはtrueとすることとなる。Codingのデータ型で説明されているように、「ユーザインターフェース（たとえば、選択肢から特定の項目をユーザが選択するような形式）で特定のコードをユーザが選択したのであれば、\"userSelected\"に記録されてもよい」\r\nユーザが選択したコードがあれば、その選択がコード変換などで優先される。そのほかのコードは代替のコードシステムか低粒度のコード（たとえば、ベンダー固有の初期値のための一般的なコード）に文字列変換変換するしかない。"
* code ^binding.description = "薬品の種類を規定するコード化された概念"
* status 1..
* status ^definition = "薬剤が有効に使われているかどうかを指定するコード。"
* status ^comment = "このステータスは薬剤がローカルにあるシステム内で薬剤データベースや棚卸表で有効とされているかどうかを識別するためのものである。たとえば、薬剤システムで「ABC病院特製クリーム」といった製剤のために新しい薬剤ファイルを作成されるような場合もある。未来のある時点では、薬剤記録を作成した時にエラーが発生し、ステータスが「entered-in-error」に変化することもありうる。このステータスは薬剤が特定の処方集に記載されているかどうかを指定するためのものではない。薬剤記録が複数の処方集やカタログを参照することも可能であり、それぞれの記録が異なるステータスを持つこともある。"
* status ^isModifierReason = "このエレメントはすべての属性の解釈によって変化する。"
* manufacturer only Reference(JP_Organization)
* manufacturer ^short = "製品の製造者"
* manufacturer ^definition = "Describes the details of the manufacturer of the medication product.  This is not intended to represent the distributor of a medication product.\r\n\r\n医薬品の製造元の詳細を説明する。これは、医薬品の販売業者を表すことを意図したものではない。"
* form ^definition = "製品の剤型についての説明。散剤(powder)、錠剤(tablets)、カプセル(capsule)など。"
* form ^comment = "もし、Medication ResourceがMedicationRequest Resourceから参照された場合は、これはオーダされた剤型である。Medication ResourceがMedicationDispense Resourceから参照された場合は、払い出された剤型である。MedicationAdministration ResourceからMedication Resourceが参照されていれば、投与された剤型である。"
* amount only JP_MedicationRatio_Amount
* amount ^short = "パッケージ中の薬剤の量"
* amount ^definition = "パッケージされた製品に含まれる薬剤固有の量。たとえば、同じ力価の製品を指定すれば（たとえば、インスリングラルギン10単位/mL注射液）、この値はパッケージ内での薬剤量（たとえば、3mL, 10mLなど）を明示することになる。"
* amount ^comment = "比率（Ratio)を表すデータ型は、量(Quantity)と共通単位を使って適切に表現できないときのみに使われるべきである。分母が\"1\"に固定されているとわかっているような場合は、量(Quantity)を比率(Ratio)の代わりに使うべきである。"
* ingredient ^short = "薬効がある、あるいは薬効を伴わない成分"
* ingredient ^definition = "この薬剤を構成する特定の重要成分を識別する"
* ingredient ^comment = "すべての成分を含む必要はない。もし、ある成分が記載されていなくてもその成分が含有されているかどうかを必ずしも意味しない。特定の成分が記載されていても、すべての成分が記載されていると言うことを意味しない。有効成分であるか、有効成分ではないかを指定することは可能である。"
* ingredient.extension ^slicing.discriminator.type = #value
* ingredient.extension ^slicing.discriminator.path = "url"
* ingredient.extension ^slicing.rules = #open
* ingredient.item[x] only CodeableConcept
* ingredient.item[x] ^short = "有効な成分あるいは含有物"
* ingredient.item[x] ^definition = "有効成分。物質(単純成分）あるいは他の薬剤や処方。"
* ingredient.item[x] ^comment = "すべての用語集はこの一般的な様式を満たさない。場合によっては、情報モデルとしてCodeableConceptや直接Codingを使うべきではなく、テキストやコード、翻訳や事前条件と事後条件でのエレメントの関係などを示すことも適切ではない。"
* ingredient.item[x] ^requirements = "成分は物質（たとえば、アモキシシリン）や、他の薬剤（たとえば、Glaxal Baseなどの合成製品）を参照されることもある。"
* ingredient.isActive ^short = "有効成分の指標"
* ingredient.isActive ^definition = "この成分が薬剤の治療効果に影響するかどうかの指標\r\n\r\nIndication of whether this ingredient affects the therapeutic action of the drug."
* ingredient.isActive ^requirements = "Trueであれば、この成分が薬剤の治療効果に影響がある（たとえば有効）ということを示す。\r\nFalseであれば、この成分が薬剤の治療効果に影響がない（たとえば無効）ということを示す。"
* ingredient.strength 1..
* ingredient.strength.extension[strengthType] only JP_Medication_IngredientStrength_StrengthType
* ingredient.strength.extension[strengthType] ^definition = "投与量が製剤単位か成分単位かを格納する拡張"
* ingredient.strength only JP_MedicationRatio_Amount
* ingredient.strength ^short = "成分の活性量"
* ingredient.strength ^definition = "この薬剤中にどの程度の物質が含まれているかを示す。たとえば、1錠あたり250mgなど。これは分子が250mgで分母が1錠である比率を表現している。"
* ingredient.strength ^comment = "Ratioデータ型は2つの数字の関係で示され、Quantityや一般的な単位で適切に表現できない関係を表すときにのみ用いられる。分母の値が「1」で固定されているような値であれば、QuantityがRatioの代わりに用いられるべきである。"
* batch ^short = "分包された薬剤についての詳細な解説"
* batch ^definition = "薬剤のパッケージ（薬品そのものではない）についての情報。"
* batch.lotNumber ^short = "バッチのID"
* batch.lotNumber ^definition = "特定の薬品を含むバッチに割り当てられたロット番号"
* batch.lotNumber ^comment = "FHIRの文字列は1MBを超えるサイズであってはならない(SHALL NOT)。"
* batch.expirationDate ^short = "このバッチの期限が切れるとき"
* batch.expirationDate ^definition = "この特定のバッチの薬剤の期限が切れるとき"

* form from $JP_MedicationFormMERIT9_VS (preferred)

// ==============================
//   Extension 定義
// ==============================
Extension: JP_Medication_Ingredient_DrugNo
Id: jp-medication-ingredient-drugno
Title: "JP Core Medication Ingredient DrugNo Extension"
Description: "同一剤グループ内での順番を格納する拡張"
* ^url = $JP_Medication_Ingredient_DrugNo
* ^date = "2022-09-26"
* ^purpose = "同一剤グループ内での順番を格納する拡張"
* ^context.type = #element
* ^context.expression = "Medication.ingredient"
* . ^short = "RP内の薬剤の連番"
* . ^definition = "RP内の薬剤の連番"
* id ^short = "RP内の薬剤の連番"
* id ^definition = "RP内の薬剤の連番"
* url = $JP_Medication_Ingredient_DrugNo (exactly)
* value[x] only integer

Extension: JP_Medication_IngredientStrength_StrengthType
Id: jp-medication-ingredientstrength-strengthtype
Title: "JP Core Medication IngredientStrength StrengthType Extension"
Description: "投与量が製剤単位か成分単位かを格納する拡張"
* ^url = $JP_Medication_IngredientStrength_StrengthType
* ^date = "2022-09-26"
* ^purpose = "投与量が製剤単位か成分単位かを格納する拡張"
* ^context.type = #element
* ^context.expression = "Medication.ingredient.strength"
* . ^short = "力価区分"
* . ^definition = "投与量が製剤単位か成分単位かを格納する"
* url = $JP_Medication_IngredientStrength_StrengthType (exactly)
* value[x] only CodeableConcept
* value[x] from JP_MedicationIngredientStrengthStrengthType_VS (example)
