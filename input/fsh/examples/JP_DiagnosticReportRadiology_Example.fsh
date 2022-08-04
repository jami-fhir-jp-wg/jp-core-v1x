Instance: jp-diagnosticreport-radiology-example-1
InstanceOf: JP_DiagnosticReport_Radiology
Title: "JP Core DiagnosticReport Radiology Example1"
Description: "放射線レポート1"
Usage: #example
* contained[0] = jp-imagingstudy-radiology-example-1
* identifier.use = #usual
* identifier.system = "http://jpfhir.jp/fhir/Common/IdSystem/resourceInstance-identifier"
* identifier.value = "123456"
* status = #final
* category = $diagnostic-service-sectionid-cs#RAD
* code = http://loinc.org#10191-5 "Physical findings of Abdomen Narrative"
* subject = Reference(Patient/jp-patient-example-1)
* effectiveDateTime = "2008-06-17"
* issued = "2008-06-18T09:23:00+10:00"
* performer = Reference(Practitioner/jp-practionner-example-male-1) "大阪 一郎"
* imagingStudy.display = "CHEST CT DICOM imaging study"
* imagingStudy = Reference(ImagingStudy/jp-imagingstudy-radiology-example-1)
* conclusion = "インプレッション: ひだり肺上葉の空洞性病変。 肺腺癌を疑う。みぎ肺上葉陳旧性炎症性瘢痕。"
* presentedForm.contentType = urn:ietf:bcp:13#image/jpeg
* presentedForm.language = #ja
* presentedForm.data = "/9j/"
* presentedForm.title = "HTML Report"


Instance: jp-imagingstudy-radiology-example-1
InstanceOf: JP_ImagingStudy_Radiology
Title: "JP Core ImagingStudy Ragiology Example1"
Description: "放射線画像オーダ1"
Usage: #inline
* identifier.system = "http://www.acme.com/identifiers/patient"
* identifier.value = "urn:oid:2.16.124.113543.6003.1154777499.30246.19789.3503430045"
* status = #available
* subject = Reference(Patient/jp-patient-example-1)
* started = "2011-01-01T11:01:20+09:00"
* numberOfSeries = 1
* numberOfInstances = 1
* series.uid = "2.16.124.113543.6003.2588828330.45298.17418.2723805630"
* series.number = 3
* series.modality.system = "http://dicom.nema.org/resources/ontology/DCM"
* series.modality.code = #CT
* series.description = "CT胸部スクリーニング"
* series.numberOfInstances = 1
* series.bodySite.system = "http://jpfhir.jp/Common/ValueSet/imagingStudy-bodySite"
* series.bodySite.code = #43799004
* series.bodySite.display = "Chest"
* series.instance.uid = "2.16.124.113543.6003.189642796.63084.16748.2599092903"
* series.instance.sopClass.system = #urn:ietf:rfc:3986
* series.instance.sopClass.code = #urn:oid:1.2.840.10008.5.1.4.1.1.2
* series.instance.number = 1