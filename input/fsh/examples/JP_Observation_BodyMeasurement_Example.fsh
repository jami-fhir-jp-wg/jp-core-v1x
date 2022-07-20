Instance: jp-observation-bodyMeasurement-example-1
InstanceOf: JP_Observation_BodyMeasurement
Title: "JP Core Observation BodyMeasurement Basic Example"
Description: "JP_ObservationBodyMeasurementリソースの1例"
Usage: #example
* id = "bm-12345"
* category.coding.code = #体重
* category.coding.system = "http://jpfhir.jp/Common/CodeSystem/bodymeasurement-category"
* subject = Reference("Patient/Patient-67890")
* code.coding[0].code = #abc-local-456
* code.coding[=].system = "http://abc-hospital.local/fhir/Observation/localcode"
* code.coding[+].code = #31000296
* code.coding[=].system = "http://jpfhir.jp/Common/CodeSystem/vitalsign-code"
* effectiveDateTime = "2021-10-19T10:00:00+09:00"
* valueQuantity.unit = "kg"
* valueQuantity.value = 63.5
* status = #final
* encounter = Reference("Encounter/jp-encounter-example1")