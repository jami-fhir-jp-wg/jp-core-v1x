// ==============================
//   Profile 定義
// ==============================
Profile: JP_ServiceRequest_Common
Parent: ServiceRequest
Id: jp-servicerequest-common
Title: "JP Core ServiceRequest Common Profile"
Description: "本プロファイル説明は、患者に対し立案・実施されるリクエストの記録で、行為や診断、もしくは他のサービスのために用いられるFHIR ServiceRequestリソースを使用するにあたっての、最低限の制約を記述したものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_ServiceRequest_Common"
* ^status = #active
* ^date = "2024-09-18"
* . ^short = "サービスリクエスト"
* . ^definition = "診断のための検査、治療、手術などのサービスリクエストの記録"
//
* identifier ^short = "サービスリクエストを識別する業務ID。"
* identifier ^definition = "リクエストの発注者、受注者、サービスの実施者によるインスタンスに割り当てられた識別子。"
* identifier ^comment = "この要素は、発注者（HL7 v2 では 'Placer' ）とリクエストに応じて観察、行為等を実施した者（HL7 v2 では 'Filler' ）を区別するために用いられる。"
//
* instantiatesCanonical ^short = "FHIRのプロトコール、定義への参照"
* instantiatesCanonical ^definition = "このサービスリクエストに部分的、または完全に関わる、FHIRで定義されたプロトコル、ガイドライン、オーダセットまたは他の定義を指しているURL"
* instantiatesCanonical ^comment = "PlanDefinitionリソースは、実行されるアクションのシリーズ、シーケンス、またはグループを記述するために使用され、ActivityDefinitionリソースは、特定の各ステップまたはアクティビティを定義するために使用される。詳細は、PlanDefinition のBoundaries and Relationshipsセクションを参照してください。（訳注:R4とR4Bの本文に誤りあり、修正されたR5を翻訳）"
//
* instantiatesUri ^short = "外部のプロトコール、定義への参照"
* instantiatesUri ^definition = "このサービスリクエストに部分的、または完全に関わる、外部の管理されたプロトコール、ガイドライン、オーダセットや他の定義へのURL参照"
* instantiatesUri = "HTMLページ、PDFなど、名前で解決できないURI識別子"
//
* basedOn ^short = "リクエストするリソースへの参照"
* basedOn ^definition = "このリクエストによって実施すべき計画、提案、オーダの詳細（への参照）"
* basedOn only Reference(CarePlan or JP_ServiceRequest_Common or JP_MedicationRequest)
// 
* replaces ^short = "完了または終了したService Requestリソースの代替（への参照）"
* replaces only Reference(JP_ServiceRequest_Common)
//
* requisition ^short = "サービスリクエストの複合ID（別名 グループID）"
* requisition ^definition = "一人の発注者によっておおよそ同時に署名されたサービスリクエストの全てに共通する識別子で、複合、またはグループIDを表現する。"
* requisition ^comment = "サービスリクエストは、basedOn要素、このrequisition要素によって関係付けられる。同じrequisition要素の一部であるサービスリクエストは、初めに作成された後にその状態と管理が変化する視点から、一般的に独立して扱われる。"
// 
* status ^short = "サービスリクエストの状態"
* status ^definition = "オーダの状態"
* status ^comment = "status要素は、一般的に発注者の完全な制御下にあり、オーダが起案か有効かを決定し、有効化された後は、競合、停止、または中断される。受注者の活動に関連する状態は、対応するイベント（一般的な議論についてはEventパターンを参照）またはTaskリソースを使用して反映される。"
// * status from http://hl7.org/fhir/ValueSet/request-status (required)
// 
* intent ^short = "サービスリクエストの意図（proposal | plan | directive | order | original-order | reflex-order | filler-order | instance-order | option）"
* intent ^definition = "この要求が、提案、経過、オリジナル、繰り返しかどうかを示す。"
* intent ^comment = "この要素は、リソースが実際に適用されるタイミングや方法を意図的に変更するため、修飾子と表現される。"
// * intent from http://hl7.org/fhir/ValueSet/request-intent (required)
// 
* category ^short = "サービスリクエストの分類"
* category ^definition = "検索、分類、表示の目的でサービスを分類するコード（例 「外科的手技」）"
* category ^comment = "リソースを検索または表示するためのコンテキストまたはユースケースに応じて、複数の分類軸が存在する場合がある。粒度のレベルは、Value Setのカテゴリー概念によって定義される。"
* category from http://hl7.org/fhir/ValueSet/servicerequest-category (example)
// 
* priority ^short = "サービスリクエストの緊急度（routine | urgent | asap | stat）"
* priority ^definition = "このサービスリクエストはどの程度早く対処されるべきかを示す。"
// * priority from http://hl7.org/fhir/ValueSet/request-priority (requred)
// 
* doNotPerform ^short = "値が真の時、サービスや処置は実施不可"
* doNotPerform ^definition = "要求された特定のサービス（例、手技、診断のための検査、また検査パネル）の識別子"
* doNotPerform ^comment =  "一般的には、コードと時間枠のみであるが、時には体の部位や実施者などの修飾語を追加して、禁止範囲を狭められる。code要素とdoNotPerform要素がともに否定を含む場合、禁止を強化することになり、二重否定解釈をしてはならない。"
// 
* code ^short = "リクエストの内容を示すコード"
* code ^definition = "要求された特定のサービス（例、行為、診断のための検査、また検査パネル）の識別子"
* code ^comment = "多くの検査・放射線処置コードは、血清または血漿グルコース、胸部 X 線など、検体・器官系が検査オーダー名に埋め込まれている。検体は、検査コードとは別に記録されないかもしれない。"
* code from http://hl7.org/fhir/ValueSet/procedure-code (example)
// 
* orderDetail ^short = "追加のオーダ情報"
* orderDetail ^definition = "リクエストの提供方法に関する追加の詳細および指示。例えば、尿道カテーテルのサービスリクエストには、外部または留置カテーテルのリクエストの詳細があり、包帯のサービスリクエストには、包帯の適用方法を指定する追加の指示が必要な場合もある。"
* orderDetail ^comment = "リクエストされたサービス提供の指示についての医療記録からの情報については、supportingInformation要素を使用。"
// * orderDetail obeys prr-1
* orderDetail from http://hl7.org/fhir/ValueSet/servicerequest-orderdetail (example)
//
* quantity[x] ^short = "サービスの量"
* quantity[x] ^definition = "リクエストされるサービスの量。数量（例:1500ドルの住宅改造）、比率（例:1ヶ月に20回の半日訪問）、または範囲（例:1分間に2.0～1.8Gy）。"
* quantity[x] ^comment = "サービスリクエスト時に、項目とは別に数を指定する必要がある。"
//
* subject ^short = "サービスリクエストの対象（個人または集団）"
* subject ^definition = "サービスが実行される対象（人または物）。多くは患者だが、動物、集団（人または動物）、透析器のような装置、また場所（点家的には環境調査）も対象となる。"
* subject only Reference(JP_Patient or JP_Location)
//
* encounter ^short = "サービスがリクエストされる診療時の場面"
* encounter ^definition = "サービスがリクエストされる医療背景についての追加情報を提供する診療時の場面"
* encounter only Reference(JP_Encounter)
//
* occurrence[x] ^short = "サービスを実施すべき日時"
* occurrence[x] ^definition = "リクエストされたサービスを実施すべき日時"
//
* asNeeded[x] ^short = "前提条件"
* asNeeded[x] ^definition = "CodeableConceptが存在する場合、そのサービスを行うための前提条件を示す。例えば、「痛み」、「再発時」など。"
//
* authoredOn ^short = "リクエストの署名日時"
* authoredOn ^definition = "リクエストが有効化された日時"
//
* requester ^short = "サービスを要求した人または物（要求者、発注者）"
* requester ^definition = "リクエストを開始し、その有効化に責任を持つ個人"
* requester ^comment = "伝言をする者ではなく、署名者。この要素は、Provenanceリソースを通じて管理される委任を扱うことを意図していない。"
* requester only Reference(JP_Practitioner or JP_PractitionerRole or JP_Organization or JP_Patient or JP_RelatedPerson or JP_Device)
//
* performerType ^short = "実施者の役割"
* performerType ^definition = "リクエストされたサービスの実施者の役割"
* performerType ^comment = "参加者の資格ではなく役割。タスクではなく、能力を記述。例えば、「調剤薬局」、「精神科医」、「院内紹介」など。"
//
* performer ^short = "サービスの実施者"
* performer ^definition = "リクエストされたサービスを行うために望ましい実施者。例えば、外科医、皮膚病理医、内視鏡医など。"
* performer ^comment = "実施者が複数の場合、順番に関係なく、優先順位のない実施者のリストとして解釈される。優先順位が必要な場合は、request.performerOrder 拡張を使用する。実施者のグループ（例えば、医師Aと医師B）を表すには、CareTeamを使用する。"
* performer only Reference(JP_Practitioner or JP_PractitionerRole or JP_Organization or JP_Patient or JP_Device or JP_RelatedPerson or CareTeam)
//
* locationCode ^short = "リクエストされた場所"
* locationCode ^definition = "実際に行為が行われるべき好ましい場所を、コード化またはフリーテキスト形式で記述。例：自宅や介護施設など。"
// * locationCode from http://terminology.hl7.org/ValueSet/v3-ServiceDeliveryLocationRoleType (exmple)
//
* locationReference ^short = "リクエストされた場所（参照）"
* locationReference ^definition = "実際に行為が行われるべき好ましい場所（複数可）への参照。例：自宅や介護施設など。"
* locationReference only Reference(JP_Location)
//
* reasonCode ^short = "行為やサービスの説明・理由"
* reasonCode ^definition = "このサービスがリクエストされる理由についての説明または根拠をコード化またはテキスト化したもの。しばしば（保険）請求を目的とされる。supportingInfoで参照されるリソースに関連する場合がある。"
* reasonCode ^comment = "この要素は照会理由を表し、サービスがどのように実行されるか、あるいは全く実行されないかどうかを決定するために使用される。CTスキャンの例で示したように、データが自由記述の場合は、CodeableConcept.text要素を使用する。"
//
* reasonReference ^short = "行為やサービスの説明・理由（参照）"
* reasonReference ^definition = "このサービスが要求される理由の正当性を提供する他のリソースを示す。supportingInfoで参照されるリソースに関連する場合がある。"
* reasonReference ^comment = "この要素は照会理由を表し、サービスがどのように実行されるか、あるいは全く実行されないかどうかを決定するために使用される。可能な限り具体的にするために、ObservationやConditionリソースへの参照が可能であれば使用されるべきである。また、DiagnosticReport を参照する場合は、DiagnosticReport.conclusion および/または DiagnosticReport.conclusionCode を参照する必要がある。DocumentReference への参照を使用する場合、ターゲット文書は、このサービス要求の関連理由を提供する明確な所見言語を含んでいなければならない。CTスキャンの例に示すように、データが自由記述（符号化されていない）の場合、 ServiceRequest.reasonCodeにCodeableConcept.text要素を使用する。"
* reasonReference only Reference(JP_Condition or JP_Observation_Common or JP_DiagnosticReport_Common or DocumentReference)
//
* insurance ^short = "関連する保険情報"
* insurance ^definition = "リクエストされたサービスを提供するために必要な保険プラン、適用範囲拡大、事前承認、および/または事前決定がある。"
* insurance only Reference(JP_Coverage or ClaimResponse)
//
* supportingInfo ^short = "追加の補助的な臨床情報（別名 オーダエントリー時の質問 Ask at Order Entry question; AOEs）"
* supportingInfo ^definition = "サービスやその解釈に影響を与える可能性のある、患者や検体に関する追加の臨床情報。この情報には、診断、臨床所見、その他の観察が含まれる。検査のオーダでは、一般的に「オーダエントリー時の質問（AOEs）」と呼ばれ ている。これには、オーダを完了するために必要な文脈や裏付けとなる情報を提供するために、実施者が明示的に要求した観察が含まれる。例えば、血液ガス測定のための吸入酸素量の報告などである。"
* supportingInfo ^comment = "サービスの提供方法に関する情報を表すには、instructions 要素を使用する。"
//
* specimen ^short = "検体"
* specimen ^definition = "検査で使用する１つ以上の検体"
* specimen ^comment = "多くの診断的行為は検体を必要とするが、リクエスト自体は実際には検体に関するものではない。この要素は、診断検査が既に存在する検体に対してリクエストされ、適用される検体を参照するためのものである。逆に、検体が未知の時に最初にリクエストが入力された場合、SpecimenリソースがServiceRequestリソースを参照する。"
* specimen only Reference(JP_Specimen)
//
* bodySite ^short = "体の部位（別名 場所）"
* bodySite ^definition = "行為を実施すべき解剖学的部位。目標とする場所。"
* bodySite ^comment = "ServiceRequest.codeにあるコードに暗黙の了解がない場合にのみ使用する。使用例として、BodySiteをインラインコード化された要素ではなく、別のリソースとして扱う必要がある場合（例えば、別々に識別し追跡するため）、procedure.targetBodyStructureの拡張を使用してください。"
// * bodySite from http://hl7.org/fhir/ValueSet/body-site (exmple)
//
* note ^short = "コメント"
* note ^definition = "サービス要求について作成された、その他のメモやコメント。例えば、内部請求のメモなど。"
//
* patientInstruction ^short = "患者、消費者向けの説明"
* patientInstruction ^definition = "患者または消費者が理解できる言葉で指示。"
//
* relevantHistory ^short = "リソースの履歴（バージョン管理）"
* relevantHistory ^definition = "このリクエストの履歴で重要なもの"
* relevantHistory ^comment = "この要素はには、ServiceRequestのProvenanceの全てのバージョンではなく、重要と思われたものだけ含められる。現在のバージョンのリソースに関連したProvenanceリソースを含めてはならない（SHALL NOT）。（もし、Provenanceとして重要な変化と思われれば、以降の更新の一部として追加すべきである。それまでは、'_revinclude'を使って指定されたProvenanceのバージョンを直接クエリーできる。全てのProvenanceはこのRequestの履歴を対象とすべきである。）"


// Invariant: prr-1
// Severity: #error
// Description: "code要素がある場合のみ、orderDetail要素は存在"
// Expression: "orderDetail.empty() or code.exists()"