Instance: jp-observation-labresult-example-1
InstanceOf: JP_Observation_LabResult
Title: "JP Core Observation LabResult Example 検体検査（尿）"
Description: "検体検査（尿）"
Usage: #example
* contained[0] = jp-servicerequest-example-1
* category[laboratory].coding = $observation-category#laboratory "Laboratory"
* basedOn = Reference(ServiceRequest/jp-servicerequest-example-1)
* code.coding[0] = http://abc-hospital.local/fhir/Observation/localcode#05104 "尿酸"
* code.coding[+] = $JP_ObservationLabResultCode_CS#3C020000002327101
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
* subject = Reference(Patient/jp-patient-example-1)
* performer = Reference(jp-practitioner-example-female-1)
* specimen = Reference(Specimen/jp-specimen-example-1)

// 検査オーダ
Instance: jp-servicerequest-example-1
InstanceOf: ServiceRequest
Usage: #inline
* status = #active
* intent = #original-order
* code = http://abc-hospital.local/fhir/ObservationOrder/localcode#12345678
* code.text = "尿検査"
* subject = Reference(Patient/jp-patient-example-1)
* encounter = Reference(Encounter/jp-encounter-example-1)
* occurrenceDateTime = "2021-10-10T17:39:00+09:00"
* requester = Reference(Practitioner/jp-practitioner-example-female-1)
* performer = Reference(Practitioner/jp-practitioner-example-male-2)

