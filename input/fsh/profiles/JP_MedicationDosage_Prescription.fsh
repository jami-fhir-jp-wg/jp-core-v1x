// ==============================
//   Profile 定義
// ==============================
Profile: JP_MedicationDosage_Prescription
Parent: JP_MedicationDosage
Id: jp-medicationdosage-prescription
Title: "JP Core MedicationDosage Prescription Profile"
Description: "処方用法に関するプロファイル"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationDosage_Prescription"
* ^status = #draft
* extension[device] ..0
* extension[line] ..0
* timing.code from $JP_MedicationUsageJAMI_VS (preferred)
* timing.code ^comment = "BIDなどは「施設特有の時間」として定義される。たとえば、施設がBIDを「つねに朝7時と夕方6時」であると指定することがある。この指定が不適切であれば、BIDというコードは使うべきではない。その代わり、HL7が定義したBIDのコードではなく、その施設特有のコードで明示的に示すべきであり、構造化された表現を使うべきである（この場合、2回のイベントの時刻を指定する必要がある）。  
【JP Core仕様】JAMI標準用法コード(16桁)を使用することが望ましいが、ローカルコードも使用可能。"
* doseAndRate.dose[x] only SimpleQuantity
* doseAndRate.dose[x] ^short = "1回投与量"
* doseAndRate.dose[x] ^definition = "1回投与量"
* doseAndRate.dose[x] ^comment = "この量は指定された薬剤の量を指定するものであって、各有効成分の量を指定するものではない。各成分の量はMedication resourceで伝えることができる。たとえば、有効成分が375mgである錠剤を1錠投与することを伝えたい場合、Medication resourceを利用して、XYZ成分が375mg含有しているという錠剤であることを文書化することができる。あるいは1回投与量が375mgであることを伝えるのであれば、Medication resourceをつかって単にそれが錠剤であることを示せばよい。もし、ドーパミンの静注を例に挙げて、400mgのドーパミンを500mlの注射溶液に混ぜて使うことを伝えたいのであれば、それをすべてMedication resourceで伝えることができる。もし、投与について即時に伝達することを意図していない（たとえば投与速度が示されていたり、投与時期に範囲があるような場合）のであれば、たとえば1回500mlを4時間以上かけて投与する予定を伝える場合にもMedication resourceで伝えることができる。  
【JP Core仕様】1回の投与量を指定する。単位は医薬品単位略号を使用することが望ましい。"
* doseAndRate.rate[x] only Ratio
* doseAndRate.rateRatio ^short = "単位時間内での薬剤量"
* doseAndRate.rateRatio ^definition = "単位時間内での薬剤量。JP Coreでは1日投与量を表す。"
* doseAndRate.rateRatio ^comment = "【JP Core仕様】日本ではまだ一般的に利用されている一日量での処方のためにrateRatioを用いる。"
* doseAndRate.rateRatio ^requirements = "患者の体内に導入される、あるいはされた薬剤の速度を指定する。一般的には、たとえば1時間あたり100mlあるいは100ml/hrのように注射の速度を示す。たとえば、500mlを2時間でというように、単位時間あたりの速さを表現することもできる。その他、200マイクログラム/minや200マイクログラム/1分, 1 リットル/8時間のような表現もできる。しばしば、投与速度を投与総量/ 投与総時間で表ような場合に投与時間が明示される（たとえば、500ml/2時間という場合は、投与時間が2時間であることを示している）。しかしながら、投与速度で投与時間が明示されない場合（たとえば、250ml/毎時)は、timing.repeat.durationが注射の総投与時間を示すためには必要となる。"
* doseAndRate.rateRatio.numerator ^short = "1日投与量"
* doseAndRate.rateRatio.numerator ^definition = "1日投与量"
* doseAndRate.rateRatio.denominator.value = 1 (exactly)
* doseAndRate.rateRatio.denominator.system = "http://unitsofmeasure.org" (exactly)
* doseAndRate.rateRatio.denominator.code = #d (exactly)
* doseAndRate.rateRatio.denominator.unit = "日" (exactly)
