// =================================
//   ImagingStudy Endoscopy Example
// =================================
Instance: jp-imagingstudy-endoscopy-example-1
InstanceOf: JP_ImagingStudy_Endoscopy
Title: "JP Core ImagingStudy Endoscopy Example 内視鏡画像検査"
Description: "内視鏡画像検査"
Usage: #example
* identifier.system = "urn:dicom:uid"
* identifier.value = "urn:oid:2.16.124.113543.6003.1154777499.30246.19789.20230425001"
* status = #available
* modality = https://dicom.nema.org/medical/dicom/current/output/chtml/part16/sect_CID_29.html#ES "Endoscopy"
* subject = Reference(Patient/jp-patient-example-1) "東京 太郎"
* started = "2023-04-21T15:54:32+09:00"
// =================================
//   endopointの記載方法要確認
// =================================
* endpoint = Reference(Endpoint/jp-endpoint-example-wadors)
* numberOfSeries = 1
* numberOfInstances = 5
* series.uid = "2.16.124.113543.6003.1154777499.30246.19789.20230425001.1"
* series.number = 1
* series.modality = https://dicom.nema.org/medical/dicom/current/output/chtml/part16/sect_CID_29.html#ES "Endoscopy"
* series.numberOfInstances = 5
// ===================================
//   series.endopointの記載方法要確認
// ===================================
* series.endpoint = Reference(Endpoint/jp-endpoint-example-wadors)
// =============================================
//   Instanceを複数回繰り返し記載する方法要確認
// =============================================
* series.instance.uid = "2.16.124.113543.6003.1154777499.30246.19789.20230425001.1.1"
* series.instance.sopClass = https://dicom.nema.org/medical/dicom/current/output/chtml/part04/sect_B.5.html#table_B.5-1#1.2.840.10008.5.1.4.1.1.77.1.1 "VL Endoscopic Image Storage"
* series.instance.number = 1
* series.instance.uid = "2.16.124.113543.6003.1154777499.30246.19789.20230425001.1.2"
* series.instance.sopClass = https://dicom.nema.org/medical/dicom/current/output/chtml/part04/sect_B.5.html#table_B.5-1#1.2.840.10008.5.1.4.1.1.77.1.1 "VL Endoscopic Image Storage"
* series.instance.number = 2
* series.instance.uid = "2.16.124.113543.6003.1154777499.30246.19789.20230425001.1.3"
* series.instance.sopClass = https://dicom.nema.org/medical/dicom/current/output/chtml/part04/sect_B.5.html#table_B.5-1#1.2.840.10008.5.1.4.1.1.77.1.1 "VL Endoscopic Image Storage"
* series.instance.number = 3
* series.instance.uid = "2.16.124.113543.6003.1154777499.30246.19789.20230425001.1.4"
* series.instance.sopClass = https://dicom.nema.org/medical/dicom/current/output/chtml/part04/sect_B.5.html#table_B.5-1#1.2.840.10008.5.1.4.1.1.77.1.1 "VL Endoscopic Image Storage"
* series.instance.number = 4
* series.instance.uid = "2.16.124.113543.6003.1154777499.30246.19789.20230425001.1.5"
* series.instance.sopClass = https://dicom.nema.org/medical/dicom/current/output/chtml/part04/sect_B.5.html#table_B.5-1#1.2.840.10008.5.1.4.1.1.77.1.1 "VL Endoscopic Image Storage"
* series.instance.number = 5
