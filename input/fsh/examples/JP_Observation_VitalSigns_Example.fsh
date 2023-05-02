Instance: jp-observation-vitalsigns-example-1
InstanceOf: JP_Observation_VitalSigns
Title: "JP Core Observation VitalSigns Example バイタル（呼吸数）"
Description: "バイタル（呼吸数）"
Usage: #example
* category[simpleObservation] = $JP_SimpleObservationCategory_CS#vital-signs "Vital Sign"
* category[vitalSignCategory] = $JP_ObservationVitalSignsCategory_CS#vital-signs  "Vital Sign"
* subject = Reference(Patient/jp-patient-example-1)
* code.coding[0] = http://abc-hospital.local/fhir/Observation/localcode#abc-local-456 "呼吸数"
* code.coding[+] = h$US_Loinc_CS#9279-1 "Respiratory rate"
* code.coding[+] = $JP_ObservationVitalSignsCode_CS#31001369 "呼吸数"
* effectiveDateTime = "2021-10-19T10:00:00+09:00"
* valueQuantity.unit = "回"
* valueQuantity.value = 400
* performer = Reference(jp-practitioner-example-male-2)
* status = #final
* encounter = Reference(Encounter/jp-encounter-example-1)