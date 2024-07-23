Profile: JP_ServiceRequest_Common
Parent:	ServiceRequest
Id: jp-servicerequest-common
Description:    "JP-ServiceRequest-Common"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_ServiceRequest_Common"
* ^status = #active
* ^date = "2024-07-18"
* meta.lastUpdated 0.. MS
* identifier ^short = "このリクエストに割り当てられた識別子"
* identifier ^definition = "注文者、受取人、注文フルフィルラーによってこのリクエストに割り当てられた識別子"
* basedOn ^short = "リクエストが達成するもの"
* basedOn ^definition = "このリクエストによって実現される計画/提案/注文"
* replaces ^short = "リクエストが代替するもの"
* replaces ^definition = "このエレメントで参照される完了または終了したリクエストをこのリクエストが代替する"
* category ^short = "サービスの分類"
* category ^definition = "「手術処置」など、検索、ソート、表示のためのサービスを分類するコード"
* code ^short = "要求されたものを示すコード"
* orderDetail ^short = "オーダの詳細情報"
* quantity[x] ^short = "サービスの費用"
* subject ^short = "サービスを実施する対象"
* encounter ^short = "リクエストが作成された状況"
* occurrence[x] ^short = "サービスが実施される日時等"
* authoredOn ^short = "リクエストが発生した日"
* requester ^short = "サービスを要求した者"
* performerType ^short = "実施者の役割（職種）"
* performer ^short = "依頼された実施者"
* performer ^definition = "要求されたサービスを行うために依頼された実施者。例えば、外科医、皮膚病理学者、内視鏡医など"
* locationCode ^short = "リクエストされた場所を示すコード"
* locationReference ^short = "リクエストされた場所"
* insurance ^short = "関連する保険カバレッジ"
* supportingInfo ^short = "追加の臨床情報"
* specimen ^short = "プロシージャーのサンプル"
* specimen ^definition = "検査手順で使用される 1 つ以上の標本"
* bodySite ^short = "体の部位"
* relevantHistory ^short = "リクエストの履歴"
* relevantHistory ^definition = "要求の履歴の主要なイベント"
