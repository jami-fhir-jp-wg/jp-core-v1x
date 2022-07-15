Instance: jp-imagingstudy-radiology-example-1
InstanceOf: JP_ImagingStudy_Radiology
Title: "JP Core ImagingStudy Basic Example"
Description: "JP_ImagingStudyリソースの1例"
Usage: #example
* identifier.system = "http://www.acme.com/identifiers/patient"
* identifier.value = "urn:oid:2.16.124.113543.6003.1154777499.30246.19789.3503430045"
* status = #available
* subject = Reference("Patient/jp-patient-example-1")
* started = "2011-01-01T11:01:20+09:00"
* numberOfSeries = 1
* numberOfInstances = 1
* series.uid = "2.16.124.113543.6003.2588828330.45298.17418.2723805630"
* series.number = 3
* series.modality.system = "http://dicom.nema.org/resources/ontology/DCM"
* series.modality.code = #CT
* series.description = "CT胸部スクリーニング"
* series.numberOfInstances = 1
// ValueSet未定義
* series.bodySite.system = "http://jpfhir.jp/Common/ValueSet/imagingStudy-bodySite"
* series.bodySite.code = #43799004
* series.bodySite.display = "Chest"
* series.instance.uid ="2.16.124.113543.6003.189642796.63084.16748.2599092903"
* series.instance.sopClass.system = 
* series.instance.sopClass.code = #urn:oid:1.2.840.10008.5.1.4.1.1.2
* series.instance.number = 1