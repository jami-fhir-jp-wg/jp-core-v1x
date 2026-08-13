Instance: jp-imagingstudy-pathology-example-1
InstanceOf: JP_ImagingStudy_Pathology
Usage: #example
Title: "JP ImagingStudy Pathology Example 病理WSI画像"
Description: "病理WSI画像のImagingStudyリソース例"
* identifier.system = "urn:dicom:uid"
* identifier.value = "urn:oid:1.2.392.200119.99999.100.1.20210101120000"
* status = #available
* modality.system = "http://dicom.nema.org/resources/ontology/DCM"
* modality.code = #SM
* modality.display = "Slide Microscopy"
* subject = Reference(Patient/jp-patient-example-1)
* encounter = Reference(Encounter/jp-encounter-example-1)
* started = "2021-01-15T10:30:00+09:00"
* numberOfSeries = 1
* numberOfInstances = 5
* description = "病理組織検査 胃生検"
* series.uid = "1.2.392.200119.99999.100.1.20210101120000.1"
* series.number = 1
* series.modality.system = "http://dicom.nema.org/resources/ontology/DCM"
* series.modality.code = #SM
* series.modality.display = "Slide Microscopy"
* series.description = "HE染色"
* series.numberOfInstances = 5
* series.specimen = Reference(Specimen/jp-specimen-example-1)
* series.started = "2021-01-15T10:30:00+09:00"
* series.instance[0].uid = "1.2.392.200119.99999.100.1.20210101120000.1.1"
* series.instance[0].sopClass.system = "urn:ietf:rfc:3986"
* series.instance[0].sopClass.code = #urn:oid:1.2.840.10008.5.1.4.1.1.77.1.6
* series.instance[0].number = 1
* series.instance[0].title = "WSI Image 1"
* series.instance[+].uid = "1.2.392.200119.99999.100.1.20210101120000.1.2"
* series.instance[=].sopClass.system = "urn:ietf:rfc:3986"
* series.instance[=].sopClass.code = #urn:oid:1.2.840.10008.5.1.4.1.1.77.1.6
* series.instance[=].number = 2
* series.instance[=].title = "WSI Image 2"
