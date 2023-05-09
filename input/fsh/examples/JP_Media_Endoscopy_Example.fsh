// =================================
//   Media Endoscopy Example
// =================================
Instance: jp-media-endoscopy-example-1
InstanceOf: JP_Media_Endoscopy
Title: "JP Core Media Endoscopy Example 内視鏡画像"
Description: "内視鏡画像"
Usage: #example
* identifier.system = "http://samplehospital.org/fhir/endoscopysystem/imaging-orders"
* identifier.value = "202304250945280001"
* status = #completed
* type = #image
* modality = https://dicom.nema.org/medical/dicom/current/output/chtml/part16/sect_CID_29.html#ES "Endoscopy"
* subject = Reference(Patient/jp-patient-example-1) "東京 太郎"
* createdDateTime = "2023-04-26"
* height = 1080
* width = 1920
// =================================
//   contentの記載方法要確認
// =================================
* content.contentType = #image/jpeg
* content.url = "http://samplehospital.org/fhir/binary/A20230426001"
* content.creation = "2023-04-26"
