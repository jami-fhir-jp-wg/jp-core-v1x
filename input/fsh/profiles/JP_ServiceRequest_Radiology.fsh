// ==============================  
//   Profile 定義  
// ==============================  
Profile: JP_ServiceRequest_Radiology_Item  
Parent: JP_ServiceRequest_Common  
Id: jp-servicerequest-radiology-item  
Title: "JP Core ServiceRequest Radiology Item Profile"  
Description: "本プロファイルはJP_ServiceRequest_Commonプロファイルから派生したもので、放射線検査オーダのボディ情報（個々の放射線検査の内容）を表現するための制約を記述したものである。個々の放射線検査の内容はJP_ServiceRequest_Radiology_Itemで表現する。"  
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_ServiceRequest_Radiology_Item"  
* ^status = #active  
* ^date = "2026-10-06"  
* . ^short = "放射線検査オーダのボディ情報"  
* . ^definition = "放射線検査オーダのボディ情報（個々の放射線検査の内容）を表現する。放射線検査項目の粒度は、JJ1017の検査項目単位とする。"  
//  
* identifier ^comment = "この要素は、発注者（HL7 v2 では 'Placer' ）とリクエストに応じて観察、行為等を実施した者（HL7 v2 では 'Filler' ）を区別するために用いられる。【JP Core仕様】オーダリングシステムがオーダー単位に付番する識別番号＋枝番を格納する。親はオーダー番号、子はオーダー番号＋枝番とする。"  
//  
// TODO: 親オーダ側プロファイル（JP_ServiceRequest_Radiology_Requesting）の定義確定後に参照先を絞り込む  
* basedOn 1..*  
* basedOn ^comment = "【JP Core仕様】元となるサービスリクエスト（放射線検査オーダのヘッダー情報）を参照する。"  
//  
* intent = #order  
* intent ^comment = "【JP Core仕様】本プロファイルでは \"order\" 固定とする。"  
//  
// category にオーダ種別 slice を定義  
* category ^slicing.discriminator.type = #value  
* category ^slicing.discriminator.path = "$this"  
* category ^slicing.rules = #open  
* category contains orderCategory 1..1  
// TODO: JP_ServiceRequestOrderCategory_VS は未定義。CodeSystem/ValueSet の確定後にバインドする  
// * category[orderCategory] from $JP_ServiceRequestOrderCategory_VS (required)  
* category[orderCategory] ^short = "オーダ種別"  
* category[orderCategory] ^comment = "【JP Core仕様】オーダ種別を格納する。放射線検査オーダは \"imaging\" を指定する。"  
//  
* code 1..1  
* code ^short = "オーダー内容を示すコード（JJ1017コード）"  
* code ^comment = "【JP Core仕様】JJ1017コード（JJ1017-16M: 前方16桁）は必須。code.display には検査を識別できる名称を記述する（JJ1017指針に従う、あるいはローカルで定義する）。"  
// TODO: JJ1017 の CodeSystem/ValueSet 未定義。確定後に code.coding への slice および from バインディングを追加する  
//  
* subject only Reference(JP_Patient)  
* subject ^short = "対象患者"  
//  
* encounter only Reference(JP_Encounter)  
* encounter ^comment = "【JP Core仕様】この検査が関連しているEncounterリソース。JP_Encounter（固定）。"  
//  
* occurrence[x] ^short = "オーダーの予約日時"  
* occurrence[x] ^comment = "【JP Core仕様】実施日時が確定しているものを記述する。予約不要、または日付未定の予約は記述しない（occurrence 要素ごと省略する）。日付が決まった時点で update して値を入れる。"  
//  
* requisition 1..1  
* requisition ^short = "オーダ番号（ローカルコード）"  
//  
* requester 1..1  
* requester ^short = "オーダー依頼医"  
* requester only Reference(JP_Practitioner or JP_PractitionerRole)  
//  
* performerType ^comment = "【JP Core仕様】放射線検査では実施時に登録されるため、依頼時は原則設定されない。"  
* performer ^comment = "【JP Core仕様】放射線検査では実施時に登録されるため、依頼時は原則設定されない。"  
//  
* reasonCode ^comment = "【JP Core仕様】日本では病名・検査目的・依頼理由が自由文で書かれるのが一般的。CodeableConcept は coding のほかに text 要素を持てるため、コード化されていないテキストも表現できる。病名は coding、検査目的は text とし、検査目的と依頼理由を分けたい場合は reasonCode 自体を複数持つ（0..*）。"  
* reasonReference ^comment = "【JP Core仕様】病名等の理由を提供するリソースへの参照。可能な限り Observation や Condition リソースへの参照を使用する。"  
//  
// supportingInfo：造影剤アレルギー・腎機能・妊娠・体内金属等の付帯情報  
// TODO: MustSupport 付与は JP Core 方針（原則非付与）と矛盾するため要SWG確認。採用する場合は制約定義文も確定させる  
* supportingInfo MS  
* supportingInfo ^definition = "造影剤アレルギー・腎機能・妊娠・体内金属等の付帯情報を記述する。"  
* supportingInfo ^comment = "【JP Core仕様】アレルギーは JP_AllergyIntolerance、腎機能・体重は JP_Observation_Common、妊娠は JP_Condition、体内金属（インプラント、ペースメーカー等）は Device、上記で表現できないもの（入れ墨等）は DocumentReference にテキストで格納する。問診票は QuestionnaireResponse の利用も検討される。新しいリソース種別が出てくる可能性があるため Resource を末尾に残し閉じない。"  
* supportingInfo only Reference(JP_AllergyIntolerance or JP_Observation_Common or JP_Condition or JP_Device or JP_DocumentReference or QuestionnaireResponse or Resource)  
//  
* specimen ^comment = "【JP Core仕様】画像検査では原則不要。"  
//  
* bodySite ^comment = "【JP Core仕様】JJ1017の大部位または小部位によって表現する。JJ1017の部位リスト参照、または JP Core 独自定義は継続検討。"  
//  
* note ^comment = "【JP Core仕様】依頼時のフリーコメント運用のため使用する。"
