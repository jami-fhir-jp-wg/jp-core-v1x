//検体材料
Instance: jp-specimen-example-1
InstanceOf: Specimen
Title: "JP Core Specimen Example 検体材料（尿）"
Description: "検体材料（尿）"
Usage: #example
* identifier.system = "http://abc-hospital.local/identifiers/collections"
* identifier.value = "23234352356"
* accessionIdentifier.system = "http://abc-hospital.local/specimens/2011"
* accessionIdentifier.value = "X352356"
* status = #available
* type = http://terminology.hl7.org/CodeSystem/v2-0487#UR ""
* subject = Reference(Patient/jp-patient-example-1)
* receivedTime = "2021-10-11T11:03:00+09:00"
* container.identifier.value = "48736-15394-75465"
* container.description = "採尿容器"
* container.type.text = "採尿容器"
* container.capacity.value = 50
* container.capacity.unit = "mL"
* container.specimenQuantity.value = 40
* container.specimenQuantity.unit = "mL"

Instance: jp-specimen-example-2
InstanceOf: Specimen
Title: "JP Core Specimen Example 検体材料（血液）"
Description: "検体材料（血液）"
Usage: #example
* identifier.system = "http://abc-hospital.local/identifiers/collections"
* identifier.value = "23234352357"
* accessionIdentifier.system = "http://abc-hospital.local/specimens/2011"
* accessionIdentifier.value = "X352357"
* status = #available
* type = http://terminology.hl7.org/CodeSystem/v2-0487#BLD "Whole blood"
* subject = Reference(Patient/jp-patient-example-1)
* receivedTime = "2021-08-11T11:03:00+09:00"
* container.identifier.value = "48736-15394-75467"
* container.description = "採血菅"
* container.type.text = "採血菅"
* container.capacity.value = 20
* container.capacity.unit = "mL"
* container.specimenQuantity.value = 18
* container.specimenQuantity.unit = "mL"



Instance: jp-specimen-example-3
InstanceOf: Specimen
Title: "JP Core Specimen Example 検体材料（喀痰）"
Description: "検体材料（喀痰）"
Usage: #inline
* identifier.system = "http://abc-hospital.local/identifiers/collections"
* identifier.value = "23234352358"
* accessionIdentifier.system = "http://abc-hospital.local/specimens/2011"
* accessionIdentifier.value = "X352358"
* status = #available
* type = http://terminology.hl7.org/CodeSystem/v2-0487#BLD "Whole blood"
* subject = Reference(Patient/jp-patient-example-1)
* receivedTime = "2021-08-11T11:03:00+09:00"
* container.identifier.value = "48736-15394-75468"
* container.description = "採血菅"
* container.type.text = "採血菅"
* container.capacity.value = 20
* container.capacity.unit = "mL"
* container.specimenQuantity.value = 3
* container.specimenQuantity.unit = "mL"