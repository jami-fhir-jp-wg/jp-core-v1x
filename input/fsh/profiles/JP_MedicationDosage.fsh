// ==============================
//   Profile 定義
// ==============================
Profile: JP_MedicationDosage
Parent: Dosage
Id: jp-medicationdosage
Title: "JP Core MedicationDosage Profile"
Description: "このプロファイルはユーザは直接適用するものではなく、JP_MedicationRequestとJP_MedicationRequestInjectionの共通の親となる抽象プロファイルである。MedicationRequestリソースに対して、内服・外用薬剤処方、注射・点滴などのデータを送受信するため、JP_MedicationRequestとJP_MedicationRequestInjectionの各プロファイルの基礎となる制約と拡張のうち共通部分を定めている。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationDosage"
* ^status = #draft
* extension contains
    JP_MedicationRequest_DosageInstruction_PeriodOfUse named periodOfUse ..1 and
    JP_MedicationRequest_DosageInstruction_UsageDuration named usageDuration ..1 and
    JP_MedicationRequest_DosageInstruction_Line named line ..* and
    JP_MedicationRequest_DosageInstruction_Device named device ..*
// sequence
* sequence ^short = "服用指示の順番"
* sequence ^definition = "どの服用指示を適応するか判断するかについての順序を示したもの"
* sequence ^comment = "32 bitの数値。これ以上の値であれば10進数を使うこと。"
* sequence ^requirements = "もし、複数の服用法(Dosage)でsequenceの数値が同じであれば、その指示が同時に扱われることを示している。sequenceの数値が異なれば、服用指示(Dosage)の順番を意図している。"
// text
* text ^short = "フリーテキストの用法指示。"
* text ^definition = "JP Coreでは必須。フリーテキストの用法指示。"
* text ^comment = "FHIRの文字列は1MB以上の大きさとなってなはらない(SHALL NOT)。"
* text ^requirements = "フリーテキストでの用法指示はコード化するには複雑すぎる指示の場合には用いてもよい。この属性の文脈は薬剤の名前や説明が入っていない。コード化された指示がある場合は、フリーテキストでの指示は人間が服用あるいは投与するために表示されてもよい。テキストでの指示はつねに配置されることを想定されている。もし、dosage.timing属性も配置されていれば、dosage.textはtimingを同じ情報を反映すべきである。薬剤の投与あるいは調剤についての付加的な情報にはテキストでの説明が入っているべきである。"
// additionalInstruction
* additionalInstruction from $JP_MedicationUsageJAMIAdditional_VS (preferred)
* additionalInstruction ^short = "患者に対する補足指示や注意。たとえば、「食事と一緒に」「眠くなることがある」"
* additionalInstruction ^definition = "どのように薬剤を内服するかについての患者への補足指示（たとえば、「食事と一緒に」や「30分から1時間前に内服」）や薬剤についての注意書き（たとえば、「眠くなることがある」や「日光や紫外線が皮膚にあたららないようにすること」）"
* additionalInstruction ^comment = "薬剤投与や調剤についての情報（たとえば、「腹膜内ポートに可能な限り迅速に注入」や「薬剤Xの直後に」）であり、dosage.textにも複製されるべきである。"
* additionalInstruction ^requirements = "補足指示はコード化されるように意図されているが、コードがない場合はエレメントはテキストだけで表現することができる。たとえば、「大量の水で服用する」という指示はコード化されていることもあれば、されていないことおある。"
// patientInstruction
* patientInstruction ^short = "患者あるいは消費者向けの指示"
* patientInstruction ^definition = "患者あるいは消費者に理解してもらうための指示。"
* patientInstruction ^comment = "FHIRの文字列は1MB以上の大きさとなってなはらない(SHALL NOT)。"
// timing
* timing only JP_MedicationTiming
// asNeeded
* asNeeded[x] only boolean
* asNeeded[x] ^short = "「頓用」指示"
* asNeeded[x] ^definition = "【JP Core仕様】頓用型の用法を指定する場合に”true”を指定し、そのコードを指定する場合は用法コードとして指定する。\r\nMedication(薬剤)が必要なときに指定された量とスケジュールのみで投薬するか（Booleanで選択される）、投薬する前提条件はTiming.Code(CodeableConcept)を示している。"
// site
* site from $JP_MedicationBodySiteJAMIExternal_VS (preferred)
* site ^short = "投与される身体部位"
* site ^definition = "投与される身体部位。外用薬で部位を指定する場合に使用する。"
* site ^comment = "もし、BodySite resourceの属性が必要な場合(たとえば、部位の指定や別々に投与経路を設定する場合)は、[bodySite](extension-bodysite.html)の標準拡張を使うこと。要約コードや非常に正確な位置の定義へのreferenceを使用することもできる。  
【JP Core仕様】JAMI外用部位３桁コードを使用することが望ましいが、ローカルコードも使用可能。"
// route
* route from $JP_MedicationRouteHL70162_VS (preferred)
* route ^short = "投与経路"
* route ^definition = "投与経路"
* route ^comment = "投与経路の一般的パターンに全てのターミノロジーが適応しているわけではない。情報モデルはCodeableConceptではなく、直接Codingをを使用してテキストやコーディング、翻訳、そしてエレメントと事前条件、事後条件の関係について管理するためにその構造を提示する必要がある。  
【JP Core仕様】HL7表0162をベースにした投与経路コードを使用することが望ましいが、ローカルコードも使用可能。"
// method
* method ^short = "投与方法"
* method ^definition = "投与方法"
* method ^comment = "ターミノロジーは投与する経路あるいは剤型をあらかじめ指定するために用いられる。"
* method ^requirements = "コード化された値は体内に薬剤が投与される方法を示している。注射ではよく使われる。たとえば、緩徐に注入、深部に静注など。"
* method.coding ^slicing.discriminator.type = #value
* method.coding ^slicing.discriminator.path = "system"
* method.coding ^slicing.rules = #open
* method.coding contains
    unitDigit1 ..1 and
    unitDigit2 ..1
* method.coding[unitDigit1] from JP_MedicationMethodJAMIBasicUsage_VS (preferred)
* method.coding[unitDigit1].system = "urn:oid:1.2.392.200250.2.2.20.30" (exactly)
* method.coding[unitDigit1] ^short = "投与⽅法に対応するJAMI 用法コード表基本用法１桁コード"
* method.coding[unitDigit1] ^definition = "投与⽅法に対応するJAMI 用法コード表基本用法１桁コードを識別するURI。"
* method.coding[unitDigit1] ^comment = "コードは臨時で列記したものや、コードのリストからSNOMED CTのように公式に定義されたものまである（HL7 v3 core principle を参照)。FHIR自体ではコーディング規約を定めてはいないし、意味を暗示するために利用されない(SHALL NOT)。一般的に UserSelected = trueの場合には一つのコードシステムが使われる。"
* method.coding[unitDigit1] ^requirements = "他のコードシステムへの変換や代替のコードシステムを使ってエンコードしてもよい。"
* method.coding[unitDigit2] from JP_MedicationMethodJAMIDetailUsage_VS (preferred)
* method.coding[unitDigit2].system = "urn:oid:1.2.392.200250.2.2.20.40" (exactly)
* method.coding[unitDigit2] ^short = "投与⽅法に対応するJAMI 用法コード表基本用法2桁コード"
* method.coding[unitDigit2] ^definition = "投与⽅法に対応するJAMI 用法コード表基本用法2桁コードを識別するURI。２桁コードurn:oid:1.2.392.200250.2.2.20.40"
* method.coding[unitDigit2] ^comment = "コードは臨時で列記したものや、コードのリストからSNOMED CTのように公式に定義されたものまである（HL7 v3 core principle を参照)。FHIR自体ではコーディング規約を定めてはいないし、意味を暗示するために利用されない(SHALL NOT)。一般的に UserSelected = trueの場合には一つのコードシステムが使われる。"
* method.coding[unitDigit2] ^requirements = "他のコードシステムへの変換や代替のコードシステムを使ってエンコードしてもよい。"
* method.text ^short = "投与⽅法のテキスト表現"
* method.text ^definition = "投与⽅法のテキスト表現。コードで指定できない場合、本要素で文字列として指定してもよい。"
* method.text ^comment = "textエレメントはcodingのdisplayNameエレメントと一致することがよくある。"
* method.text ^requirements = "ターミノロジー由来のコードは必ずしも人間が使う言葉の全てのニュアンスを含めた正確な意味を捉えているわけではなく、適切なコードが見つからない場合もある。そのような場合でもtextエレメントは元々の意味のすべてを捉えるために使うことができる。"
// 用法テキスト表現
* text ^short = "投与⽅法のテキスト表現"
* text ^definition = "投与⽅法のテキスト表現。コードで指定できない場合、本要素で文字列として指定してもよい。"
* text ^comment = "textエレメントはcodingのdisplayNameエレメントと一致することがよくある。"
* text ^requirements = "ターミノロジー由来のコードは必ずしも人間が使う言葉の全てのニュアンスを含めた正確な意味を捉えているわけではなく、適切なコードが見つからない場合もある。そのような場合でもtextエレメントは元々の意味のすべてを捉えるために使うことができる。"
// doseAndRate
* doseAndRate ^short = "薬剤の投与量"
* doseAndRate ^definition = "薬剤が投与される量"
// doseAndRate.type
* doseAndRate.type from $JP_MedicationIngredientStrengthStrengthType_VS (preferred)
* doseAndRate.type ^short = "力価区分"
* doseAndRate.type ^definition = "力価区分"
* doseAndRate.type ^comment = "投与速度・量の一般的パターンに全てのターミノロジーが適応しているわけではない。情報モデルはCodeableConceptではなく、直接Codingをを使用してテキストやコーディング、翻訳、そしてエレメントと事前条件、事後条件の関係について管理するためにその構造を提示する必要がある。"
* doseAndRate.type ^requirements = "このtypeに値が指定されていなければ、\"ordered\"であることが想定される。"
// doseAndRate.dose[x]
* doseAndRate.doseRange only JP_MedicationRange
* doseAndRate.doseQuantity only JP_MedicationSimpleQuantity
// doseAndRate.rate[x]
* doseAndRate.rate[x] ^short = "薬剤の投与量"
* doseAndRate.rate[x] ^definition = "薬剤が投与される量"
* doseAndRate.rateRatio only JP_MedicationRatio
* doseAndRate.rateRange only JP_MedicationRange
* doseAndRate.rateQuantity only JP_MedicationSimpleQuantity
// doseAndRate.maxDose関連
* maxDosePerPeriod only JP_MedicationRatio
* maxDosePerAdministration only JP_MedicationSimpleQuantity
* maxDosePerLifetime only JP_MedicationSimpleQuantity

// ==============================
//   Extension 定義
// ==============================
Extension: JP_MedicationRequest_DosageInstruction_Device
Id: jp-medicationrequest-dosageinstruction-device
Title: "JP Core MedicationRequest DosageInstruction Device Extension"
Description: "投与装置を格納する拡張"
* ^url = $JP_MedicationRequest_DosageInstruction_Device
* ^date = "2022-03-16"
* ^context[0].type = #element
* ^context[=].expression = "MedicationRequest.dosageInstruction"
* ^context[+].type = #element
* ^context[=].expression = "MedicationDispense.dosageInstruction"
* . ^short = "投与装置"
* . ^definition = "投与装置を格納する拡張"
* url = $JP_MedicationRequest_DosageInstruction_Device (exactly)
* value[x] only Reference(Device)

Extension: JP_MedicationRequest_DosageInstruction_Line
Id: jp-medicationrequest-dosageinstruction-line
Title: "JP Core MedicationRequest DosageInstruction Line Extension"
Description: "指示ラインを格納するための拡張"
* ^url = $JP_MedicationRequest_DosageInstruction_Line
* ^date = "2022-03-16"
* ^context[0].type = #element
* ^context[=].expression = "MedicationRequest.dosageInstruction"
* ^context[+].type = #element
* ^context[=].expression = "MedicationDispense.dosageInstruction"
* ^context[+].type = #element
* ^context[=].expression = "MedicationAdministration.dosage"
* . ^short = "指示ライン"
* . ^definition = "指示ラインを格納する拡張"
* url = $JP_MedicationRequest_DosageInstruction_Line (exactly)
* value[x] only CodeableConcept
* valueCodeableConcept.coding from $JP_MedicationExampleLine_VS (example)

Extension: JP_MedicationRequest_DosageInstruction_PeriodOfUse
Id: jp-medicationrequest-dosageinstruction-periodofuse
Title: "JP Core MedicationRequest DosageInstruction PeriodOfUse Extension"
Description: "投与開始日を格納する拡張"
* ^url = $JP_MedicationRequest_DosageInstruction_PeriodOfUse
* ^date = "2022-03-16"
* ^purpose = "処方日とは別に明示的に投与・内服開始日を指定するため。"
* ^context[0].type = #element
* ^context[=].expression = "MedicationRequest.dosageInstruction"
* ^context[+].type = #element
* ^context[=].expression = "MedicationDispense.dosageInstruction"
* . ^short = "投与期間の開始日を明示するための拡張"
* . ^definition = "MedicationRequestの投与期間の開始日を明示するための拡張"
* url = $JP_MedicationRequest_DosageInstruction_PeriodOfUse (exactly)
* value[x] only Period
* value[x] ^short = "投与期間を表す"
* value[x] ^definition = "MedicationRequestに投与期間の開始日を明示するための拡張"
* value[x].start 1..
* value[x].start ^short = "投与期間の開始日"
* value[x].start ^definition = "明示された投与期間の開始日"

Extension: JP_MedicationRequest_DosageInstruction_UsageDuration
Id: jp-medicationrequest-dosageinstruction-usageduration
Title: "JP Core MedicationRequest DosageInstruction UsageDuration Extension"
Description: "隔日投与など、服用開始日から終了日までの日数と実投与日数が異なる場合に、実投与日数を明⽰したい場合に使用する拡張"
* ^url = $JP_MedicationRequest_DosageInstruction_UsageDuration
* ^date = "2022-03-16"
* ^context[0].type = #element
* ^context[=].expression = "MedicationRequest.dosageInstruction"
* ^context[+].type = #element
* ^context[=].expression = "MedicationDispense.dosageInstruction"
* . ^short = "実投与日数"
* . ^definition = "隔日投与などで実投与日数と処方期間が異なる場合に用いられる。"
* url = $JP_MedicationRequest_DosageInstruction_UsageDuration (exactly)
* value[x] only Duration
* value[x] ^short = "実投与日数"
* value[x] ^definition = "隔日投与などで実投与日数と処方期間が異なる場合に用いられる。"
* value[x].id ^short = "エレメント間参照のためのID"
* value[x].id ^definition = "JP Coreでは使用されない。"
* value[x].value ^short = "実投与日数"
* value[x].value ^definition = "隔日投与などで実投与日数と処方期間が異なる場合に用いられる。"
* value[x].unit = "日" (exactly)
* value[x].unit ^short = "実投与日数単位"
* value[x].unit ^definition = "「日」で固定される"
* value[x].system = "http://unitsofmeasure.org" (exactly)
* value[x].system ^short = "UCUM"
* value[x].system ^definition = "単位コード UCUMを識別するURI。固定値。"
* value[x].code = #d (exactly)
* value[x].code ^short = "単位コードUCUMにおける実投与日数の単位"
* value[x].code ^definition = "単位コードUCUMにおける実投与日数の単位。dで固定される"