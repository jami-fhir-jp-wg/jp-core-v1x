
// ==============================
//   DateType 定義
// ==============================
// ------------------------------
// JP_MedicationDosageBase DataType
// ------------------------------
Profile: JP_MedicationDosageBase
Parent: Dosage
Id: jp-medicationdosagebase
Title: "JP Core MedicationDosage Base DataType"
Description: "このデータタイプは薬剤用法のDosageベースとして基礎となる制約と拡張のうち共通部分を定めている。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationDosageBase"
* ^status = #active
* ^date = "2025-07-04"
* . ^short = "薬の服用方法・服用した方法、または服用すべき方法"
* . ^definition = "薬の服用方法・服用した方法、または服用すべき方法"

// sequence
* sequence ^short = "服用指示の順番"
* sequence ^definition = "どの服用指示を適応するか判断するかについての順序を示したもの"
* sequence ^comment = "32 bitの数値。これ以上の値であれば10進数を使うこと。"
* sequence ^requirements = "もし、複数の服用法(Dosage)でsequenceの数値が同じであれば、その指示が同時に扱われることを示している。sequenceの数値が異なれば、服用指示(Dosage)の順番を意図している。"
// text
* text ^short = "フリーテキストの用法指示"
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
* asNeeded[x] ^definition = "【JP Core仕様】頓用型の用法を指定する場合に”true”を指定し、そのコードを指定する場合は用法コードとして指定する。  
Medication(薬剤)が必要なときに指定された量とスケジュールのみで投薬するか（Booleanで選択される）、投薬する前提条件はTiming.Code(CodeableConcept)を示している。"
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
* route ^comment = "投与経路の一般的パターンに全てのターミノロジが適応しているわけではない。情報モデルはCodeableConceptではなく、直接Codingをを使用してテキストやコーディング、翻訳、そしてエレメントと事前条件、事後条件の関係について管理するためにその構造を提示する必要がある。  
【JP Core仕様】HL7表0162をベースにした投与経路コードを使用することが望ましいが、ローカルコードも使用可能。"
// method
* method ^short = "投与方法"
* method ^definition = "投与方法"
* method ^comment = "ターミノロジは投与する経路あるいは剤型をあらかじめ指定するために用いられる。"
* method ^requirements = "コード化された値は体内に薬剤が投与される方法を示している。注射ではよく使われる。たとえば、緩徐に注入、深部に静注など。"
* method.coding ^slicing.discriminator.type = #value
* method.coding ^slicing.discriminator.path = "system"
* method.coding ^slicing.rules = #open
* method.coding contains
    unitDigit1 ..1 and
    unitDigit2 ..1
* method.coding[unitDigit1] from JP_MedicationMethodJAMIBasicUsage_VS (preferred)
* method.coding[unitDigit1].system = $JP_MedicationMethodJAMIBasicUsage_CS (exactly)
* method.coding[unitDigit1] ^short = "投与⽅法に対応するJAMI 用法コード表基本用法１桁コード"
* method.coding[unitDigit1] ^definition = "投与⽅法に対応するJAMI 用法コード表基本用法１桁コードを識別するURI。"
* method.coding[unitDigit1] ^comment = "コードは臨時で列記したものや、コードのリストからSNOMED CTのように公式に定義されたものまである（HL7 v3 core principle を参照)。FHIR自体ではコーディング規約を定めてはいないし、意味を暗示するために利用されない(SHALL NOT)。一般的に UserSelected = trueの場合には一つのコードシステムが使われる。"
* method.coding[unitDigit1] ^requirements = "他のコードシステムへの変換や代替のコードシステムを使ってエンコードしてもよい。"
* method.coding[unitDigit2] from JP_MedicationMethodJAMIDetailUsage_VS (preferred)
* method.coding[unitDigit2].system = $JP_MedicationMethodJAMIDetailUsage_CS (exactly)
* method.coding[unitDigit2] ^short = "投与⽅法に対応するJAMI 用法コード表基本用法2桁コード"
* method.coding[unitDigit2] ^definition = "投与⽅法に対応するJAMI 用法コード表基本用法2桁コードを識別するURI。２桁コードhttp://jami.jp/CodeSystem/MedicationUsage"
* method.coding[unitDigit2] ^comment = "コードは臨時で列記したものや、コードのリストからSNOMED CTのように公式に定義されたものまである（HL7 v3 core principle を参照)。FHIR自体ではコーディング規約を定めてはいないし、意味を暗示するために利用されない(SHALL NOT)。一般的に UserSelected = trueの場合には一つのコードシステムが使われる。"
* method.coding[unitDigit2] ^requirements = "他のコードシステムへの変換や代替のコードシステムを使ってエンコードしてもよい。"
* method.text ^short = "投与⽅法のテキスト表現"
* method.text ^definition = "投与⽅法のテキスト表現。コードで指定できない場合、本要素で文字列として指定してもよい。"
* method.text ^comment = "textエレメントはcodingのdisplayNameエレメントと一致することがよくある。"
* method.text ^requirements = "ターミノロジ由来のコードは必ずしも人間が使う言葉の全てのニュアンスを含めた正確な意味を捉えているわけではなく、適切なコードが見つからない場合もある。そのような場合でもtextエレメントは元々の意味のすべてを捉えるために使うことができる。"
// 用法テキスト表現
* text ^short = "投与⽅法のテキスト表現"
* text ^definition = "投与⽅法のテキスト表現。コードで指定できない場合、本要素で文字列として指定してもよい。"
* text ^comment = "textエレメントはcodingのdisplayNameエレメントと一致することがよくある。"
* text ^requirements = "ターミノロジ由来のコードは必ずしも人間が使う言葉の全てのニュアンスを含めた正確な意味を捉えているわけではなく、適切なコードが見つからない場合もある。そのような場合でもtextエレメントは元々の意味のすべてを捉えるために使うことができる。"
// doseAndRate
* doseAndRate ^short = "薬剤の投与量"
* doseAndRate ^definition = "薬剤が投与される量"
// doseAndRate.type
* doseAndRate.type from $JP_MedicationIngredientStrengthStrengthType_VS (preferred)
* doseAndRate.type ^short = "力価区分"
* doseAndRate.type ^definition = "力価区分"
* doseAndRate.type ^comment = "投与速度・量の一般的パターンに全てのターミノロジが適応しているわけではない。情報モデルはCodeableConceptではなく、直接Codingをを使用してテキストやコーディング、翻訳、そしてエレメントと事前条件、事後条件の関係について管理するためにその構造を提示する必要がある。"
* doseAndRate.type ^requirements = "このtypeに値が指定されていなければ、\"ordered\"であることが想定される。"

// doseAndRate
// dose[x]
* doseAndRate.dose[x] only SimpleQuantity
// rate[x]
* doseAndRate.rate[x] ^short = "薬剤の投与量速度"
* doseAndRate.rate[x] ^definition = "薬剤が投与される量の速度"
// maxDose関連
* maxDosePerPeriod only JP_MedicationRatio_DosePerPeriod
* maxDosePerPeriod ^short = "単位時間当たりの投薬量の上限"
* maxDosePerPeriod ^definition = "単位時間当たりの投薬量の上限"
* maxDosePerAdministration only JP_MedicationSimpleQuantity
* maxDosePerAdministration ^short = "1回あたりの投薬量の上限"
* maxDosePerAdministration ^definition = "1回あたりの投薬量の上限"
* maxDosePerLifetime only JP_MedicationSimpleQuantity
* maxDosePerLifetime ^short = "生涯の投薬量の上限"
* maxDosePerLifetime ^definition = "生涯の投薬量の上限"

// ------------------------------
// (内服用)JP_MedicationDosage DataType
// ------------------------------
Profile: JP_MedicationDosage
Parent: JP_MedicationDosageBase
Id: jp-medicationdosage
Title: "JP Core MedicationDosage DataType"
Description: "このデータタイプは内服用法の制約と拡張のうち共通部分を定めている。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationDosage"
* ^status = #active
* ^date = "2023-10-31"
* extension contains
    JP_MedicationDosage_PeriodOfUse named periodOfUse ..1 and
    JP_MedicationDosage_UsageDuration named usageDuration ..1
// timing
* timing.code from $JP_MedicationUsageJAMI_VS (preferred)
* timing.code ^comment = "BIDなどは「施設特有の時間」として定義される。たとえば、施設がBIDを「つねに朝7時と夕方6時」であると指定することがある。この指定が不適切であれば、BIDというコードは使うべきではない。その代わり、HL7が定義したBIDのコードではなく、その施設特有のコードで明示的に示すべきであり、構造化された表現を使うべきである（この場合、2回のイベントの時刻を指定する必要がある）。  
【JP Core仕様】JAMI標準用法コード(16桁)を使用することが望ましいが、ローカルコードも使用可能。"
* timing.repeat.boundsDuration.value ^short = "投薬日数"
* timing.repeat.boundsDuration.value ^definition = "投薬日数"
* timing.repeat.boundsDuration.system = "http://unitsofmeasure.org" (exactly)
* timing.repeat.boundsDuration.system ^short = "UCUM"
* timing.repeat.boundsDuration.system ^definition = "単位コード UCUMを識別するURI。固定値。"
* timing.repeat.boundsDuration.code = #d (exactly)
* timing.repeat.boundsDuration.code ^short = "投与日数の単位"
* timing.repeat.boundsDuration.code ^definition = "単位コードUCUMにおける投与日数の単位。dで固定される。"
* timing.repeat.boundsDuration.unit = "日" (exactly)
* timing.repeat.boundsDuration.unit ^short = "投薬日数の単位"
* timing.repeat.boundsDuration.unit ^definition = "投薬日数の単位文字列。日で固定される"
// dosageAndRate
// dose[x]
* doseAndRate.doseQuantity only JP_MedicationSimpleQuantity
* doseAndRate.doseQuantity ^short = "1回投与量"
* doseAndRate.doseQuantity ^definition = "1回投与量"
* doseAndRate.doseQuantity ^comment = "この量は指定された薬剤の量を指定するものであって、各有効成分の量を指定するものではない。各成分の量はMedication resourceで伝えることができる。たとえば、有効成分が375mgである錠剤を1錠投与することを伝えたい場合、Medication resourceを利用して、XYZ成分が375mg含有しているという錠剤であることを文書化することができる。あるいは1回投与量が375mgであることを伝えるのであれば、Medication resourceをつかって単にそれが錠剤であることを示せばよい。もし、ドーパミンの静注を例に挙げて、400mgのドーパミンを500mlの注射溶液に混ぜて使うことを伝えたいのであれば、それをすべてMedication resourceで伝えることができる。もし、投与について即時に伝達することを意図していない（たとえば投与速度が示されていたり、投与時期に範囲があるような場合）のであれば、たとえば1回500mlを4時間以上かけて投与する予定を伝える場合にもMedication resourceで伝えることができる。  
【JP Core仕様】1回の投与量を指定する。単位は医薬品単位略号を使用することが望ましい。"
// rate[x]
* doseAndRate.rateRatio only JP_MedicationRatio_DosePerDay
* doseAndRate.rateRange only JP_MedicationRange_UnitOfTime
* doseAndRate.rateQuantity ^short = "投与速度(量/時間)を指定する"
* doseAndRate.rateQuantity ^definition = "投与速度(量/時間)を指定する"

// ------------------------------
// (注射用)JP_MedicationDosage DataType
// ------------------------------
Profile: JP_MedicationDosage_Injection
Parent: JP_MedicationDosageBase
Id: jp-medicationdosage-injection
Title: "JP Core MedicationDosage Injection DataType"
Description: "このデータタイプは注射用法の制約と拡張のうち共通部分を定めている。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationDosage_Injection"
* ^status = #active
* ^date = "2023-10-31"
* extension contains
    JP_MedicationDosage_DosageComment named dosageComment ..* and
    JP_MedicationDosage_Device named device ..* and
    JP_MedicationDosage_Line named line ..* and
    JP_MedicationDosage_LineComment named lineComment ..*
* timing ^short = "投与タイミング"
* timing ^definition = "投与タイミングを記録する。"
* timing.code from $JP_MedicationUsageInjection_VS (preferred)
* timing.code ^comment = "BIDなどは「施設特有の時間」として定義される。たとえば、施設がBIDを「つねに朝7時と夕方6時」であると指定することがある。この指定が不適切であれば、BIDというコードは使うべきではない。その代わり、HL7が定義したBIDのコードではなく、その施設特有のコードで明示的に示すべきであり、構造化された表現を使うべきである（この場合、2回のイベントの時刻を指定する必要がある）。  
【JP Core仕様】頓用指示時にはJAMI処方・注射オーダ標準用法規格の表6 イベント区分、イベント詳細区分(“http://jpfhir.jp/fhir/core/CodeSystem/JP_MedicationAsNeededConditionJAMI_CS”)を推奨するが、MERIT-9 処方オーダ 表5 頓用指示(“http://jpfhir.jp/fhir/core/CodeSystem/JP_MedicationAsNeededConditionMERIT9_CS”) を使用してもよい。"
// site
* site.extension contains
    JP_MedicationDosage_SiteComment named siteComment ..* and
    $bodySite named bodySite ..*
* site.extension[bodySite] ^short = "身体部位の位置に関する詳細"
* site.extension[bodySite] ^definition = "身体部位の位置に関する詳細情報。site概念がユースケースに必要な詳細を提供しない場合に使用される。"
// method
* method.extension contains JP_MedicationDosage_MethodComment named methodComment ..*
// route
* route.extension contains JP_MedicationDosage_RouteComment named routeComment ..*
// dose[x]
* doseAndRate.extension contains JP_MedicationDosage_RateComment named rateComment ..*
* doseAndRate.doseQuantity only JP_MedicationSimpleQuantity
* doseAndRate.doseQuantity ^short = "1回投与量（体積）"
* doseAndRate.doseQuantity ^definition = "1回投与量（体積）"
* doseAndRate.doseQuantity ^comment = "この量は指定された薬剤の量を指定するものであって、各有効成分の量を指定するものではない。各成分の量はMedication resourceで伝えることができる。たとえば、有効成分が375mgである錠剤を1錠投与することを伝えたい場合、Medication resourceを利用して、XYZ成分が375mg含有しているという錠剤であることを文書化することができる。あるいは1回投与量が375mgであることを伝えるのであれば、Medication resourceをつかって単にそれが錠剤であることを示せばよい。もし、ドーパミンの静注を例に挙げて、400mgのドーパミンを500mlの注射溶液に混ぜて使うことを伝えたいのであれば、それをすべてMedication resourceで伝えることができる。もし、投与について即時に伝達することを意図していない（たとえば投与速度が示されていたり、投与時期に範囲があるような場合）のであれば、たとえば1回500mlを4時間以上かけて投与する予定を伝える場合にもMedication resourceで伝えることができる。  
【JP Core仕様】1回の投与量（体積）を指定する。単位はUCUMを使用する。"
// // rate[x]
* doseAndRate.rateRatio only JP_MedicationRatio_DosePerPeriod
* doseAndRate.rateRange only JP_MedicationRange_UnitOfTime
* doseAndRate.rateQuantity ^short = "投与速度(流量)を指定する単位は流量を表す単位（e.g. 量/時間)を指定する"
* doseAndRate.rateQuantity ^definition = "投与速度(流量)を指定する単位は流量を表す単位（e.g. 量/時間)を指定する"

// ==============================
//   Extension 定義
// ==============================
// ------------------------------
// JP_MedicationDosage_DosageComment
// ------------------------------
Extension: JP_MedicationDosage_DosageComment
Id: jp-medicationdosage-dosagecomment
Title: "JP Core Medication Dosage DosageComment Extension"
Description: "用法コメントを格納するための拡張"
* ^url = $JP_MedicationDosage_DosageComment
* ^status = #active
* ^date = "2023-10-31"
* ^context[+].type = #element
* ^context[=].expression = "Dosage"
* ^context[+].type = #element
* ^context[=].expression = "MedicationAdministration.dosage"
* . ^short = "用法コメント"
* . ^definition = "用法コメントを格納するための拡張"
* url = $JP_MedicationDosage_DosageComment (exactly)
* value[x] only string or CodeableConcept
* valueCodeableConcept from JP_MedicationExampleDosageComment_VS (example)
* valueString ^short = "テキスト記載"

// ------------------------------
// JP_MedicationDosage_LineComment
// ------------------------------
Extension: JP_MedicationDosage_LineComment
Id: jp-medicationdosage-linecomment
Title: "JP Core Medication Dosage LineComment Extension"
Description: "ラインコメントを格納する"
* ^url = $JP_MedicationDosage_LineComment
* ^status = #active
* ^date = "2023-10-31"
* ^context[+].type = #element
* ^context[=].expression = "Dosage"
* ^context[+].type = #element
* ^context[=].expression = "MedicationAdministration.dosage"
* . ^short = "ラインコメント"
* . ^definition = "ラインコメントを格納するための拡張"
* url = $JP_MedicationDosage_LineComment (exactly)
* value[x] only string or CodeableConcept
* valueCodeableConcept from JP_MedicationExampleLineComment_VS (example)
* valueString ^short = "テキスト記載"

// ------------------------------
// JP_MedicationDosage_MethodComment
// ------------------------------
Extension: JP_MedicationDosage_MethodComment
Id: jp-medicationdosage-methodcomment
Title: "JP Core Medication Dosage MethodComment Extension"
Description: "手技コメントを格納するための拡張"
* ^url = $JP_MedicationDosage_MethodComment
* ^status = #active
* ^date = "2023-10-31"
* ^context[+].type = #element
* ^context[=].expression = "Dosage.method"
* ^context[+].type = #element
* ^context[=].expression = "MedicationAdministration.dosage.method"
* . ^short = "手技コメント"
* . ^definition = "手技コメントを格納するための拡張"
* url = $JP_MedicationDosage_MethodComment (exactly)
* value[x] only string or CodeableConcept
* valueCodeableConcept from JP_MedicationExampleMethodComment_VS (example)
* valueString ^short = "テキスト記載"

// ------------------------------
// JP_MedicationDosage_RateComment
// ------------------------------
Extension: JP_MedicationDosage_RateComment
Id: jp-medicationdosage-ratecomment
Title: "JP Core Medication Dosage RateComment Extension"
Description: "投与速度コメントを格納するための拡張"
* ^url = $JP_MedicationDosage_RateComment
* ^status = #active
* ^date = "2023-10-31"
* ^context[+].type = #element
* ^context[=].expression = "Dosage.doseAndRate"
* ^context[+].type = #element
* ^context[=].expression = "MedicationAdministration.dosage"
* . ^short = "投与速度コメント"
* . ^definition = "投与速度コメントを格納するための拡張"
* url = $JP_MedicationDosage_RateComment (exactly)
* value[x] only string or CodeableConcept
* valueCodeableConcept from JP_MedicationExampleRateComment_VS (example)
* valueString ^short = "テキスト記載"

// ------------------------------
// JP_MedicationDosage_RouteComment
// ------------------------------
Extension: JP_MedicationDosage_RouteComment
Id: jp-medicationdosage-routecomment
Title: "JP Core Medication Dosage RouteComment Extension"
Description: "投与経路コメントを格納するための拡張"
* ^url = $JP_MedicationDosage_RouteComment
* ^status = #active
* ^date = "2023-10-31"
* ^context[+].type = #element
* ^context[=].expression = "Dosage.route"
* ^context[+].type = #element
* ^context[=].expression = "MedicationAdministration.dosage.route"
* . ^short = "投与経路コメント"
* . ^definition = "投与経路コメントを格納するための拡張"
* url = $JP_MedicationDosage_RouteComment (exactly)
* value[x] only string or CodeableConcept
* valueCodeableConcept from JP_MedicationExampleRouteComment_VS (example)
* valueString ^short = "テキスト記載"

// ------------------------------
// JP_MedicationDosage_SiteComment
// ------------------------------
Extension: JP_MedicationDosage_SiteComment
Id: jp-medicationdosage-sitecomment
Title: "JP Core Medication Dosage SiteComment Extension"
Description: "投与部位コメントを格納するための拡張"
* ^url = $JP_MedicationDosage_SiteComment
* ^status = #active
* ^date = "2023-10-31"
* ^context[+].type = #element
* ^context[=].expression = "Dosage.site"
* ^context[+].type = #element
* ^context[=].expression = "MedicationAdministration.dosage.site"
* . ^short = "投与部位コメント"
* . ^definition = "投与部位コメントを格納するための拡張"
* url = $JP_MedicationDosage_SiteComment (exactly)
* value[x] only string or CodeableConcept
* valueCodeableConcept from JP_MedicationExampleSiteComment_VS (example)
* valueString ^short = "テキスト記載"

// ------------------------------
//JP_MedicationDosage_Device
// ------------------------------
Extension: JP_MedicationDosage_Device
Id: jp-medicationdosage-device
Title: "JP Core Medication Dosage Device Extension"
Description: "投与装置を格納する拡張"
* ^url = $JP_MedicationDosage_Device
* ^status = #active
* ^date = "2023-10-31"
* ^context[0].type = #element
* ^context[=].expression = "Dosage"
* ^context[+].type = #element
* ^context[=].expression = "MedicationAdministration.dosage"
* . ^short = "投与装置"
* . ^definition = "投与装置を格納する拡張"
* url = $JP_MedicationDosage_Device (exactly)
* value[x] only Reference(Device)

// ------------------------------
//JP_MedicationDosage_Line
// ------------------------------
Extension: JP_MedicationDosage_Line
Id: jp-medicationdosage-line
Title: "JP Core Medication Dosage Line Extension"
Description: "指示ラインを格納するための拡張"
* ^url = $JP_MedicationDosage_Line
* ^status = #active
* ^date = "2023-10-31"
* ^context[0].type = #element
* ^context[=].expression = "Dosage"
* ^context[+].type = #element
* ^context[=].expression = "MedicationAdministration.dosage"
* . ^short = "指示ライン"
* . ^definition = "指示ラインを格納する拡張"
* url = $JP_MedicationDosage_Line (exactly)
* value[x] only CodeableConcept
* valueCodeableConcept from JP_MedicationExampleLine_VS (example)
// * valueString ^short = "テキスト記載"

// ------------------------------
//JP_MedicationDosage_PeriodOfUse
// ------------------------------
Extension: JP_MedicationDosage_PeriodOfUse
Id: jp-medicationdosage-periodofuse
Title: "JP Core Medication Dosage PeriodOfUse Extension"
Description: "投与開始日を格納する拡張"
* ^url = $JP_MedicationDosage_PeriodOfUse
* ^status = #active
* ^date = "2023-10-31"
* ^purpose = "処方日とは別に明示的に投与・内服開始日を指定するため。"
* ^context[+].type = #element
* ^context[=].expression = "Dosage"
* . ^short = "投与期間の開始日を明示するための拡張"
* . ^definition = "MedicationRequestの投与期間の開始日を明示するための拡張"
* url = $JP_MedicationDosage_PeriodOfUse (exactly)
* value[x] only Period
* value[x] ^short = "投与期間を表す"
* value[x] ^definition = "MedicationRequestに投与期間の開始日を明示するための拡張"
* value[x].start 1..
* value[x].start ^short = "投与期間の開始日"
* value[x].start ^definition = "明示された投与期間の開始日"

// ------------------------------
// JP_MedicationDosage_UsageDuration
// ------------------------------
Extension: JP_MedicationDosage_UsageDuration
Id: jp-medicationdosage-usageduration
Title: "JP Core Medication Dosage UsageDuration Extension"
Description: "隔日投与など、服用開始日から終了日までの日数と実投与日数が異なる場合に、実投与日数を明⽰したい場合に使用する拡張"
* ^url = $JP_MedicationDosage_UsageDuration
* ^status = #active
* ^date = "2023-10-31"
* ^context[+].type = #element
* ^context[=].expression = "Dosage"
* . ^short = "実投与日数"
* . ^definition = "隔日投与などで実投与日数と処方期間が異なる場合に用いられる。"
* url = $JP_MedicationDosage_UsageDuration (exactly)
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