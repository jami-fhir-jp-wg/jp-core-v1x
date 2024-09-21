// ==============================
//   Profile 定義
// ==============================
Profile: JP_MedicationDispenseBase
Parent: MedicationDispense
Id: jp-medicationdispensebase
Title: "JP Core MedicationDispenseBase Profile"
Description: "このプロファイルはユーザは直接適用するものではなく、JP_MedicationDispenseとJP_MedicationDispenseInjectionの共通の親となる抽象プロファイルである。このプロファイルはMedicationDispenseリソースに対して、内服・外用薬剤処方調剤・払い出し記録のデータを送受信するため、JP_MedicationDispenseとJP_MedicationDispenseInjectionの各プロファイルの基礎となる制約と拡張のうち共通部分を定めている。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationDispenseBase"
* ^status = #active
* ^date = "2023-06-26"
* . ^short = "指定された患者への薬剤の払い出し"
* . ^definition = "指定された患者・個人へ薬剤が払い出されたか払い出される予定のものを示す。これには（供給される）提供される製品についての説明や薬剤の服用に関する指示も含まれる。薬剤払い出しは薬剤オーダに対して薬局システムが対応した結果となる。"
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
* identifier[rpNumber].system ^definition = "ここで付番されたIDがRp番号であることを明示するためにOIDとして定義された。urn:oid:1.2.392.100495.20.3.81で固定される。"
* identifier[rpNumber].value 1..
* identifier[rpNumber].value ^short = "Rp番号(剤グループ番号)"
* identifier[rpNumber].value ^definition = "Rp番号(剤グループ番号)。\"1\"など。"
* identifier[rpNumber].value ^comment = "value は string型であり、数値はゼロサプレス、つまり、'01'でなく'1'と指定すること。"
* identifier[requestIdentifier].system = "http://jpfhir.jp/fhir/core/IdSystem/resourceInstance-identifier" (exactly)
* identifier[requestIdentifier] ^short = "処方オーダに対するID(MedicationRequestからの継承)"
* identifier[requestIdentifier] ^definition = "薬剤をオーダする単位としての処方箋に対するID。原則として調剤の基となったMedicationRequestのIDを設定する。"
* identifier[requestIdentifier].value 1..
* extension contains JP_MedicationDispense_Preparation named preparation ..*
* partOf only Reference(JP_Procedure)
* partOf ^short = "親イベントへの参照"
* partOf ^definition = "この調剤の契機となったProcedureリソースへの参照。"
* status ^short = "preparation | in-progress | cancelled | on-hold | completed | entered-in-error | stopped | unknown 一連の調剤イベントの状態"
* status ^definition = "一連の調剤イベントの状態を指定するコード。"
* statusReason[x] ^short = "調剤が実行されなかった理由"
* statusReason[x] ^definition = "調剤が実行されなかった理由を示す。"
* category ^short = "調剤タイプ"
* category ^definition = "投薬のタイプを示す（たとえば、薬剤が消費または投与されると予想される場所（つまり、入院患者または外来患者））。　入院、外来、退院、自宅など。"
* medication[x] ^short = "医薬品"
* medication[x] ^definition = "投与された薬剤を識別する。既知の薬のリストから薬を識別するコード情報を設定する。"
* medication[x] ^comment = "ひとつのtext要素と、複数のcoding 要素を記述できる。処方オーダ時に選択または入力し、実際に処方箋に印字される文字列を必ずtext要素に格納した上で、それをコード化した情報を1個以上のcoding 要素に記述する。  
厚生労働省標準であるHOT9コード（販社指定が不要な場合にはHOT7コード）または広く流通しているYJコードを用いるか、一般名処方の場合には厚生労働省保険局一般名処方マスタのコードを使用して、Coding要素（コードsystemを識別するURI、医薬品のコード、そのコード表における医薬品の名称の3つからなる）で記述する。  
なお、上記のいずれの標準的コードも付番されていない医薬品や医療材料の場合には、薬機法の下で使用されているGS1標準の識別コードであるGTIN(Global Trade Item Number)の調剤包装単位（最少包装単位、個別包装単位）14桁を使用する。  
ひとつの処方薬、医療材料を複数のコード体系のコードで記述してもよく、その場合にcoding 要素を繰り返して記述する。  
ただし、ひとつの処方薬を複数のコードで繰り返し記述する場合には、それらのコードが指し示す処方薬、医療材料は当然同一でなければならない。  
また、処方を発行した医療機関内でのデータ利用のために、医療機関固有コード体系によるコード（ハウスコード、ローカルコード）の記述を含めてもよいが、その場合でも上述したいずれかの標準コードを同時に記述することが必要である。"
* subject 1..1
* subject only Reference(JP_Patient)
* subject ^short = "投与対象患者"
* subject ^definition = "投与を受ける患者"
* subject ^comment = "参照は、実際のFHIRリソースへの参照である必要があり、解決可能（内容に到達可能）である必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。"
* context only Reference(JP_Encounter or EpisodeOfCare)
* context ^short = "調剤ベントに関連するEncounterやエピソード"
* context ^definition = "調剤ベントに関連するEncounterやエピソードへの参照。"
* context ^comment = "参照は、実際のFHIRリソースへの参照である必要があり、解決可能（内容に到達可能）である必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。"
* supportingInformation ^short = "薬の調剤をサポートする情報"
* supportingInformation ^definition = "調剤される薬剤をサポートする追加情報への任意のリソースへの参照。"
* supportingInformation ^comment = "参照は、実際のFHIRリソースへの参照である必要があり、解決可能（内容に到達可能）である必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。"
* performer ^short = "調剤を実施した人"
* performer ^definition = "調剤した人を示す"
* performer.actor only Reference(JP_Practitioner or JP_PractitionerRole or JP_Organization or JP_Patient or Device or RelatedPerson)
* location only Reference(JP_Location)
* location ^short = "調剤実施場所"
* location ^definition = "調剤が実施された場所を示すLocationリソースへの参照。"
* location ^comment = "参照は、実際のFHIRリソースへの参照である必要があり、解決可能（内容に到達可能）である必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。"
* authorizingPrescription ^short = "調剤を正当化する元の処方オーダ"
* authorizingPrescription ^definition = "調剤の元になった処方オーダを表すMedicationRequestリソースへの参照。"
* type ^short = "実行される調剤イベント"
* type ^definition = "実行される調剤イベントのタイプを示す。たとえば、トライアルフィル、トライアルの完了、部分フィル、緊急フィル、サンプルなどである。"
* type ^comment = "すべてのターミノロジの使用がこの一般的なパターンに適合するわけではない。場合によっては、モデルはCodeableConceptを使用せず、コーディングを直接使用して、テキスト、コーディング、翻訳、および要素間の関係とpre-coordinationとpost-coordinationの用語関係を管理するための独自の構造を提供する必要がある。"
* quantity 1..
* quantity only JP_MedicationSimpleQuantity
* quantity ^short = "払い出される薬剤の量"
* quantity ^definition = "調剤総量。  
JP Coreでは必須  
払い出される薬剤の量。計測単位を含む。"
* quantity ^comment = "使用状況によって、これがどのような量であるか、したがってどのような単位を使用できるかが定義される場合がかなりある。使用状況によっては、比較演算子の値も制限される場合がある。"
* daysSupply only JP_MedicationSimpleQuantity
* daysSupply ^short = "タイミングとして表される投薬量"
* daysSupply ^definition = "タイミングとして表される投薬量。すなわち、XX日分、XX回分などの数量。"
* daysSupply ^comment = "使用状況によって、これがどのような量であるか、したがってどのような単位を使用できるかが定義される場合がかなりある。使用状況によっては、比較演算子の値も制限される場合がある。"
* whenPrepared ^short = "調剤がパッケージ化され、レビューされた日時"
* whenPrepared ^definition = "調剤がパッケージ化され、レビューされた日時"
* whenHandedOver 1..
* whenHandedOver ^short = "払い出された日時"
* whenHandedOver ^definition = "必須。  
患者あるいはその代理人に払い出される薬剤が提供された日時。"
* destination only Reference(JP_Location)
* destination ^short = "薬が送られた場所"
* destination ^definition = "調剤イベントの一環として、薬剤が出荷された行先先の施設/場所のLocationリソースへの参照。"
* destination ^comment = "参照は、実際のFHIRリソースへの参照である必要があり、解決可能（内容に到達可能）である必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。"
* receiver only Reference(JP_Patient or JP_Practitioner)
* receiver ^short = "薬を受け取った人"
* receiver ^definition = "薬を受け取った人を識別する。これは通常、患者またはその介護者だが、医療専門家になる場合もある。"
* receiver ^comment = "参照は、実際のFHIRリソースへの参照である必要があり、解決可能（内容に到達可能）である必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。"
* note ^short = "調剤に関する備考"
* note ^definition = "他の要素では伝達できなかった調剤に関する追加情報。"
* note ^comment = "構造化された注釈（アノテーション）を持たないシステムの場合、作成者や時間なしで単一の注釈を簡単に伝達できる。情報を変更する可能性があるため、この要素をナラティブに含める必要がある場合がある。  
*注釈は、計算機処理れきる「変更」情報を伝達するために使用されるべきではない*。 （ユーザの行動を強制することはほとんど不可能であるため、これはSHOULDとする）。"
* dosageInstruction only JP_MedicationDosageBase
* substitution ^short = "調剤の一部として置換が行われたかどうかを示す。場合によっては、置換が期待されるが発生しない場合もあれば、置換が予期されないが発生する場合もある。このブロックは、置換が行われたか行われなかったか、およびその理由を説明する。何も指定されていない場合、置換は行われていない。"
* substitution.wasSubstituted ^short = "調剤で置換が実行されたか、あるいはされていないかを'true'または'false'で表す"
* substitution.wasSubstituted ^definition = "処方されたものとは異なる薬剤または製品を調剤した場合に、'true'を設定する。"
* substitution.type ^short = "処方されたものとは異なる薬が調剤されたかどうかを示すコード"
* substitution.type ^definition = "処方されたものとは異なる薬が調剤されたかどうかを示すコード。  
HL7 v3 Value Set ActSubstanceAdminSubstitutionCode　から以下のコードが使用できる。  
E  : 別の生物学的同等および治療的に同等の製品で置換が行われたか、許可された。  
EC : 代替品が発生したか、次のような別の製品で許可されている：同じ有効成分を含むが異なる塩で処方された代替医薬品、同じ有効成分を持つエステル医薬品同等物、強度、剤形、投与経路。  
BC : 代替が発生したか、同等のブランド間で許可されてるが、ジェネリックでは許可されない。  
G  : 代替が発生したか、同等のジェネリック間で許可されているが、ブランド間では許可されない。  
TE : 同じ治療目的と安全性プロファイルを持つ別の製品で代替が発生したか、許可された。  
TB : ジェネリック医薬品ではなく、治療的に同等のブランド間で代替品が発生したか、許可されている  
TG : 治療的に同等のジェネリック間で置換が発生したか、許可されているが、ブランドは許可されない。  
F  : 処方ガイドラインに準拠。  
N  : 置換は発生しなかったか、許可されていない。"
* substitution.type ^comment = ""
* substitution.reason ^short = "置換が実施された理由"
* substitution.reason ^definition = "治療継続性確保のため、FP:処方方針、 OS: 在庫欠品、  RR:代替えを義務付けまたは禁止する規制要件に従った"
* substitution.reason ^comment = ""
* substitution.responsibleParty only Reference(JP_Practitioner or JP_PractitionerRole)
* substitution.responsibleParty ^short = "置換責任者"
* substitution.responsibleParty ^definition = "置換の主な責任を負う個人または組織。Practitioner   PractitionerRole リソースへの参照。"
* substitution.responsibleParty ^comment = "参照は、実際のFHIRリソースへの参照である必要があり、解決可能（内容に到達可能）である必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。"
* detectedIssue ^short = "アクションを伴う臨床的問題"
* detectedIssue ^definition = "患者に対する1つまたは複数のアクティブまたは提案された臨床アクションを伴う、またはそれらの間の実際のまたは潜在的な臨床問題を示す。例えば薬物間相互作用、重複治療、投与量アラートなど。  
DetectedIssue リソースへの参照。"
* eventHistory ^short = "関連するライフサイクルイベントのリスト"
* eventHistory ^definition = "調剤が確認されたときなど、発生した対象のイベントのサマリー。"

//--------------------------
// 内服 JP_MedicationDispense
//--------------------------
Profile: JP_MedicationDispense
Parent: JP_MedicationDispenseBase
Id: jp-medicationdispense
Title: "JP Core MedicationDispense Profile"
Description: "このプロファイルはMedicationDispenseリソースに対して、内服・外用薬剤処方調剤・払い出し記録のデータを送受信するための基礎となる制約と拡張を定めたものである。JP_MedicationDispenseBaseプロファイルからの派生プロファイルである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationDispense"
* ^status = #active
* ^date = "2023-06-26"
* . ^short = "指定された患者への薬剤の払い出し"
* . ^definition = "指定された患者・個人へ薬剤が払い出されたか払い出される予定のものを示す。これには（供給される）提供される製品についての説明や薬剤の服用に関する指示も含まれる。薬剤払い出しは薬剤オーダに対して薬局システムが対応した結果となる。"
* identifier contains
    orderInRp 1..1
* identifier[orderInRp] ^short = "同一RP番号（剤グループ）での薬剤の表記順"
* identifier[orderInRp] ^definition = "同一剤グループでの薬剤を表記する際の順番。XML形式と異なりJSON形式の場合、表記順は項目の順序を意味しない。したがって、薬剤の記載順を別に規定する必要があるためIDを用いて表現する。"
* identifier[orderInRp] ^comment = "同一剤グループ内での薬剤の順番を1から順の番号で示す。"
* identifier[orderInRp].system 1..
* identifier[orderInRp].system = "$JP_MedicationAdministrationIndex " (exactly)
* identifier[orderInRp].system ^short = "RP番号内（剤グループ内）の連番を示すsystem値"
* identifier[orderInRp].system ^definition = "剤グループ内番号の名前空間を識別するURI。固定値 http://jpfhir.jp/fhir/core/mhlw/IdSystem/MedicationAdministrationIndex"
* identifier[orderInRp].value 1..
* identifier[orderInRp].value ^short = "RP番号内（剤グループ内）の連番"
* identifier[orderInRp].value ^definition = "剤グループ内連番。"
* identifier[orderInRp].value ^comment = "value は string型であり、数値はゼロサプレス、つまり、'01'でなく'1'と指定すること。"
* medication[x] only CodeableConcept
* medicationCodeableConcept from JP_MedicationCode_VS (preferred)
* medicationCodeableConcept ^short = "コード集で定義された医薬品コード"
* medicationCodeableConcept ^binding.description = "処方する製剤を表すコード。"
* authorizingPrescription only Reference(JP_MedicationRequest)
* dosageInstruction only JP_MedicationDosage

//--------------------------
// 注射 JP_MedicationDispense_Injection
//--------------------------
Profile: JP_MedicationDispense_Injection
Parent: JP_MedicationDispenseBase
Id: jp-medicationdispense-injection
Title: "JP Core MedicationDispense Injection Profile"
Description: "このプロファイルはMedicationDispenseリソースに対して、注射薬剤処方調剤・払い出し記録のデータを送受信するための基礎となる制約と拡張を定めたものである。JP_MedicationDispenseBaseプロファイルからの派生プロファイルである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationDispense_Injection"
* ^status = #active
* ^date = "2023-06-26"
* . ^short = "指定された患者への注射薬剤の払い出し"
* . ^definition = "指定された患者・個人へ注射薬剤が払い出されたか払い出される予定のものを示す。これには（供給される）提供される製品についての説明や注射薬剤の服用に関する指示も含まれる。薬剤払い出しは注射オーダに対して薬局システムが対応した結果となる。"
* medication[x] only Reference(Medication)
* medicationReference only Reference(JP_Medication)
* authorizingPrescription only Reference(JP_MedicationRequest_Injection)
* dosageInstruction only JP_MedicationDosage_Injection

// ==============================
//   Extension 定義
// ==============================
Extension: JP_MedicationDispense_Preparation
Id: jp-medicationdispense-preparation
Title: "JP Core MedicationDispense Preparation Extension"
Description: "薬剤単位の調剤結果"
* ^url = $JP_MedicationDispense_Preparation
* ^status = #active
* ^date = "2023-06-26"
* ^purpose = "薬剤単位の調剤結果"
* ^context.type = #element
* ^context.expression = "MedicationDispense"
* . ^short = "調剤結果"
* . ^definition = "薬剤単位の調剤結果"
* url = $JP_MedicationDispense_Preparation (exactly)
* value[x] only string or CodeableConcept
* value[x] ^short = "調剤結果"
* value[x] ^definition = "薬剤単位の調剤結果"
* valueCodeableConcept from $JP_MedicationInstructionForDispenseJHSP0002_VS (example)
* valueString ^short = "テキスト記載"
