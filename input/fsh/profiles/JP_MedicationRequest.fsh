// ==============================
//   Profile 定義
// ==============================

//-------------------------------
// 内服 JP_MedicationRequest
//-------------------------------
Profile: JP_MedicationRequest
Parent: MedicationRequest
Id: jp-medicationrequest
Title: "JP Core MedicationRequest Profile"
Description: "このプロファイルはMedicationRequestリソースに対して、内服・外用薬剤処方のデータを送受信するための基礎となる制約と拡張を定めたものである。"
* extension contains JP_MedicationDispense_Preparation named preparation ..*
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationRequest"
* ^status = #active
* ^date = "2022-10-31"
* . ^short = "患者あるいはグループに対しての処方オーダ"
* . ^definition = "患者への薬の供給と内服・外用薬剤処方の指示を共に提供するオーダ。ケアプランやワークフローパターンとハーモナイズし、入院や外来でも使えるようにするため、このリソースは\"MedicationPrescription\"や\"MedicationOrder\"ではなく、\"MedicationRequest\"と呼ばれる。MedicationRequestプロファイルからの派生プロファイルである。"
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^short = "外部から参照されるID"
* identifier ^definition = "このインスタンスが外部から参照されるために使われるIDである。処方箋全体としてのIDとしては使用しない。\r\n処方箋内で同一の用法をまとめて表記されるRp番号はこのIdentifier elementの別スライスで表現する。それ以外に任意のIDを付与してもよい。\r\nこのIDは業務手順によって定められた処方オーダに対して、直接的なURL参照が適切でない場合も含めて関連付けるために使われる。この業務手順のIDは実施者によって割り当てられたものであり、リソースが更新されたりサーバからサーバに転送されたとしても固定のものとして存続する。"
* identifier ^comment = "これは業務IDであって、リソースに対するIDではない。"
* identifier contains
    rpNumber 1..1 and
    orderInRp 1..1 and
    requestIdentifierCommon 0..1 and
    requestIdentifier 0..*

* identifier[rpNumber] ^short = "処方箋内部の剤グループとしてのRp番号"
* identifier[rpNumber] ^definition = "処方箋内で同一用法の薬剤を慣用的にまとめて、Rpに番号をつけて剤グループとして一括指定されることがある。このスライスでは剤グループに対して割り振られたRp番号を記録する。"
* identifier[rpNumber] ^comment = "剤グループに複数の薬剤が含まれる場合、このグループ内の薬剤には同じRp番号が割り振られる。"
* identifier[rpNumber].system = "urn:oid:1.2.392.100495.20.3.81" (exactly)
* identifier[rpNumber].system ^short = "Rp番号(剤グループ番号)についてのsystem値"
* identifier[rpNumber].system ^definition = "ここで付番されたIDがRp番号であることを明示するためにOIDとして定義された。urn:oid:1.2.392.100495.20.3.81で固定される。"
* identifier[rpNumber].value 1..
* identifier[rpNumber].value ^short = "Rp番号(剤グループ番号)"
* identifier[rpNumber].value ^definition = "Rp番号(剤グループ番号)。\"1\"など。"
* identifier[rpNumber].value ^comment = "value は string型であり、数値はゼロサプレス、つまり、'01'でなく'1'と指定すること。"
* identifier[orderInRp] ^short = "同一RP番号（剤グループ）での薬剤の表記順"
* identifier[orderInRp] ^definition = "同一剤グループでの薬剤を表記する際の順番。XML形式と異なりJSON形式の場合、表記順は項目の順序を意味しない。したがって、薬剤の記載順を別に規定する必要があるためIDを用いて表現する。"
* identifier[orderInRp] ^comment = "同一剤グループ内での薬剤の順番を1から順の番号で示す。"
* identifier[orderInRp].system 1..
* identifier[orderInRp].system ^short = "RP番号内（剤グループ内）の連番を示すsystem値"
* identifier[orderInRp].system ^definition = "剤グループ内番号の名前空間を識別するURI。固定値urn:oid:1.2.392.100495.20.3.82"
* identifier[orderInRp].system = "urn:oid:1.2.392.100495.20.3.82" (exactly)
* identifier[orderInRp].value 1..
* identifier[orderInRp].value ^short = "RP番号内（剤グループ内）の連番"
* identifier[orderInRp].value ^definition = "剤グループ内連番。"
* identifier[orderInRp].value ^comment = "value は string型であり、数値はゼロサプレス、つまり、'01'でなく'1'と指定すること。"
* identifier[requestIdentifier] ^short = "処方オーダに対するID"
* identifier[requestIdentifier] ^definition = "薬剤をオーダする単位としての処方依頼に対するID。MedicationRequestは単一の薬剤でインスタンスが作成される。"
* identifier[requestIdentifier].system = "http://jpfhir.jp/fhir/core/IdSystem/resourceInstance-identifier" (exactly)
* identifier[requestIdentifier].value 1..
* identifier[requestIdentifierCommon] ^short = "処方箋に対するID"
* identifier[requestIdentifierCommon] ^definition = "薬剤をオーダする単位としての処方箋に対するID。MedicationRequestは単一の薬剤でインスタンスが作成されるが、それの集合としての処方箋のID。system 要素には、保険医療機関番号を含む処方箋ID（urn:oid:1.2.392.100495.20.3.11.1[保険医療機関コード(10 桁)]）を指定する。全国で⼀意になる発番ルールにもとづく場合には urn:oid:1.2.392.100495.20.3.11 とする。"
* identifier[requestIdentifierCommon].system = "urn:oid:1.2.392.100495.20.3.11" (exactly)
* identifier[requestIdentifierCommon].value 1..



* status ^short = "オーダの現在の状態を示すコード。" 
* status ^definition = "オーダの現在の状態を示すコード。一般的には active か completed の状態であるだろう。"
* status ^comment = "このエレメントはmodifierとされている。StatusとはこのResourceが現在妥当な状態ではないことも示すからである。"
* status ^isModifierReason = "このエレメントは modifier である。Statusエレメントが entered-in-error という正当な情報として扱うべきではない状態の値も取り得るからである。"
* statusReason ^short = "現在のステータスの理由"
* statusReason ^definition = "現在のステータスの理由"
* statusReason ^comment = "一般的には「保留(suspended)」や「中止(cancelled)」といった例外的状態を示すために持ちいられる。MedicationRequestオーダが発生した理由についてはreasonCodeに記載され、この項目は用いられない。"
* intent ^short = "投薬指示の意図"
* intent ^definition = "投薬指示の意図 が提案(proposal)、計画(plan)、あるいは他の要求によるものかを示す。"
* intent ^comment = "処方をオーダする場合、MedicationRequestのどの段階でオーダしたのかについて、この項目を指定することが期待される。たとえば、proposalであれば患者、関係者、医師あるいは機器からの提案として作成される。\"plan\"であれば、医師、患者、関係者そして機器からの提案として生成される。\"original-order\"は医師にしか作成できない。\r\n\r\ninstance-orderはリクエストあるいはオーダをインスタンス化する段階であり、MedicationAdministrationレコードにも使われる。\r\r\nintentはこのresourceが実際に適応される時に変化するため、このエレメントはmodifierとしてラベルされる。"
* intent ^isModifierReason = "このエレメントは全ての記述的な属性の解釈を変える。たとえば、「リクエストすることが推奨される時間」と「リクエストすることが承認された時間」、あるいは「リクエストすることが推奨される人」と「リクエストすることが承認された人」など"

* category ^short = "薬剤使用区分"
* category ^definition = "このMedicationRequest Resourceが使用される区分を示す。日本では「院外」「院内」「入院」「外来」などの区分を想定する。\r\n一般的には、外来や入院などどこでこの薬剤が投与、内服されるかを想定した区分である。\r\n処方病棟や処方した診療科をOrganization resourceで表現することが冗長である場合にはこの区分が用いられることもある。\r\n\r\nHL7 FHIRではvalue setとして http://terminology.hl7.org/CodeSystem/medicationrequest-category がデフォルトで用いられるが、日本での使用の場合持参薬をカバーする必要があり、JAHIS処方データ規約V3.0Cに記載されているMERIT-9処方オーダ表7とJHSP0007表を組み合わせて持ちいることとする。"
* category ^comment = "薬剤が投与あるいはその他の用途で利用されると想定される場面についての区分である。"
* category ^binding.description = "MedicationRequest Resourceの区分を示すコード化された概念。たとえば、どこで服薬あるいは投与されるか、治療の種別はどうかについて。"
* category from $JP_MedicationCategory_VS (preferred) 

* medication[x] ^short = "What medication was supplied　医薬品"
* medication[x] ^definition = "Identifies the medication that was administered. This is either a link to a resource representing the details of the medication or a simple attribute carrying a code that identifies the medication from a known list of medications.\r\n\r\n投与された薬剤を識別する。既知の薬のリストから薬を識別するコード情報を設定する。"
* medication[x] ^comment = "If only a code is specified, then it needs to be a code for a specific product. If more information is required, then the use of the medication resource is recommended.  For example, if you require form or lot number, then you must reference the Medication resource.\r\n\r\nひとつのtext要素と、複数のcoding 要素を記述できる。処方オーダ時に選択または入力し、実際に処方箋に印字される文字列を必ずtext要素に格納した上で、それをコード化した情報を1個以上のcoding 要素に記述する。\r\n\r\n厚生労働省標準であるHOT9コード（販社指定が不要な場合にはHOT7コード）または広く流通しているYJコードを用いるか、一般名処方の場合には厚生労働省保険局一般名処方マスタのコードを使用して、Coding要素（コードsystemを識別するURI、医薬品のコード、そのコード表における医薬品の名称の3つからなる）で記述する。\r\n\rなお、上記のいずれの標準的コードも付番されていない医薬品や医療材料の場合には、薬機法の下で使用されているGS1標準の識別コードであるGTIN(Global Trade Item Number)の調剤包装単位（最少包装単位、個別包装単位）14桁を使用する。\r\n\rひとつの処方薬、医療材料を複数のコード体系のコードで記述してもよく、その場合にcoding 要素を繰り返して記述する。\rただし、ひとつの処方薬を複数のコードで繰り返し記述する場合には、それらのコードが指し示す処方薬、医療材料は当然同一でなければならない。\rまた、処方を発行した医療機関内でのデータ利用のために、医療機関固有コード体系によるコード（ハウスコード、ローカルコード）の記述を含めてもよいが、その場合でも上述したいずれかの標準コードを同時に記述することが必要である。"
* medication[x] only CodeableConcept

* medicationCodeableConcept from JP_MedicationCode_VS (preferred)
* medicationCodeableConcept ^binding.description = "処方する製剤を表すコード。"

* priority ^short = "オーダの優先度"
* priority ^definition = "このMedicationRequestオーダの優先度。他のオーダと比較して表現される。"
* priority ^comment = "FHIRでは文字列の大きさが1MBを超えてはならない(SHALL NOT)。"
* doNotPerform ^short = "要求が禁止された行為であればTrue"
* doNotPerform ^definition = "このオーダが実施していけないものであればTrueを表示される"
* doNotPerform ^comment = "もし、doNotPerformに指定がなければ、オーダは実施してもよいものである。(たとえば、「実施せよ」)"
* doNotPerform ^isModifierReason = "このエレメントは実施すべきオーダを否定するものであるため、このエレメントはmodifierとされている。（たとえば、この薬剤オーダが不適切なものであったり初歩宇部着物ではない場合)"
* reported[x] ^short = "初期記録にはない報告"
* reported[x] ^definition = "このレコードは元々の一次記録から報告されたものか、二次的に「報告された」資料から取り込まれたものかを示す。報告の情報源についても示される。"
* subject 1..1
* subject only Reference(JP_Patient)
* subject ^short = "処方箋が発行された対象(個人あるいはグループ)"
* subject ^definition = "JP Coreでは患者を表すPatientリソースへの参照。\r\n一般には薬剤が投与される対象となる人（あるいはグループ)を表現するResourceに対するリンク。"
* subject ^comment = "処方オーダの対象は必須項目である。\r\n二次利用のためにどこに実際の対象がいるのかについての情報は提供されない。特定の対象に対して匿名化することも必要である。"
* encounter only Reference(JP_Encounter)
* encounter ^short = "encounter/admission/stay のいずれかとして記録された診察"
* encounter ^definition = "JP Coreでの使用は規定されていない。\r\nこの対象となるリソース[x]が作成される間やこの記録が作成される対象のencounterは密接に関連している。"
* encounter ^comment = "このエレメントは一般的には外来でのイベントに対応するが、診察が公式に終わる前や後にこの診察についてのコンテキストに対応して開始される活動についても対応する。もし、診療のエピソードに関連させる必要があれば、extensionとして扱われることがある。"
* supportingInformation ^short = "薬剤オーダについて補助的情報"
* supportingInformation ^definition = "薬剤をオーダするときに補助的となる追加情報（たとえば、患者の身長や体重））を含む。"
* supportingInformation ^comment = "参照先は実存するFHIR Resourceでなければならず(SHALL)、解決可能(アクセスコントロールや、一時的に利用不可であることなどは許容される)でなければならない(SHALL)。解決の方法はURLから取得可能であるか、Resource型が適応できるかどうか、正規のURLとして絶対的参照を扱うことができるか、ローカルのレジストリ／リポジトリから参照することができるかである。"
* authoredOn 1..
* authoredOn ^short = "この処方オーダが最初に記述された日"
* authoredOn ^definition = "JP Coreでは必須。処方指示が最初に作成された日時。秒の精度まで記録する。タイムゾーンも付与しなければならない。"
* requester only Reference(JP_Practitioner or JP_PractitionerRole or JP_Organization or JP_Patient or RelatedPerson or Device)
* requester ^short = "このオーダを発行した人・物"
* requester ^definition = "JP Coreではこのエレメントに対する規定はない。\r\nこのオーダを発行した責任のある人、組織、機器。"
* requester ^comment = "参照先は実存するFHIR Resourceでなければならず(SHALL)、解決可能(アクセスコントロールや、一時的に利用不可であることなどは許容される)でなければならない(SHALL)。解決の方法はURLから取得可能であるか、Resource型が適応できるかどうか、正規のURLとして絶対的参照を扱うことができるか、ローカルのレジストリ／リポジトリから参照することができるかである。"
* performer only Reference(JP_Practitioner or JP_PractitionerRole or JP_Organization or JP_Patient or Device or RelatedPerson or CareTeam)
* performer ^short = "薬剤投与・管理を行った者"
* performer ^definition = "薬物治療を実施すると予定された者。（たとえば、薬剤投与を行った者）"
* performer ^comment = "参照先は実存するFHIR Resourceでなければならず(SHALL)、解決可能(アクセスコントロールや、一時的に利用不可であることなどは許容される)でなければならない(SHALL)。解決の方法はURLから取得可能であるか、Resource型が適応できるかどうか、正規のURLとして絶対的参照を扱うことができるか、ローカルのレジストリ／リポジトリから参照することができるかである。"
* performerType from JP_PractitionerRole_VS (example)
* performerType ^short = "薬剤投与を行った職種"
* performerType ^definition = "薬剤の投与・管理を行った職種を示す。"
* performerType ^comment = "Performerを示さずにこのエレメントが指定された場合は、このエレメントは薬剤の投与／管理が指定の職種でなければならないと言うことを示している。Performerと共に指定された場合は、もし指定されたPerformerが実施できない場合に薬剤投与・管理を行うものについての要件が示されたことを意味する。"
* recorder only Reference(JP_Practitioner or JP_PractitionerRole)
* recorder ^short = "投薬オーダの入力者"
* recorder ^definition = "JP Coreではこのエレメントに対する規定はない。\r\nたとえば口答指示や電話でのオーダにより、他の人の代理で処方を入力した人。"
* recorder ^comment = "参照先は実存するFHIR Resourceでなければならず(SHALL)、解決可能(アクセスコントロールや、一時的に利用不可であることなどは許容される)でなければならない(SHALL)。解決の方法はURLから取得可能であるか、Resource型が適応できるかどうか、正規のURLとして絶対的参照を扱うことができるか、ローカルのレジストリ／リポジトリから参照することができるかである。"
* reasonCode ^short = "薬を注文するあるいは注文しない理由や適応"
* reasonCode ^definition = "このエレメントに対するJP Coreの規定はない。\r\n薬剤をオーダするあるいはしないことを示した理由。"
* reasonCode ^comment = "このエレメントは病名コードであってもよい。もし、すべての条件を示す記録があって他の詳細な記録が必要であれば、reasonReferenceを使用すること。"
* reasonReference only Reference(JP_Condition or JP_Observation_Common)
* reasonReference ^short = "処方箋が書かれた理由について補足するCondition ResourceまたはObservation Resource"
* reasonReference ^definition = "薬剤がなぜオーダされたのかを説明する条件や観察。"
* reasonReference ^comment = "薬剤オーダの理由を示すこれは条件や観察についての参照である。もし、コードだけであればreasonCodeを使用すること。"
* instantiatesCanonical ^short = "FHIRプロトコルまたは定義のインスタンス"
* instantiatesCanonical ^definition = "このMedicationRequestの一部あるいは全部が遵守するprotocolやguideline, ordersetなど他の定義を示すURL。"
* instantiatesCanonical ^comment = "[Canonical References](references.html#canonical)を参照すること。"
* instantiatesUri ^short = "外部プロトコルまたは定義のインスタンス"
* instantiatesUri ^definition = "このMedicationRequestの一部あるいは全部が遵守するprotocolやguideline, ordersetなど他の定義を示すURL。"
* instantiatesUri ^comment = "以下参照。 http://en.wikipedia.org/wiki/Uniform_resource_identifier"
* basedOn ^short = "オーダが実施される根拠"
* basedOn ^definition = "このMedicationRequestの全部あるいは一部を満たす計画やオーダ。"
* basedOn ^comment = "参照先は実存するFHIR Resourceでなければならず(SHALL)、解決可能(アクセスコントロールや、一時的に利用不可であることなどは許容される)でなければならない(SHALL)。解決の方法はURLから取得可能であるか、Resource型が適応できるかどうか、正規のURLとして絶対的参照を扱うことができるか、ローカルのレジストリ／リポジトリから参照することができるかである。"
* groupIdentifier ^short = "このRequestを一部とする複数のオーダを構成するID"
* groupIdentifier ^definition = "一人の処方者が同時期に前後して作成した全てのリクエストに共通するIDで、処方や薬品請求のIDを示す。"
* groupIdentifier ^requirements = "リクエストは\"basedOn\"での関連付け（たとえば、あるリクエストが他のリクエストを満たす）か、あるいは共通の請求伝票に書かれているを示すことで関連付けられる。同じ請求伝票にあるリクエストは最初に作成されてからは変更や維持などについては独立したものと見なされる。"
* courseOfTherapyType ^short = "薬剤投与の全体的なパターン"
* courseOfTherapyType ^definition = "患者が内服する薬剤についての管理の全体的なパターンについての記載。"
* courseOfTherapyType ^comment = "この属性は薬剤プロトコールと混同してはならない。"
* insurance only Reference(JP_Coverage or ClaimResponse)
* insurance ^short = "適用される保険"
* insurance ^definition = "リクエストされたサービスについて支払いが求め裸得ることになる、保険のプランや適応範囲の拡大、事前の権限付与、かつ/または事前の判定。"
* insurance ^comment = "参照先は実存するFHIR Resourceでなければならず(SHALL)、解決可能(アクセスコントロールや、一時的に利用不可であることなどは許容される)でなければならない(SHALL)。解決の方法はURLから取得可能であるか、Resource型が適応できるかどうか、正規のURLとして絶対的参照を扱うことができるか、ローカルのレジストリ／リポジトリから参照することができるかである。"
* note ^short = "薬剤単位の備考"
* note ^definition = "他の属性では伝えることができなかったMedicationRequestについての付加的情報。"
* note ^comment = "構造化されたアノテーションが内システムでは、作成者や記録時間のない一つのアノテーションで情報を伝達している。このエレメントに情報の修正を要する可能性があるためにナラティブな情報も必要としている。Annotationsには機械処理が可能で修正される（\"modifying\")情報を伝達することに使うべきではない(SHOULD NOT)。これがSHOULDである理由はユーザの行動を強制することはほぼ不可能であるからである。"

* dosageInstruction only JP_MedicationDosage

* dispenseRequest ^short = "調剤・払い出しについての承認事項"
* dispenseRequest ^definition = "薬剤オーダ(MedicationRequest, Medication Prescription, Medication Orderなどとしても表現される）や薬剤オーダとの一部としての薬剤の払い出しあるいは提供。この情報はオーダとしてかならず伝えられるというわけではないことに注意。薬剤部門で調剤・払い出しを完了するための施設（たとえば病院）やシステムでのサポートに関する設定をしてもよい。"
* dispenseRequest.id ^short = "内部エレメントを参照するためのユニークID"
* dispenseRequest.id ^definition = "エレメント間参照のためのユニークID。空白を含まない全ての文字を使ってもよい(MAY)。"
* dispenseRequest.extension ^slicing.discriminator.type = #value
* dispenseRequest.extension ^slicing.discriminator.path = "url"
* dispenseRequest.extension ^slicing.rules = #open
* dispenseRequest.extension contains
    JP_MedicationRequest_DispenseRequest_InstructionForDispense named instructionForDispense ..* and
    JP_MedicationRequest_DispenseRequest_ExpectedRepeatCount named expectedRepeatCount ..1
* dispenseRequest.initialFill ^short = "初回の調剤詳細"
* dispenseRequest.initialFill ^definition = "初回の薬剤払い出しでの期間や量への指示"
* dispenseRequest.initialFill ^comment = "このエレメントを設定するときには量あるいは期間が指定されていなければならない。"
* dispenseRequest.initialFill.quantity only JP_MedicationSimpleQuantity
* dispenseRequest.initialFill.quantity ^short = "初回の調剤量"
* dispenseRequest.initialFill.quantity ^definition = "初回の払い出しとして提供される薬剤の量。"
* dispenseRequest.initialFill.quantity ^comment = "このエレメントはどのような量を表現するか定義するためにコンテキストにあわせてよく定義される。したがって、どのような単位でも利用することができる。使用されるコンテキストによってcomparatorエレメントで値が定義されることもある。"
* dispenseRequest.initialFill.duration ^short = "初回の調剤期間"
* dispenseRequest.initialFill.duration ^definition = "初回に行われる調剤、払い出しで予定される期間"
* dispenseRequest.initialFill.duration ^comment = "このエレメントはどのような量を表現するか定義するためにコンテキストにあわせてよく定義される。したがって、どのような単位でも利用することができる。使用されるコンテキストによってcomparatorエレメントで値が定義されることもある。"
* dispenseRequest.dispenseInterval ^short = "再調剤までの最短期間"
* dispenseRequest.dispenseInterval ^definition = "再調剤、払い出しを行う予定までの最短の期間"
* dispenseRequest.dispenseInterval ^comment = "このエレメントはどのような量を表現するか定義するためにコンテキストにあわせてよく定義される。したがって、どのような単位でも利用することができる。使用されるコンテキストによってcomparatorエレメントで値が定義されることもある。"
* dispenseRequest.validityPeriod ^short = "許可された払い出し期間"
* dispenseRequest.validityPeriod ^definition = "このエレメントは処方の有効期間（処方が失効する日）を示す。"
* dispenseRequest.validityPeriod.start ^short = "境界を含む開始時刻"
* dispenseRequest.validityPeriod.start ^definition = "期間の開始を示す。境界も含まれる。"
* dispenseRequest.validityPeriod.start ^comment = "このエレメントが設定されていなければ、下限が不明であることを示す。"
* dispenseRequest.validityPeriod.end ^short = "継続中でなければ境界を含む終了時刻"
* dispenseRequest.validityPeriod.end ^definition = "期間の終了時刻。もし、期間の終了が示されていなければ、このインスタンスが生成された時点での終了時刻が不明であったか計画されていなかったかである。開始時刻(start)は過去であることもあり、終了時刻(end)は未来であることもあり、その時点での見込みあるいは予定された終了時刻を意味する。"
* dispenseRequest.validityPeriod.end ^comment = "終了時刻は全ての日付・時刻に対応する。たとえば、2012-02-03T10:00:00は2012-02-03を終了時刻(end)の値とする期間を示す。"
* dispenseRequest.numberOfRepeatsAllowed ^short = "許可されたリフィル回数"
* dispenseRequest.numberOfRepeatsAllowed ^definition = "リフィル回数を示す整数である。患者が処方された薬を最初の払い出しから追加で受け取ることができる回数である。使用上の注意：この整数には最初の払い出しが含まれない。オーダが「30錠に加えて3回リフィル可」であれば、このオーダで合計で最大4回、120錠が患者に受け渡される。この数字を0とすることで，処方者がリフィルを許可しないということを明示することができる。"
* dispenseRequest.numberOfRepeatsAllowed ^comment = "許可された払い出し回数は，最大でこの数字に1を足したものである。"
* dispenseRequest.quantity only JP_MedicationSimpleQuantity
* dispenseRequest.quantity ^short = "調剤量"
* dispenseRequest.quantity ^definition = "1回の調剤で払い出される薬剤の量"
* dispenseRequest.quantity ^comment = "このエレメントはどのような量を表現するか定義するためにコンテキストにあわせてよく定義される。したがって、どのような単位でも利用することができる。使用されるコンテキストによってcomparatorエレメントで値が定義されることもある。"
* dispenseRequest.expectedSupplyDuration ^short = "調剤日数"
* dispenseRequest.expectedSupplyDuration ^definition = "供給される製品が使用されるか、あるいは払い出しが想定されている時間を指定する期間。"
* dispenseRequest.expectedSupplyDuration ^comment = "状況によっては、この属性は物理的に供給される量というよりも、想定されている期間に供給される薬剤の量を指定する数量の代わりに使われることもある。たとえば、薬剤が90日間供給される（オーダされた量に基づいて）など。可能であれば、量も示した方がより正確になる。expectedSupplyDurationは外部要因に影響をうけることのある予測値である。"
* dispenseRequest.expectedSupplyDuration.unit = "日" (exactly)
* dispenseRequest.expectedSupplyDuration.system = "http://unitsofmeasure.org" (exactly)
* dispenseRequest.expectedSupplyDuration.code = #d (exactly)
* dispenseRequest.performer only Reference(JP_Organization)
* dispenseRequest.performer ^short = "想定された払い出し薬局"
* dispenseRequest.performer ^definition = "処方者によって指定される調剤・払い出しを行うと想定されているOrganizationを示す。\r\n\r\nIndicates the intended dispensing Organization specified by the prescriber."
* dispenseRequest.performer ^comment = "参照先は実存するFHIR Resourceでなければならず(SHALL)、解決可能(アクセスコントロールや、一時的に利用不可であることなどは許容される)でなければならない(SHALL)。解決の方法はURLから取得可能であるか、Resource型が適応できるかどうか、正規のURLとして絶対的参照を扱うことができるか、ローカルのレジストリ／リポジトリから参照することができるかである。"
* substitution ^short = "後発医薬品への変更可否情報"
* substitution ^definition = "後発医薬品への変更可否情報。代替薬剤を払い出してよいかどうかを示している。代替薬剤を使用しなければいけない場合もあれば、使用しない場合もある。このブロックでは処方者の意図が示される。もし、何も指定されていなければ代替薬品を用いてもよい。"
* substitution.allowed[x] only CodeableConcept
* substitution.allowed[x] from $JP_MedicationSubstitutionNotAllowedReason_VS (preferred)
* substitution.allowed[x] ^short = "後発医薬品への変更可否情報"
* substitution.allowed[x] ^definition = "後発医薬品への変更可否情報。"
* substitution.allowed[x] ^comment = "代替品が許可されるかどうかは無視できないので、このエレメントはmodifierとしてラベルされる。"
* substitution.reason ^short = "代替品を提供した（あるいは、しなかった）理由"
* substitution.reason ^definition = "代替品にしなければならなかった、あるいは代替品が認められなかった理由を示す。"
* substitution.reason ^comment = "代替品の理由を表す一般的パターンに全てのターミノロジが適応しているわけではない。情報モデルはCodeableConceptではなく、直接Codingをを使用してテキストやコーディング、翻訳、そしてエレメントと事前条件、事後条件の関係について管理するためにその構造を提示する必要がある。"
* priorPrescription only Reference(MedicationRequest)
* priorPrescription ^short = "前回のオーダ/処方"
* priorPrescription ^definition = "関連する先行オーダや処方を表現するMedicationRequest Resourceへのリンク。"
* priorPrescription ^comment = "参照先は実存するFHIR Resourceでなければならず(SHALL)、解決可能(アクセスコントロールや、一時的に利用不可であることなどは許容される)でなければならない(SHALL)。解決の方法はURLから取得可能であるか、Resource型が適応できるかどうか、正規のURLとして絶対的参照を扱うことができるか、ローカルのレジストリ／リポジトリから参照することができるかである。"
* detectedIssue ^short = "実施時の臨床的問題"
* detectedIssue ^definition = "患者に対して1回以上の実施されたか提案された診療行為によって、実際に起きたあるいは起きる可能性のある臨床的問題。たとえば、薬剤官相互作用や重複治療、薬剤量についての警告など。DetectedIssueリソースへの参照。"
* detectedIssue ^comment = "このエレメントは意思決定支援システムや臨床医によって指摘された問題点を扱うことができ、問題を表すためのステップについての情報を扱ってもよい。"
* eventHistory ^short = "ライフサイクルで関心のあるイベントのリスト"
* eventHistory ^definition = "このリソースの現在のバージョンをユーザから見て関係していそうなキーとなる更新や状態遷移と識別される過去のバージョンのこのリソースあるいは調剤請求あるいはEvent ResourceについてのProvenance resourceへの参照。"
* eventHistory ^comment = "このエレメントには全てのバージョンのMedicationRequestについてのProvenanceが取り込まれているわけではない。「関連する」あるいは重要と思われたものだけである。現在のバージョンのResourceに関連したProvenance resourceを含めてはならない(SHALL NOT)。（もし、Provenanceとして「関連した」変化と思われれば、後の更新の一部として取り込まれる必要があるだろう。それまでは、このバージョンを_revincludeを使ってprovenanceとして指定して直接クエリーを発行することができる。全てのProvenanceがこのRequestについての履歴を対象として持つべきである。）"



//-------------------------------
// 注射 JP_MedicationRequest_Injection
//-------------------------------
Profile: JP_MedicationRequest_Injection
Parent: MedicationRequest
Id: jp-medicationrequest-injection
Title: "JP Core MedicationRequest Injection Profile"
Description: "このプロファイルはMedicationRequestリソースに対して、注射薬剤処方のデータを送受信するための基礎となる制約と拡張を定めたものである。"
* extension contains JP_MedicationDispense_Preparation named preparation ..*
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationRequest_Injection"
* ^status = #active
* ^date = "2022-10-31"
* . ^short = "患者あるいはグループに対しての注射薬剤処方オーダ"
* . ^definition = "患者への薬の供給と注射や点滴の指示を共に提供するオーダ。ケアプランやワークフローパターンとハーモナイズし、入院や外来でも使えるようにするため、このリソースは\"MedicationPrescription\"や\"MedicationOrder\"ではなく、\"MedicationRequest\"と呼ばれる。MedicationRequestプロファイルからの派生プロファイルである。"
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^short = "外部から参照されるID"
* identifier ^definition = "このインスタンスが外部から参照されるために使われるIDである。処方箋全体としてのIDとしては使用しない。\r\n処方箋内で同一の用法をまとめて表記されるRp番号はこのIdentifier elementの別スライスで表現する。それ以外に任意のIDを付与してもよい。\r\nこのIDは業務手順によって定められた処方オーダに対して、直接的なURL参照が適切でない場合も含めて関連付けるために使われる。この業務手順のIDは実施者によって割り当てられたものであり、リソースが更新されたりサーバからサーバに転送されたとしても固定のものとして存続する。"
* identifier ^comment = "これは業務IDであって、リソースに対するIDではない。"
* identifier contains
    rpNumber 1..1 and
    requestIdentifierCommon 0..1 and
    requestIdentifier 0..*

* identifier[rpNumber] ^short = "処方箋内部の剤グループとしてのRp番号"
* identifier[rpNumber] ^definition = "処方箋内で同一用法の薬剤を慣用的にまとめて、Rpに番号をつけて剤グループとして一括指定されることがある。このスライスでは剤グループに対して割り振られたRp番号を記録する。"
* identifier[rpNumber] ^comment = "剤グループに複数の薬剤が含まれる場合、このグループ内の薬剤には同じRp番号が割り振られる。"
* identifier[rpNumber].system = "urn:oid:1.2.392.100495.20.3.81" (exactly)
* identifier[rpNumber].system ^short = "Rp番号(剤グループ番号)についてのsystem値"
* identifier[rpNumber].system ^definition = "ここで付番されたIDがRp番号であることを明示するためにOIDとして定義された。urn:oid:1.2.392.100495.20.3.81で固定される。"
* identifier[rpNumber].value 1..
* identifier[rpNumber].value ^short = "Rp番号(剤グループ番号)"
* identifier[rpNumber].value ^definition = "Rp番号(剤グループ番号)。\"1\"など。"
* identifier[rpNumber].value ^comment = "value は string型であり、数値はゼロサプレス、つまり、'01'でなく'1'と指定すること。"
* identifier[requestIdentifier] ^short = "処方オーダに対するID"
* identifier[requestIdentifier] ^definition = "薬剤をオーダする単位としての処方依頼に対するID。MedicationRequestは単一の薬剤でインスタンスが作成される。"
* identifier[requestIdentifier].system = "http://jpfhir.jp/fhir/core/IdSystem/resourceInstance-identifier" (exactly)
* identifier[requestIdentifier].value 1..
* identifier[requestIdentifierCommon] ^short = "処方箋に対するID"
* identifier[requestIdentifierCommon] ^definition = "薬剤をオーダする単位としての処方箋に対するID。MedicationRequestは単一の薬剤でインスタンスが作成されるが、それの集合としての処方箋のID。system 要素には、保険医療機関番号を含む処方箋ID（urn:oid:1.2.392.100495.20.3.11.1[保険医療機関コード(10 桁)]）を指定する。全国で⼀意になる発番ルールにもとづく場合には urn:oid:1.2.392.100495.20.3.11 とする。"
* identifier[requestIdentifierCommon].system = "urn:oid:1.2.392.100495.20.3.11" (exactly)
* identifier[requestIdentifierCommon].value 1..

* status ^short = "オーダの現在の状態を示すコード。" 
* status ^definition = "オーダの現在の状態を示すコード。一般的には active か completed の状態であるだろう。"
* status ^comment = "このエレメントはmodifierとされている。StatusとはこのResourceが現在妥当な状態ではないことも示すからである。"
* status ^isModifierReason = "このエレメントは modifier である。Statusエレメントが entered-in-error という正当な情報として扱うべきではない状態の値も取り得るからである。"
* statusReason ^short = "現在のステータスの理由"
* statusReason ^definition = "現在のステータスの理由"
* statusReason ^comment = "一般的には「保留(suspended)」や「中止(cancelled)」といった例外的状態を示すために持ちいられる。MedicationRequestオーダが発生した理由についてはreasonCodeに記載され、この項目は用いられない。"
* intent ^short = "投薬指示の意図"
* intent ^definition = "投薬指示の意図 が提案(proposal)、計画(plan)、あるいは他の要求によるものかを示す。"
* intent ^comment = "処方をオーダする場合、MedicationRequestのどの段階でオーダしたのかについて、この項目を指定することが期待される。たとえば、proposalであれば患者、関係者、医師あるいは機器からの提案として作成される。\"plan\"であれば、医師、患者、関係者そして機器からの提案として生成される。\"original-order\"は医師にしか作成できない。\r\n\r\ninstance-orderはリクエストあるいはオーダをインスタンス化する段階であり、MedicationAdministrationレコードにも使われる。\r\r\nintentはこのresourceが実際に適応される時に変化するため、このエレメントはmodifierとしてラベルされる。"
* intent ^isModifierReason = "このエレメントは全ての記述的な属性の解釈を変える。たとえば、「リクエストすることが推奨される時間」と「リクエストすることが承認された時間」、あるいは「リクエストすることが推奨される人」と「リクエストすることが承認された人」など"

* category ^short = "薬剤使用区分"
* category ^definition = "このMedicationRequest Resourceが使用される区分を示す。日本では「院外」「院内」「入院」「外来」などの区分を想定する。\r\n一般的には、外来や入院などどこでこの薬剤が投与、内服されるかを想定した区分である。\r\n処方病棟や処方した診療科をOrganization resourceで表現することが冗長である場合にはこの区分が用いられることもある。\r\n\r\nHL7 FHIRではvalue setとして http://terminology.hl7.org/CodeSystem/medicationrequest-category がデフォルトで用いられるが、日本での使用の場合持参薬をカバーする必要があり、JAHIS処方データ規約V3.0Cに記載されているMERIT-9処方オーダ表7とJHSP0007表を組み合わせて持ちいることとする。"
* category ^comment = "薬剤が投与あるいはその他の用途で利用されると想定される場面についての区分である。"
* category ^binding.description = "MedicationRequest Resourceの区分を示すコード化された概念。たとえば、どこで服薬あるいは投与されるか、治療の種別はどうかについて。"
* category from $JP_MedicationCategoryInjection_VS (preferred)

* medication[x] ^short = "What medication was supplied　医薬品"
* medication[x] ^definition = "Identifies the medication that was administered. This is either a link to a resource representing the details of the medication or a simple attribute carrying a code that identifies the medication from a known list of medications.\r\n\r\n投与された薬剤を識別する。既知の薬のリストから薬を識別するコード情報を設定する。"
* medication[x] ^comment = "If only a code is specified, then it needs to be a code for a specific product. If more information is required, then the use of the medication resource is recommended.  For example, if you require form or lot number, then you must reference the Medication resource.\r\n\r\nひとつのtext要素と、複数のcoding 要素を記述できる。処方オーダ時に選択または入力し、実際に処方箋に印字される文字列を必ずtext要素に格納した上で、それをコード化した情報を1個以上のcoding 要素に記述する。\r\n\r\n厚生労働省標準であるHOT9コード（販社指定が不要な場合にはHOT7コード）または広く流通しているYJコードを用いるか、一般名処方の場合には厚生労働省保険局一般名処方マスタのコードを使用して、Coding要素（コードsystemを識別するURI、医薬品のコード、そのコード表における医薬品の名称の3つからなる）で記述する。\r\n\rなお、上記のいずれの標準的コードも付番されていない医薬品や医療材料の場合には、薬機法の下で使用されているGS1標準の識別コードであるGTIN(Global Trade Item Number)の調剤包装単位（最少包装単位、個別包装単位）14桁を使用する。\r\n\rひとつの処方薬、医療材料を複数のコード体系のコードで記述してもよく、その場合にcoding 要素を繰り返して記述する。\rただし、ひとつの処方薬を複数のコードで繰り返し記述する場合には、それらのコードが指し示す処方薬、医療材料は当然同一でなければならない。\rまた、処方を発行した医療機関内でのデータ利用のために、医療機関固有コード体系によるコード（ハウスコード、ローカルコード）の記述を含めてもよいが、その場合でも上述したいずれかの標準コードを同時に記述することが必要である。"
* medication[x] only Reference(Medication)

* medicationReference only Reference(JP_Medication)

* priority ^short = "オーダの優先度"
* priority ^definition = "このMedicationRequestオーダの優先度。他のオーダと比較して表現される。"
* priority ^comment = "FHIRでは文字列の大きさが1MBを超えてはならない(SHALL NOT)。"
* doNotPerform ^short = "要求が禁止された行為であればTrue"
* doNotPerform ^definition = "このオーダが実施していけないものであればTrueを表示される"
* doNotPerform ^comment = "もし、doNotPerformに指定がなければ、オーダは実施してもよいものである。(たとえば、「実施せよ」)"
* doNotPerform ^isModifierReason = "このエレメントは実施すべきオーダを否定するものであるため、このエレメントはmodifierとされている。（たとえば、この薬剤オーダが不適切なものであったり初歩宇部着物ではない場合)"
* reported[x] ^short = "初期記録にはない報告"
* reported[x] ^definition = "このレコードは元々の一次記録から報告されたものか、二次的に「報告された」資料から取り込まれたものかを示す。報告の情報源についても示される。"
* subject 1..1
* subject only Reference(JP_Patient)
* subject ^short = "処方箋が発行された対象(個人あるいはグループ)"
* subject ^definition = "JP Coreでは患者を表すPatientリソースへの参照。\r\n一般には薬剤が投与される対象となる人（あるいはグループ)を表現するResourceに対するリンク。"
* subject ^comment = "処方オーダの対象は必須項目である。\r\n二次利用のためにどこに実際の対象がいるのかについての情報は提供されない。特定の対象に対して匿名化することも必要である。"
* encounter only Reference(JP_Encounter)
* encounter ^short = "encounter/admission/stay のいずれかとして記録された診察"
* encounter ^definition = "JP Coreでの使用は規定されていない。\r\nこの対象となるリソース[x]が作成される間やこの記録が作成される対象のencounterは密接に関連している。"
* encounter ^comment = "このエレメントは一般的には外来でのイベントに対応するが、診察が公式に終わる前や後にこの診察についてのコンテキストに対応して開始される活動についても対応する。もし、診療のエピソードに関連させる必要があれば、extensionとして扱われることがある。"
* supportingInformation ^short = "薬剤オーダについて補助的情報"
* supportingInformation ^definition = "薬剤をオーダするときに補助的となる追加情報（たとえば、患者の身長や体重））を含む。"
* supportingInformation ^comment = "参照先は実存するFHIR Resourceでなければならず(SHALL)、解決可能(アクセスコントロールや、一時的に利用不可であることなどは許容される)でなければならない(SHALL)。解決の方法はURLから取得可能であるか、Resource型が適応できるかどうか、正規のURLとして絶対的参照を扱うことができるか、ローカルのレジストリ／リポジトリから参照することができるかである。"
* authoredOn 1..
* authoredOn ^short = "この処方オーダが最初に記述された日"
* authoredOn ^definition = "JP Coreでは必須。処方指示が最初に作成された日時。秒の精度まで記録する。タイムゾーンも付与しなければならない。"
* requester only Reference(JP_Practitioner or JP_PractitionerRole or JP_Organization or JP_Patient or RelatedPerson or Device)
* requester ^short = "このオーダを発行した人・物"
* requester ^definition = "JP Coreではこのエレメントに対する規定はない。\r\nこのオーダを発行した責任のある人、組織、機器。"
* requester ^comment = "参照先は実存するFHIR Resourceでなければならず(SHALL)、解決可能(アクセスコントロールや、一時的に利用不可であることなどは許容される)でなければならない(SHALL)。解決の方法はURLから取得可能であるか、Resource型が適応できるかどうか、正規のURLとして絶対的参照を扱うことができるか、ローカルのレジストリ／リポジトリから参照することができるかである。"
* performer only Reference(JP_Practitioner or JP_PractitionerRole or JP_Organization or JP_Patient or Device or RelatedPerson or CareTeam)
* performer ^short = "薬剤投与・管理を行った者"
* performer ^definition = "薬物治療を実施すると予定された者。（たとえば、薬剤投与を行った者）"
* performer ^comment = "参照先は実存するFHIR Resourceでなければならず(SHALL)、解決可能(アクセスコントロールや、一時的に利用不可であることなどは許容される)でなければならない(SHALL)。解決の方法はURLから取得可能であるか、Resource型が適応できるかどうか、正規のURLとして絶対的参照を扱うことができるか、ローカルのレジストリ／リポジトリから参照することができるかである。"
* performerType from JP_PractitionerRole_VS (example)
* performerType ^short = "薬剤投与を行った職種"
* performerType ^definition = "薬剤の投与・管理を行った職種を示す。"
* performerType ^comment = "Performerを示さずにこのエレメントが指定された場合は、このエレメントは薬剤の投与／管理が指定の職種でなければならないと言うことを示している。Performerと共に指定された場合は、もし指定されたPerformerが実施できない場合に薬剤投与・管理を行うものについての要件が示されたことを意味する。"
* recorder only Reference(JP_Practitioner or JP_PractitionerRole)
* recorder ^short = "投薬オーダの入力者"
* recorder ^definition = "JP Coreではこのエレメントに対する規定はない。\r\nたとえば口答指示や電話でのオーダにより、他の人の代理で処方を入力した人。"
* recorder ^comment = "参照先は実存するFHIR Resourceでなければならず(SHALL)、解決可能(アクセスコントロールや、一時的に利用不可であることなどは許容される)でなければならない(SHALL)。解決の方法はURLから取得可能であるか、Resource型が適応できるかどうか、正規のURLとして絶対的参照を扱うことができるか、ローカルのレジストリ／リポジトリから参照することができるかである。"
* reasonCode ^short = "薬を注文するあるいは注文しない理由や適応"
* reasonCode ^definition = "このエレメントに対するJP Coreの規定はない。\r\n薬剤をオーダするあるいはしないことを示した理由。"
* reasonCode ^comment = "このエレメントは病名コードであってもよい。もし、すべての条件を示す記録があって他の詳細な記録が必要であれば、reasonReferenceを使用すること。"
* reasonReference only Reference(JP_Condition or JP_Observation_Common)
* reasonReference ^short = "処方箋が書かれた理由について補足するCondition ResourceまたはObservation Resource"
* reasonReference ^definition = "薬剤がなぜオーダされたのかを説明する条件や観察。"
* reasonReference ^comment = "薬剤オーダの理由を示すこれは条件や観察についての参照である。もし、コードだけであればreasonCodeを使用すること。"
* instantiatesCanonical ^short = "FHIRプロトコルまたは定義のインスタンス"
* instantiatesCanonical ^definition = "このMedicationRequestの一部あるいは全部が遵守するprotocolやguideline, ordersetなど他の定義を示すURL。"
* instantiatesCanonical ^comment = "[Canonical References](references.html#canonical)を参照すること。"
* instantiatesUri ^short = "外部プロトコルまたは定義のインスタンス"
* instantiatesUri ^definition = "このMedicationRequestの一部あるいは全部が遵守するprotocolやguideline, ordersetなど他の定義を示すURL。"
* instantiatesUri ^comment = "以下参照。 http://en.wikipedia.org/wiki/Uniform_resource_identifier"
* basedOn ^short = "オーダが実施される根拠"
* basedOn ^definition = "このMedicationRequestの全部あるいは一部を満たす計画やオーダ。"
* basedOn ^comment = "参照先は実存するFHIR Resourceでなければならず(SHALL)、解決可能(アクセスコントロールや、一時的に利用不可であることなどは許容される)でなければならない(SHALL)。解決の方法はURLから取得可能であるか、Resource型が適応できるかどうか、正規のURLとして絶対的参照を扱うことができるか、ローカルのレジストリ／リポジトリから参照することができるかである。"
* groupIdentifier ^short = "このRequestを一部とする複数のオーダを構成するID"
* groupIdentifier ^definition = "一人の処方者が同時期に前後して作成した全てのリクエストに共通するIDで、処方や薬品請求のIDを示す。"
* groupIdentifier ^requirements = "リクエストは\"basedOn\"での関連付け（たとえば、あるリクエストが他のリクエストを満たす）か、あるいは共通の請求伝票に書かれているを示すことで関連付けられる。同じ請求伝票にあるリクエストは最初に作成されてからは変更や維持などについては独立したものと見なされる。"
* courseOfTherapyType ^short = "薬剤投与の全体的なパターン"
* courseOfTherapyType ^definition = "患者が内服する薬剤についての管理の全体的なパターンについての記載。"
* courseOfTherapyType ^comment = "この属性は薬剤プロトコールと混同してはならない。"
* insurance only Reference(JP_Coverage or ClaimResponse)
* insurance ^short = "適用される保険"
* insurance ^definition = "リクエストされたサービスについて支払いが求め裸得ることになる、保険のプランや適応範囲の拡大、事前の権限付与、かつ/または事前の判定。"
* insurance ^comment = "参照先は実存するFHIR Resourceでなければならず(SHALL)、解決可能(アクセスコントロールや、一時的に利用不可であることなどは許容される)でなければならない(SHALL)。解決の方法はURLから取得可能であるか、Resource型が適応できるかどうか、正規のURLとして絶対的参照を扱うことができるか、ローカルのレジストリ／リポジトリから参照することができるかである。"
* note ^short = "薬剤単位の備考"
* note ^definition = "他の属性では伝えることができなかったMedicationRequestについての付加的情報。"
* note ^comment = "構造化されたアノテーションが内システムでは、作成者や記録時間のない一つのアノテーションで情報を伝達している。このエレメントに情報の修正を要する可能性があるためにナラティブな情報も必要としている。Annotationsには機械処理が可能で修正される（\"modifying\")情報を伝達することに使うべきではない(SHOULD NOT)。これがSHOULDである理由はユーザの行動を強制することはほぼ不可能であるからである。"

* dosageInstruction only JP_MedicationDosage_Injection

* dispenseRequest ^short = "調剤・払い出しについての承認事項"
* dispenseRequest ^definition = "薬剤オーダ(MedicationRequest, Medication Prescription, Medication Orderなどとしても表現される）や薬剤オーダとの一部としての薬剤の払い出しあるいは提供。この情報はオーダとしてかならず伝えられるというわけではないことに注意。薬剤部門で調剤・払い出しを完了するための施設（たとえば病院）やシステムでのサポートに関する設定をしてもよい。"
* dispenseRequest.id ^short = "内部エレメントを参照するためのユニークID"
* dispenseRequest.id ^definition = "エレメント間参照のためのユニークID。空白を含まない全ての文字を使ってもよい(MAY)。"
* dispenseRequest.extension ^slicing.discriminator.type = #value
* dispenseRequest.extension ^slicing.discriminator.path = "url"
* dispenseRequest.extension ^slicing.rules = #open
* dispenseRequest.extension contains
    JP_MedicationRequest_DispenseRequest_InstructionForDispense named instructionForDispense ..* and
    JP_MedicationRequest_DispenseRequest_ExpectedRepeatCount named expectedRepeatCount ..1
* dispenseRequest.initialFill ^short = "初回の調剤詳細"
* dispenseRequest.initialFill ^definition = "初回の薬剤払い出しでの期間や量への指示"
* dispenseRequest.initialFill ^comment = "このエレメントを設定するときには量あるいは期間が指定されていなければならない。"
* dispenseRequest.initialFill.quantity only JP_MedicationSimpleQuantity
* dispenseRequest.initialFill.quantity ^short = "初回の調剤量"
* dispenseRequest.initialFill.quantity ^definition = "初回の払い出しとして提供される薬剤の量。"
* dispenseRequest.initialFill.quantity ^comment = "このエレメントはどのような量を表現するか定義するためにコンテキストにあわせてよく定義される。したがって、どのような単位でも利用することができる。使用されるコンテキストによってcomparatorエレメントで値が定義されることもある。"
* dispenseRequest.initialFill.duration ^short = "初回の調剤期間"
* dispenseRequest.initialFill.duration ^definition = "初回に行われる調剤、払い出しで予定される期間"
* dispenseRequest.initialFill.duration ^comment = "このエレメントはどのような量を表現するか定義するためにコンテキストにあわせてよく定義される。したがって、どのような単位でも利用することができる。使用されるコンテキストによってcomparatorエレメントで値が定義されることもある。"
* dispenseRequest.dispenseInterval ^short = "再調剤までの最短期間"
* dispenseRequest.dispenseInterval ^definition = "再調剤、払い出しを行う予定までの最短の期間"
* dispenseRequest.dispenseInterval ^comment = "このエレメントはどのような量を表現するか定義するためにコンテキストにあわせてよく定義される。したがって、どのような単位でも利用することができる。使用されるコンテキストによってcomparatorエレメントで値が定義されることもある。"
* dispenseRequest.validityPeriod ^short = "許可された払い出し期間"
* dispenseRequest.validityPeriod ^definition = "このエレメントは処方の有効期間（処方が失効する日）を示す。"
* dispenseRequest.validityPeriod.start ^short = "境界を含む開始時刻"
* dispenseRequest.validityPeriod.start ^definition = "期間の開始を示す。境界も含まれる。"
* dispenseRequest.validityPeriod.start ^comment = "このエレメントが設定されていなければ、下限が不明であることを示す。"
* dispenseRequest.validityPeriod.end ^short = "継続中でなければ境界を含む終了時刻"
* dispenseRequest.validityPeriod.end ^definition = "期間の終了時刻。もし、期間の終了が示されていなければ、このインスタンスが生成された時点での終了時刻が不明であったか計画されていなかったかである。開始時刻(start)は過去であることもあり、終了時刻(end)は未来であることもあり、その時点での見込みあるいは予定された終了時刻を意味する。"
* dispenseRequest.validityPeriod.end ^comment = "終了時刻は全ての日付・時刻に対応する。たとえば、2012-02-03T10:00:00は2012-02-03を終了時刻(end)の値とする期間を示す。"
* dispenseRequest.numberOfRepeatsAllowed ^short = "許可されたリフィル回数"
* dispenseRequest.numberOfRepeatsAllowed ^definition = "リフィル回数を示す整数である。患者が処方された薬を最初の払い出しから追加で受け取ることができる回数である。使用上の注意：この整数には最初の払い出しが含まれない。オーダが「30錠に加えて3回リフィル可」であれば、このオーダで合計で最大4回、120錠が患者に受け渡される。この数字を0とすることで，処方者がリフィルを許可しないということを明示することができる。"
* dispenseRequest.numberOfRepeatsAllowed ^comment = "許可された払い出し回数は，最大でこの数字に1を足したものである。"
* dispenseRequest.quantity only JP_MedicationSimpleQuantity
* dispenseRequest.quantity ^short = "調剤量"
* dispenseRequest.quantity ^definition = "1回の調剤で払い出される薬剤の量"
* dispenseRequest.quantity ^comment = "このエレメントはどのような量を表現するか定義するためにコンテキストにあわせてよく定義される。したがって、どのような単位でも利用することができる。使用されるコンテキストによってcomparatorエレメントで値が定義されることもある。"
* dispenseRequest.expectedSupplyDuration ^short = "調剤日数"
* dispenseRequest.expectedSupplyDuration ^definition = "供給される製品が使用されるか、あるいは払い出しが想定されている時間を指定する期間。"
* dispenseRequest.expectedSupplyDuration ^comment = "状況によっては、この属性は物理的に供給される量というよりも、想定されている期間に供給される薬剤の量を指定する数量の代わりに使われることもある。たとえば、薬剤が90日間供給される（オーダされた量に基づいて）など。可能であれば、量も示した方がより正確になる。expectedSupplyDurationは外部要因に影響をうけることのある予測値である。"
* dispenseRequest.expectedSupplyDuration.unit = "日" (exactly)
* dispenseRequest.expectedSupplyDuration.system = "http://unitsofmeasure.org" (exactly)
* dispenseRequest.expectedSupplyDuration.code = #d (exactly)
* dispenseRequest.performer only Reference(JP_Organization)
* dispenseRequest.performer ^short = "想定された払い出し薬局"
* dispenseRequest.performer ^definition = "処方者によって指定される調剤・払い出しを行うと想定されているOrganizationを示す。\r\n\r\nIndicates the intended dispensing Organization specified by the prescriber."
* dispenseRequest.performer ^comment = "参照先は実存するFHIR Resourceでなければならず(SHALL)、解決可能(アクセスコントロールや、一時的に利用不可であることなどは許容される)でなければならない(SHALL)。解決の方法はURLから取得可能であるか、Resource型が適応できるかどうか、正規のURLとして絶対的参照を扱うことができるか、ローカルのレジストリ／リポジトリから参照することができるかである。"
* substitution ^short = "後発医薬品への変更可否情報"
* substitution ^definition = "後発医薬品への変更可否情報。代替薬剤を払い出してよいかどうかを示している。代替薬剤を使用しなければいけない場合もあれば、使用しない場合もある。このブロックでは処方者の意図が示される。もし、何も指定されていなければ代替薬品を用いてもよい。"
* substitution.allowed[x] only CodeableConcept
* substitution.allowed[x] from $JP_MedicationSubstitutionNotAllowedReason_VS (preferred)
* substitution.allowed[x] ^short = "後発医薬品への変更可否情報"
* substitution.allowed[x] ^definition = "後発医薬品への変更可否情報。"
* substitution.allowed[x] ^comment = "代替品が許可されるかどうかは無視できないので、このエレメントはmodifierとしてラベルされる。"
* substitution.reason ^short = "代替品を提供した（あるいは、しなかった）理由"
* substitution.reason ^definition = "代替品にしなければならなかった、あるいは代替品が認められなかった理由を示す。"
* substitution.reason ^comment = "代替品の理由を表す一般的パターンに全てのターミノロジが適応しているわけではない。情報モデルはCodeableConceptではなく、直接Codingをを使用してテキストやコーディング、翻訳、そしてエレメントと事前条件、事後条件の関係について管理するためにその構造を提示する必要がある。"
* priorPrescription only Reference(MedicationRequest)
* priorPrescription ^short = "前回のオーダ/処方"
* priorPrescription ^definition = "関連する先行オーダや処方を表現するMedicationRequest Resourceへのリンク。"
* priorPrescription ^comment = "参照先は実存するFHIR Resourceでなければならず(SHALL)、解決可能(アクセスコントロールや、一時的に利用不可であることなどは許容される)でなければならない(SHALL)。解決の方法はURLから取得可能であるか、Resource型が適応できるかどうか、正規のURLとして絶対的参照を扱うことができるか、ローカルのレジストリ／リポジトリから参照することができるかである。"
* detectedIssue ^short = "実施時の臨床的問題"
* detectedIssue ^definition = "患者に対して1回以上の実施されたか提案された診療行為によって、実際に起きたあるいは起きる可能性のある臨床的問題。たとえば、薬剤官相互作用や重複治療、薬剤量についての警告など。DetectedIssueリソースへの参照。"
* detectedIssue ^comment = "このエレメントは意思決定支援システムや臨床医によって指摘された問題点を扱うことができ、問題を表すためのステップについての情報を扱ってもよい。"
* eventHistory ^short = "ライフサイクルで関心のあるイベントのリスト"
* eventHistory ^definition = "このリソースの現在のバージョンをユーザから見て関係していそうなキーとなる更新や状態遷移と識別される過去のバージョンのこのリソースあるいは調剤請求あるいはEvent ResourceについてのProvenance resourceへの参照。"
* eventHistory ^comment = "このエレメントには全てのバージョンのMedicationRequestについてのProvenanceが取り込まれているわけではない。「関連する」あるいは重要と思われたものだけである。現在のバージョンのResourceに関連したProvenance resourceを含めてはならない(SHALL NOT)。（もし、Provenanceとして「関連した」変化と思われれば、後の更新の一部として取り込まれる必要があるだろう。それまでは、このバージョンを_revincludeを使ってprovenanceとして指定して直接クエリーを発行することができる。全てのProvenanceがこのRequestについての履歴を対象として持つべきである。）"



// ==============================
//   Extension 定義
// ==============================

//-------------------------------
// JP_MedicationRequest_DispenseRequest_ExpectedRepeatCount
//-------------------------------
Extension: JP_MedicationRequest_DispenseRequest_ExpectedRepeatCount
Id: jp-medicationrequest-dispenserequest-expectedrepeatcount
Title: "JP Core MedicationRequest DispenseRequest ExpectedRepeatCount Extension"
Description: "頓用回数"
* ^url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DispenseRequest_ExpectedRepeatCount"
* ^status = #active
* ^date = "2022-10-24"
* ^purpose = "頓用の場合など調剤量を錠数ではなく回数で表現したい場合の回数を格納する拡張"
* ^context.type = #element
* ^context.expression = "MedicationRequest.dispenseRequest"
* . ^short = "頓用回数"
* . ^definition = "頓用回数を表現する拡張"
* url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DispenseRequest_ExpectedRepeatCount" (exactly)
* value[x] 1..
* value[x] only integer
* value[x] ^short = "頓用回数"
* value[x] ^definition = "頓用回数"

//-------------------------------
// JP_MedicationRequest_DispenseRequest_ExpectedRepeatCount
//-------------------------------
Extension: JP_MedicationRequest_DispenseRequest_InstructionForDispense
Id: jp-medicationrequest-dispenserequest-instructionfordispense
Title: "JP Core MedicationRequest DispenseRequest InstructionForDispense Extension"
Description: "調剤指示。薬剤単位の調剤指示を表現するための拡張"
* ^url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DispenseRequest_InstructionForDispense"
* ^status = #active
* ^date = "2022-10-24"
* ^context.type = #element
* ^context.expression = "MedicationRequest.dispenseRequest"
* . ^short = "調剤指示"
* . ^definition = "薬剤単位の調剤指示を格納する"
* url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DispenseRequest_InstructionForDispense" (exactly)
* value[x] only CodeableConcept
* value[x] ^short = "調剤指示"
* value[x] ^definition = "薬剤単位の調剤・払い出し指示"
* valueCodeableConcept.coding from $JP_MedicationInstructionForDispenseJHSP0002_VS (preferred)

