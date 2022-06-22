Instance: jp-location-example-ope
InstanceOf: Location
Title: "JP Location 手術室"
Description: "手術室"
Usage: #example
* identifier.value = "B1-S.F2.1.00"
* status = #suspended
* operationalStatus = http://terminology.hl7.org/CodeSystem/v2-0116#H
* name = "南ウィング　神経放射線科　手術室1"
* alias[0] = "南ウィング　神経放射線科　手術室5"
* alias[+] = "メインウィング　神経放射線科　手術室2"
* description = "Old South Wing, Neuro Radiology Operation Room 1 on second floor"
* mode = #instance
* type = http://terminology.hl7.org/CodeSystem/v3-RoleCode#RNEU
* telecom.system = #phone
* telecom.value = "2329"
* physicalType = http://terminology.hl7.org/CodeSystem/location-physical-type#ro


Instance: jp-location-example-ward
InstanceOf: Location
Title: "JP Location 病棟"
Description: "JP Location 病棟の例"
Usage: #example
* identifier.value = "09A.021.4"
* status = #suspended
* name = "09A病棟 021病室 4ベッド"
* description = "09A病棟 021病室 4ベッド"
* mode = #instance
* type = http://terminology.hl7.org/CodeSystem/v3-RoleCode#WARD
* telecom.system = #phone
* telecom.value = "2329"
* physicalType = http://terminology.hl7.org/CodeSystem/location-physical-type#bd