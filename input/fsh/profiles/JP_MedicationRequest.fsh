// ==============================
//   Profile 定義
// ==============================
Profile: JP_MedicationRequest
Parent: JP_MedicationRequestBase
Id: jp-medicationrequest
Title: "JP Core MedicationRequest Profile"
Description: "このプロファイルはJP_MedicationRequestBaseリソースに対して、内服・外用薬剤処方のデータを送受信するための基礎となる制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationRequest"
* ^status = #active
* ^date = "2022-07-31"
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

* dosageInstruction.timing.code from $JP_MedicationUsageJAMI_VS (preferred)
* dosageInstruction.timing.code ^comment = "BIDなどは「施設特有の時間」として定義される。たとえば、施設がBIDを「つねに朝7時と夕方6時」であると指定することがある。この指定が不適切であれば、BIDというコードは使うべきではない。その代わり、HL7が定義したBIDのコードではなく、その施設特有のコードで明示的に示すべきであり、構造化された表現を使うべきである（この場合、2回のイベントの時刻を指定する必要がある）。  
【JP Core仕様】JAMI標準用法コード(16桁)を使用することが望ましいが、ローカルコードも使用可能。"

* dosageInstruction.doseAndRate.doseQuantity.code from $JP_MedicationUnitMERIT9_VS (preferred)
* dosageInstruction.doseAndRate.rateRatio.numerator.code from $JP_MedicationUnitMERIT9_VS (preferred)
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
* dosageInstruction.doseAndRate.type ^short = "力価区分"
* dosageInstruction.doseAndRate.type ^definition = "力価区分"
* dosageInstruction.doseAndRate.type ^comment = "投与速度・量の一般的パターンに全てのターミノロジーが適応しているわけではない。情報モデルはCodeableConceptではなく、直接Codingをを使用してテキストやコーディング、翻訳、そしてエレメントと事前条件、事後条件の関係について管理するためにその構造を提示する必要がある。"
* dosageInstruction.doseAndRate.type ^requirements = "このtypeに値が指定されていなければ、\"ordered\"であることが想定される。"
* dosageInstruction.doseAndRate.type.id ^short = "エレメント間参照のためのユニークID"
* dosageInstruction.doseAndRate.type.id ^definition = "エレメント間参照のためのユニークID。空白を含まない全ての文字を使ってもよい(MAY)。"
* dosageInstruction.doseAndRate.type.coding ^short = "力価区分コード"
* dosageInstruction.doseAndRate.type.coding ^definition = "力価区分コード"
* dosageInstruction.doseAndRate.type.coding ^comment = "コードは臨時で列記したものや、コードのリストからSNOMED CTのように公式に定義されたものまである（HL7 v3 core principle を参照)。FHIR自体ではコーディング規約を定めてはいないし、意味を暗示するために利用されない(SHALL NOT)。一般的に UserSelected = trueの場合には一つのコードシステムが使われる。"
* dosageInstruction.doseAndRate.type.coding ^requirements = "他のコードシステムへの変換や代替のコードシステムを使ってエンコードしてもよい。"
* dosageInstruction.doseAndRate.type.coding.id ^short = "エレメント間参照のためのユニークID"
* dosageInstruction.doseAndRate.type.coding.id ^definition = "エレメント間参照のためのユニークID。空白を含まない全ての文字を使ってもよい(MAY)。"
* dosageInstruction.doseAndRate.type.coding.system ^short = "力価区分コードのコード体系を識別するURI"
* dosageInstruction.doseAndRate.type.coding.system ^definition = "力価区分コードのコード体系を識別するURI。固定値。"
* dosageInstruction.doseAndRate.type.coding.system ^comment = "URIはOID(urn:oid:....)やUUID(urn:uuid:....)であることもある。OIDやUUIDはHL7のOIDレジストリを参照していなければならない（SHALL)。そうでなければ、URIはHL7のFHIRのリストに挙げられている特別なURIであるか、用語集が明確な定義が参照されるべきである。"
* dosageInstruction.doseAndRate.type.coding.system ^requirements = "記号の定義の根拠が明確である必要がある。"
* dosageInstruction.doseAndRate.type.coding.version ^short = "用語集のバージョン - もし必要であれば追加する。"
* dosageInstruction.doseAndRate.type.coding.version ^definition = "コードが選択された際に利用されたコードシステムのバージョンである。コードの意味するところがバージョンが変わっても一貫しているように十分にメンテナンスされているコードシステムであれば、バージョンを表記する必要はないことに留意されたい。しかしながら、一貫性はなかなか保証されるものではないし、意味の一貫性が保証されていないのであればバージョンは交換されるべきである（SHOULD)。"
* dosageInstruction.doseAndRate.type.coding.version ^comment = "ターミノロジーのバージョンが文字列としてコードシステムにより定義されていない場合は、そのバージョンが公式に公開された日付を示す（FHIRのdateフォーマットで表現される）dateを用いることが推奨されている。"
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
* dosageInstruction.doseAndRate.type from $JP_MedicationIngredientStrengthStrengthType_VS (preferred)
* dispenseRequest.quantity.code from $JP_MedicationUnitMERIT9_VS (preferred)
* category from $JP_MedicationCategory_VS (preferred)
* dosageInstruction.additionalInstruction from $JP_MedicationUsageJAMIAdditional_VS (preferred)
* dosageInstruction.additionalInstruction ^short = "患者に対する補足指示や注意。たとえば、「食事と一緒に」「眠くなることがある」【JP Core仕様】JAMI 8桁補足用法コードを使用することが望ましい。"
* dosageInstruction.additionalInstruction ^comment = "薬剤投与や調剤についての情報（たとえば、「腹膜内ポートに可能な限り迅速に注入」や「薬剤Xの直後に」）であり、dosage.textにも複製されるべきである。  
【JP Core仕様】JAMI 8桁補足用法コードを使用することが望ましいが、ローカルコードも使用可能。"

* dosageInstruction.site from $JP_MedicationBodySiteJAMIExternal_VS (preferred)
* dosageInstruction.site ^comment = "もし、BodySite resourceの属性が必要な場合(たとえば、部位の指定や別々に投与経路を設定する場合)は、[bodySite](extension-bodysite.html)の標準拡張を使うこと。要約コードや非常に正確な位置の定義へのreferenceを使用することもできる。  
【JP Core仕様】JAMI外用部位３桁コードを使用することが望ましいが、ローカルコードも使用可能。"

* dosageInstruction.route from $JP_MedicationRouteHL70162_VS (preferred)
* dosageInstruction.route ^comment = "投与経路の一般的パターンに全てのターミノロジーが適応しているわけではない。情報モデルはCodeableConceptではなく、直接Codingをを使用してテキストやコーディング、翻訳、そしてエレメントと事前条件、事後条件の関係について管理するためにその構造を提示する必要がある。  
【JP Core仕様】HL7表0162をベースにした投与経路コードを使用することが望ましいが、ローカルコードも使用可能。"

* dosageInstruction.doseAndRate.dose[x] only SimpleQuantity
* dosageInstruction.doseAndRate.dose[x] ^short = "1回投与量"
* dosageInstruction.doseAndRate.dose[x] ^definition = "1回投与量"
* dosageInstruction.doseAndRate.dose[x] ^comment = "この量は指定された薬剤の量を指定するものであって、各有効成分の量を指定するものではない。各成分の量はMedication resourceで伝えることができる。たとえば、有効成分が375mgである錠剤を1錠投与することを伝えたい場合、Medication resourceを利用して、XYZ成分が375mg含有しているという錠剤であることを文書化することができる。あるいは1回投与量が375mgであることを伝えるのであれば、Medication resourceをつかって単にそれが錠剤であることを示せばよい。もし、ドーパミンの静注を例に挙げて、400mgのドーパミンを500mlの注射溶液に混ぜて使うことを伝えたいのであれば、それをすべてMedication resourceで伝えることができる。もし、投与について即時に伝達することを意図していない（たとえば投与速度が示されていたり、投与時期に範囲があるような場合）のであれば、たとえば1回500mlを4時間以上かけて投与する予定を伝える場合にもMedication resourceで伝えることができる。  
【JP Core仕様】1回の投与量を指定する。単位は医薬品単位略号を使用することが望ましい。"
* dosageInstruction.doseAndRate.dose[x].value ^short = "1回投与量"
* dosageInstruction.doseAndRate.dose[x].value ^definition = "1回投与量"
* dosageInstruction.doseAndRate.dose[x].system from JP_MedicationUnitMERIT9_VS (preferred)
* dosageInstruction.doseAndRate.dose[x].system ^short = "医薬品単位略号を識別するOID。"
* dosageInstruction.doseAndRate.dose[x].system ^definition = "医薬品単位略号を識別するOID。固定値。"
* dosageInstruction.doseAndRate.dose[x].code ^short = "医薬品単位略号"
* dosageInstruction.doseAndRate.dose[x].code ^definition = "医薬品単位略号"

* dosageInstruction.doseAndRate.rate[x] only Ratio
* dosageInstruction.doseAndRate.rate[x] ^short = "単位時間内での薬剤量"
* dosageInstruction.doseAndRate.rate[x] ^definition = "単位時間内での薬剤量。JP Coreでは1日投与量を表す。"
* dosageInstruction.doseAndRate.rate[x] ^comment = "【JP Core仕様】日本ではまだ一般的に利用されている一日量での処方のためにrateRatioを用いる。"
* dosageInstruction.doseAndRate.rate[x] ^requirements = "患者の体内に導入される、あるいはされた薬剤の速度を指定する。一般的には、たとえば1時間あたり100mlあるいは100ml/hrのように注射の速度を示す。たとえば、500mlを2時間でというように、単位時間あたりの速さを表現することもできる。その他、200マイクログラム/minや200マイクログラム/1分, 1 リットル/8時間のような表現もできる。しばしば、投与速度を投与総量/ 投与総時間で表ような場合に投与時間が明示される（たとえば、500ml/2時間という場合は、投与時間が2時間であることを示している）。しかしながら、投与速度で投与時間が明示されない場合（たとえば、250ml/毎時)は、timing.repeat.durationが注射の総投与時間を示すためには必要となる。"
* dosageInstruction.doseAndRate.rate[x].numerator ^short = "1日投与量"
* dosageInstruction.doseAndRate.rate[x].numerator ^definition = "1日投与量"
* dosageInstruction.doseAndRate.rate[x].numerator.value ^short = "1日投与量"
* dosageInstruction.doseAndRate.rate[x].numerator.value ^definition = "1日投与量"
* dosageInstruction.doseAndRate.rate[x].numerator.comparator ..0
* dosageInstruction.doseAndRate.rate[x].numerator.unit ^short = "投与量の単位"
* dosageInstruction.doseAndRate.rate[x].numerator.unit ^definition = "投与量の単位。"
* dosageInstruction.doseAndRate.rate[x].numerator.system from JP_MedicationUnitMERIT9_VS (preferred)
* dosageInstruction.doseAndRate.rate[x].numerator.system ^short = "医薬品単位略号を識別するOID"
* dosageInstruction.doseAndRate.rate[x].numerator.system ^definition = "医薬品単位略号を識別するOID。固定値。"
* dosageInstruction.doseAndRate.rate[x].numerator.code ^short = "医薬品単位略号"
* dosageInstruction.doseAndRate.rate[x].numerator.code ^definition = "医薬品単位略号"
* dosageInstruction.doseAndRate.rate[x].denominator ^short = "1日"
* dosageInstruction.doseAndRate.rate[x].denominator ^definition = "1日"
* dosageInstruction.doseAndRate.rate[x].denominator.system = "http://unitsofmeasure.org" (exactly)
* dosageInstruction.doseAndRate.rate[x].denominator.value = 1 (exactly)
* dosageInstruction.doseAndRate.rate[x].denominator.unit = "日" (exactly)
* dosageInstruction.doseAndRate.rate[x].denominator.code = #d (exactly)
* dosageInstruction.doseAndRate.rate[x].denominator.code ^short = "「日」を表すUCUM単位コード"
* dosageInstruction.doseAndRate.rate[x].denominator.code ^definition = "「日」を表すUCUM単位コード"
