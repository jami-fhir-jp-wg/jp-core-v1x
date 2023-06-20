Instance: jp-diagnosticreport-labresult-example-1
InstanceOf: JP_DiagnosticReport_LabResult
Title: "JP Core DiagnosticReport_LabResult Example 検体検査（血液）レポート"
Description: "検体検査（血液）レポート"
Usage: #example
* contained[0] = inner-observation-labresult-1
* contained[+] = inner-observation-labresult-2
* contained[+] = inner-observation-labresult-3
* status = #final
* identifier.system = "http://abc-hospital.local/fhir/lab/reportid"
* identifier.value = "5234342"
* category[+] = $JP_SimpleObservationCategory_CS#laboratory
* category[=] = $JP_Loinc_CS#LP29693-6
* code = $JP_Loinc_CS#11502-2 "Laboratory report"
* subject = Reference(Patient/jp-patient-example-1)
* encounter = Reference(Encounter/jp-encounter-example-1)
* effectiveDateTime = "2021-03-04T08:30:00+09:00"
* issued = "2021-03-04T11:45:33+09:00"
* performer = Reference(Organization/jp-organization-example-hospital) "健康第一病院"
* presentedForm.contentType = #application/pdf
* presentedForm.language = #ja-JP
* presentedForm.data = "JVBERi0xLjUNCiW1tbW1DQoxIDAgb2JqDQo8PC9UeXBlL0NhdGFsb2cvUGFnZXMgMiAwIFIvTGFuZyhqYS1KUCkgL1N0cnVjdFRyZWVSb290IDEzIDAgUi9NYXJrSW5mbzw8L01hcmtlZCB0cnVlPj4+Pg0KZW5kb2JqDQoyIDAgb2JqDQo8PC9UeXBlL1BhZ2VzL0NvdW50IDEvS2lkc1sgMyAwIFJdID4+DQplbmRvYmoNCjMgMCBvYmoN"
* presentedForm.title = "検査結果PDFレポート"
* effectiveDateTime = "2021-08-25T08:30:00+09:00"
* result[0] = Reference(Observation/inner-observation-labresult-1)
* result[+] = Reference(Observation/inner-observation-labresult-2)
* result[+] = Reference(Observation/inner-observation-labresult-3)

Instance: inner-observation-labresult-1
InstanceOf: JP_Observation_LabResult
Usage: #inline
* status = #final
* category[+] = $JP_SimpleObservationCategory_CS#laboratory
* code.coding[0] = http://abc-hospital.local/fhir/Observation/localcode#123 "ヘモグロビン"
* code.coding[+] = $JP_ObservationLabResultCode_CS#2A990000001930953
* code.text = "ヘモグロビン"
* subject = Reference(Patient/jp-patient-example-1)
* performer = Reference(Organization/jp-organization-example-hospital) "健康第一病院"
* valueQuantity = 176 'g/L' "g/L"
* referenceRange.low = 135 'g/L' "g/L"
* referenceRange.high = 180 'g/L' "g/L"
* effectiveDateTime = "2021-03-04T08:30:00+09:00"
* specimen = Reference(Specimen/jp-specimen-example-2)

Instance: inner-observation-labresult-2
InstanceOf: JP_Observation_LabResult
Usage: #inline
* status = #final
* category[+] = $JP_SimpleObservationCategory_CS#laboratory
* code.coding[0] = http://abc-hospital.local/fhir/Observation/localcode#456 "赤血球数"
* code.coding[+] = $JP_ObservationLabResultCode_CS#2A990000001992051
* code.text = "赤血球数"
* subject = Reference(Patient/jp-patient-example-1)
* performer = Reference(Organization/jp-organization-example-hospital) "健康第一病院"
* valueQuantity = 5.9 '10*6/uL' "10*6/uL"
* referenceRange.low = 4.2 '10*6/uL' "10*6./L"
* referenceRange.high = 6 '10*6/uL' "10*6./L"
* effectiveDateTime = "2021-03-04T08:30:00+09:00"
* effectiveDateTime = "2021-03-04T08:30:00+09:00"
* specimen = Reference(Specimen/jp-specimen-example-2)

Instance: inner-observation-labresult-3
InstanceOf: JP_Observation_LabResult
Usage: #inline
* status = #final
* category[+] = $JP_SimpleObservationCategory_CS#laboratory
* code.coding[0] = http://abc-hospital.local/fhir/Observation/localcode#789 "ヘマトクリット"
* code.coding[+] = $JP_ObservationLabResultCode_CS#2A990000001930954
* code.text = "ヘマトクリット"
* subject = Reference(Patient/jp-patient-example-1)
* performer = Reference(Organization/jp-organization-example-hospital) "健康第一病院"
* valueQuantity.value = 55
* valueQuantity.unit = "%"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#H
* effectiveDateTime = "2021-03-04T08:30:00+09:00"
* referenceRange.low.value = 38
* referenceRange.low.unit = "%"
* referenceRange.high.value = 52
* referenceRange.high.unit = "%"
* effectiveDateTime = "2021-03-04T08:30:00+09:00"
* specimen = Reference(Specimen/jp-specimen-example-2)

