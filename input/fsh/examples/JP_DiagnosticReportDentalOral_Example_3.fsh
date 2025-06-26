Instance: jp-diagnosticreport-dentaloral-example-3
InstanceOf: JP_DiagnosticReport_DentalOral
Title: "JP Core DiagnosticReport DentalOral Example 口腔診査レポート3（診療情報提供書版）"
Description: "初診時口腔診査"
Usage: #example
* text.status = #additional
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><h2><span title=\"Codes: {http://loinc.org LP31759-1}\">DiagnosticReport DentalOral </span> (<span title=\"Codes: {http://loinc.org 32453-3}\">Physical findings of Mouth</span>)</h2><table class=\"grid\"><tr><td>Subject</td><td><b>山田 太郎</b> male, DoB: 1970-01-01 ( id:000000010)</td></tr><tr><td>When For</td><td>2022-10-01</td></tr><tr><td>Reported</td><td>2022-10-24 17:30:00+09:00</td></tr><tr><td>Identifier:</td><td> id:0123456(use:USUAL)</td></tr></table><h3>Report Details</h3><p><b><big>【初診時口腔診査】</big></b></p></div>"
* identifier.use = #usual
* identifier.system = $JP_IdSystem_PrescriptionDocumentID
* identifier.value = "123456"
* status = #final
* category[first] = $Loinc_CS#LP31759-1 "DENTAL"
* code = $JP_DocumentCodes_CS#32453-3 "口腔診査報告書"
* subject = Reference(Patient/jp-patient-example-1)
* effectiveDateTime = "2022-10-01"
* issued = "2022-10-24T17:30:00+09:00"
* performer = Reference(Practitioner/jp-practitioner-example-male-1) "大阪 一郎"
* resultsInterpreter = Reference(Practitioner/jp-practitioner-example-male-1) "大阪 一郎"
* result[0] = Reference(Observation/jp-observation-dentaloral-ecs-example) "口腔診査結果"
* conclusion = "歯冠破折(傷病名コード：5218009）"