// ==============================
//   Profile 定義
// ==============================
Profile: JP_MedicationDosage_Injection
Parent: JP_MedicationDosageBase
Id: jp-medicationdosage-injection
Title: "JP Core MedicationDosage Prescription DataType"
Description: "注射用法に関するDataType"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationDosage_Injection"
* ^status = #draft
* extension[periodOfUse] ..0
* extension[usageDuration] ..0
* timing ^short = "投与タイミング"
* timing ^definition = "投与タイミングを記録する。"
* timing.code from $JP_MedicationUsageInjection_VS (preferred)
* timing.code ^comment = "BIDなどは「施設特有の時間」として定義される。たとえば、施設がBIDを「つねに朝7時と夕方6時」であると指定することがある。この指定が不適切であれば、BIDというコードは使うべきではない。その代わり、HL7が定義したBIDのコードではなく、その施設特有のコードで明示的に示すべきであり、構造化された表現を使うべきである（この場合、2回のイベントの時刻を指定する必要がある）。  
【JP Core仕様】頓用指示時にはJAMI処方・注射オーダ標準用法規格の表6 イベント区分、イベント詳細区分(“http://jpfhir.jp/fhir/Common/CodeSystem/JP_MedicationAsNeededConditionJAMI_CS”)を推奨するが、MERIT-9 処方オーダ 表5 頓用指示(“http://jpfhir.jp/fhir/Common/CodeSystem/JP_MedicationAsNeededConditionMERIT9_CS”) を使用してもよい。"
* doseAndRate.dose[x] only SimpleQuantity
* doseAndRate.doseQuantity only JP_MedicationSimpleQuantity
* doseAndRate.doseQuantity ^short = "1回投与量（体積）"
* doseAndRate.doseQuantity ^definition = "1回投与量（体積）"
* doseAndRate.doseQuantity ^comment = "この量は指定された薬剤の量を指定するものであって、各有効成分の量を指定するものではない。各成分の量はMedication resourceで伝えることができる。たとえば、有効成分が375mgである錠剤を1錠投与することを伝えたい場合、Medication resourceを利用して、XYZ成分が375mg含有しているという錠剤であることを文書化することができる。あるいは1回投与量が375mgであることを伝えるのであれば、Medication resourceをつかって単にそれが錠剤であることを示せばよい。もし、ドーパミンの静注を例に挙げて、400mgのドーパミンを500mlの注射溶液に混ぜて使うことを伝えたいのであれば、それをすべてMedication resourceで伝えることができる。もし、投与について即時に伝達することを意図していない（たとえば投与速度が示されていたり、投与時期に範囲があるような場合）のであれば、たとえば1回500mlを4時間以上かけて投与する予定を伝える場合にもMedication resourceで伝えることができる。  
【JP Core仕様】1回の投与量（体積）を指定する。単位はUCUMを使用する。"
* doseAndRate.rate[x] only Ratio
* doseAndRate.rateRatio only JP_MedicationRatio_DosePerPeriod

