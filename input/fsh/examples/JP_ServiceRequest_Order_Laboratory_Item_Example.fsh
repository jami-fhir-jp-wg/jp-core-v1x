// 2つの例は、最低限のサンプル（Example 1）と、項目を付加したサンプル（Example 2）である。
// 検査項目ごとの記述方法を定めるものではない。
// ※ 依頼単位との関係付けは JP Core では規定しないため、
//    いずれの例でも basedOn、requisition を設定していない。

// 最低限のサンプル：必須要素のみ（γ-GTP）
Instance: jp-servicerequest-order-laboratory-item-example-1
InstanceOf: JP_ServiceRequest_Order_Laboratory_Item
Title: "JP Core ServiceRequest Order Laboratory Item Example 個別検査項目（γ-GTP）"
Description: "検体検査の個別検査項目の最低限のサンプル。必須要素（identifier、status、intent、category、code、subject）のみを設定している。検査項目が γ-GTP であることに特別な意味はなく、γ-GTP の記述方法を定めるものではない。"
Usage: #example
* identifier[0].system = "http://example.org/abc-hospital/fhir/ServiceRequest/orderItemNo"
* identifier[=].value = "000000000012345_12345678_023_03090"
* status = #active
* intent = #order
* category[laboratory] = $JP_SimpleObservationCategory_CS#laboratory
* code.coding[0] = http://example.org/abc-hospital/fhir/Observation/localcode#03090 "γ-GTP"
* code.coding[+] = $JP_ObservationLabResultCode_CS#3B090000002327201
* code.text = "γ-GTP"
* subject = Reference(Patient/jp-patient-example-1)

// 項目を付加したサンプル：任意要素も設定（クレアチニン）
Instance: jp-servicerequest-order-laboratory-item-example-2
InstanceOf: JP_ServiceRequest_Order_Laboratory_Item
Title: "JP Core ServiceRequest Order Laboratory Item Example 個別検査項目（クレアチニン）"
Description: "検体検査の個別検査項目に項目を付加したサンプル。必須要素に加え、検体検査の依頼で使用する任意要素（緊急度、検査目的、依頼病名、依頼者、検体など）を設定している。すべての要素の設定を求めるものではなく、検査項目がクレアチニンであることにも特別な意味はない。"
Usage: #example
* identifier[0].system = "http://example.org/abc-hospital/fhir/ServiceRequest/orderItemNo"
* identifier[=].value = "000000000012345_12345678_023_03015"
* status = #active
* intent = #order
* category[laboratory] = $JP_SimpleObservationCategory_CS#laboratory
* priority = #routine
* code.coding[0] = http://example.org/abc-hospital/fhir/Observation/localcode#03015 "クレアチニン"
* code.coding[+] = $JP_ObservationLabResultCode_CS#3C015000002327101
* code.text = "クレアチニン"
* subject = Reference(Patient/jp-patient-example-1)
* encounter = Reference(Encounter/jp-encounter-example-1)
* occurrenceDateTime = "2021-10-19T01:15:00+09:00"
* authoredOn = "2021-10-19T01:00:00+09:00"
* requester = Reference(Practitioner/jp-practitioner-example-female-1)
* performerType.text = "検体検査部門"
* performer = Reference(Organization/jp-organization-example-inspection)
* reasonCode.text = "化学療法前の腎機能評価"
* reasonReference = Reference(Condition/jp-condition-example-1)
* insurance = Reference(Coverage/jp-coverage-example-1)
* specimen = Reference(Specimen/jp-specimen-example-1)
* note.text = "化学療法の開始前日までに結果が必要。"
