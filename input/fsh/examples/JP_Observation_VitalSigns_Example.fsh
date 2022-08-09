Instance: jp-observation-vitalsigns-example-1
InstanceOf: JP_Observation_VitalSigns
Title: "JP Core Observation VitalSigns Basic バイタル（呼吸数）"
Description: "バイタル（呼吸数）"
Usage: #example
* category = $vitalSigns-category-cs#呼吸機能 "呼吸機能"
* subject = Reference(Patient/jp-patient-example-1)
* code.coding[0] = http://abc-hospital.local/fhir/Observation/localcode#abc-local-456 "呼吸数"
* code.coding[+] = http://loinc.org#9279-1 "Respiratory rate"
* code.coding[+] = $vitalSigns-code-cs#呼吸数 "呼吸数"
* effectiveDateTime = "2021-10-19T10:00:00+09:00"
* valueQuantity.unit = "回"
* valueQuantity.value = 400
* performer = Reference(jp-practitioner-example-male-2)
* status = #final
* encounter = Reference(Encounter/jp-encounter-example-1)