Instance: jp-diagnosticreport-labresult-example-1
InstanceOf: JP_DiagnosticReport_LabResult
Title: "JP Core DiagosticReport_LabResult Example 検体検査"
Description: "検体検査"
Usage: #example
* status = #final
* category.coding = $observation-category#検体検査
* code.coding = http://loinc.org#11502-2 "Laboratory report"
* subject = Reference(Patient/jp-patient-example-1)
* effectiveDateTime = "2016-08-25T08:30:00+09:00"
* performer = Reference(Practitioner/jp-practitioner-example-female-1)
* result = Reference(ObservationLabResult/jp-observation-labresult-example-1)


