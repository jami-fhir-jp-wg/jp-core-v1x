Instance: jp-servicerequest-radiology-item-example-1  
InstanceOf: JP_ServiceRequest_Radiology_Item  
Title: "JP Core ServiceRequest Radiology Item Example 1"  
Description: "放射線検査オーダ項目の例"  
Usage: #example  
* basedOn = Reference(ServiceRequest/jp-servicerequest-example-1)
* status = #active  
* intent = #order  
// TODO: JP_ServiceRequestOrderCategory_CS 確定後に system/code を修正  
* category[orderCategory].coding.code = #imaging  
* category[orderCategory].coding.display = "放射線検査"  
// TODO: JJ1017 CS 確定後に修正（JJ1017-16M 前方16桁）  
* code.coding.code = #TODO  
* code.coding.display = "胸部X線撮影" // TODO: 実値  
* subject = Reference(Patient/jp-patient-example-1)  
* requester = Reference(Practitioner/jp-practitioner-example-male-1)  
* requisition.system = "http://example.hospital.jp/fhir/order-number" // TODO: 実値  
* requisition.value = "R20260903001"                                   // TODO: 実値  
* occurrenceDateTime = "2026-09-10T10:00:00+09:00"                     // TODO: 実値  
* reasonCode[0].text = "肺炎疑い"        // TODO: 実値（Condition参照は reasonReference も可）  
* reasonCode[+].text = "胸部X線検査目的"  // TODO: 実値  
* authoredOn = "2026-09-03T09:00:00+09:00"
