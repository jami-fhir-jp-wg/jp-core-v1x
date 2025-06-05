RuleSet: MedicationAdministrationBaseRules_subject2note
* subject 1..1
* subject only Reference(JP_Patient)
* subject ^short = "投与対象患者"
* subject ^definition = "投与を受ける患者"
* subject ^comment = "参照は、実際のFHIRリソースへの参照である必要があり、解決可能（内容に到達可能）である必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。"
* context only Reference(JP_Encounter or EpisodeOfCare)
* context ^short = "Encounter、または一部として実施されるケアエピソード"
* context ^definition = "投薬が行われた患者と医療提供者の間の訪問、入院、またはその他の接触。  
受診情報や入院情報を表すEncounterへの参照。"
* context ^comment = "参照は、実際のFHIRリソースへの参照である必要があり、解決可能（内容に到達可能）である必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。"
* supportingInformation ^short = "投与をサポートする追加情報"
* supportingInformation ^definition = "薬の投与をサポートする追加情報（たとえば、患者の身長や体重）。"
* supportingInformation ^comment = "参照は、実際のFHIRリソースへの参照である必要があり、解決可能（内容に到達可能）である必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。"
* effective[x] only dateTime or Period
* effective[x] ^short = "開始時間と終了時間"
* effective[x] ^definition = "投与が行われた（または「notGiven」属性がtrueの場合は行われなかった）特定の日時または時間間隔。錠剤を飲み込むなど、多くの管理では、dateTimeの使用がより適切である。"
* effective[x] ^comment = "投与実施日時であり、JP Coreでは必須である。"
* performer ^short = "投薬を実施した人"
* performer ^definition = "投薬およびそれに関与した人"
* performer.actor only Reference(JP_Practitioner or JP_PractitionerRole or JP_Patient or RelatedPerson or Device)
* reasonCode ^short = "投薬が実施された理由"
* reasonCode ^definition = "投薬が実施された理由を示すコード"
* reasonReference ^short = "薬が投与された理由を裏付ける状態または観察"
* reasonReference only Reference(JP_Condition or JP_Observation_Common or JP_DiagnosticReport_Common)
* reasonReference ^definition = "薬が投与された理由を裏付ける状態または観察"
* reasonReference ^comment = "これは、投薬要求の理由である状態への参照。コードのみが存在する場合は、reasonCodeを使用する。"
* request only Reference(MedicationRequest or JP_MedicationRequest or JP_MedicationRequest_Injection)
* request ^short = "実施された元の投与依頼情報"
* request ^definition = "投与を実行する元になった投与指示や権限への参照情報。"
* request ^comment = "これは、orderまたはinstance-orderのいずれかであるMedicationRequestへの参照。インテントが他の値である場合は、MedicationRequestsを参照しないこと。"
* request ^requirements = "これは、インテント（意図）がorderまたはinstance-orderのいずれかであるMedicationRequestへの参照である。  
インテントが他の値である場合は、MedicationRequestsを参照しないこと。"
* device ^short = "投与に使用されるデバイス"
* device ^definition = "患者に薬を投与する際に使用されるデバイスへの参照。たとえば、特定の輸液ポンプ。"
* device ^comment = "参照は、実際のFHIRリソースへの参照である必要があり、解決可能（内容に到達可能）である必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。"
* note ^short = "投与に関する備考情報"
* note ^definition = "構造化された注釈情報がないシステムの場合、この要素によって作成者や作成時刻情報なしで単一の注釈を簡単に伝達できる。投与情報に付帯する潜在的な情報や修飾的な情報を伝えるために、この要素に叙述的な記述でそれらを含める必要がある場合がある。   
*注釈は、計算可能な「変更」情報を伝達するために使用されるべきではない*。 （ユーザの行動を強制することはほとんど不可能であるため、これはSHOULDである）。"

RuleSet: MedicationAdministrationBaseRules_dosageText
* dosage ^short = "薬の服用方法の詳細"
* dosage ^definition = "投薬量情報の詳細を説明する。線量、率、場所、ルートなど。"
* dosage.text ^short = "フリーテキストの投与方法の説明　SIG:用法"
* dosage.text ^definition = "フリーテキストの投与量用法は、投与される投与量や用法が複雑すぎてコーディングできない場合に使用できる。コード化された投与量や用法が存在する場合、フリーテキストの投与量や用法は、人間に表示するためにまだ存在している可能性がある。  
投与量や用法のこの指示は、実際に投与される薬の投与量や用法を反映する必要がある。"

RuleSet: MedicationAdministrationBaseRules_dosageSite
* dosage.site from $JP_MedicationBodySiteJAMIExternal_VS (preferred)
* dosage.site ^short = "投与部位"
* dosage.site ^definition = "薬が最初に体内に入った解剖学的部位のコード化された記述。たとえば、「左腕」。"
* dosage.site ^comment = "ユースケースでBodySiteリソースの属性が必要な場合（たとえば、個別に識別して追跡するため）、標準の拡張機能[bodySite]（extension-bodysite.html）を使用する。要約コード、または場所の非常に正確な定義への参照、あるいはその両方である可能性がある。"

RuleSet: MedicationAdministrationBaseRules_dosageRoute
* dosage.route from $JP_MedicationRouteHL70162_VS (preferred)
* dosage.route ^short = "体への投与経路"
* dosage.route ^definition = "患者への、または患者への治療薬の投与経路または生理学的経路を指定するコード。たとえば、局所、静脈内など。"
* dosage.route ^comment = ""

RuleSet: MedicationAdministrationBaseRules_dosageMethod2Dose
* dosage.method ^short = "投与方法"
* dosage.method ^definition = "投与方法"
* dosage.method ^comment = "ターミノロジは投与する経路あるいは剤型をあらかじめ指定するために用いられる。"
* dosage.method ^requirements = "コード化された値は体内に薬剤が投与される方法を示している。注射ではよく使われる。たとえば、緩徐に注入、深部に静注など。"
* dosage.method.coding ^slicing.discriminator.type = #value
* dosage.method.coding ^slicing.discriminator.path = "system"
* dosage.method.coding ^slicing.rules = #open
* dosage.method.coding contains
    unitDigit1 ..1 and
    unitDigit2 ..1
* dosage.method.coding[unitDigit1] from JP_MedicationMethodJAMIBasicUsage_VS (preferred)
* dosage.method.coding[unitDigit1].system = $JP_MedicationMethodJAMIBasicUsage_CS (exactly)
* dosage.method.coding[unitDigit1] ^short = "投与⽅法に対応するJAMI 用法コード表基本用法１桁コード"
* dosage.method.coding[unitDigit1] ^definition = "投与⽅法に対応するJAMI 用法コード表基本用法１桁コードを識別するURI。"
* dosage.method.coding[unitDigit1] ^comment = "コードは臨時で列記したものや、コードのリストからSNOMED CTのように公式に定義されたものまである（HL7 v3 core principle を参照)。FHIR自体ではコーディング規約を定めてはいないし、意味を暗示するために利用されない(SHALL NOT)。一般的に UserSelected = trueの場合には一つのコードシステムが使われる。"
* dosage.method.coding[unitDigit1] ^requirements = "他のコードシステムへの変換や代替のコードシステムを使ってエンコードしてもよい。"
* dosage.method.coding[unitDigit2] from JP_MedicationMethodJAMIDetailUsage_VS (preferred)
* dosage.method.coding[unitDigit2].system = $JP_MedicationMethodJAMIDetailUsage_CS (exactly)
* dosage.method.coding[unitDigit2] ^short = "投与⽅法に対応するJAMI 用法コード表基本用法2桁コード"
* dosage.method.coding[unitDigit2] ^definition = "投与⽅法に対応するJAMI 用法コード表基本用法2桁コードを識別するURI。２桁コードhttp://jami.jp/CodeSystem/MedicationUsage"
* dosage.method.coding[unitDigit2] ^comment = "コードは臨時で列記したものや、コードのリストからSNOMED CTのように公式に定義されたものまである（HL7 v3 core principle を参照)。FHIR自体ではコーディング規約を定めてはいないし、意味を暗示するために利用されない(SHALL NOT)。一般的に UserSelected = trueの場合には一つのコードシステムが使われる。"
* dosage.method.coding[unitDigit2] ^requirements = "他のコードシステムへの変換や代替のコードシステムを使ってエンコードしてもよい。"
* dosage.method.text ^short = "投与⽅法のテキスト表現"
* dosage.method.text ^definition = "投与⽅法のテキスト表現。コードで指定できない場合、本要素で文字列として指定してもよい。"
* dosage.method.text ^comment = "textエレメントはcodingのdisplayNameエレメントと一致することがよくある。"
* dosage.method.text ^requirements = "ターミノロジ由来のコードは必ずしも人間が使う言葉の全てのニュアンスを含めた正確な意味を捉えているわけではなく、適切なコードが見つからない場合もある。そのような場合でもtextエレメントは元々の意味のすべてを捉えるために使うことができる。"

* dosage.dose only JP_MedicationSimpleQuantity
* dosage.dose ^short = "用量あたりの投薬量"
* dosage.dose ^definition = "1回の投与イベントで投与される薬剤の量。この値は、投与が錠剤の飲み込みや注射などの本質的に瞬間的なイベントである場合に使用する。"

RuleSet: MedicationAdministrationBaseRules_dosageRateX
* dosage.rate[x] ^short = "単位時間あたりの用量"
* dosage.rate[x] ^definition = "薬が患者に導入された、または導入される予定の速度を識別する。  
通常、注入の速度。 1時間あたり100mlまたは100ml/時。単位時間あたりのレートとして表すこともできる。 2時間あたり500ml。その他の例：200mcg/分または200mcg/1分。 1リットル/8時間。"
* dosage.rate[x] ^comment = "レートが時間の経過とともに変化し、これをMedicationAdministrationで記述する場合は、各変更を、特定のMedicationAdministration.dosage.rateと、レート変更が発生した日時を使用して、個別のMedicationAdministrationとして記述する必要がある。通常、MedicationAdministration.dosage.rate要素は、平均レートを伝達するためには使用されない。"

RuleSet: MedicationAdministrationBaseRules_eventHistory
* eventHistory ^short = "ライフサイクルで関心のあるイベントのリスト"
* eventHistory ^definition = "投与が確認されたときなど、発生した関連のあるベントのサマリー。"

// ==============================
//   Profile 定義
// ==============================
Profile: JP_MedicationAdministrationBase
Parent: MedicationAdministration
Id: jp-medicationadministrationBase
Title: "JP Core MedicationAdministrationBase Profile"
Description: "このプロファイルはMedicationAdministrationリソースに対して、投薬実施情報のデータを送受信するための基礎となる制約と拡張を定めたものである。"
// extension 参照宣言
* extension contains
    JP_MedicationAdministration_RequestDepartment named requestDepartment ..1 and
    JP_MedicationAdministration_RequestAuthoredOn named requestAuthoredOn ..1 and
    JP_MedicationAdministration_Location named location ..1   and
    JP_MedicationAdministration_Requester named requester ..*
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationAdministrationBase"
* ^status = #active
* ^date = "2024-12-30"
* . ^short = "患者への薬剤投与記録"
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^short = "外部から参照されるID"
* identifier ^definition = "このインスタンスが外部から参照されるために使われるIDである。処方箋全体としてのIDとしては使用しない。  
処方箋内で同一の用法をまとめて表記されるRp番号はこのIdentifier elementの別スライスで表現する。それ以外に任意のIDを付与してもよい。  
このIDは業務手順によって定められた処方オーダに対して、直接的なURL参照が適切でない場合も含めて関連付けるために使われる。この業務手順のIDは実施者によって割り当てられたものであり、リソースが更新されたりサーバからサーバに転送されたとしても固定のものとして存続する。"
* identifier ^comment = "これは業務IDであって、リソースに対するIDではない。"
* identifier contains
    rpNumber 1..1 and
    requestIdentifier ..*
* identifier[rpNumber] ^short = "処方箋内部の剤グループとしてのRp番号"
* identifier[rpNumber] ^definition = "処方箋内で同一用法の薬剤を慣用的にまとめて、Rpに番号をつけて剤グループとして一括指定されることがある。このスライスでは剤グループに対して割り振られたRp番号を記録する。"
* identifier[rpNumber] ^comment = "剤グループに複数の薬剤が含まれる場合、このグループ内の薬剤には同じRp番号が割り振られる。"
* identifier[rpNumber].system = $JP_Medication_RPGroupNumber (exactly)
* identifier[rpNumber].system ^short = "Rp番号(剤グループ番号)についてのsystem値"
* identifier[rpNumber].system ^definition = "ここで付番されたIDがRp番号であることを明示するためにOID-urlとして定義された。http://jpfhir.jp/fhir/core/mhlw/IdSystem/Medication-RPGroupNumberで固定される。"
* identifier[rpNumber].value 1..
* identifier[rpNumber].value ^short = "Rp番号(剤グループ番号)"
* identifier[rpNumber].value ^definition = "Rp番号(剤グループ番号)。\"1\"など。"
* identifier[rpNumber].value ^comment = "value は string型であり、数値はゼロサプレス、つまり、'01'でなく'1'と指定すること。"
* identifier[requestIdentifier].system = $JP_IdSystem_PrescriptionDocumentID (exactly)
* identifier[requestIdentifier] ^short = "処方オーダに対するID(MedicationRequestからの継承)"
* identifier[requestIdentifier] ^definition = "薬剤をオーダする単位としての処方箋に対するID。原則として投薬実施の基となったMedicationRequestのIDを設定する。"
* identifier[requestIdentifier].value 1..
* instantiates ^short = "プロトコルや定義のインスタンス化"
* instantiates ^definition = "このイベントによって全体的または部分的に順守されたプロトコル、ガイドライン、オーダセット、またはその他の定義。"
* partOf ^short = "親イベントへの参照"
* partOf ^definition = "この特定のイベントがコンポーネントまたはステップであるようなより大きな親イベント。"
* status ^short = "completed | stopped"
* status ^definition = "通常、管理が完了したことを示すように設定される。輸液などの長期にわたる投与では、投与を開始しても完了しない場合や、他のプロセスの進行中に一時停止する場合がある。  
【JP Core仕様】　completed or stopped に限定される。"
* status ^binding.description = "患者への投与状況"
* statusReason ^short = "実施されていない理由"
* statusReason ^definition = "投与が実施されていない理由を示すコード"
* statusReason ^comment = ""
* category ^short = "薬が使用される区分"
* category ^definition = ""

* medication[x] ^short = "医薬品"
* medication[x] ^definition = "投与された薬剤を識別する。既知の薬のリストから薬を識別するコード情報を設定する。"
* medication[x] ^comment = "ひとつのtext要素と、複数のcoding 要素を記述できる。処方オーダ時に選択または入力し、実際に処方箋に印字される文字列を必ずtext要素に格納した上で、それをコード化した情報を1個以上のcoding 要素に記述する。  
厚生労働省標準であるHOT9コード（販社指定が不要な場合にはHOT7コード）または広く流通しているYJコードを用いるか、一般名処方の場合には厚生労働省保険局一般名処方マスタのコードを使用して、Coding要素（コードsystemを識別するURI、医薬品のコード、そのコード表における医薬品の名称の3つからなる）で記述する。  
なお、上記のいずれの標準的コードも付番されていない医薬品や医療材料の場合には、薬機法の下で使用されているGS1標準の識別コードであるGTIN(Global Trade Item Number)の調剤包装単位（最少包装単位、個別包装単位）14桁を使用する。  
ひとつの処方薬、医療材料を複数のコード体系のコードで記述してもよく、その場合にcoding 要素を繰り返して記述する。  
ただし、ひとつの処方薬を複数のコードで繰り返し記述する場合には、それらのコードが指し示す処方薬、医療材料は当然同一でなければならない。  
また、処方を発行した医療機関内でのデータ利用のために、医療機関固有コード体系によるコード（ハウスコード、ローカルコード）の記述を含めてもよいが、その場合でも上述したいずれかの標準コードを同時に記述することが必要である。"

//-------------------------------
// 内服 JP_MedicationAdministration
//-------------------------------
Profile: JP_MedicationAdministration
Parent: JP_MedicationAdministrationBase
Id: jp-medicationadministration
Title: "JP Core MedicationAdministration Profile"
Description: "このプロファイルはMedicationAdministrationリソースに対して、内服・外用薬剤処方投与実施情報のデータを送受信するための基礎となる制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationAdministration"
* ^status = #active
* ^date = "2023-10-31"

* identifier contains
    orderInRp 1..1
* identifier[orderInRp] ^short = "同一RP番号（剤グループ）での薬剤の表記順"
* identifier[orderInRp] ^definition = "同一剤グループでの薬剤を表記する際の順番。XML形式と異なりJSON形式の場合、表記順は項目の順序を意味しない。したがって、薬剤の記載順を別に規定する必要があるためIDを用いて表現する。"
* identifier[orderInRp] ^comment = "同一剤グループ内での薬剤の順番を1から順の番号で示す。"
* identifier[orderInRp].system 1..
* identifier[orderInRp].system = $JP_MedicationAdministrationIndex (exactly)
* identifier[orderInRp].system ^short = "RP番号内（剤グループ内）の連番を示すsystem値"
* identifier[orderInRp].system ^definition = "剤グループ内番号の名前空間を識別するURI。固定値 http://jpfhir.jp/fhir/core/mhlw/IdSystem/MedicationAdministrationIndex"
* identifier[orderInRp].value 1..
* identifier[orderInRp].value ^short = "RP番号内（剤グループ内）の連番"
* identifier[orderInRp].value ^definition = "剤グループ内連番。"
* identifier[orderInRp].value ^comment = "value は string型であり、数値はゼロサプレス、つまり、'01'でなく'1'と指定すること。"


* medication[x] only CodeableConcept
* medicationCodeableConcept from $JP_MedicationCode_VS (preferred)
* medicationCodeableConcept ^binding.description = "処方する製剤を表すコード。"

* insert MedicationAdministrationBaseRules_subject2note
* insert MedicationAdministrationBaseRules_dosageText
* insert MedicationAdministrationBaseRules_dosageSite
* insert MedicationAdministrationBaseRules_dosageMethod2Dose
* insert MedicationAdministrationBaseRules_dosageRateX
* dosage.rateRatio only JP_MedicationRatio_DosePerPeriod
* insert MedicationAdministrationBaseRules_eventHistory

//-------------------------------
// 注射 JP_MedicationAdministration_Injection
//-------------------------------
Profile: JP_MedicationAdministration_Injection
Parent: JP_MedicationAdministrationBase
Id: jp-medicationadministration-injection
Title: "JP Core MedicationAdministration Injection Profile"
Description: "このプロファイルはMedicationAdministrationリソースに対して、注射薬剤処方投与実施情報のデータを送受信するための基礎となる制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationAdministration_Injection"
* ^status = #active
* ^date = "2024-12-30"
* . ^short = "患者への注射薬剤投与記録"
* extension contains
    JP_MedicationAdministration_UncategorizedComment named uncategorizedComment ..*
* medication[x] only Reference(Medication)
* medicationReference only Reference(JP_Medication)
* medicationReference ^definition = "医薬品の識別情報は必須でありmedicationReference.referenceが必ず存在しなければならない、JP Coreでは注射の医薬品情報は単一薬剤の場合も Medicationリソースとして記述し、medicationCodeableConceptは使用しない。参照するMedicationリソースは、MedicationRequest.contained属性に内包することが望ましいが、外部参照としても良い。"

* dosage.extension contains
    JP_MedicationDosage_DosageComment named dosageComment ..* and
    JP_MedicationDosage_Device named device ..* and
    JP_MedicationDosage_Line named line ..* and
    JP_MedicationDosage_LineComment named lineComment ..* and
    JP_MedicationDosage_RateComment named rateComment ..*

* insert MedicationAdministrationBaseRules_dosageText
* insert MedicationAdministrationBaseRules_dosageSite
* dosage.site.extension contains
    $bodySite named bodySite ..* and
    JP_MedicationDosage_SiteComment named siteComment ..*

* dosage.route.extension contains JP_MedicationDosage_RouteComment named routeComment ..*
* insert MedicationAdministrationBaseRules_dosageRoute
* dosage.method.extension contains JP_MedicationDosage_MethodComment named methodComment ..*
* insert MedicationAdministrationBaseRules_dosageMethod2Dose
* insert MedicationAdministrationBaseRules_dosageRateX
//--以下１行を追加（2023.9.6)
* dosage.rateRatio only JP_MedicationRatio_DosePerPeriod

* dosage.rateQuantity ^short = "投与速度(流量)を指定する単位は流量を表す単位（e.g. 量/時間)を指定する"
* dosage.rateQuantity ^definition = "投与速度(流量)を指定する単位は流量を表す単位（e.g. 量/時間)を指定する"
* insert MedicationAdministrationBaseRules_eventHistory


// ==============================
//   Extension 定義
// ==============================
//-------------------------------
// JP_MedicationAdministration_Location
//-------------------------------
Extension: JP_MedicationAdministration_Location
Id: jp-medicationadministration-location
Title: "JP Core MedicationAdministration Location Extension"
Description: "実施場所を格納するための拡張"
* ^url = $JP_MedicationAdministration_Location
* ^status = #active
* ^date = "2023-10-31"
* ^context.type = #element
* ^context.expression = "MedicationAdministration"
* . ^short = "実施場所"
* . ^definition = "実施場所を格納するための拡張。  
実施場所を記述した  Locationリソースへの参照。"
* url = $JP_MedicationAdministration_Location (exactly)
* value[x] only Reference(JP_Location)
* value[x] ^short = "実施場所"

//-------------------------------
// JP_MedicationAdministration_RequestAuthoredOn
//-------------------------------
Extension: JP_MedicationAdministration_RequestAuthoredOn
Id: jp-medicationadministration-requestauthoredon
Title: "JP Core MedicationAdministration RequestAuthoredOn Extension"
Description: "依頼日時を格納するための拡張"
* ^url = $JP_MedicationAdministration_RequestAuthoredOn
* ^status = #active
* ^date = "2023-10-31"
* ^context.type = #element
* ^context.expression = "MedicationAdministration"
* . ^short = "依頼日時"
* . ^definition = "依頼日時を格納するための拡張"
* url = $JP_MedicationAdministration_RequestAuthoredOn (exactly)
* value[x] only dateTime

//-------------------------------
// JP_MedicationAdministration_RequestDepartment
//-------------------------------
Extension: JP_MedicationAdministration_RequestDepartment
Id: jp-medicationadministration-requestdepartment
Title: "JP Core MedicationAdministration RequestDepartment Extension"
Description: "依頼科を格納するための拡張"
* ^url = $JP_MedicationAdministration_RequestDepartment
* ^status = #active
* ^date = "2023-10-31"
* ^context.type = #element
* ^context.expression = "MedicationAdministration"
* . ^short = "依頼科"
* . ^definition = "依頼科を格納するための拡張"
* url = $JP_MedicationAdministration_RequestDepartment (exactly)
* value[x] only CodeableConcept
* valueCodeableConcept from $JP_Department_SsMix_VS (preferred)

//-------------------------------
// JP_MedicationAdministration_Requester
//-------------------------------
Extension: JP_MedicationAdministration_Requester
Id: jp-medicationadministration-requester
Title: "JP Core MedicationAdministration Requester Extension"
Description: "依頼医を格納するための拡張"
* ^url = $JP_MedicationAdministration_Requester
* ^status = #active
* ^date = "2023-10-31"
* ^context.type = #element
* ^context.expression = "MedicationAdministration"
* . ^short = "依頼医"
* . ^definition = "依頼医を格納するための拡張。  
依頼医を記述した Practitioner  リソースへの参照。"
* url = $JP_MedicationAdministration_Requester (exactly)
* value[x] only Reference(JP_Practitioner)

//-------------------------------
// JP_MedicationAdministration_UncategorizedComment
//-------------------------------
Extension: JP_MedicationAdministration_UncategorizedComment
Id: jp-medicationadministration-uncategorizedcomment
Title: "JP Core MedicationAdministration UncategorizedComment Extension"
Description: "未分類コメントを格納するための拡張"
* ^url = $JP_MedicationAdministration_UncategorizedComment
* ^status = #active
* ^date = "2023-10-31"
* ^context.type = #element
* ^context.expression = "MedicationAdministration"
* . ^short = "未分類コメント"
* . ^definition = "未分類コメントを格納するための拡張"
* url = $JP_MedicationAdministration_UncategorizedComment (exactly)
* value[x] only string or CodeableConcept
* valueCodeableConcept from $JP_MedicationExampleUncategorizedComment_VS (example)
* valueString ^short = "テキスト記載"

