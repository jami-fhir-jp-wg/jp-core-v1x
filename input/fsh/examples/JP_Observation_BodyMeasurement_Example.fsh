Instance: jp-observation-bodyMeasurement-example-1
InstanceOf: JP_Observation_BodyMeasurement
Title: "JP Core Observation BodyMeasurement Example 身体計測（体重）"
Description: "身体計測（体重）"
Usage: #example
* category[bodyMeasurement] = $JP_SimpleObservationCategory_CS#body-measurement "Body Measurement"
* category[bodyMeasurementCategory] = $JP_ObservationBodyMeasurementCategory_CS#weight "体重"
* subject = Reference(Patient/jp-patient-example-1)
* code.coding[0] = http://abc-hospital.local/fhir/Observation/localcode#abc-local-456
* code.coding[+] = $JP_ObservationBodyMeasurementCode_CS#31000296
* effectiveDateTime = "2021-10-19T10:00:00+09:00"
* valueQuantity.unit = "kg"
* valueQuantity.value = 63.5
* status = #final
* encounter = Reference(Encounter/jp-encounter-example-1)