Instance: JP-Specimen-Pathology-Example
InstanceOf: JP_Specimen_Pathology
Usage: #example
Title: "JP Core Specimen Pathology Example"
Description: "病理診断レポート用検体情報のサンプルインスタンス"
* identifier.system = "http://hospital.example.org/fhir/specimen-id"
* identifier.value = "PATH-2026-00001"
* accessionIdentifier.system = "http://hospital.example.org/fhir/accession-id"
* accessionIdentifier.value = "ACC-2026-00001"
* status = #available
* type.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0487"
* type.coding.code = #TISS
* type.coding.display = "Tissue"
* type.text = "組織"
* subject = Reference(Patient/jp-patient-example)
* receivedTime = "2026-08-10T10:30:00+09:00"
* collection.collector = Reference(Practitioner/jp-practitioner-example)
* collection.collectedDateTime = "2026-08-10T09:00:00+09:00"
* collection.method.text = "生検"
* collection.bodySite.text = "胃"
* note.text = "手術検体。ホルマリン固定済み。"
