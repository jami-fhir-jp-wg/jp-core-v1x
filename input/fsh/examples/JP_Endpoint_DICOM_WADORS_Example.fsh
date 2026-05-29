// ====================================
//   Endopoint DICOM WADO-RS Example
// ====================================
Instance: endpoint-dicom-wadors-example
InstanceOf: Endpoint
Title: "Endpoint DICOM WADO-RS Example"
Description: "DICOM WADO-RS Example"
Usage: #example
* status = #active
* identifier.use = #usual
* identifier.system = "http://example.org/abc-hospital/fhir/identifier"
* identifier.value = "example-wadors"
* status = #active
* connectionType = http://terminology.hl7.org/CodeSystem/endpoint-connection-type#dicom-wado-rs
* payloadType.text = "DICOM WADO-RS"
* payloadMimeType = urn:ietf:bcp:13#application/dicom
* name = "ABC Hospital PACS DICOM WADO-RS endpoint"
* address = "http://example.org/abc-hospital/wado-rs"
