Instance: jp-diagnosticreport-radiology-example-1
InstanceOf: JP_DiagnosticReport_Radiology
Title: "JP Core DiagnosticReport Basic Example"
Description: "JP_DiagnosticReportリソースの1例"
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2020-10-25T17:00:03.903+00:00"
* meta.source = "xxxxxxxxxxxxxx"
* identifier.use = #usual
* identifier.system = "http://www.acme.com/identifiers/patient"
* identifier.value = "xxxxxxxxxxxxxxx"
* status = #final
* category.coding.system = "http://hl7.org/fhir/v2/0074"
* category.coding.code = #RAD
* code = http://loinc.org#10191-5
* subject = Reference("Patient/jp-patient-example-1")
* effectiveDateTime = "2008-06-17"
* issued = "2008-06-18T09:23:00+10:00"
// 田中一郎は Referenceの後に続けて書くのか？
* performer = Reference("Practitioner/3ad0687e-f477-468c-afd5-fcc2bf897809") "田中太郎"
* imagingStudy.display = "CHEST CT DICOM imaging study"
// imagingStudyリソースにreferenceエレメントはないが、どういうことか？
* imagingStudy.reference = "http://someserver/some-path"
* conclusion = "インプレッション: ひだり肺上葉の空洞性病変。 肺腺癌を疑う。みぎ肺上葉陳旧性炎症性瘢痕。"
* presentedForm.contentType = #application/jpg
* presentedForm.language = #ja
* presentedForm.data = "/9j/"
* presentedForm.title = "HTML Report"