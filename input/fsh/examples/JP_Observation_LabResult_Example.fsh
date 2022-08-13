Instance: jp-observation-labresult-example-1
InstanceOf: JP_Observation_LabResult
Title: "JP Core Observation LabResult Example 検体検査（尿）"
Description: "検体検査（尿）"
Usage: #example
* id = "lab-12345"
* category.coding.code = #laboratory
* category.coding.system = "http://terminology.hl7.org/CodeSystem/observation-category"
* category.coding.display = "尿酸"
* basedOn = Reference("ServiceRequest/ServiceRequest-12345")
* code.coding[0].code = #05104
* code.coding[=].system = "http://abc-hospital.local/fhir/Observation/localcode"
* code.coding[=].display = "尿酸"
* code.coding[+].code = #3C020000002327101
* code.coding[=].system = "http://jpfhir.jp/Common/ValueSet/labResult-code"
* code.coding[=].display = "尿酸(UA)"
* code.text = "検査項目コード"
* interpretation.coding = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#L "Low"
* interpretation.text = "HLマーク"
* effectiveDateTime = "2021-10-19T17:39:00+09:00"
* status = #final
* referenceRange.low.value = 3.7
* referenceRange.high.value = 7.8
* referenceRange.type.coding = http://terminology.hl7.org/CodeSystem/referencerange-meaning#normal "Normal Range"
* valueQuantity.unit = #mg/dL
* valueQuantity.value = 3.5
* subject = Reference("Patient/Patient-67890")
* performer = Reference("Practitioner/Practitioner-abcde")
* specimen = Reference("Specimen/Specimen-fgh")