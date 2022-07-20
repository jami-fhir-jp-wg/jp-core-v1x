Instance: jp-observation-vitalsigns-example-1
InstanceOf: JP_Observation_VitalSigns
Title: "JP Core Observation VitalSigns Basic Example"
Description: "JP_ObservationVitalSignsリソースの1例"
Usage: #example
* id = "vital-12345"
* category.coding.code = #呼吸機能
* category.coding.system = "http://jpfhir.jp/Common/CodeSystem/vitalsign-category"
* category.coding.display = "呼吸機能"
* subject = Reference("Patient/Patient-67890")
* code.coding[0].code = #abc-local-456
* code.coding[=].system = "http://abc-hospital.local/fhir/Observation/localcode"
* code.coding[=].display = "呼吸数"
* code.coding[1].code = #31001369
* code.coding[=].system = "http://abc-hospital.local/fhir/Observation/localcode"
* code.coding[=].display = "呼吸数"
* effectiveDateTime = "2021-10-19T10:00:00+09:00"
* valueQuantity.unit = "回"
* valueQuantity.value = 400
* performer = Reference("Practitioner/Practitioner-abcde")
* status = #final
* encounter = Reference("Encounter/jp-encounter-example1")