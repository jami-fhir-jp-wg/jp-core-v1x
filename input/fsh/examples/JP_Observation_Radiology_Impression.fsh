Instance: jp-observation-radiology-impression-example-1
InstanceOf: JP_Observation_Radiology_Impression
Title: "JP Core Observation Radiology Impression Example 画像診断報告書（インプレッション）"
Description: "画像診断報告書（インプレッション）"
Usage: #example
* status = #final
//* basedOn only Reference(ServiceRequest)
//* partOf only Reference(JP_ImagingStudy_Radiology)
* category = $JP_SimpleObservationCategory_CS#imaging "Imaging"
* category.text = "Imaging"
//* code = $Loinc_CS#19005-8  "Radiology Imaging study [Impression] (narrative)" (exactly)
* code = $Loinc_CS#19005-8 "Radiology Imaging study [Impression] (narrative)"
* subject = Reference(Patient/jp-patient-example-1)
* valueString = "ひだり肺上葉の空洞性病変。 肺腺癌を疑う。みぎ肺上葉陳旧性炎症性瘢痕。"
* effectiveDateTime = "2021-10-18T11:00:00+09:00"
* issued = "2021-10-19T10:00:00+09:00"
* performer = Reference(Practitioner/jp-practitioner-example-male-1)
//* derivedFrom only Reference(JP_ImagingStudy_Radiology)
//* encounter = Reference(Encounter/jp-encounter-example-1)