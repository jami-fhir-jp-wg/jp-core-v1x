Instance: jp-observation-labresult-example-1
InstanceOf: JP_Observation_LabResult
Title: "JP Core Observation LabResult Basic Example"
Description: "JP_ObservationLabResultリソースの1例"
Usage: #example
* contained[0] = jp-servicerequest-example-1
* contained[+] = jp-specimen-example-1
* category.coding.code = #laboratory
* category.coding.system = "http://terminology.hl7.org/CodeSystem/observation-category"
* category.coding.display = "尿酸"
* basedOn = Reference(ServiceRequest/jp-servicerequest-example-1)
* code.coding[0].code = #05104
* code.coding[=].system = "http://abc-hospital.local/fhir/Observation/localcode"
* code.coding[=].display = "尿酸"
* code.coding[+].code = #3C020000002327101
* code.coding[=].system = "http://jpfhir.jp/Common/ValueSet/labResult-code"
* code.coding[=].display = "尿酸(UA)"
* code.text = "検査項目コード"
* interpretation.coding.code = #L
* interpretation.coding.system = "http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation"
* interpretation.coding.display = "正常値下限越え"
* interpretation.text = "HLマーク"
* effectiveDateTime = "2021-10-19T17:39:00+09:00"
* status = #final
* referenceRange.low.value = 3.7
* referenceRange.high.value = 7.8
* referenceRange.type.coding.system = "http://terminology.hl7.org/CodeSystem/referencerange-meaning"
* referenceRange.type.coding.code = #normal
* referenceRange.type.coding.display = "Normal Range"
* valueQuantity.unit = #mg/dL
* valueQuantity.value = 3.5
* subject = Reference(Patient/jp-patient-example-1)
* performer = Reference(jp-practionner-example-female-1)
//TODO: Specimenのサンプル作成の必要あり
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
* encounter = Reference(Encounter/jp-encounter-example1)
* occurrenceDateTime = "2021-10-10T17:39:00+09:00"
* requester = Reference(Practitioner/jp-practionner-example-female-1)
* performer = Reference(Practitioner/jp-practionner-example-male-2)

//検体材料
Instance: jp-specimen-example-1
InstanceOf: Specimen
Usage: #inline
* identifier.system = "http://abc-hospital.local/identifiers/collections"
* identifier.value = "23234352356"
* accessionIdentifier.system = "http://abc-hospital.local/specimens/2011"
* accessionIdentifier.value = "X352356"
* status = #available
* subject = Reference(Patient/jp-patient-example-1)
* receivedTime = "2021-10-11T11:03:00+09:00"
* container.identifier.value = "48736-15394-75465"
* container.description = "Spitch"
* container.type.text = "spitch"
* container.capacity.value = 20
* container.capacity.unit = "mL"
* container.specimenQuantity.value = 18
* container.specimenQuantity.unit = "mL"
