// ==============================
//   Profile 定義
// ==============================
Profile: JP_ServiceRequest_OrderCommon
Parent: JP_ServiceRequest_Common
Id: jp-servicerequest-ordercommon
Title: "JP Core ServiceRequest Order Common Profile"
Description: "本プロファイルは、オーダエントリシステムで作成されるオーダ情報の共通的な属性を記述するためにFHIR ServiceRequestリソースを使用するにあたっての、最低限の制約を記述したものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_ServiceRequest_OrderCommon"
* ^status = #active
* ^date = "2026-10-31"
* . ^short = "サービスリクエスト（オーダ共通）"
* . ^definition = "オーダ共通サービスリクエスト"
* meta.lastUpdated 0.. MS

//
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains
    JP_Common_Department named department 0..1 and
    JP_ServiceRequest_OrderType named orderType 0..1

//
* identifier ^short = "サービスリクエストを識別する業務ID"
* identifier ^definition = "リクエストの発注者、受注者、サービスの実施者によるインスタンスに割り当てられた識別子。\n
【JP Core】本プロファイルでは追加インスタンスでオーダIDを記述する。"
* identifier ^comment = "この要素は、発注者（HL7 v2 では 'Placer' ）とリクエストに応じて観察、行為等を実施した者（HL7 v2 では 'Filler' ）を区別するために用いられる。"
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier contains orderID 0..1
* identifier[orderID] ^short = "オーダID"
* identifier[orderID] ^definition = "オーダIDを記述する"
* identifier[orderID].system = $JP_ServiceRequset_OrderID (exactly)

// 
* intent = #order (exactly)
* intent ^short = "サービスリクエストの意図（【JP Core】「order」固定）"
* intent ^definition = "この要求が、提案、経過、オリジナル、繰り返しかどうかを示す。\n
【JP Core】本プロファイルでは「order」固定とする。"
* intent ^comment = "この要素は、リソースが実際に適用されるタイミングや方法を意図的に変更するため、修飾子と表現される。"
// 
* category ^short = "サービスリクエストの分類（【JP Core】オーダ種別）"
* category ^definition = "検索、分類、表示の目的でサービスを分類するコード（例 「外科的手技」）。\n
【JP Core】本プロファイルでは「オーダ種別」を記述する。"
* category ^comment = "リソースを検索または表示するためのコンテキストまたはユースケースに応じて、複数の分類軸が存在する場合がある。粒度のレベルは、Value Setのカテゴリー概念によって定義される。"
* category ^slicing.discriminator.type = #pattern
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category contains first 1..1
* category[first] ^short = "オーダ種別"
* category[first] ^definition = "オーダ種別を記述する"
* category[first] from $JP_ServiceRequest_OrderCategory_VS (required)
* category[first].coding.code 1..

// 
* priority ^short = "サービスリクエストの緊急度（routine | urgent | asap | stat）（【JP Core】優先度）"
* priority ^definition = "このサービスリクエストはどの程度早く対処されるべきかを示す。\n
【JP Core】本プロファイルでは「優先度」を記述する。"
//
* occurrence[x] ^short = "サービスを実施すべき日時（【JP Core】実施予定日時）"
* occurrence[x] ^definition = "リクエストされたサービスを実施すべき日時。\n
【JP Core】本プロファイルでは「実施予定日時」を記述する。"
//
* authoredOn ^short = "リクエストの署名日時（【JP Core】依頼日時）"
* authoredOn ^definition = "リクエストが有効化された日時。\n
【JP Core】本プロファイルでは「依頼日時」を記述する。"
//
* requester ^short = "サービスを要求した人または物（要求者、発注者）（【JP Core】依頼者）"
* requester ^definition = "リクエストを開始し、その有効化に責任を持つ個人。\n
【JP Core】【JP Core】本プロファイルでは「依頼者」を記述する。"
* requester ^comment = "伝言をする者ではなく、署名者。この要素は、Provenanceリソースを通じて管理される委任を扱うことを意図していない。"
* requester only Reference(JP_Practitioner or JP_PractitionerRole or JP_Organization or JP_Patient or JP_RelatedPerson or JP_Device)
//
* reasonCode ^short = "行為やサービスの説明・理由（【JP Core】検査目的、依頼病名）"
* reasonCode ^definition = "このサービスがリクエストされる理由についての説明または根拠をコード化またはテキスト化したもの。しばしば（保険）請求を目的とされる。supportingInfoで参照されるリソースに関連する場合がある。\n
本プロファイルでは「検査目的」および「依頼病名」を記述できる。"
* reasonCode ^comment = "この要素は照会理由を表し、サービスがどのように実行されるか、あるいは全く実行されないかどうかを決定するために使用される。CTスキャンの例で示したように、データが自由記述の場合は、CodeableConcept.text要素を使用する。"
//
* reasonReference ^short = "行為やサービスの説明・理由（参照）（【JP Core】依頼病名Condition）"
* reasonReference ^definition = "このサービスが要求される理由の正当性を提供する他のリソースを示す。supportingInfoで参照されるリソースに関連する場合がある。\n
【JP Core】本プロファイルではConditionリソースとして表された「依頼病名」を参照できる。"
* reasonReference ^comment = "この要素は照会理由を表し、サービスがどのように実行されるか、あるいは全く実行されないかどうかを決定するために使用される。可能な限り具体的にするために、ObservationやConditionリソースへの参照が可能であれば使用されるべきである。また、DiagnosticReport を参照する場合は、DiagnosticReport.conclusion および/または DiagnosticReport.conclusionCode を参照する必要がある。DocumentReference への参照を使用する場合、ターゲット文書は、このサービス要求の関連理由を提供する明確な所見言語を含んでいなければならない。CTスキャンの例に示すように、データが自由記述（符号化されていない）の場合、 ServiceRequest.reasonCodeにCodeableConcept.text要素を使用する。"
* reasonReference only Reference(JP_Condition or JP_Observation_Common or JP_DiagnosticReport_Common or DocumentReference)
//
* note ^short = "コメント（【JP Core】依頼コメント）"
* note ^definition = "サービス要求について作成された、その他のメモやコメント。例えば、内部請求のメモなど。\n
【JP Core】本プロファイルでは「依頼コメント」を記述できる。"
