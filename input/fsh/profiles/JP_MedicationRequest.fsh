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

* category from $JP_MedicationCategory_VS (preferred)
* medication[x] only CodeableConcept

* dosageInstruction.extension[device] ..0
* dosageInstruction.extension[line] ..0
* dosageInstruction.timing.code from $JP_MedicationUsageJAMI_VS (preferred)
* dosageInstruction.timing.code ^comment = "BIDなどは「施設特有の時間」として定義される。たとえば、施設がBIDを「つねに朝7時と夕方6時」であると指定することがある。この指定が不適切であれば、BIDというコードは使うべきではない。その代わり、HL7が定義したBIDのコードではなく、その施設特有のコードで明示的に示すべきであり、構造化された表現を使うべきである（この場合、2回のイベントの時刻を指定する必要がある）。  
【JP Core仕様】JAMI標準用法コード(16桁)を使用することが望ましいが、ローカルコードも使用可能。"
* dosageInstruction.doseAndRate.dose[x] only SimpleQuantity
* dosageInstruction.doseAndRate.dose[x] ^short = "1回投与量"
* dosageInstruction.doseAndRate.dose[x] ^definition = "1回投与量"
* dosageInstruction.doseAndRate.dose[x] ^comment = "この量は指定された薬剤の量を指定するものであって、各有効成分の量を指定するものではない。各成分の量はMedication resourceで伝えることができる。たとえば、有効成分が375mgである錠剤を1錠投与することを伝えたい場合、Medication resourceを利用して、XYZ成分が375mg含有しているという錠剤であることを文書化することができる。あるいは1回投与量が375mgであることを伝えるのであれば、Medication resourceをつかって単にそれが錠剤であることを示せばよい。もし、ドーパミンの静注を例に挙げて、400mgのドーパミンを500mlの注射溶液に混ぜて使うことを伝えたいのであれば、それをすべてMedication resourceで伝えることができる。もし、投与について即時に伝達することを意図していない（たとえば投与速度が示されていたり、投与時期に範囲があるような場合）のであれば、たとえば1回500mlを4時間以上かけて投与する予定を伝える場合にもMedication resourceで伝えることができる。  
【JP Core仕様】1回の投与量を指定する。単位は医薬品単位略号を使用することが望ましい。"
* dosageInstruction.doseAndRate.rate[x] only Ratio
* dosageInstruction.doseAndRate.rate[x] ^short = "単位時間内での薬剤量"
* dosageInstruction.doseAndRate.rate[x] ^definition = "単位時間内での薬剤量。JP Coreでは1日投与量を表す。"
* dosageInstruction.doseAndRate.rate[x] ^comment = "【JP Core仕様】日本ではまだ一般的に利用されている一日量での処方のためにrateRatioを用いる。"
* dosageInstruction.doseAndRate.rate[x] ^requirements = "患者の体内に導入される、あるいはされた薬剤の速度を指定する。一般的には、たとえば1時間あたり100mlあるいは100ml/hrのように注射の速度を示す。たとえば、500mlを2時間でというように、単位時間あたりの速さを表現することもできる。その他、200マイクログラム/minや200マイクログラム/1分, 1 リットル/8時間のような表現もできる。しばしば、投与速度を投与総量/ 投与総時間で表ような場合に投与時間が明示される（たとえば、500ml/2時間という場合は、投与時間が2時間であることを示している）。しかしながら、投与速度で投与時間が明示されない場合（たとえば、250ml/毎時)は、timing.repeat.durationが注射の総投与時間を示すためには必要となる。"
* dosageInstruction.doseAndRate.rate[x].numerator ^short = "1日投与量"
* dosageInstruction.doseAndRate.rate[x].numerator ^definition = "1日投与量"
* dosageInstruction.doseAndRate.rate[x].denominator.value = 1 (exactly)
* dosageInstruction.doseAndRate.rate[x].denominator.system = "http://unitsofmeasure.org" (exactly)
* dosageInstruction.doseAndRate.rate[x].denominator.code = #d (exactly)
* dosageInstruction.doseAndRate.rate[x].denominator.unit = "日" (exactly)
