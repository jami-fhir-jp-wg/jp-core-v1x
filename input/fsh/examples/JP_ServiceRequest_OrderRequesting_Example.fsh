Instance: jp-servicerequest-orderrequesting-example-1
InstanceOf: JP_ServiceRequest_OrderRequesting
Title: "JP Core ServiceRequest Order Requesting 胸部ＣＴ検査"
Description: "胸部ＣＴ検査オーダ"
Usage: #example
* meta.lastUpdated = "2026-10-27T16:21:14+09:00"
* meta.profile[0] = $JP_ServiceRequest_OrderCommon
* meta.profile[+] = $JP_ServiceRequest_OrderRequesting
* extension[0].url = $JP_ServiceRequest_OrderType
* extension[=].valueCodeableConcept = $v2-order-type-cs#O "外来オーダ"
* extension[+].url = $JP_Common_Department
* extension[=].valueCodeableConcept = $JP_Department_SsMix_CS#05 "呼吸器科"
* identifier[0].system = "http://myhospital.com/IdSystem/ServiceRequest"
* identifier[=].value = "00000020.20261227.162128.Z999.2.16.XA0.1"
* identifier[+].type = $v2-0203#PLAC "Placer Identifier"
* identifier[=].system = "http://myhospital.com/IdSystem/OrderID"
* identifier[=].value = "202612270000301"
* status = #active
* intent = #order
* category.coding[0] = $JP_ServiceRequest_OrderCategory_CS#radiology "放射線検査"
* category.coding[+] = http://myhospital.com/CodeSystem/order-category#C16 "放射線検査"
* category.text = "放射線検査"
* priority = #routine
* code.text = "胸部ＣＴ検査"
* subject = Reference(Patient/00000020) "患者 花子"
* occurrenceDateTime = "2026-10-27"
* authoredOn = "2026-10-27T16:21:16+09:00"
* requester = Reference(Practitioner/1234567) "山田 太郎"
* reasonCode.text = "入院時スクリーニング"
* reasonReference = Reference(Condition/123) "肺炎"
* insurance = Reference(Coverage/123) "組合管掌健康保険"
* note.text = "ペースメーカ装着"
