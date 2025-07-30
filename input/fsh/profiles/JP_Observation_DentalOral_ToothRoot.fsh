Extension: JP_Observation_DentalOral_ToothRoot
Id: jp-observation-dentaloral-toothroot
Title: "JP Core Observation DentalOral Tooth Root Status Extension"
Description: "歯根を格納するための拡張"
* ^url = $JP_Observation_DentalOral_ToothRoot
* ^status = #active
* ^date = "2025-07-04"
* ^context[+].type = #element
* ^context[=].expression = "Observation.bodySite"
* . ^short = "歯根"
* . ^definition = "歯根を格納するための拡張"
* url = $JP_Observation_DentalOral_ToothRoot (exactly)
* value[x] only CodeableConcept
* valueCodeableConcept from $JP_DentalRootBodyStructure_VS (preferred)
