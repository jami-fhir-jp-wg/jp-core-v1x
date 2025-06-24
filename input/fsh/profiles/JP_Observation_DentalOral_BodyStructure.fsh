Extension: JP_Observation_DentalOral_BodyStructure
Id: jp-observation-dentaloral-bodystructure
Title: "JP Core Observation DentalOral BodyStructure Extension"
Description: "特定の歯の歯面を格納するための拡張"
* ^url = $JP_Observation_DentalOral_BodyStructure
//* ^status = #active
* ^date = "2024-12-30"
* ^context.type = #element
* ^context.expression = "CodeableConcept"
* . ^short = "特定の歯の歯面"
* . ^definition = "特定の歯の歯面を格納するための拡張"
* url = $JP_Observation_DentalOral_BodyStructure (exactly)
* value[x] only CodeableConcept
//* valueCodeableConcept.coding from $JP_DentalBodyStructure_VS (preferred)