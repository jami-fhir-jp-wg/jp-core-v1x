Instance: jp-observation-labresult-example-1
InstanceOf: JP_Observation_LabResult
Title: "JP Core Observation LabResult Example 検体検査（尿酸）"
Description: "検体検査（尿酸）"
Usage: #example
* contained[0] = jp-servicerequest-example-1
* category[laboratory] = $JP_SimpleObservationCategory_CS#laboratory
* basedOn = Reference(ServiceRequest/jp-servicerequest-example-1)
* code.coding[0] = http://abc-hospital.local/fhir/Observation/localcode#05104 "尿酸"
* code.coding[+] = $JP_ObservationLabResultCode_CS#3C020000002327101
* code.text = "尿酸"
* interpretation.coding = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#H "High"
* interpretation.text = "H"
* effectiveDateTime = "2021-10-19T02:20:00+09:00"
* status = #final
* referenceRange.low.value = 2.1
* referenceRange.high.value = 7.0
* referenceRange.type.coding = http://terminology.hl7.org/CodeSystem/referencerange-meaning#normal "Normal Range"
* valueQuantity.unit = #mg/dL
* valueQuantity.value = 8.5
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
* code.text = "生化学検査"
* subject = Reference(Patient/jp-patient-example-1)
* encounter = Reference(Encounter/jp-encounter-example-1)
* occurrenceDateTime = "2021-10-19T01:15:00+09:00"
* requester = Reference(Practitioner/jp-practitioner-example-female-1)
* performer = Reference(Practitioner/jp-practitioner-example-male-2)

