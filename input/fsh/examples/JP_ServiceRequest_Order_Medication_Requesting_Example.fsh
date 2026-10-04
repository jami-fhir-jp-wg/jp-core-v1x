Instance: jp-servicerequest-order-medication-requesting-example-1
InstanceOf: JP_ServiceRequest_Order_Medication_Requesting
Title: "JP Core ServiceRequest Order Medication Requesting Example 処方オーダ"
Description: "外来院外処方のオーダヘッダー情報"
Usage: #example
* identifier[0].system = $JP_ResourceInstance_Identifier
* identifier[=].value = "1234567890"
* requisition.system = $JP_ResourceInstance_Identifier
* requisition.value = "1234567890"
* status = #active
* intent = #order
* category[orderCategory] = $JP_ServiceRequestOrderCategory_CS#prescription "処方"
* category[medicationCategory][0] = $JP_MedicationCategoryMERIT9_CS#OHP "外来処方"
* category[medicationCategory][+] = $JP_MedicationCategoryMERIT9_CS#OHO "院外処方"
* code.text = "処方オーダ"
* subject = Reference(Patient/jp-patient-example-1)
* authoredOn = "2026-04-01T10:00:00+09:00"
* requester = Reference(Practitioner/jp-practitioner-example-female-1)

Instance: jp-servicerequest-order-medication-requesting-example-2
InstanceOf: JP_ServiceRequest_Order_Medication_Requesting
Title: "JP Core ServiceRequest Order Medication Requesting Example 注射オーダ"
Description: "入院定時注射のオーダヘッダー情報"
Usage: #example
* identifier[0].system = $JP_ResourceInstance_Identifier
* identifier[=].value = "1234567891"
* requisition.system = $JP_ResourceInstance_Identifier
* requisition.value = "1234567891"
* status = #active
* intent = #order
* category[orderCategory] = $JP_ServiceRequestOrderCategory_CS#injection "注射"
* category[medicationCategory][0] = $JP_MedicationCategoryMERIT9_CS#IHP "入院処方"
* category[medicationCategory][+] = $JP_MedicationCategoryJHSI0001_CS#FTP "定時処方"
* code.text = "注射オーダ"
* subject = Reference(Patient/jp-patient-example-1)
* authoredOn = "2026-04-01T09:00:00+09:00"
* requester = Reference(Practitioner/jp-practitioner-example-female-1)
