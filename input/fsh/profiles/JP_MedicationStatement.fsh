// ==============================
//   Profile 定義
// ==============================

//-------------------------------
// 内服 JP_MedicationStatement
//-------------------------------
Profile: JP_MedicationStatement
Parent: MedicationStatement
Id: jp-medicationstatement
Title: "JP Core MedicationStatement Profile"
Description: "このProfileは服薬状況を示すものであり，診療情報提供書や退院サマリーなどの他の文書と組み合わせて用いられる。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationStatement"
* ^status = #active
* ^date = "2024-08-01"
* ^purpose = "このProfileは診療情報提供書や退院サマリーなどの医療文書内で服薬情報について記載するために用いられる。このResourceは薬剤処方や，調剤情報，薬剤投与実施情報としては用いられず，それぞれMedicationRequest, MedicationDispense, MedicationAdministrationが用いられる。"
* . ^short = "服薬情報"
* . ^definition = "患者が薬剤を服用している状況についての情報である。"
* identifier ^short = "外部から参照されるID"
* identifier ^definition = "このインスタンスが外部から参照されるために使われるIDである。それ以外に任意のIDを付与してもよい。\r\nこのIDは業務手順によって定められた処方オーダーに対して、直接的なURL参照が適切でない場合も含めて関連付けるために使われる。この業務手順のIDは実施者によって割り当てられたものであり、リソースが更新されたりサーバからサーバに転送されたとしても固定のものとして存続する。"
* identifier ^comment = "これは業務IDであって、リソースに対するIDではない。"
* status ^definition = "服薬状況のを示す。コード表： http://hl7.org/fhir/CodeSystem/medication-statement-status\r\nactive | completed | entered-in-error |intended | stopped | on-hold | unknown | not-take"
* status ^comment = "このエレメントはmodifierとされている。StatusとはこのResourceが現在妥当な状態ではないことも示すからである。"
* status ^isModifierReason = "このエレメントは modifier である。Statusエレメントが entered-in-error という正当な情報として扱うべきではない状態の値も取り得るからである。"
* statusReason ^short = "服薬状況の理由"
* statusReason ^definition = "現在の服薬状況を示す上記のstatusとなった理由"
* statusReason ^comment = "コード化せずにtextのみで表現する。"
* category ^short = "薬剤使用区分"
* category ^definition = "薬剤が服用されると想定されている場所。日本では「院外」「院内」「入院」「外来」などの区分を想定する。\r\n一般的には、外来や入院などどこでこの薬剤が投与、内服されるかを想定した区分である。\r\n処方病棟や処方した診療科をOrganization resourceで表現することが冗長である場合にはこの区分が用いられることもある。\r\nHL7 FHIRではvalue setとして http://terminology.hl7.org/CodeSystem/medicationrequest-category がデフォルトで用いられるが、日本での使用の場合持参薬をカバーする必要があり、JAHIS処方データ規約V3.0Cに記載されているMERIT-9処方オーダ表7とJHSP0007表を組み合わせて持ちいることとする"

// * medicationCodeableConcept only CodeableConcept
// * medicationCodeableConcept ^binding.strength = #preferred
// * medicationCodeableConcept ^binding.description = "処方する製剤を表すコード。"
// * medicationCodeableConcept.coding 1..
// * medicationCodeableConcept.coding ^short = "医薬品を表すコード"
// * medicationCodeableConcept.coding ^definition = "医薬品を表すコード。JP Coreでは最低1個のコードを記録しなければならない。\r\n利用できるコードは下記の通りである。\r\n医薬品コード（医薬品マスター）\r\n薬価基準収載医薬品コード\r\nYJコード\r\nHOT コード（9 桁）\r\n一般名処方マスター"
// * medicationCodeableConcept.coding ^comment = "コードは臨時で列記したものや、コードのリストからSNOMED CTのように公式に定義されたものまである（HL7 v3 core principle を参照)。FHIR自体ではコーディング規約を定めてはいないし、意味を暗示するために利用されない(SHALL NOT)。一般的に UserSelected = trueの場合には一つのコードシステムが使われる。\r\n【JP-CORE】Medication要素の説明を参照のこと。"
// * medicationCodeableConcept.coding.userSelected ^short = "このコードが直接ユーザーが指定したものであるかどうか"
// * medicationCodeableConcept.coding.userSelected ^definition = "ユーザーが直接コーディングしたかどうかを示す。たとえば、有効な項目のリスト（コードか表現）から選択したかどうか。"
// * medicationCodeableConcept.coding.userSelected ^comment = "ユーザーが直接コーディングしたかどうかを示す。たとえば、有効な項目のリスト（コードか表現）から選択したかどうか。"
// * medicationCodeableConcept.text ^short = "この概念のプレーンテキスト表現"
// * medicationCodeableConcept.text ^definition = "入力したユーザーが見た/選択した/発したとおりの概念および・またはユーザーが意図した概念を自然言語で表現したもの。"
// * medicationCodeableConcept.text ^comment = "textエレメントはcodingのdisplayNameエレメントと一致することがよくある。"
// * medicationReference only Reference(JP_Medication)

* medication[x] ^short = "What medication was supplied　医薬品"
* medication[x] ^definition = "Identifies the medication that was administered. This is either a link to a resource representing the details of the medication or a simple attribute carrying a code that identifies the medication from a known list of medications.\r\n\r\n投与された薬剤を識別する。既知の薬のリストから薬を識別するコード情報を設定する。"
* medication[x] ^comment = "If only a code is specified, then it needs to be a code for a specific product. If more information is required, then the use of the medication resource is recommended.  For example, if you require form or lot number, then you must reference the Medication resource.\r\n\r\nひとつのtext要素と、複数のcoding 要素を記述できる。処方オーダ時に選択または入力し、実際に処方箋に印字される文字列を必ずtext要素に格納した上で、それをコード化した情報を1個以上のcoding 要素に記述する。\r\n\r\n厚生労働省標準であるHOT9コード（販社指定が不要な場合にはHOT7コード）または広く流通しているYJコードを用いるか、一般名処方の場合には厚生労働省保険局一般名処方マスタのコードを使用して、Coding要素（コードsystemを識別するURI、医薬品のコード、そのコード表における医薬品の名称の3つからなる）で記述する。\r\n\rなお、上記のいずれの標準的コードも付番されていない医薬品や医療材料の場合には、薬機法の下で使用されているGS1標準の識別コードであるGTIN(Global Trade Item Number)の調剤包装単位（最少包装単位、個別包装単位）14桁を使用する。\r\n\rひとつの処方薬、医療材料を複数のコード体系のコードで記述してもよく、その場合にcoding 要素を繰り返して記述する。\rただし、ひとつの処方薬を複数のコードで繰り返し記述する場合には、それらのコードが指し示す処方薬、医療材料は当然同一でなければならない。\rまた、処方を発行した医療機関内でのデータ利用のために、医療機関固有コード体系によるコード（ハウスコード、ローカルコード）の記述を含めてもよいが、その場合でも上述したいずれかの標準コードを同時に記述することが必要である。"
* medication[x] only CodeableConcept

* medicationCodeableConcept from JP_MedicationCode_VS (preferred)
* medicationCodeableConcept ^binding.description = "処方する製剤を表すコード。"

* subject only Reference(JP_Patient)
* subject ^short = "処方箋が発行された患者に対する参照"
* subject ^definition = "JP Coreでは患者を表すPatientリソースへの参照。\r\n一般には薬剤が投与される対象となる患者を表現するPatient Resourceに対するリンク。"
* subject ^comment = "処方オーダーの対象は必須項目である。\r\n二次利用のためにどこに実際の対象がいるのかについての情報は提供されない。特定の対象に対して匿名化することも必要である。"
* effectivePeriod only Period
* effectivePeriod ^short = "服薬期間"
* effectivePeriod ^definition = "薬が服用される期間"
* effectivePeriod.start ^short = "開始日"
* effectivePeriod.start ^definition = "薬の服用を開始した日"
* effectivePeriod.end ^comment = "このエレメントが設定されていなければ、開始日が不明であることを示す"
* effectivePeriod.end ^short = "終了日"
* effectivePeriod.end ^definition = "薬の服用を終了する日"
* effectivePeriod.end ^comment = "この値は必ず境界日を含む。2012-02-03T10:00:00は2012-02-03を終了時刻(end)の値とする期間を示す。"
* dateAsserted ^short = "このステートメントが言明された日"
* dateAsserted ^definition = "情報源となったインスタンスでこのステートメントが言明された日"
* informationSource ^short = "この服用状況についての情報を提供した人物あるいは組織についての参照"
* informationSource ^definition = "この服用状況についての情報を提供した人物あるいは組織についての参照"
* derivedFrom ^short = "その他の支持情報"
* derivedFrom ^definition = "MedicationStatementリソースと関連するMedicationRequestやその他の支持情報を表すリソースと関連付けられるようにする。"
* reasonCode ^short = "この投薬の理由。対象疾患"
* reasonCode ^definition = "この薬剤た投与された理由"
* reasonCode ^comment = "このコードは疾患分類であっても良い。JP Coreでは傷病名マスターの使用を前提とする。"
* reasonCode.coding ^short = "投与理由，対象疾患についてのコード"
// * reasonCode.cosing.system 0..1
// * reasonCode.cosing.system = "urn:oid:1.2.392.200119.4.101.6" (example)
// * reasonCode.coding.system ^short = "ここでは傷病名マスタを対象疾患として指定する例を上げる"
// * reasonCode.coding.system ^definition = "対象疾患を例とする場合は傷病名マスターなどが利用されるが，他の理由コードを利用しても良い。"
// * reasonCode.coding.code 0..1
// * reasonCode.coding.code ^short = "投与理由に相当する概念に対するコード"
// * reasonCode.coding.display ^short ="投与理由についてのテキスト表現"
* reasonReference ^short = "服薬理由を支持するObservation, Condition, DiagnosticReportについての参照。"
* note ^short = "他のフィールドには記述できないこのstatementについての追加情報"
* note ^definition = "他の属性には記載できないこのstatementについての備考情報"
* dosage only JP_MedicationDosage
* dosage ^short = "この薬剤がどのように服用されたのか，服用すべきだったのかを示す情報"
* dosage ^definition = "患者にこの薬剤がどのように服用すべきかを示す情報"

//---------------------------------------
// 注射 JP_MedicationStatement_Injection
//---------------------------------------
Profile: JP_MedicationStatement_Injection
Parent: MedicationStatement
Id: jp-medicationstatement-injection
Title: "JP Core MedicationStatement Injection Profile"
Description: "このProfileは服薬状況を示すものであり，診療情報提供書や退院サマリーなどの他の文書と組み合わせて用いられる。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationStatement_Injection"
* ^status = #draft
* ^date = "2022-07-04"
* ^purpose = "このProfileは診療情報提供書や退院サマリーなどの医療文書内で服薬情報について記載するために用いられる。このResourceは薬剤処方や，調剤情報，薬剤投与実施情報としては用いられず，それぞれMedicationRequest, MedicationDispense, MedicationAdministrationが用いられる。"
* . ^short = "服薬情報"
* . ^definition = "患者が薬剤を服用している状況についての情報である。"
* identifier ^short = "外部から参照されるID"
* identifier ^definition = "このインスタンスが外部から参照されるために使われるIDである。それ以外に任意のIDを付与してもよい。\r\nこのIDは業務手順によって定められた処方オーダーに対して、直接的なURL参照が適切でない場合も含めて関連付けるために使われる。この業務手順のIDは実施者によって割り当てられたものであり、リソースが更新されたりサーバからサーバに転送されたとしても固定のものとして存続する。"
* identifier ^comment = "これは業務IDであって、リソースに対するIDではない。"
* status ^definition = "服薬状況のを示す。コード表： http://hl7.org/fhir/CodeSystem/medication-statement-status\r\nactive | completed | entered-in-error |intended | stopped | on-hold | unknown | not-take"
* status ^comment = "このエレメントはmodifierとされている。StatusとはこのResourceが現在妥当な状態ではないことも示すからである。"
* status ^isModifierReason = "このエレメントは modifier である。Statusエレメントが entered-in-error という正当な情報として扱うべきではない状態の値も取り得るからである。"
* statusReason ^short = "服薬状況の理由"
* statusReason ^definition = "現在の服薬状況を示す上記のstatusとなった理由"
* statusReason ^comment = "コード化せずにtextのみで表現する。"
* category ^short = "薬剤使用区分"
* category ^definition = "薬剤が服用されると想定されている場所。日本では「院外」「院内」「入院」「外来」などの区分を想定する。\r\n一般的には、外来や入院などどこでこの薬剤が投与、内服されるかを想定した区分である。\r\n処方病棟や処方した診療科をOrganization resourceで表現することが冗長である場合にはこの区分が用いられることもある。\r\nHL7 FHIRではvalue setとして http://terminology.hl7.org/CodeSystem/medicationrequest-category がデフォルトで用いられるが、日本での使用の場合持参薬をカバーする必要があり、JAHIS処方データ規約V3.0Cに記載されているMERIT-9処方オーダ表7とJHSP0007表を組み合わせて持ちいることとする"

// * medicationCodeableConcept only CodeableConcept
// * medicationCodeableConcept ^binding.strength = #preferred
// * medicationCodeableConcept ^binding.description = "処方する製剤を表すコード。"
// * medicationCodeableConcept.coding 1..
// * medicationCodeableConcept.coding ^short = "医薬品を表すコード"
// * medicationCodeableConcept.coding ^definition = "医薬品を表すコード。JP Coreでは最低1個のコードを記録しなければならない。\r\n利用できるコードは下記の通りである。\r\n医薬品コード（医薬品マスター）\r\n薬価基準収載医薬品コード\r\nYJコード\r\nHOT コード（9 桁）\r\n一般名処方マスター"
// * medicationCodeableConcept.coding ^comment = "コードは臨時で列記したものや、コードのリストからSNOMED CTのように公式に定義されたものまである（HL7 v3 core principle を参照)。FHIR自体ではコーディング規約を定めてはいないし、意味を暗示するために利用されない(SHALL NOT)。一般的に UserSelected = trueの場合には一つのコードシステムが使われる。\r\n【JP-CORE】Medication要素の説明を参照のこと。"
// * medicationCodeableConcept.coding.userSelected ^short = "このコードが直接ユーザーが指定したものであるかどうか"
// * medicationCodeableConcept.coding.userSelected ^definition = "ユーザーが直接コーディングしたかどうかを示す。たとえば、有効な項目のリスト（コードか表現）から選択したかどうか。"
// * medicationCodeableConcept.coding.userSelected ^comment = "ユーザーが直接コーディングしたかどうかを示す。たとえば、有効な項目のリスト（コードか表現）から選択したかどうか。"
// * medicationCodeableConcept.text ^short = "この概念のプレーンテキスト表現"
// * medicationCodeableConcept.text ^definition = "入力したユーザーが見た/選択した/発したとおりの概念および・またはユーザーが意図した概念を自然言語で表現したもの。"
// * medicationCodeableConcept.text ^comment = "textエレメントはcodingのdisplayNameエレメントと一致することがよくある。"
// * medicationReference only Reference(JP_Medication)

* medication[x] ^short = "What medication was supplied　医薬品"
* medication[x] ^definition = "Identifies the medication that was administered. This is either a link to a resource representing the details of the medication or a simple attribute carrying a code that identifies the medication from a known list of medications.\r\n\r\n投与された薬剤を識別する。既知の薬のリストから薬を識別するコード情報を設定する。"
* medication[x] ^comment = "If only a code is specified, then it needs to be a code for a specific product. If more information is required, then the use of the medication resource is recommended.  For example, if you require form or lot number, then you must reference the Medication resource.\r\n\r\nひとつのtext要素と、複数のcoding 要素を記述できる。処方オーダ時に選択または入力し、実際に処方箋に印字される文字列を必ずtext要素に格納した上で、それをコード化した情報を1個以上のcoding 要素に記述する。\r\n\r\n厚生労働省標準であるHOT9コード（販社指定が不要な場合にはHOT7コード）または広く流通しているYJコードを用いるか、一般名処方の場合には厚生労働省保険局一般名処方マスタのコードを使用して、Coding要素（コードsystemを識別するURI、医薬品のコード、そのコード表における医薬品の名称の3つからなる）で記述する。\r\n\rなお、上記のいずれの標準的コードも付番されていない医薬品や医療材料の場合には、薬機法の下で使用されているGS1標準の識別コードであるGTIN(Global Trade Item Number)の調剤包装単位（最少包装単位、個別包装単位）14桁を使用する。\r\n\rひとつの処方薬、医療材料を複数のコード体系のコードで記述してもよく、その場合にcoding 要素を繰り返して記述する。\rただし、ひとつの処方薬を複数のコードで繰り返し記述する場合には、それらのコードが指し示す処方薬、医療材料は当然同一でなければならない。\rまた、処方を発行した医療機関内でのデータ利用のために、医療機関固有コード体系によるコード（ハウスコード、ローカルコード）の記述を含めてもよいが、その場合でも上述したいずれかの標準コードを同時に記述することが必要である。"
* medication[x] only Reference(Medication)

* medicationReference only Reference(JP_Medication)
* medicationReference ^definition = "医薬品の識別情報は必須でありmedicationReference.referenceが必ず存在しなければならない、JP Coreでは注射の医薬品情報は単一薬剤の場合も Medicationリソースとして記述し、medicationCodeableConceptは使用しない。参照するMedicationリソースは、MedicationRequest.contained属性に内包することが望ましいが、外部参照としても良い。"

* subject only Reference(JP_Patient)
* subject ^short = "処方箋が発行された患者に対する参照"
* subject ^definition = "JP Coreでは患者を表すPatientリソースへの参照。\r\n一般には薬剤が投与される対象となる患者を表現するPatient Resourceに対するリンク。"
* subject ^comment = "処方オーダーの対象は必須項目である。\r\n二次利用のためにどこに実際の対象がいるのかについての情報は提供されない。特定の対象に対して匿名化することも必要である。"
* effectivePeriod only Period
* effectivePeriod ^short = "服薬期間"
* effectivePeriod ^definition = "薬が服用される期間"
* effectivePeriod.start ^short = "開始日"
* effectivePeriod.start ^definition = "薬の服用を開始した日"
* effectivePeriod.end ^comment = "このエレメントが設定されていなければ、開始日が不明であることを示す"
* effectivePeriod.end ^short = "終了日"
* effectivePeriod.end ^definition = "薬の服用を終了する日"
* effectivePeriod.end ^comment = "この値は必ず境界日を含む。2012-02-03T10:00:00は2012-02-03を終了時刻(end)の値とする期間を示す。"
* dateAsserted ^short = "このステートメントが言明された日"
* dateAsserted ^definition = "情報源となったインスタンスでこのステートメントが言明された日"
* informationSource ^short = "この服用状況についての情報を提供した人物あるいは組織についての参照"
* informationSource ^definition = "この服用状況についての情報を提供した人物あるいは組織についての参照"
* derivedFrom ^short = "その他の支持情報"
* derivedFrom ^definition = "MedicationStatementリソースと関連するMedicationRequestやその他の支持情報を表すリソースと関連付けられるようにする。"
* reasonCode ^short = "この投薬の理由。対象疾患"
* reasonCode ^definition = "この薬剤た投与された理由"
* reasonCode ^comment = "このコードは疾患分類であっても良い。JP Coreでは傷病名マスターの使用を前提とする。"
* reasonCode.coding ^short = "投与理由，対象疾患についてのコード"
// * reasonCode.cosing.system 0..1
// * reasonCode.cosing.system = "urn:oid:1.2.392.200119.4.101.6" (example)
// * reasonCode.coding.system ^short = "ここでは傷病名マスタを対象疾患として指定する例を上げる"
// * reasonCode.coding.system ^definition = "対象疾患を例とする場合は傷病名マスターなどが利用されるが，他の理由コードを利用しても良い。"
// * reasonCode.coding.code 0..1
// * reasonCode.coding.code ^short = "投与理由に相当する概念に対するコード"
// * reasonCode.coding.display ^short ="投与理由についてのテキスト表現"
* reasonReference ^short = "服薬理由を支持するObservation, Condition, DiagnosticReportについての参照。"
* note ^short = "他のフィールドには記述できないこのstatementについての追加情報"
* note ^definition = "他の属性には記載できないこのstatementについての備考情報"
* dosage only JP_MedicationDosage_Injection
* dosage ^short = "この薬剤がどのように服用されたのか，服用すべきだったのかを示す情報"
* dosage ^definition = "患者にこの薬剤がどのように服用すべきかを示す情報"
* dosage.extension contains
    JP_MedicationDosage_DosageComment named dosageComment ..* and
    JP_MedicationDosage_Device named device ..* and
    JP_MedicationDosage_Line named line ..* and
    JP_MedicationDosage_LineComment named lineComment ..* and
    JP_MedicationDosage_RateComment named rateComment ..*
* dosage.route.extension contains JP_MedicationDosage_RouteComment named routeComment ..*
* dosage.method.extension contains JP_MedicationDosage_MethodComment named methodComment ..*
* dosage.site.extension contains 
    $bodySite named bodySite ..* and
    JP_MedicationDosage_SiteComment named siteComment ..*