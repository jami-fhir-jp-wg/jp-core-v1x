// ==============================
//   Profile 定義
// ==============================
Profile: JP_MedicationRequestBase
Parent: MedicationRequest
Id: jp-medicationrequestbase
Title: "JP Core MedicationRequestBase Profile"
Description: "このプロファイルはユーザは直接適用するものではなく、JP_MedicationRequestとJP_MedicationRequestInjectionの共通の親となる抽象プロファイルである。MedicationRequestリソースに対して、内服・外用薬剤処方、注射・点滴などのデータを送受信するため、JP_MedicationRequestとJP_MedicationRequestInjectionの各プロファイルの基礎となる制約と拡張のうち共通部分を定めている。"
* extension contains JP_MedicationDispense_Preparation named preparation ..*
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationRequestBase"
* ^status = #draft
* ^date = "2022-03-16"
* . ^short = "患者あるいはグループに対しての薬剤処方オーダ"
* . ^definition = "患者への薬の供給と内服指示を共に提供するオーダ。ケアプランやワークフローパターンとハーモナイズし、入院や外来でも使えるようにするため、このリソースは\"MedicationPrescription\"や\"MedicationOrder\"ではなく、\"MedicationRequest\"と呼ばれる。"
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^short = "外部から参照されるID"
* identifier ^definition = "このインスタンスが外部から参照されるために使われるIDである。処方箋全体としてのIDとしては使用しない。\r\n処方箋内で同一の用法をまとめて表記されるRp番号はこのIdentifier elementの別スライスで表現する。それ以外に任意のIDを付与してもよい。\r\nこのIDは業務手順によって定められた処方オーダーに対して、直接的なURL参照が適切でない場合も含めて関連付けるために使われる。この業務手順のIDは実施者によって割り当てられたものであり、リソースが更新されたりサーバからサーバに転送されたとしても固定のものとして存続する。"
* identifier ^comment = "これは業務IDであって、リソースに対するIDではない。"
* identifier contains
    rpNumber 1..1 and
    requestIdentifier ..*
* identifier[rpNumber] ^short = "処方箋内部の剤グループとしてのRp番号"
* identifier[rpNumber] ^definition = "処方箋内で同一用法の薬剤を慣用的にまとめて、Rpに番号をつけて剤グループとして一括指定されることがある。このスライスでは剤グループに対して割り振られたRp番号を記録する。"
* identifier[rpNumber] ^comment = "剤グループに複数の薬剤が含まれる場合、このグループ内の薬剤には同じRp番号が割り振られる。"
* identifier[rpNumber].use ..0
* identifier[rpNumber].type ..0
* identifier[rpNumber].system 1..
* identifier[rpNumber].system = "urn:oid:1.2.392.100495.20.3.81" (exactly)
* identifier[rpNumber].system ^short = "Rp番号(剤グループ番号)についてのsystem値"
* identifier[rpNumber].system ^definition = "ここで付番されたIDがRp番号であることを明示するためにOIDとして定義された。urn:oid:1.2.392.100495.20.3.81で固定される。"
* identifier[rpNumber].value 1..
* identifier[rpNumber].value ^short = "Rp番号(剤グループ番号)"
* identifier[rpNumber].value ^definition = "Rp番号(剤グループ番号)。\"1\"など。"
* identifier[rpNumber].value ^comment = "value は string型であり、数値はゼロサプレス、つまり、'01'でなく'1'と指定すること。"
* identifier[rpNumber].period ..0
* identifier[rpNumber].assigner ..0
* identifier[requestIdentifier] ^short = "処方オーダーに対するID"
* identifier[requestIdentifier] ^definition = "薬剤をオーダーする単位としての処方箋に対するID。MedicationRequestは単一の薬剤でインスタンスが作成されるが、それの集合としての処方箋のID。"
* identifier[requestIdentifier].system 1..
* identifier[requestIdentifier].system = "http://jpfhir.jp/fhir/Common/IdSystem/resourceInstance-identifier" (exactly)
* status ^definition = "JP Coreでは\"active\"に固定される。\r\nオーダーの現在の状態を示すコード。一般的には active か completed の状態であるだろう。"
* status ^comment = "このエレメントはmodifierとされている。StatusとはこのResourceが現在妥当な状態ではないことも示すからである。"
* status ^isModifierReason = "このエレメントは modifier である。Statusエレメントが entered-in-error という正当な情報として扱うべきではない状態の値も取り得るからである。"
* statusReason ^short = "現状の理由"
* statusReason ^definition = "現在のステータスの理由"
* statusReason ^comment = "一般的には「保留(suspended)」や「中止(cancelled)」といった例外的状態を示すために持ちいられる。MedicationRequestオーダーが発生した理由についてはreasonCodeに記載され、この項目は用いられない。"
* intent = #order (exactly)
* intent ^definition = "JP Coreでは \"order\" に固定される。\r\n投薬リクエストの意図 が提案(proposal)、計画(plan)、あるいは他の要求によるものかを示す。"
* intent ^comment = "処方をオーダーする場合、MedicationRequestのどの段階でオーダーしたのかについて、この項目を指定することが期待される。たとえば、proposalであれば患者、関係者、医師あるいは機器からの提案として作成される。\"plan\"であれば、医師、患者、関係者そして機器からの提案として生成される。\"original-order\"は医師にしか作成できない。\r\n\r\ninstance-orderはリクエストあるいはオーダーをインスタンス化する段階であり、MedicationAdministrationレコードにも使われる。\r\r\nintentはこのresourceが実際に適応される時に変化するため、このエレメントはmodifierとしてラベルされる。"
* intent ^isModifierReason = "このエレメントは全ての記述的な属性の解釈を変える。たとえば、「リクエストすることが推奨される時間」と「リクエストすることが承認された時間」、あるいは「リクエストすることが推奨される人」と「リクエストすることが承認された人」など"
* category ^short = "薬剤使用区分"
* category ^definition = "このMedicationRequest Resourceが使用される区分を示す。日本では「院外」「院内」「入院」「外来」などの区分を想定する。\r\n一般的には、外来や入院などどこでこの薬剤が投与、内服されるかを想定した区分である。\r\n処方病棟や処方した診療科をOrganization resourceで表現することが冗長である場合にはこの区分が用いられることもある。\r\n\r\nHL7 FHIRではvalue setとして http://terminology.hl7.org/CodeSystem/medicationrequest-category がデフォルトで用いられるが、日本での使用の場合持参薬をカバーする必要があり、JAHIS処方データ規約V3.0Cに記載されているMERIT-9処方オーダ表7とJHSP0007表を組み合わせて持ちいることとする。"
* category ^comment = "薬剤が投与あるいはその他の用途で利用されると想定される場面についての区分である。"
* category ^binding.strength = #example
* category ^binding.description = "MedicationRequest Resourceの区分を示すコード化された概念。たとえば、どこで服薬あるいは投与されるか、治療の種別はどうかについて。"
* priority ^definition = "このMedicationRequestオーダーの優先度。他のオーダーと比較して表現される。"
* priority ^comment = "FHIRでは文字列の大きさが1MBを超えてはならない(SHALL NOT)。"
* doNotPerform ^short = "要求が禁止された行為であればTrue"
* doNotPerform ^definition = "このオーダーが実施していけないものであればTrueを表示される"
* doNotPerform ^comment = "もし、doNotPerformに指定がなければ、オーダーは実施してもよいものである。(たとえば、「実施せよ」)"
* doNotPerform ^isModifierReason = "このエレメントは実施すべきオーダーを否定するものであるため、このエレメントはmodifierとされている。（たとえば、この薬剤オーダーが不適切なものであったり初歩宇部着物ではない場合)"
* reported[x] ^short = "初期記録にはない報告"
* reported[x] ^definition = "このレコードは元々の一次記録から報告されたものか、二次的に「報告された」資料から取り込まれたものかを示す。報告の情報源についても示される。"
* medicationCodeableConcept only CodeableConcept
* medicationCodeableConcept from JP_MedicationCode_VS (preferred)
* medicationCodeableConcept ^binding.strength = #preferred
* medicationCodeableConcept ^binding.description = "処方する製剤を表すコード。"
* medicationCodeableConcept.coding 1..
* medicationCodeableConcept.coding ^short = "医薬品を表すコード"
* medicationCodeableConcept.coding ^definition = "医薬品を表すコード。JP Coreでは最低1個のコードを記録しなければならない。\r\n利用できるコードは下記の通りである。\r\n医薬品コード（医薬品マスター）\r\n薬価基準収載医薬品コード\r\nYJコード\r\nHOT コード（9 桁）\r\n一般名処方マスター"
* medicationCodeableConcept.coding ^comment = "コードは臨時で列記したものや、コードのリストからSNOMED CTのように公式に定義されたものまである（HL7 v3 core principle を参照)。FHIR自体ではコーディング規約を定めてはいないし、意味を暗示するために利用されない(SHALL NOT)。一般的に UserSelected = trueの場合には一つのコードシステムが使われる。\r\n【JP Core仕様】Medication要素の説明を参照のこと。"
* medicationCodeableConcept.coding.userSelected ^short = "このコードが直接ユーザーが指定したものであるかどうか"
* medicationCodeableConcept.coding.userSelected ^definition = "ユーザーが直接コーディングしたかどうかを示す。たとえば、有効な項目のリスト（コードか表現）から選択したかどうか。"
* medicationCodeableConcept.coding.userSelected ^comment = "ユーザーが直接コーディングしたかどうかを示す。たとえば、有効な項目のリスト（コードか表現）から選択したかどうか。"
* medicationCodeableConcept.text ^short = "この概念のプレーンテキスト表現"
* medicationCodeableConcept.text ^definition = "入力したユーザーが見た/選択した/発したとおりの概念および・またはユーザーが意図した概念を自然言語で表現したもの。"
* medicationCodeableConcept.text ^comment = "textエレメントはcodingのdisplayNameエレメントと一致することがよくある。"
* medicationReference only Reference(JP_Medication)
// * medication[x] ^short = "投与される薬剤"
// * medication[x] ^definition = "医薬品コードと医薬品名称。coding要素を繰り返すことでHOT9 やYJコードなど複数のコード体系で医薬品コード並記することが可能。\r\n薬される薬剤についてのID。JP Coreでは内服処方箋で使用されるMedicationRequestではcodeableConceptのみを使用する。"
// * medication[x] ^comment = "日本での運用を検討した場合に、煩雑ではあるがMedication resourceを参照するのではなくcodeableConceptとして1薬剤ごとにMedicationRequestインスタンスを生成する方針とした。\r\n\r\nコードだけが指定されていても、製品を特定できる必要がある。もし、多くの情報が必要であれば、Medication Resourceを利用することが推奨される。たとえば、もし、薬剤の剤型や、ロット番号を知る必要があったり、薬剤の成分や臨時で調整されたものであったりする場合には、Medication Resourceを参照しなくてはならない。\r\n 【JP Core仕様】 ひとつのtext要素と、複数のcoding 要素を記述できる。処方オーダ時に選択または入力し、実際に処方箋に印字される文字列を必ずtext要素に格納した上で、それをコード化した情報を1個以上のcoding 要素に記述する。\r\n厚生労働省標準であるHOT9コード（販社指定が不要な場合にはHOT7コード）または広く流通しているYJコードを用いるか、一般名処方の場合には厚生労働省保険局一般名処方マスタのコードを使用して、Coding要素（コードsystemを識別するURI、医薬品のコード、そのコード表における医薬品の名称の3つからなる）で記述する。\r\nなお、上記のいずれの標準的コードも付番されていない医薬品や医療材料の場合には、薬機法の下で使用されているGS1標準の識別コードであるGTIN(Global Trade Item Number)の調剤包装単位（最少包装単位、個別包装単位）14桁を使用する。\r\nひとつの処方薬、医療材料を複数のコード体系のコードで記述してもよく、その場合にcoding 要素を繰り返して記述する。 ただし、ひとつの処方薬を複数のコードで繰り返し記述する場合には、それらのコードが指し示す処方薬、医療材料は当然同一でなければならない。 また、処方を発行した医療機関内でのデータ利用のために、医療機関固有コード体系によるコード（ハウスコード、ローカルコード）の記述を含めてもよいが、その場合でも上述したいずれかの標準コードを同時に記述することが必要である。"
// * medication[x].id ^short = "エレメント間参照のためのユニークID"
// * medication[x].id ^definition = "エレメント間参照のためのユニークID。空白を含まない全ての文字を使ってもよい(MAY)。" 
* subject only Reference(JP_Patient)
* subject ^short = "処方箋が発行された対象(個人あるいはグループ)"
* subject ^definition = "JP Coreでは患者を表すPatientリソースへの参照。\r\n一般には薬剤が投与される対象となる人（あるいはグループ)を表現するResourceに対するリンク。"
* subject ^comment = "処方オーダーの対象は必須項目である。\r\n二次利用のためにどこに実際の対象がいるのかについての情報は提供されない。特定の対象に対して匿名化することも必要である。"
* subject.id ^short = "内部エレメントを参照するためのユニークID"
* subject.id ^definition = "リソース内のエレメントを参照（内部参照）するためのユニークなID。空白を含まなければどのような文字列であってもよい。"
* subject.reference 1..1
* subject.reference ^short = "文字列による参照、関係、内部あるいは絶対URL"
* subject.reference ^definition = "対象となる患者を表すPatient resourceへの参照である。PatientリソースのfullUrl要素に指定されるUUID を指定すること\r\n一般には他のResourceが存在する場所への参照。参照はサービスのベースURLに対する相対的なものや、リソースがある場所を示す絶対的URLであることもある。参照はバージョンを指定していることもあればそうでないこともある。もし参照が、FHIRのRESTfulサーバ以外を対象としていれば、それはバージョンが指定されているべきである。分割された内部参照('#'で始まる)の場合は内部に含まれるResourceへの参照である。"
* subject.reference ^comment = "絶対URLを使えば安定してクラウドやWeb上にスケーラブルな対応をすることができる。一方で、相対・論理参照を使えば閉鎖されたエコシステム内部に適した柔軟な対応ができる。絶対URLをはFHIRリソースのRESTfulサーバを指定するために必要となるわけではないが、より推奨される方法である。もし、URLが\"/[type]/[id]\"で構成されていれば、FHIRのRESTfulサーバへの参照を想定していると推測することもできる。"
* subject.type ^short = "参照先の型(Patient)"
* subject.type ^definition = "参照されるPatientが型として示される。\r\n一般的には参照の対象として予定される型。もし、Reference.typeとReference.referenceがともに指定されていて、Reference.referenceがFHIRのURLであればどちらも一致させなければならない(SHALL)。\n\r\n型はResource Definitionに対するCanonical URLであってその型も参照の対象となる。Referenceはhttp://hl7.org/fhir/StructureDefinition/に対する相対URLである。たとえば、\"Patient\"はhttp://hl7.org/fhir/StructureDefinition/Patientへの参照である。絶対URLは論理モデルにおいて、論理モデル内部での参照として飲み使用可能であり、Resourceに対しては指定できない。"
* subject.type ^comment = "このelementは参照の対象の型を指定するためのものである。他のElementで指定されていた型であってもなくても指定することができる。場合によっては、対象の型は参照（たとえば、RESTful URL)についての調査により決定されることもあるし、参照の対象から決定されることもある。もし、参照と型のどちらもが指定されていたら、参照は指定された型を決定されるべきである(SHALL)。"
* subject.identifier ^short = "文字列による参照が不明な場合の論理参照"
* subject.identifier ^definition = "対象となるresourceへのID。FHIRサーバを経由してこの参照が指定するEntityが指定できないか、実際の位置を示す既知のIDへとResourceを変換できない場合のように、ほかのresourceを直接参照することができない場合に使われる。Reference.identifierがFHIRインスタンスである何かを実際に示している必要はないが、FHIRインスタンスとして表現されると想定される業務概念を示されなくてはらならず(SHALL)、そのインスタンスは参照先のFHIRのResource型である必要がある。"
* subject.identifier ^comment = "IDが参照として与えられている場合には、参照を処理するシステムはIDをIDが利用される業務コンテキストがわかっているかどうか参照を解決するためにしか利用することができない。このIDはグローバル(たとえば国民ID）であることもあるが、そうでないこともある。そのため、この参照を利用する有効な機構（たとえば、データを連鎖させたり、包含させるなど）、サーバが参照を解決することができるとも期待できない。サーバは到達できなかったり、解決できないあるいは拒否されるような参照でもIDとして受け取ることができる。CapabilityStatement.rest.resource.referencePolicyを参照のこと。\r\n\r\nIDと正確な参照が共に提供されている場合は、正確な参照が優先される。Resourceを処理するアプリケーションも許容されるがIDが正確な参照と一致することを確認することは求められてない。\r\n\r\nアプリケーションは論理参照を正確な参照へとコンバートする際に、実際に示している論理参照を外したり、削除してもよい。\r\n\r\n参照はFHIRのResourceとして表現することができる構造となるように示されているが、アプリケーションが参照の対象について検索することを求めていない限り、実際にFHIR Resourceのインスタンスが存在していなくてもよい。IDを参照しているコンテンツは、どのリソースの型が限定的に許容されるか明示されていなくても論理的な制約を満たさなければならない。たとえば、薬剤処方を示すIDの型がReference(Observation|DIagnosticReport)であることは、正当化されないであろう。Reference.identifierのユースケースの一つは、FHIRの表現が存在しない場合に、(Any)を参照する型として利用するような場合である。"
* encounter only Reference(JP_Encounter)
* encounter ^short = "encounter/admission/stay のいずれかとして記録された診察"
* encounter ^definition = "JP Core profileでの使用は規定されていない。\r\nこの対象となるリソース[x]が作成される間やこの記録が作成される対象のencounterは密接に関連している。"
* encounter ^comment = "このエレメントは一般的には外来でのイベントに対応するが、診察が公式に終わる前や後にこの診察についてのコンテキストに対応して開始される活動についても対応する。もし、診療のエピソードに関連させる必要があれば、extensionとして扱われることがある。"
* supportingInformation ^short = "薬剤オーダについて補助的情報"
* supportingInformation ^definition = "薬剤をオーダーするときに補助的となる追加情報（たとえば、患者の身長や体重））を含む。"
* supportingInformation ^comment = "参照先は実存するFHIR Resourceでなければならず(SHALL)、解決可能(アクセスコントロールや、一時的に利用不可であることなどは許容される)でなければならない(SHALL)。解決の方法はURLから取得可能であるか、Resource型が適応できるかどうか、正規のURLとして絶対的参照を扱うことができるか、ローカルのレジストリ／リポジトリから参照することができるかである。"
* authoredOn 1..
* authoredOn ^short = "この処方オーダーが最初に記述された日"
* authoredOn ^definition = "JP Core profileでは必須。処方指示が最初に作成された日時。秒の精度まで記録する。タイムゾーンも付与しなければならない。"
* requester only Reference(JP_Practitioner or JP_PractitionerRole or JP_Organization or JP_Patient or RelatedPerson or Device)
* requester ^short = "このオーダーを発行した人・物"
* requester ^definition = "JP Core profileではこのエレメントに対する規定はない。\r\nこのオーダーを発行した責任のある人、組織、機器。"
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
* recorder ^short = "投薬オーダーの入力者"
* recorder ^definition = "JP Core profileではこのエレメントに対する規定はない。\r\nたとえば口答指示や電話でのオーダーにより、他の人の代理で処方を入力した人。"
* recorder ^comment = "参照先は実存するFHIR Resourceでなければならず(SHALL)、解決可能(アクセスコントロールや、一時的に利用不可であることなどは許容される)でなければならない(SHALL)。解決の方法はURLから取得可能であるか、Resource型が適応できるかどうか、正規のURLとして絶対的参照を扱うことができるか、ローカルのレジストリ／リポジトリから参照することができるかである。"
* reasonCode ^short = "薬を注文するあるいは注文しない理由や適応"
* reasonCode ^definition = "このエレメントに対するJP Coreの規定はない。\r\n薬剤をオーダーするあるいはしないことを示した理由。"
* reasonCode ^comment = "このエレメントは病名コードであってもよい。もし、すべての条件を示す記録があって他の詳細な記録が必要であれば、reasonReferenceを使用すること。"
* reasonReference only Reference(JP_Condition or JP_Observation_Common)
* reasonReference ^short = "処方箋が書かれた理由について補足するCondition ResourceまたはObservation Resource"
* reasonReference ^definition = "薬剤がなぜオーダーされたのかを説明する条件や観察。"
* reasonReference ^comment = "薬剤オーダーの理由を示すこれは条件や観察についての参照である。もし、コードだけであればreasonCodeを使用すること。"
* instantiatesCanonical ^short = "FHIRプロトコルまたは定義のインスタンス"
* instantiatesCanonical ^definition = "このMedicationRequestの一部あるいは全部が遵守するprotocolやguideline, ordersetなど他の定義を示すURL。"
* instantiatesCanonical ^comment = "[Canonical References](references.html#canonical)を参照すること。"
* instantiatesUri ^short = "外部プロトコルまたは定義のインスタンス"
* instantiatesUri ^definition = "このMedicationRequestの一部あるいは全部が遵守するprotocolやguideline, ordersetなど他の定義を示すURL。"
* instantiatesUri ^comment = "以下参照。 http://en.wikipedia.org/wiki/Uniform_resource_identifier"
* basedOn ^short = "オーダーが実施される根拠"
* basedOn ^definition = "このMedicationRequestの全部あるいは一部を満たす計画やオーダー。"
* basedOn ^comment = "参照先は実存するFHIR Resourceでなければならず(SHALL)、解決可能(アクセスコントロールや、一時的に利用不可であることなどは許容される)でなければならない(SHALL)。解決の方法はURLから取得可能であるか、Resource型が適応できるかどうか、正規のURLとして絶対的参照を扱うことができるか、ローカルのレジストリ／リポジトリから参照することができるかである。"
* groupIdentifier ^short = "このRequestを一部とする複数のオーダーを構成するID"
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
* note ^comment = "構造化されたアノテーションが内システムでは、作成者や記録時間のない一つのアノテーションで情報を伝達している。このエレメントに情報の修正を要する可能性があるためにナラティブな情報も必要としている。Annotationsには機械処理が可能で修正される（\"modifying\")情報を伝達することに使うべきではない(SHOULD NOT)。これがSHOULDである理由はユーザーの行動を強制することはほぼ不可能であるからである。"
* dosageInstruction only JP_MedicationDosage
* dispenseRequest ^short = "調剤・払い出しについての承認事項"
* dispenseRequest ^definition = "薬剤オーダー(MedicationRequest, Medication Prescription, Medication Orderなどとしても表現される）や薬剤オーダーとの一部としての薬剤の払い出しあるいは提供。この情報はオーダーとしてかならず伝えられるというわけではないことに注意。薬剤部門で調剤・払い出しを完了するための施設（たとえば病院）やシステムでのサポートに関する設定をしてもよい。"
* dispenseRequest.id ^short = "内部エレメントを参照するためのユニークID"
* dispenseRequest.id ^definition = "エレメント間参照のためのユニークID。空白を含まない全ての文字を使ってもよい(MAY)。"
* dispenseRequest.extension ^slicing.discriminator.type = #value
* dispenseRequest.extension ^slicing.discriminator.path = "url"
* dispenseRequest.extension ^slicing.rules = #open
* dispenseRequest.extension contains
    JP_MedicationRequest_DispenseRequest_InstructionForDispense named instructionForDispense ..* and
    JP_MedicationRequest_DispenseRequest_ExpectedRepeatCount named expectedRepeatCount ..1
* dispenseRequest.extension[instructionForDispense] ^short = "調剤指示"
* dispenseRequest.extension[instructionForDispense] ^definition = "薬剤単位の調剤指示を格納する"
* dispenseRequest.extension[instructionForDispense].value[x] ^short = "調剤指示"
* dispenseRequest.extension[instructionForDispense].value[x] ^definition = "薬剤単位の調剤・払い出し指示"
* dispenseRequest.extension[expectedRepeatCount] ^short = "頓用回数"
* dispenseRequest.extension[expectedRepeatCount] ^definition = "頓用回数"
* dispenseRequest.initialFill ^short = "初回の調剤詳細"
* dispenseRequest.initialFill ^definition = "初回の薬剤払い出しでの期間や量への指示"
* dispenseRequest.initialFill ^comment = "このエレメントを設定するときには量あるいは期間が指定されていなければならない。"
* dispenseRequest.initialFill.id ^short = "内部エレメントを参照するためのユニークID"
* dispenseRequest.initialFill.id ^definition = "エレメント間参照のためのユニークID。空白を含まない全ての文字を使ってもよい(MAY)。"
* dispenseRequest.initialFill.quantity ^short = "初回の調剤量"
* dispenseRequest.initialFill.quantity ^definition = "初回の払い出しとして提供される薬剤の量。"
* dispenseRequest.initialFill.quantity ^comment = "このエレメントはどのような量を表現するか定義するためにコンテキストにあわせてよく定義される。したがって、どのような単位でも利用することができる。使用されるコンテキストによってcomparatorエレメントで値が定義されることもある。"
* dispenseRequest.initialFill.quantity.id ^short = "エレメント間参照のためのユニークID"
* dispenseRequest.initialFill.quantity.id ^definition = "エレメント間参照のためのユニークID。空白を含まない全ての文字を使ってもよい(MAY)。"
* dispenseRequest.initialFill.quantity.value ^short = "（精度が暗示された）数値"
* dispenseRequest.initialFill.quantity.value ^definition = "計測された量。精度を含めた値が暗示される。"
* dispenseRequest.initialFill.quantity.value ^comment = "暗示された精度については常に尊重すべきである。貨幣計算では制度に関する独自のルールがある（会計についての標準的な教科書を参照すること）。"
* dispenseRequest.initialFill.quantity.comparator ^short = "< | <= | >= | > - 値の解釈法"
* dispenseRequest.initialFill.quantity.comparator ^definition = "実際の値が計測して示された値よりも大きいのか小さいのかなど、値がどのように解釈され、表現されるのかを示している。たとえば、もし、comparatorエレメントが\"<\"であれば、実際の値は示された値よりも小さい(<)。"
* dispenseRequest.initialFill.quantity.comparator ^comment = "FHIRの文字列は1MB以上の大きさとなってなはらない(SHALL NOT)。"
* dispenseRequest.initialFill.quantity.comparator ^requirements = "計測法に制限があって値が<5ug/L や >400mg/L として示されるような場合でも値を扱えるようなフレームワークが必要である。"
* dispenseRequest.initialFill.quantity.unit ^short = "単位表現"
* dispenseRequest.initialFill.quantity.unit ^definition = "人間にも可読な単位表現"
* dispenseRequest.initialFill.quantity.unit ^comment = "FHIRの文字列は1MB以上の大きさとなってなはらない(SHALL NOT)。"
* dispenseRequest.initialFill.quantity.unit ^requirements = "コンテキストによってさまざまな単位の表現がある。固定された特定の表現が求められることがある。たとえば、mcgはmicrogramを表す。"
* dispenseRequest.initialFill.quantity.system from JP_MedicationUnitMERIT9_VS (preferred)
* dispenseRequest.initialFill.quantity.system ^short = "コード化された単位表現を規定するシステム"
* dispenseRequest.initialFill.quantity.system ^definition = "単位をコード化して表現するシステムについてのID。"
* dispenseRequest.initialFill.quantity.system ^comment = "以下参照。 http://en.wikipedia.org/wiki/Uniform_resource_identifier"
* dispenseRequest.initialFill.quantity.system ^requirements = "システムによって定義される単位のコードを把握しておく必要がある。"
* dispenseRequest.initialFill.quantity.code ^short = "単位のコード化された形式"
* dispenseRequest.initialFill.quantity.code ^definition = "単位を表現するシステムで機械処理できる形式での単位。"
* dispenseRequest.initialFill.quantity.code ^comment = "UCUMが推奨されるシステムではあるが、SNOMED CT(慣用単位のために）やISO 4217を通貨のために利用することができる。コンテキストによっては特定なシステムによるコードが付加的に求められることもある。"
* dispenseRequest.initialFill.quantity.code ^requirements = "どのような形式であっても機械処理できる単位形式であることが求められる。UCUMは量についての単位を提供し、SNOMED CTは他に関心のある単位を提供する。"
* dispenseRequest.initialFill.duration ^short = "初回の調剤期間"
* dispenseRequest.initialFill.duration ^definition = "初回に行われる調剤、払い出しで予定される期間"
* dispenseRequest.initialFill.duration ^comment = "このエレメントはどのような量を表現するか定義するためにコンテキストにあわせてよく定義される。したがって、どのような単位でも利用することができる。使用されるコンテキストによってcomparatorエレメントで値が定義されることもある。"
* dispenseRequest.initialFill.duration.id ^short = "エレメント間参照のためのユニークID"
* dispenseRequest.initialFill.duration.id ^definition = "エレメント間参照のためのユニークID。空白を含まない全ての文字を使ってもよい(MAY)。"
* dispenseRequest.initialFill.duration.value ^short = "（精度が暗示された）数値"
* dispenseRequest.initialFill.duration.value ^definition = "計測された量。精度を含めた値が暗示される。"
* dispenseRequest.initialFill.duration.value ^comment = "暗示された精度については常に尊重すべきである。貨幣計算では制度に関する独自のルールがある（会計についての標準的な教科書を参照すること）。"
* dispenseRequest.initialFill.duration.comparator ^short = "< | <= | >= | > - 値の解釈法"
* dispenseRequest.initialFill.duration.comparator ^definition = "実際の値が計測して示された値よりも大きいのか小さいのかなど、値がどのように解釈され、表現されるのかを示している。たとえば、もし、comparatorエレメントが\"<\"であれば、実際の値は示された値よりも小さい(<)。"
* dispenseRequest.initialFill.duration.comparator ^comment = "FHIRの文字列は1MB以上の大きさとなってなはらない(SHALL NOT)。"
* dispenseRequest.initialFill.duration.comparator ^requirements = "計測法に制限があって値が<5ug/L や >400mg/L として示されるような場合でも値を扱えるようなフレームワークが必要である。"
* dispenseRequest.initialFill.duration.unit ^short = "単位表現"
* dispenseRequest.initialFill.duration.unit ^definition = "人間にも可読な単位表現"
* dispenseRequest.initialFill.duration.unit ^comment = "FHIRの文字列は1MB以上の大きさとなってなはらない(SHALL NOT)。"
* dispenseRequest.initialFill.duration.unit ^requirements = "コンテキストによってさまざまな単位の表現がある。固定された特定の表現が求められることがある。たとえば、mcgはmicrogramを表す。"
* dispenseRequest.initialFill.duration.system ^short = "コード化された単位表現を規定するシステム"
* dispenseRequest.initialFill.duration.system ^definition = "単位をコード化して表現するシステムについてのID。"
* dispenseRequest.initialFill.duration.system ^comment = "以下参照。 http://en.wikipedia.org/wiki/Uniform_resource_identifier"
* dispenseRequest.initialFill.duration.system ^requirements = "システムによって定義される単位のコードを把握しておく必要がある。"
* dispenseRequest.initialFill.duration.code ^short = "単位のコード化された形式"
* dispenseRequest.initialFill.duration.code ^definition = "単位を表現するシステムで機械処理できる形式での単位。"
* dispenseRequest.initialFill.duration.code ^comment = "UCUMが推奨されるシステムではあるが、SNOMED CT(慣用単位のために）やISO 4217を通貨のために利用することができる。コンテキストによっては特定なシステムによるコードが付加的に求められることもある。"
* dispenseRequest.initialFill.duration.code ^requirements = "どのような形式であっても機械処理できる単位形式であることが求められる。UCUMは量についての単位を提供し、SNOMED CTは他に関心のある単位を提供する。"
* dispenseRequest.dispenseInterval ^short = "再調剤までの最短期間"
* dispenseRequest.dispenseInterval ^definition = "再調剤、払い出しを行う予定までの最短の期間"
* dispenseRequest.dispenseInterval ^comment = "このエレメントはどのような量を表現するか定義するためにコンテキストにあわせてよく定義される。したがって、どのような単位でも利用することができる。使用されるコンテキストによってcomparatorエレメントで値が定義されることもある。"
* dispenseRequest.dispenseInterval.id ^short = "エレメント間参照のためのユニークID"
* dispenseRequest.dispenseInterval.id ^definition = "エレメント間参照のためのユニークID。空白を含まない全ての文字を使ってもよい(MAY)。"
* dispenseRequest.dispenseInterval.value ^short = "（精度が暗示された）数値"
* dispenseRequest.dispenseInterval.value ^definition = "計測された量。精度を含めた値が暗示される。"
* dispenseRequest.dispenseInterval.value ^comment = "暗示された精度については常に尊重すべきである。貨幣計算では制度に関する独自のルールがある（会計についての標準的な教科書を参照すること）。"
* dispenseRequest.dispenseInterval.comparator ^short = "< | <= | >= | > - 値の解釈法"
* dispenseRequest.dispenseInterval.comparator ^definition = "実際の値が計測して示された値よりも大きいのか小さいのかなど、値がどのように解釈され、表現されるのかを示している。たとえば、もし、comparatorエレメントが\"<\"であれば、実際の値は示された値よりも小さい(<)。"
* dispenseRequest.dispenseInterval.comparator ^comment = "FHIRの文字列は1MB以上の大きさとなってなはらない(SHALL NOT)。"
* dispenseRequest.dispenseInterval.comparator ^requirements = "計測法に制限があって値が<5ug/L や >400mg/L として示されるような場合でも値を扱えるようなフレームワークが必要である。"
* dispenseRequest.dispenseInterval.unit ^short = "単位表現"
* dispenseRequest.dispenseInterval.unit ^definition = "人間にも可読な単位表現"
* dispenseRequest.dispenseInterval.unit ^comment = "FHIRの文字列は1MB以上の大きさとなってなはらない(SHALL NOT)。"
* dispenseRequest.dispenseInterval.unit ^requirements = "コンテキストによってさまざまな単位の表現がある。固定された特定の表現が求められることがある。たとえば、mcgはmicrogramを表す。"
* dispenseRequest.dispenseInterval.system ^short = "コード化された単位表現を規定するシステム"
* dispenseRequest.dispenseInterval.system ^definition = "単位をコード化して表現するシステムについてのID。"
* dispenseRequest.dispenseInterval.system ^comment = "以下参照。 http://en.wikipedia.org/wiki/Uniform_resource_identifier"
* dispenseRequest.dispenseInterval.system ^requirements = "システムによって定義される単位のコードを把握しておく必要がある。"
* dispenseRequest.dispenseInterval.code ^short = "単位のコード化された形式"
* dispenseRequest.dispenseInterval.code ^definition = "単位を表現するシステムで機械処理できる形式での単位。"
* dispenseRequest.dispenseInterval.code ^comment = "UCUMが推奨されるシステムではあるが、SNOMED CT(慣用単位のために）やISO 4217を通貨のために利用することができる。コンテキストによっては特定なシステムによるコードが付加的に求められることもある。"
* dispenseRequest.dispenseInterval.code ^requirements = "どのような形式であっても機械処理できる単位形式であることが求められる。UCUMは量についての単位を提供し、SNOMED CTは他に関心のある単位を提供する。"
* dispenseRequest.validityPeriod ^short = "許可された払い出し期間"
* dispenseRequest.validityPeriod ^definition = "このエレメントは処方の有効期間（処方が失効する日）を示す。"
* dispenseRequest.validityPeriod.id ^short = "エレメント間参照のためのユニークID"
* dispenseRequest.validityPeriod.id ^definition = "エレメント間参照のためのユニークID。空白を含まない全ての文字を使ってもよい(MAY)。"
* dispenseRequest.validityPeriod.start ^short = "境界を含む開始時刻"
* dispenseRequest.validityPeriod.start ^definition = "期間の開始を示す。境界も含まれる。"
* dispenseRequest.validityPeriod.start ^comment = "このエレメントが設定されていなければ、下限が不明であることを示す。"
* dispenseRequest.validityPeriod.end ^short = "継続中でなければ境界を含む終了時刻"
* dispenseRequest.validityPeriod.end ^definition = "期間の終了時刻。もし、期間の終了が示されていなければ、このインスタンスが生成された時点での終了時刻が不明であったか計画されていなかったかである。開始時刻(start)は過去であることもあり、終了時刻(end)は未来であることもあり、その時点での見込みあるいは予定された終了時刻を意味する。"
* dispenseRequest.validityPeriod.end ^comment = "終了時刻は全ての日付・時刻に対応する。たとえば、2012-02-03T10:00:00は2012-02-03を終了時刻(end)の値とする期間を示す。"
* dispenseRequest.numberOfRepeatsAllowed ^short = "許可されたリフィル回数"
* dispenseRequest.numberOfRepeatsAllowed ^definition = "リフィル回数を示す整数である。患者が処方された薬を最初の払い出しから追加で受け取ることができる回数である。使用上の注意：この整数には最初の払い出しが含まれない。オーダーが「30錠に加えて3回リフィル可」であれば、このオーダーで合計で最大4回、120錠が患者に受け渡される。この数字を0とすることで，処方者がリフィルを許可しないということを明示することができる。"
* dispenseRequest.numberOfRepeatsAllowed ^comment = "許可された払い出し回数は，最大でこの数字に1を足したものである。"
* dispenseRequest.quantity ^short = "調剤量"
* dispenseRequest.quantity ^definition = "1回の調剤で払い出される薬剤の量"
* dispenseRequest.quantity ^comment = "このエレメントはどのような量を表現するか定義するためにコンテキストにあわせてよく定義される。したがって、どのような単位でも利用することができる。使用されるコンテキストによってcomparatorエレメントで値が定義されることもある。"
* dispenseRequest.quantity.id ^short = "エレメント間参照のためのユニークID"
* dispenseRequest.quantity.id ^definition = "エレメント間参照のためのユニークID。空白を含まない全ての文字を使ってもよい(MAY)。"
* dispenseRequest.quantity.value 1..
* dispenseRequest.quantity.value ^short = "調剤量"
* dispenseRequest.quantity.value ^definition = "調剤量。精度を含めた値が暗示される。"
* dispenseRequest.quantity.value ^comment = "暗示された精度については常に尊重すべきである。貨幣計算では制度に関する独自のルールがある（会計についての標準的な教科書を参照すること）。"
* dispenseRequest.quantity.comparator ^short = "< | <= | >= | > - 値の解釈法"
* dispenseRequest.quantity.comparator ^definition = "実際の値が計測して示された値よりも大きいのか小さいのかなど、値がどのように解釈され、表現されるのかを示している。たとえば、もし、comparatorエレメントが\"<\"であれば、実際の値は示された値よりも小さい(<)。"
* dispenseRequest.quantity.comparator ^comment = "FHIRの文字列は1MB以上の大きさとなってなはらない(SHALL NOT)。"
* dispenseRequest.quantity.comparator ^requirements = "計測法に制限があって値が<5ug/L や >400mg/L として示されるような場合でも値を扱えるようなフレームワークが必要である。"
* dispenseRequest.quantity.unit 1..
* dispenseRequest.quantity.unit ^short = "単位文字列"
* dispenseRequest.quantity.unit ^definition = "単位文字列"
* dispenseRequest.quantity.unit ^comment = "FHIRの文字列は1MB以上の大きさとなってなはらない(SHALL NOT)。"
* dispenseRequest.quantity.unit ^requirements = "コンテキストによってさまざまな単位の表現がある。固定された特定の表現が求められることがある。たとえば、mcgはmicrogramを表す。"
* dispenseRequest.quantity.system 1..
* dispenseRequest.quantity.system = "urn:oid:1.2.392.100495.20.2.101"
* dispenseRequest.quantity.system ^short = "医薬品単位略号を識別するURL"
* dispenseRequest.quantity.system ^definition = "医薬品単位略号を識別するURL。urn:oid:1.2.392.100495.20.2.101で固定される。"
* dispenseRequest.quantity.system ^comment = "以下参照。 http://en.wikipedia.org/wiki/Uniform_resource_identifier"
* dispenseRequest.quantity.system ^requirements = "システムによって定義される単位のコードを把握しておく必要がある。"
* dispenseRequest.quantity.code 1..
* dispenseRequest.quantity.code ^short = "医薬品単位略号。"
* dispenseRequest.quantity.code ^definition = "医薬品単位略号。"
* dispenseRequest.quantity.code ^comment = "UCUMが推奨されるシステムではあるが、SNOMED CT(慣用単位のために）やISO 4217を通貨のために利用することができる。コンテキストによっては特定なシステムによるコードが付加的に求められることもある。"
* dispenseRequest.quantity.code ^requirements = "どのような形式であっても機械処理できる単位形式であることが求められる。UCUMは量についての単位を提供し、SNOMED CTは他に関心のある単位を提供する。"
* dispenseRequest.expectedSupplyDuration ^short = "調剤日数"
* dispenseRequest.expectedSupplyDuration ^definition = "供給される製品が使用されるか、あるいは払い出しが想定されている時間を指定する期間。"
* dispenseRequest.expectedSupplyDuration ^comment = "状況によっては、この属性は物理的に供給される量というよりも、想定されている期間に供給される薬剤の量を指定する数量の代わりに使われることもある。たとえば、薬剤が90日間供給される（オーダーされた量に基づいて）など。可能であれば、量も示した方がより正確になる。expectedSupplyDurationは外部要因に影響をうけることのある予測値である。"
* dispenseRequest.expectedSupplyDuration.id ^short = "エレメント間参照のためのユニークID"
* dispenseRequest.expectedSupplyDuration.id ^definition = "エレメント間参照のためのユニークID。空白を含まない全ての文字を使ってもよい(MAY)。"
* dispenseRequest.expectedSupplyDuration.value 1..
* dispenseRequest.expectedSupplyDuration.value ^short = "調剤日数"
* dispenseRequest.expectedSupplyDuration.value ^definition = "調剤日数"
* dispenseRequest.expectedSupplyDuration.value ^comment = "暗示された精度については常に尊重すべきである。貨幣計算では制度に関する独自のルールがある（会計についての標準的な教科書を参照すること）。"
* dispenseRequest.expectedSupplyDuration.comparator ..0
* dispenseRequest.expectedSupplyDuration.comparator ^short = "< | <= | >= | > - 値の解釈法"
* dispenseRequest.expectedSupplyDuration.comparator ^definition = "実際の値が計測して示された値よりも大きいのか小さいのかなど、値がどのように解釈され、表現されるのかを示している。たとえば、もし、comparatorエレメントが\"<\"であれば、実際の値は示された値よりも小さい(<)。"
* dispenseRequest.expectedSupplyDuration.comparator ^comment = "FHIRの文字列は1MB以上の大きさとなってなはらない(SHALL NOT)。"
* dispenseRequest.expectedSupplyDuration.comparator ^requirements = "計測法に制限があって値が<5ug/L や >400mg/L として示されるような場合でも値を扱えるようなフレームワークが必要である。"
* dispenseRequest.expectedSupplyDuration.unit 1..
* dispenseRequest.expectedSupplyDuration.code = #d (exactly)
* dispenseRequest.expectedSupplyDuration.system = "http://unitsofmeasure.org" (exactly)
* dispenseRequest.expectedSupplyDuration.unit = "日" (exactly)
* dispenseRequest.expectedSupplyDuration.unit ^short = "調剤日数の単位"
* dispenseRequest.expectedSupplyDuration.unit ^definition = "調剤日数の単位。「日」固定。"
* dispenseRequest.expectedSupplyDuration.unit ^comment = "FHIRの文字列は1MB以上の大きさとなってなはらない(SHALL NOT)。"
* dispenseRequest.expectedSupplyDuration.unit ^requirements = "コンテキストによってさまざまな単位の表現がある。固定された特定の表現が求められることがある。たとえば、mcgはmicrogramを表す。"
* dispenseRequest.expectedSupplyDuration.system 1..
* dispenseRequest.expectedSupplyDuration.system ^short = "UCUM単位コードを識別するURI"
* dispenseRequest.expectedSupplyDuration.system ^definition = "UCUM単位コードを識別するURI。固定値。"
* dispenseRequest.expectedSupplyDuration.system ^comment = "以下参照。 http://en.wikipedia.org/wiki/Uniform_resource_identifier"
* dispenseRequest.expectedSupplyDuration.system ^requirements = "システムによって定義される単位のコードを把握しておく必要がある。"
* dispenseRequest.expectedSupplyDuration.code 1..
* dispenseRequest.expectedSupplyDuration.code ^short = "「日」を表すUCUM単位コード"
* dispenseRequest.expectedSupplyDuration.code ^definition = "「日」を表すUCUM単位コード。固定値。"
* dispenseRequest.expectedSupplyDuration.code ^comment = "UCUMが推奨されるシステムではあるが、SNOMED CT(慣用単位のために）やISO 4217を通貨のために利用することができる。コンテキストによっては特定なシステムによるコードが付加的に求められることもある。"
* dispenseRequest.expectedSupplyDuration.code ^requirements = "どのような形式であっても機械処理できる単位形式であることが求められる。UCUMは量についての単位を提供し、SNOMED CTは他に関心のある単位を提供する。"
* dispenseRequest.performer ^short = "想定された払い出し薬局"
* dispenseRequest.performer ^definition = "処方者によって指定される調剤・払い出しを行うと想定されているOrganizationを示す。\r\n\r\nIndicates the intended dispensing Organization specified by the prescriber."
* dispenseRequest.performer ^comment = "参照先は実存するFHIR Resourceでなければならず(SHALL)、解決可能(アクセスコントロールや、一時的に利用不可であることなどは許容される)でなければならない(SHALL)。解決の方法はURLから取得可能であるか、Resource型が適応できるかどうか、正規のURLとして絶対的参照を扱うことができるか、ローカルのレジストリ／リポジトリから参照することができるかである。"
* substitution ^short = "後発医薬品への変更可否情報"
* substitution ^definition = "後発医薬品への変更可否情報。代替薬剤を払い出してよいかどうかを示している。代替薬剤を使用しなければいけない場合もあれば、使用しない場合もある。このブロックでは処方者の意図が示される。もし、何も指定されていなければ代替薬品を用いてもよい。"
* substitution.id ^short = "内部エレメントを参照するためのユニークID"
* substitution.id ^definition = "リソース内のエレメントを参照（内部参照）するためのユニークなID。空白を含まなければどのような文字列であってもよい。"
* substitution.allowed[x] only CodeableConcept
* substitution.allowed[x] from $JP_MedicationSubstitutionNotAllowedReason_VS (preferred)
* substitution.allowed[x] ^short = "後発医薬品への変更可否情報。"
* substitution.allowed[x] ^definition = "後発医薬品への変更可否情報。"
* substitution.allowed[x] ^comment = "代替品が許可されるかどうかは無視できないので、このエレメントはmodifierとしてラベルされる。"
* substitution.allowed[x].coding ^short = "後発品変更不可コード"
* substitution.allowed[x].coding ^definition = "後発品変更不可コード。"
* substitution.allowed[x].coding.system 1..
* substitution.allowed[x].coding.system = "urn:oid:1.2.392.100495.20.2.41" (exactly)
* substitution.allowed[x].coding.system ^short = "後発品変更不可コードを識別するURI"
* substitution.allowed[x].coding.system ^definition = "後発品変更不可コードを識別するURI。固定値。"
* substitution.allowed[x].coding.code 1..
* substitution.allowed[x].coding.code ^short = "後発品変更不可コード"
* substitution.allowed[x].coding.code ^definition = "後発品変更不可コード。"
* substitution.allowed[x].coding.display ^short = "後発品変更不可コード表示名"
* substitution.allowed[x].coding.display ^definition = "後発品変更不可コード表示名。"
* substitution.reason ^short = "代替品を提供した（あるいは、しなかった）理由"
* substitution.reason ^definition = "代替品にしなければならなかった、あるいは代替品が認められなかった理由を示す。"
* substitution.reason ^comment = "代替品の理由を表す一般的パターンに全てのターミノロジーが適応しているわけではない。情報モデルはCodeableConceptではなく、直接Codingをを使用してテキストやコーディング、翻訳、そしてエレメントと事前条件、事後条件の関係について管理するためにその構造を提示する必要がある。"
* priorPrescription ^short = "前回のオーダー/処方"
* priorPrescription ^definition = "関連する先行オーダーや処方を表現するMedicationRequest Resourceへのリンク。"
* priorPrescription ^comment = "参照先は実存するFHIR Resourceでなければならず(SHALL)、解決可能(アクセスコントロールや、一時的に利用不可であることなどは許容される)でなければならない(SHALL)。解決の方法はURLから取得可能であるか、Resource型が適応できるかどうか、正規のURLとして絶対的参照を扱うことができるか、ローカルのレジストリ／リポジトリから参照することができるかである。"
* detectedIssue ^short = "実施時の臨床的問題"
* detectedIssue ^definition = "患者に対して1回以上の実施されたか提案された診療行為によって、実際に起きたあるいは起きる可能性のある臨床的問題。たとえば、薬剤官相互作用や重複治療、薬剤量についての警告など。DetectedIssueリソースへの参照。"
* detectedIssue ^comment = "このエレメントは意思決定支援システムや臨床医によって指摘された問題点を扱うことができ、問題を表すためのステップについての情報を扱ってもよい。"
* eventHistory ^short = "ライフサイクルで関心のあるイベントのリスト"
* eventHistory ^definition = "このリソースの現在のバージョンをユーザーから見て関係していそうなキーとなる更新や状態遷移と識別される過去のバージョンのこのリソースあるいは調剤請求あるいはEvent ResourceについてのProvenance resourceへの参照。"
* eventHistory ^comment = "このエレメントには全てのバージョンのMedicationRequestについてのProvenanceが取り込まれているわけではない。「関連する」あるいは重要と思われたものだけである。現在のバージョンのResourceに関連したProvenance resourceを含めてはならない(SHALL NOT)。（もし、Provenanceとして「関連した」変化と思われれば、後の更新の一部として取り込まれる必要があるだろう。それまでは、このバージョンを_revincludeを使ってprovenanceとして指定して直接クエリーを発行することができる。全てのProvenanceがこのRequestについての履歴を対象として持つべきである。）"


// ==============================
//   Extension 定義
// ==============================
Extension: JP_MedicationRequest_DispenseRequest_ExpectedRepeatCount
Id: jp-medicationrequest-dispenserequest-expectedrepeatcount
Title: "JP Core MedicationRequest DispenseRequest ExpectedRepeatCount Extension"
Description: "頓用回数"
* ^url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DispenseRequest_ExpectedRepeatCount"
* ^date = "2022-03-16"
* ^purpose = "頓用の場合など調剤量を錠数ではなく回数で表現したい場合の回数を格納する拡張"
* ^context.type = #element
* ^context.expression = "MedicationRequest.dispenseRequest"
* . ..1
* . ^short = "頓⽤回数を表現する拡張"
* . ^definition = "頓⽤回数を表現する拡張"
* url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DispenseRequest_ExpectedRepeatCount" (exactly)
* value[x] 1..
* value[x] only integer
* value[x] ^short = "頓用回数"
* value[x] ^definition = "頓用回数"

Extension: JP_MedicationRequest_DispenseRequest_InstructionForDispense
Id: jp-medicationrequest-dispenserequest-instructionfordispense
Title: "JP Core MedicationRequest DispenseRequest InstructionForDispense Extension"
Description: "調剤指示。薬剤単位の調剤指示を表現するための拡張"
* ^url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DispenseRequest_InstructionForDispense"
* ^date = "2022-03-16"
* ^context.type = #element
* ^context.expression = "MedicationRequest.dispenseRequest"
* id ..0
* url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DispenseRequest_InstructionForDispense" (exactly)
* value[x] only CodeableConcept
* valueCodeableConcept.coding from $JP_MedicationInstructionForDispenseJHSP0002_VS (preferred)


