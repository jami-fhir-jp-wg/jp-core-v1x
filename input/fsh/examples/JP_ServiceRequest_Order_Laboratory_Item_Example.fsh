// 検体検査の個別検査項目（γ-GTP）の例
// ※ 依頼単位との関係付けは JP Core では規定しないため、
//    この例では basedOn、requisition を設定していない。
Instance: jp-servicerequest-order-laboratory-item-example-1
InstanceOf: JP_ServiceRequest_Order_Laboratory_Item
Title: "JP Core ServiceRequest Order Laboratory Item Example 個別検査項目（γ-GTP）"
Description: "検体検査の個別検査項目（γ-GTP）の例。標準コード（JLAC10）とローカルコードの両方を設定している。"
Usage: #example
* identifier[0].system = "http://example.org/abc-hospital/fhir/ServiceRequest/orderItemNo"
* identifier[=].value = "000000000012345_12345678_023_03090"
* status = #active
* intent = #order
* priority = #routine
* code.coding[0] = http://example.org/abc-hospital/fhir/Observation/localcode#03090 "γ-GTP"
* code.coding[+] = $JP_ObservationLabResultCode_CS#3B090000002327201
* code.text = "γ-GTP"
* subject = Reference(Patient/jp-patient-example-1)
* encounter = Reference(Encounter/jp-encounter-example-1)
* occurrenceDateTime = "2021-10-19T01:15:00+09:00"
* authoredOn = "2021-10-19T01:00:00+09:00"
* requester = Reference(Practitioner/jp-practitioner-example-female-1)
* specimen = Reference(Specimen/jp-specimen-example-1)

// 検体検査の個別検査項目（クレアチニン）の例（最小構成に近い例）
Instance: jp-servicerequest-order-laboratory-item-example-2
InstanceOf: JP_ServiceRequest_Order_Laboratory_Item
Title: "JP Core ServiceRequest Order Laboratory Item Example 個別検査項目（クレアチニン）"
Description: "検体検査の個別検査項目（クレアチニン）の例。依頼単位を送信せず、個別検査項目を並べて表現するユースケースを想定し、ローカルコードのみを設定している。"
Usage: #example
* identifier[0].system = "http://example.org/abc-hospital/fhir/ServiceRequest/orderItemNo"
* identifier[=].value = "000000000012345_12345678_023_03015"
* status = #active
* intent = #order
* code.coding[0] = http://example.org/abc-hospital/fhir/Observation/localcode#03015 "クレアチニン"
* code.text = "クレアチニン"
* subject = Reference(Patient/jp-patient-example-1)
* occurrenceDateTime = "2021-10-19T01:15:00+09:00"
