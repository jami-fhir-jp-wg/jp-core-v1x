Instance: jp-observation-electrocardiogram-example-1
InstanceOf: JP_Observation_Electrocardiogram
Title: "JP Core Observation Electrocardiogram Example"
Description: "安静時12誘導心電図"
Usage: #example
//* category = $JP_SimpleObservationCategory_CS#procedure "Procedure"
* subject = Reference(Patient/jp-patient-example-1)
* code.coding[ekgCode] = $Loinc_CS#11524-6 "EKG Study" 
* effectiveDateTime = "2024-10-19T10:00:00+09:00"
* performer = Reference(Practitioner/jp-practitioner-example-male-1)
* status = #final
* encounter = Reference(Encounter/jp-encounter-example-1)
* interpretation[0] = urn:oid:1.2.392.200119.5.2.4.1.1.3#1-0 "正常"
* component[+].code.coding = $Loinc_CS#76282-3 "Heart rate.beat-to-beat"
* component[=].code.text = "Heart rate.beat-to-beat by EKG"
* component[=].valueQuantity.value = 75
* component[=].valueQuantity.unit = "{beats}/min"
* component[+].code.coding = $Loinc_CS#8637-1 "RR interval"
* component[=].code.text = "R-R interval by EKG"
* component[=].valueQuantity.value = 0.8
* component[=].valueQuantity.unit = "s"
* component[+].code.coding = $Loinc_CS#8625-6 "PR interval"
* component[=].code.text = "PR interval"
* component[=].valueQuantity.value = 0.16
* component[=].valueQuantity.unit = "s"
* component[+].code.coding = $Loinc_CS#8633-0 "QRS duration"
* component[=].code.text = "QRS duration"
* component[=].valueQuantity.value = 90
* component[=].valueQuantity.unit = "ms"
* component[+].code.coding = $Loinc_CS#8634-8 "QT interval"
* component[=].code.text = "QT interval"
* component[=].valueQuantity.value = 0.4
* component[=].valueQuantity.unit = "s"
* component[+].code.coding = $Loinc_CS#8636-3 "QTC interval"
* component[=].code.text = "Q-T interval corrected"
* component[=].valueQuantity.value = 0.42
* component[=].valueQuantity.unit = "s"
* component[+].code.coding = $Loinc_CS#9924-2 "P wave axis"
* component[=].code.text = "P wave axis"
* component[=].valueQuantity.value = 60
* component[=].valueQuantity.unit = "deg"
* component[+].code.coding = $Loinc_CS#8632-2 "QRS axis"
* component[=].code.text = "QRS axis"
* component[=].valueQuantity.value = 30
* component[=].valueQuantity.unit = "deg"
* component[+].code.coding = $Loinc_CS#9995-2 "R wave amplitude.lead V5"
* component[=].code.text = "R wave amplitude in lead V5"
* component[=].valueQuantity.value = 1.2
* component[=].valueQuantity.unit = "mV"
* component[+].code.coding = $Loinc_CS#10040-4 "S wave amplitude.lead V1"
* component[=].code.text = "S wave amplitude in lead V1"
* component[=].valueQuantity.value = 0.9
* component[=].valueQuantity.unit = "mV"
* component[+].code.coding = $Loinc_CS#76636-0 "R wave amplitude.V5+S wave amplitude.V1"
* component[=].code.text = "R wave amplitude.V5+S wave amplitude.V1"
* component[=].valueQuantity.value = 2.1
* component[=].valueQuantity.unit = "mV"
* component[+].code.coding = $Loinc_CS#8638-9 "T wave axis"
* component[=].code.text = "T wave axis"
* component[=].valueQuantity.value = 45
* component[=].valueQuantity.unit = "deg"
* extension[lead].valueInteger = 12
* extension[deviceInterpretation].valueBoolean = true

