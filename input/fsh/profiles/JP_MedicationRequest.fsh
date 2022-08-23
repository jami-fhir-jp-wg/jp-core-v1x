// ==============================
//   Profile 定義
// ==============================
Profile: JP_MedicationRequest
Parent: JP_MedicationRequestBase
Id: jp-medicationrequest
Title: "JP Core MedicationRequest Profile"
Description: "このプロファイルはJP_MedicationRequestBaseリソースに対して、内服・外用薬剤処方のデータを送受信するための基礎となる制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationRequest"
* ^status = #draft
* ^date = "2022-03-16"
// * ^purpose = "このプロファイルはJP_MedicationRequestBaseリソースに対して、内服・外用薬剤処方のデータを送受信するための基礎となる制約と拡張を定めたものである。"
* . ^short = "患者あるいはグループに対しての処方オーダ"
* . ^definition = "患者への薬の供給と内服・外用薬剤処方の指示を共に提供するオーダ。ケアプランやワークフローパターンとハーモナイズし、入院や外来でも使えるようにするため、このリソースは\"MedicationPrescription\"や\"MedicationOrder\"ではなく、\"MedicationRequest\"と呼ばれる。JP_MedicationRequestBaseプロファイルからの派生プロファイルである。"
* identifier contains
    orderInRp 1..1
* identifier[orderInRp] ^short = "同一RP番号（剤グループ）での薬剤の表記順"
* identifier[orderInRp] ^definition = "同一剤グループでの薬剤を表記する際の順番。XML形式と異なりJSON形式の場合、表記順は項目の順序を意味しない。したがって、薬剤の記載順を別に規定する必要があるためIDを用いて表現する。"
* identifier[orderInRp] ^comment = "同一剤グループ内での薬剤の順番を1から順の番号で示す。"
* identifier[orderInRp].use ..0
* identifier[orderInRp].type ..0
* identifier[orderInRp].system 1..
* identifier[orderInRp].system = "urn:oid:1.2.392.100495.20.3.82" (exactly)
* identifier[orderInRp].system ^short = "RP番号内（剤グループ内）の連番を示すsystem値"
* identifier[orderInRp].system ^definition = "剤グループ内番号の名前空間を識別するURI。固定値urn:oid:1.2.392.100495.20.3.82"
* identifier[orderInRp].value 1..
* identifier[orderInRp].value ^short = "RP番号内（剤グループ内）の連番"
* identifier[orderInRp].value ^definition = "剤グループ内連番。"
* identifier[orderInRp].value ^comment = "value は string型であり、数値はゼロサプレス、つまり、'01'でなく'1'と指定すること。"
* identifier[orderInRp].period ..0
* identifier[orderInRp].assigner ..0
* dosageInstruction.doseAndRate.rateRatio.denominator 1..
* dosageInstruction.doseAndRate.rateRatio.denominator ^short = "1日投与量の分母である「1日」を表す"
* dosageInstruction.doseAndRate.rateRatio.denominator ^definition = "1日投与量の分母である「1日」を表す。"
* dosageInstruction.doseAndRate.rateRatio.denominator.value 1..
* dosageInstruction.doseAndRate.rateRatio.denominator.value = 1 (exactly)
* dosageInstruction.doseAndRate.rateRatio.denominator.value ^short = "1日投与量の分母である「1日」"
* dosageInstruction.doseAndRate.rateRatio.denominator.value ^definition = "1日投与量の分母である「1日」を表す。"
* dosageInstruction.doseAndRate.rateRatio.denominator.comparator ..0
* dosageInstruction.doseAndRate.rateRatio.denominator.unit 1..
* dosageInstruction.doseAndRate.rateRatio.denominator.code = #d (exactly)
* dosageInstruction.doseAndRate.rateRatio.denominator.system = "http://unitsofmeasure.org" (exactly)
* dosageInstruction.doseAndRate.rateRatio.denominator.unit = "日" (exactly)
* dosageInstruction.doseAndRate.rateRatio.denominator.unit ^short = "1日投与量の分母である「1日」の単位"
* dosageInstruction.doseAndRate.rateRatio.denominator.unit ^definition = "1日投与量の分母である「1日」の単位。「日」で固定される。"
* dosageInstruction.doseAndRate.rateRatio.denominator.system 1..
* dosageInstruction.doseAndRate.rateRatio.denominator.system ^short = "UCUM単位コードを識別するURI"
* dosageInstruction.doseAndRate.rateRatio.denominator.system ^definition = "UCUM単位コードを識別するURI"
* dosageInstruction.doseAndRate.rateRatio.denominator.code 1..
* dosageInstruction.doseAndRate.rateRatio.denominator.code ^short = "「日」を表すUCUM単位コード。"
* dosageInstruction.doseAndRate.rateRatio.denominator.code ^definition = "「日」を表すUCUM単位コード。dで固定される。"
* dosageInstruction.doseAndRate.type 1..
* dosageInstruction.doseAndRate.type ^short = "力価区分"
* dosageInstruction.doseAndRate.type ^definition = "力価区分"
* dosageInstruction.doseAndRate.type ^comment = "投与速度・量の一般的パターンに全てのターミノロジーが適応しているわけではない。情報モデルはCodeableConceptではなく、直接Codingをを使用してテキストやコーディング、翻訳、そしてエレメントと事前条件、事後条件の関係について管理するためにその構造を提示する必要がある。"
* dosageInstruction.doseAndRate.type ^requirements = "このtypeに値が指定されていなければ、\"ordered\"であることが想定される。"
* dosageInstruction.doseAndRate.type.id ^short = "エレメント間参照のためのユニークID"
* dosageInstruction.doseAndRate.type.id ^definition = "エレメント間参照のためのユニークID。空白を含まない全ての文字を使ってもよい(MAY)。"
* dosageInstruction.doseAndRate.type.coding 1..1
* dosageInstruction.doseAndRate.type.coding ^short = "力価区分コード"
* dosageInstruction.doseAndRate.type.coding ^definition = "力価区分コード"
* dosageInstruction.doseAndRate.type.coding ^comment = "コードは臨時で列記したものや、コードのリストからSNOMED CTのように公式に定義されたものまである（HL7 v3 core principle を参照)。FHIR自体ではコーディング規約を定めてはいないし、意味を暗示するために利用されない(SHALL NOT)。一般的に UserSelected = trueの場合には一つのコードシステムが使われる。"
* dosageInstruction.doseAndRate.type.coding ^requirements = "他のコードシステムへの変換や代替のコードシステムを使ってエンコードしてもよい。"
* dosageInstruction.doseAndRate.type.coding.id ^short = "エレメント間参照のためのユニークID"
* dosageInstruction.doseAndRate.type.coding.id ^definition = "エレメント間参照のためのユニークID。空白を含まない全ての文字を使ってもよい(MAY)。"
* dosageInstruction.doseAndRate.type.coding.system 1..
* dosageInstruction.doseAndRate.type.coding.system = "urn:oid:1.2.392.100495.20.2.22" (exactly)
* dosageInstruction.doseAndRate.type.coding.system ^short = "力価区分コードのコード体系を識別するURI"
* dosageInstruction.doseAndRate.type.coding.system ^definition = "力価区分コードのコード体系を識別するURI。固定値。"
* dosageInstruction.doseAndRate.type.coding.system ^comment = "URIはOID(urn:oid:....)やUUID(urn:uuid:....)であることもある。OIDやUUIDはHL7のOIDレジストリを参照していなければならない（SHALL)。そうでなければ、URIはHL7のFHIRのリストに挙げられている特別なURIであるか、用語集が明確な定義が参照されるべきである。"
* dosageInstruction.doseAndRate.type.coding.system ^requirements = "記号の定義の根拠が明確である必要がある。"
* dosageInstruction.doseAndRate.type.coding.version ^short = "用語集のバージョン - もし必要であれば追加する。"
* dosageInstruction.doseAndRate.type.coding.version ^definition = "コードが選択された際に利用されたコードシステムのバージョンである。コードの意味するところがバージョンが変わっても一貫しているように十分にメンテナンスされているコードシステムであれば、バージョンを表記する必要はないことに留意されたい。しかしながら、一貫性はなかなか保証されるものではないし、意味の一貫性が保証されていないのであればバージョンは交換されるべきである（SHOULD)。"
* dosageInstruction.doseAndRate.type.coding.version ^comment = "ターミノロジーのバージョンが文字列としてコードシステムにより定義されていない場合は、そのバージョンが公式に公開された日付を示す（FHIRのdateフォーマットで表現される）dateを用いることが推奨されている。"
* dosageInstruction.doseAndRate.type.coding.code 1..
* dosageInstruction.doseAndRate.type.coding.code ^short = "力価区分コード"
* dosageInstruction.doseAndRate.type.coding.code ^definition = "力価区分コード"
* dosageInstruction.doseAndRate.type.coding.code ^comment = "FHIRの文字列は1MB以上の大きさとなってなはらない(SHALL NOT)。"
* dosageInstruction.doseAndRate.type.coding.code ^requirements = "システム内の特定のコードを参照する必要がある。"
* dosageInstruction.doseAndRate.type.coding.display ^short = "力価区分コードの表示名"
* dosageInstruction.doseAndRate.type.coding.display ^definition = "力価区分コードの表示名"
* dosageInstruction.doseAndRate.type.coding.display ^comment = "FHIRの文字列は1MB以上の大きさとなってなはらない(SHALL NOT)。"
* dosageInstruction.doseAndRate.type.coding.display ^requirements = "コードが持つ意味をそのシステムを知らない人でも読めるように人間可読であるようにしている必要がある。"
* dosageInstruction.doseAndRate.type.coding.userSelected ^short = "このコードが直接ユーザーが指定したものであるかどうか"
* dosageInstruction.doseAndRate.type.coding.userSelected ^definition = "ユーザーが直接コーディングしたかどうかを示す。たとえば、有効な項目のリスト（コードか表現）から選択したかどうか。"
* dosageInstruction.doseAndRate.type.coding.userSelected ^comment = "選択肢の中から、直接選ばれたコードは新しく翻訳するときには最も適切なスタート地点である。何をもって「直接選ばれた」とするのかには曖昧なところがあり、このエレメントの使用について明確にして結論として何を意味するのかより完全になるよう取引先との合意が必要となる。"
* dosageInstruction.doseAndRate.type.coding.userSelected ^requirements = "このエレメントは臨床安全のために特定されてきた。System/codeのペアが明示的に選択されることは、言語処理や何らかの規則を元に推測されるよりも正確だからである。"
* dosageInstruction.doseAndRate.type.text ^short = "この概念のプレーンテキスト表現"
* dosageInstruction.doseAndRate.type.text ^definition = "入力したユーザーが見た/選択した/発したとおりの概念および・またはユーザーが意図した概念を自然言語で表現したもの。"
* dosageInstruction.doseAndRate.type.text ^comment = "textエレメントはcodingのdisplayNameエレメントと一致することがよくある。"
* dosageInstruction.doseAndRate.type.text ^requirements = "ターミノロジー由来のコードは必ずしも人間が使う言葉の全てのニュアンスを含めた正確な意味を捉えているわけではなく、適切なコードが見つからない場合もある。そのような場合でもtextエレメントは元々の意味のすべてを捉えるために使うことができる。"
* dosageInstruction.extension[device] ..0
* dosageInstruction.extension[device] ^short = "Device"
* dosageInstruction.extension[line] ..0