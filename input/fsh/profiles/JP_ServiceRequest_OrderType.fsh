// ==============================
//   Extension 定義
// ==============================
Extension: JP_ServiceRequest_OrderType
Id: jp-servicerequest-ordertype
Title: "JP Core ServiceRequest Order Type"
Description: "オーダの入外区分について記述する。"
* ^url = $JP_ServiceRequest_OrderType
* ^status = #active
* ^date = "2026-10-31"
* ^purpose = "JP_ServiceRequest_OrderCommonにおいてオーダの入外区分を記述できるようにする。"
* ^context.type = #element
* ^context.expression = "ServiceRequest"
* . ^short = "オーダ入外区分"
* . ^definition = "オーダの入外区分を記述す津ための拡張"
* url = $JP_ServiceRequest_OrderType (exactly)
* value[x] 1..1
* value[x] only CodeableConcept
* valueCodeableConcept.coding from $v2-order-type-vs (required)
* valueCodeableConcept.coding 1..1
* valueCodeableConcept.coding.system = $v2-order-type-cs (exactly)
* valueCodeableConcept.coding.code 1..1
* value[x] ^short = "オーダ入外区分"
* value[x] ^definition = "オーダ入外区分を記述する"