Instance: JP-Media-Pathology-Example-01
InstanceOf: JP_Media_Pathology
Usage: #example
Title: "JP Core Media Pathology Example 01"
Description: "病理画像メディアのサンプルインスタンス"
* identifier.system = "urn:oid:1.2.392.100495.20.3.11"
* identifier.value = "MEDIA-PATH-001-001"
* status = #completed
* type = http://terminology.hl7.org/CodeSystem/media-type#image "Image"
* modality = http://dicom.nema.org/resources/ontology/DCM#XC "External-camera Photography"
* subject = Reference(Patient/jp-patient-example-1)
* issued = "2026-08-10T10:30:00+09:00"
* content.contentType = #image/jpeg
* content.url = "http://example.org/fhir/media/pathology/specimen-001.jpg"
* content.title = "病理検体画像 001"
* note.text = "臓器全体像の撮影画像"
