// ==============================
//   Profile 定義
// ==============================
Profile: JP_MedicationDosage_Injection
Parent: JP_MedicationDosage
Id: jp-medicationdosage-injection
Title: "JP Core MedicationDosage Prescription Profile"
Description: "注射用法に関するプロファイル"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationDosage_Injection"
* ^status = #draft
* extension[periodOfUse] ..0
* extension[usageDuration] ..0
* timing ^short = "投与タイミング"
* timing ^definition = "投与タイミングを記録する。"
* timing.code from $JP_MedicationUsageInjection_VS (preferred)
* timing.code ^comment = "BIDなどは「施設特有の時間」として定義される。たとえば、施設がBIDを「つねに朝7時と夕方6時」であると指定することがある。この指定が不適切であれば、BIDというコードは使うべきではない。その代わり、HL7が定義したBIDのコードではなく、その施設特有のコードで明示的に示すべきであり、構造化された表現を使うべきである（この場合、2回のイベントの時刻を指定する必要がある）。  
【JP Core仕様】頓用指示時にはJAMI処方・注射オーダ標準用法規格の表6 イベント区分、イベント詳細区分(“http://jpfhir.jp/fhir/Common/CodeSystem/JP_MedicationAsNeededConditionJAMI_CS”)を推奨するが、MERIT-9 処方オーダ 表5 頓用指示(“http://jpfhir.jp/fhir/Common/CodeSystem/JP_MedicationAsNeededConditionMERIT9_CS”) を使用してもよい。"
* site from $JP_MedicationBodySiteJAMIExternal_VS (preferred)
* site ^comment = "もし、BodySite resourceの属性が必要な場合(たとえば、部位の指定や別々に投与経路を設定する場合)は、[bodySite](extension-bodysite.html)の標準拡張を使うこと。要約コードや非常に正確な位置の定義へのreferenceを使用することもできる。  
【JP Core仕様】JAMI外用部位３桁コードを使用することが望ましいが、ローカルコードも使用可能。"
* route from $JP_MedicationRouteHL70162_VS (preferred)
* route ^comment = "投与経路の一般的パターンに全てのターミノロジーが適応しているわけではない。情報モデルはCodeableConceptではなく、直接Codingをを使用してテキストやコーディング、翻訳、そしてエレメントと事前条件、事後条件の関係について管理するためにその構造を提示する必要がある。  
【JP Core仕様】HL7表0162をベースにした投与経路コードを使用することが望ましいが、ローカルコードも使用可能。"
* doseAndRate.dose[x] only SimpleQuantity
* doseAndRate.dose[x] ^short = "1回投与量（体積）"
* doseAndRate.dose[x] ^definition = "1回投与量（体積）"
* doseAndRate.dose[x] ^comment = "この量は指定された薬剤の量を指定するものであって、各有効成分の量を指定するものではない。各成分の量はMedication resourceで伝えることができる。たとえば、有効成分が375mgである錠剤を1錠投与することを伝えたい場合、Medication resourceを利用して、XYZ成分が375mg含有しているという錠剤であることを文書化することができる。あるいは1回投与量が375mgであることを伝えるのであれば、Medication resourceをつかって単にそれが錠剤であることを示せばよい。もし、ドーパミンの静注を例に挙げて、400mgのドーパミンを500mlの注射溶液に混ぜて使うことを伝えたいのであれば、それをすべてMedication resourceで伝えることができる。もし、投与について即時に伝達することを意図していない（たとえば投与速度が示されていたり、投与時期に範囲があるような場合）のであれば、たとえば1回500mlを4時間以上かけて投与する予定を伝える場合にもMedication resourceで伝えることができる。  
【JP Core仕様】1回の投与量（体積）を指定する。単位はUCUMを使用する。"
* doseAndRate.rate[x] only Ratio
* doseAndRate.rateRatio ^short = "単位時間内での薬剤の容量（体積）"
* doseAndRate.rateRatio ^comment = "【JP Core仕様】単位時間内での薬剤の容量（体積）、すなわち投与速度を記述する。単位はUCUMを使用する。"
* doseAndRate.rateRatio ^requirements = "患者の体内に導入される、あるいはされた薬剤の速度を指定する。一般的には、たとえば1時間あたり100mlあるいは100ml/hrのように注射の速度を示す。たとえば、500mlを2時間でというように、単位時間あたりの速さを表現することもできる。その他、200マイクログラム/minや200マイクログラム/1分, 1 リットル/8時間のような表現もできる。しばしば、投与速度を投与総量/ 投与総時間で表ような場合に投与時間が明示される（たとえば、500ml/2時間という場合は、投与時間が2時間であることを示している）。しかしながら、投与速度で投与時間が明示されない場合（たとえば、250ml/毎時)は、timing.repeat.durationが注射の総投与時間を示すためには必要となる。"
* doseAndRate.rateRatio.numerator ^short = "投与量（体積）"
* doseAndRate.rateRatio.numerator ^definition = "投与量（体積）"
* doseAndRate.rateRatio.numerator.value ^short = "投与量（体積）"
* doseAndRate.rateRatio.numerator.value ^definition = "投与量（体積）"
* doseAndRate.rateRatio.numerator.system = "http://unitsofmeasure.org" (exactly)
* doseAndRate.rateRatio.numerator.unit ^short = "投与量（体積）の単位"
* doseAndRate.rateRatio.numerator.unit ^definition = "投与量（体積）の単位。UCUMを使用する。"
* doseAndRate.rateRatio.denominator ^short = "単位時間"
* doseAndRate.rateRatio.denominator ^definition = "単位時間"
* doseAndRate.rateRatio.denominator.value ^short = "単位時間"
* doseAndRate.rateRatio.denominator.value ^definition = "単位時間"
* doseAndRate.rateRatio.denominator.unit ^short = "単位時間の単位"
* doseAndRate.rateRatio.denominator.unit ^definition = "単位時間の単位。UCUMを使用する。"
* doseAndRate.rateRatio.denominator.system = "http://unitsofmeasure.org" (exactly)
* doseAndRate.rateRatio.denominator.system ^short = "UCUMを識別するURL。"
* doseAndRate.rateRatio.denominator.system ^definition = "UCUMを識別するURL。固定値。"

