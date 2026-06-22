// JP_Department Extension Usage Example
// Example 1: Using valueCodeableConcept with SS-MIX code
Instance: jp-medicationrequest-department-example-01
InstanceOf: JP_MedicationRequest
Title: "JP Core MedicationRequest with Department Extension Example (CodeableConcept)"
Description: "JP_Department拡張を使用したMedicationRequestの例。診療科情報をSS-MIX2コードで表現する。"
Usage: #example
* extension[http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Common_Department].valueCodeableConcept = $JP_Department_SsMix_CS#01 "内科"
* identifier[rpNumber].system = $JP_Medication_RPGroupNumber
* identifier[rpNumber].value = "1"
* identifier[orderInRp].system = $JP_MedicationAdministrationIndex
* identifier[orderInRp].value = "1"
* identifier[requestIdentifier].system = $JP_ResourceInstance_Identifier
* identifier[requestIdentifier].value = "MR-20230401-0001"
* identifier[prescriptionIdentifierCommon].system = $JP_IdSystem_PrescriptionDocumentID
* identifier[prescriptionIdentifierCommon].value = "20230401-0000000001"
* status = #active
* intent = #order
* medicationCodeableConcept = urn:oid:1.2.392.100495.20.2.74#103831601 "カロナール錠２００"
* subject = Reference(jp-patient-example-1)
* authoredOn = "2023-04-01T12:00:00+09:00"
* dosageInstruction.text = "内服・経口・１日３回朝昼夕食後"
* dosageInstruction.timing.code = urn:oid:1.2.392.100495.20.2.31#1013044400000000 "内服・経口・１日３回朝昼夕食後"
* dosageInstruction.route = urn:oid:2.16.840.1.113883.3.1937.777.10.5.162#PO "口"
* dosageInstruction.doseAndRate.doseQuantity = 1 $JP_MedicationUnitMERIT9_CS#TAB "錠"
* dispenseRequest.quantity = 21 $JP_MedicationUnitMERIT9_CS#TAB "錠"

// Example 2: Using valueReference to JP_Organization_Department
Instance: jp-medicationrequest-department-example-02
InstanceOf: JP_MedicationRequest
Title: "JP Core MedicationRequest with Department Extension Example (Reference)"
Description: "JP_Department拡張を使用したMedicationRequestの例。診療科情報をJP_Organization_Departmentへの参照で表現する。"
Usage: #example
* extension[http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Common_Department].valueReference = Reference(jp-organization-department-example-01)
* extension[http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Common_Department].valueReference.display = "第一内科"
* identifier[rpNumber].system = $JP_Medication_RPGroupNumber
* identifier[rpNumber].value = "2"
* identifier[orderInRp].system = $JP_MedicationAdministrationIndex
* identifier[orderInRp].value = "1"
* identifier[requestIdentifier].system = $JP_ResourceInstance_Identifier
* identifier[requestIdentifier].value = "MR-20230401-0002"
* identifier[prescriptionIdentifierCommon].system = $JP_IdSystem_PrescriptionDocumentID
* identifier[prescriptionIdentifierCommon].value = "20230401-0000000002"
* status = #active
* intent = #order
* medicationCodeableConcept = urn:oid:1.2.392.100495.20.2.74#110626901 "ロキソプロフェンNa錠６０ｍｇ「サワイ」"
* subject = Reference(jp-patient-example-1)
* authoredOn = "2023-04-01T14:00:00+09:00"
* dosageInstruction.text = "内服・経口・１日３回朝昼夕食後"
* dosageInstruction.timing.code = urn:oid:1.2.392.100495.20.2.31#1013044400000000 "内服・経口・１日３回朝昼夕食後"
* dosageInstruction.route = urn:oid:2.16.840.1.113883.3.1937.777.10.5.162#PO "口"
* dosageInstruction.doseAndRate.doseQuantity = 1 $JP_MedicationUnitMERIT9_CS#TAB "錠"
* dispenseRequest.quantity = 9 $JP_MedicationUnitMERIT9_CS#TAB "錠"

// Example 3: Using valueCodeableConcept with text only (no code)
Instance: jp-servicerequest-department-example-03
InstanceOf: JP_ServiceRequest_Common
Title: "JP Core ServiceRequest with Department Extension Example (Text only)"
Description: "JP_Department拡張を使用したServiceRequestの例。診療科情報をテキストのみで表現する。"
Usage: #example
* extension[http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Common_Department].valueCodeableConcept.text = "消化器腫瘍外科"
* identifier[0].system = "http://example.org/abc-hospital/serviceRequest-identifier"
* identifier[=].value = "SR-2023-0401-001"
* status = #active
* intent = #order
* code.text = "CT検査"
* subject = Reference(jp-patient-example-1)
* authoredOn = "2023-04-01T10:00:00+09:00"
