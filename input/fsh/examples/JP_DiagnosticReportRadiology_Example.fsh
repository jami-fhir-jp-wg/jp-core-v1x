Instance: jp-diagnosticreport-radiology-example-1
InstanceOf: JP_DiagnosticReport_Radiology
Title: "JP Core DiagnosticReport Radiology Example1"
Description: "放射線レポート1"
Usage: #example
* identifier.use = #usual
* identifier.system = "http://jpfhir.jp/fhir/Common/IdSystem/resourceInstance-identifier"
* identifier.value = "123456"
* status = #final
* category = http://terminology.hl7.org/CodeSystem/v2-0074#RAD
* code = http://loinc.org#10191-5
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