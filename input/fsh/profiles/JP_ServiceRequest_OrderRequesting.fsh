// ==============================
//   Profile 定義
// ==============================
Profile: JP_ServiceRequest_OrderRequesting
Parent: JP_ServiceRequest_OrderCommon
Id: jp-servicerequest-orderrequesting
Title: "JP Core ServiceRequest Order Requesting Profile"
Description: "本プロファイルは、オーダエントリシステムで作成されるオーダのヘッダー情報を記述するためにFHIR ServiceRequestリソースを使用するにあたっての、最低限の制約を記述したものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_ServiceRequest_OrderRequesting"
* ^status = #active
* ^date = "2026-10-31"
* . ^short = "サービスリクエスト（ヘッダー情報）"
* . ^definition = "サービスリクエストのヘッダー情報"

* code 1..
  * text 1.. MS
  