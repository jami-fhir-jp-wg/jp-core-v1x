Extension: JP_Observation_DentalOral_ToothSurface  
Id: jp-observation-dentaloral-toothsurface
Title: "JP Core Observation DentalOral ToothSurface Extension"
Description: "特定の歯の歯面を格納するための拡張"
* ^url = $JP_Observation_DentalOral_ToothSurface
* ^status = #active
* ^date = "2025-06-24"
* ^context[+].type = #element
* ^context[=].expression = "Observation.bodySite"
* . ^short = "特定の歯の歯面"
* . ^definition = "特定の歯の歯面を格納するための拡張"
* url = $JP_Observation_DentalOral_ToothSurface (exactly)
* value[x] only CodeableConcept
* valueCodeableConcept.coding from $JP_DentalSurfaceBodyStructure_VS (preferred)