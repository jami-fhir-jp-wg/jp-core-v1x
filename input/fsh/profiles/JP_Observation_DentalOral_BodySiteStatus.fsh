Extension: JP_Observation_DentalOral_BodySiteStatus
Id: jp-observation-dentaloral-bodysitestatus
Title: "JP Core Observation DentalOral Body Site Status Extension"
Description: "歯の状態を格納するための拡張"
* ^url = $JP_Observation_DentalOral_BodySiteStatus
* ^status = #active
* ^date = "2024-12-30"
* ^context.type = #element
* ^context.expression = "CodeableConcept"
* . ^short = "歯の状態"
* . ^definition = "歯の状態を格納するための拡張。例：『インプラント』、『その他の生体構造体』"
* url = $JP_Observation_DentalOral_BodySiteStatus (exactly)
* value[x] only CodeableConcept
* valueCodeableConcept from $JP_DentalBodySiteStatus_VS (preferred)
