Instance: jp-diagnosticreport-radiology-example-1
InstanceOf: JP_DiagnosticReport_Radiology
Title: "JP Core DiagnosticReport Radiology Example 放射線読影レポート"
Description: "放射線読影レポート"
Usage: #example
* identifier.use = #usual
* identifier.system = "http://jpfhir.jp/fhir/Common/IdSystem/resourceInstance-identifier"
* identifier.value = "123456"
* status = #final
* category[radiology] = $diagnostic-service-sectionid-cs#RAD
* code = http://loinc.org#18748-4 "Diagnostic imaging study"
* subject = Reference(Patient/jp-patient-example-1)
* effectiveDateTime = "2008-06-17"
* issued = "2008-06-18T09:23:00+10:00"
* performer = Reference(Practitioner/jp-practitioner-example-male-1) "大阪 一郎"
* imagingStudy.display = "CHEST CT DICOM imaging study"
* imagingStudy = Reference(ImagingStudy/jp-imagingstudy-radiology-example-1)
* conclusion = "インプレッション: ひだり肺上葉の空洞性病変。 肺腺癌を疑う。みぎ肺上葉陳旧性炎症性瘢痕。"
* presentedForm.contentType = urn:ietf:bcp:13#image/jpeg
* presentedForm.language = #ja
* presentedForm.data = "/9j/"
* presentedForm.title = "HTML Report"


// Instance: jp-diagnosticreport-radiology-example-2
// InstanceOf: JP_DiagnosticReport_Radiology
// Title: "JP Core DiagnosticReport Radiology Example 核医学レポート"
// Description: "核医学レポート"
// Usage: #example
// * identifier.use = #usual
// * identifier.system = "http://jpfhir.jp/fhir/Common/IdSystem/resourceInstance-identifier"
// * identifier.value = "123456"
// * status = #final
// * category[radiology] = $diagnostic-service-sectionid-cs#RAD
// * code.text = "核医学レポート"
// * subject = Reference(Patient/jp-patient-example-1)
// * effectiveDateTime = "2008-06-17"
// * issued = "2008-06-18T09:23:00+10:00"
// * performer = Reference(Practitioner/jp-practitioner-example-male-1) "大阪 一郎"
// * imagingStudy.display = "肺がんが見つかったため、転移状況確認のための検査を行なった"
// * conclusion = "検査結果を見る限り、明らかながんの転移は見つからなかった"
// * presentedForm.contentType = urn:ietf:bcp:13#image/jpeg
// * presentedForm.language = #ja
// * presentedForm.data = "/9j/"
// * presentedForm.title = "HTML Report"