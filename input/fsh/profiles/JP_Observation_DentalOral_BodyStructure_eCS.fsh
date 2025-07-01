Extension: JP_Observation_DentalOral_BodyStructure_eCS
Id: jp-observation-dentaloral-bodystructure-ecs
Title: "JP Core Observation DentalOral BodyStructure Extension"
Description: "特定の歯を格納するための拡張"
* ^context[+].type = #element
* ^context[=].expression = "Observation.bodySite"
* ^url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Observation_DentalOral_BodyStructure_eCS"
* ^status = #active
* ^date = "2025-06-24"
* . ^short = "特定の歯"
* . ^definition = "特定の歯を格納するための拡張"
* extension contains
  JP_Observation_DentalOral_BodyStructure_IncludedStructure named includedStructure 1..*
* value[x] 0..0

Extension: JP_Observation_DentalOral_BodyStructure_IncludedStructure
Id: jp-observation-dentaloral-bodystructure-includedstructure
Title: "JP Observation DentalOral BodyStructure IncludedStructure"
Description: "特定の歯を格納するための拡張"
* ^context[+].type = #element
* ^context[=].expression = "Extension"
* ^url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Observation_DentalOral_BodyStructure_IncludedStructure"
* ^status = #active
* extension contains
  JP_Observation_DentalOral_BodyStructure_Structure named structure 1..1 and
  JP_Observation_DentalOral_BodyStructure_Laterality named laterality 0..1 and
  JP_Observation_DentalOral_BodyStructure_BodyLandmarkOrientation named bodyLandmarkOrientation 0..* and
  JP_Observation_DentalOral_BodyStructure_Qualifier named qualifier 0..*

Extension: JP_Observation_DentalOral_BodyStructure_Structure
Id: jp-observation-dentaloral-bodystructure-structure
Title: "JP Observation DentalOral BodyStructure Structure"
* ^context[+].type = #element
* ^context[=].expression = "Extension"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_DentalOral_BodyStructure_Structure"
* ^status = #active
* ^date = "2025-06-24"
* value[x] only CodeableConcept

Extension: JP_Observation_DentalOral_BodyStructure_Laterality
Id: jp-observation-dentaloral-bodystructure-laterality
Title: "JP Observation DentalOral BodyStructure Laterality"
* ^context[+].type = #element
* ^context[=].expression = "Extension"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_DentalOral_BodyStructure_Laterality"
* ^status = #active
* ^date = "2025-06-24"
* value[x] only CodeableConcept

Extension: JP_Observation_DentalOral_BodyStructure_BodyLandmarkOrientation
Id: jp-observation-dentaloral-bodystructure-bodylandmarkorientation
Title: "JP Observation DentalOral BodyStructure BodyLandmarkOrientation"
* ^context[+].type = #element
* ^context[=].expression = "Extension"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_DentalOral_BodyStructure_BodyLandmarkOrientation"
* ^status = #active
* ^date = "2025-06-24"
* extension contains
  JP_Observation_DentalOral_BodyStructure_LandmarkDescription named landmarkDescription	0..* and
  JP_Observation_DentalOral_BodyStructure_ClockFacePosition named clockFacePosition 0..* and
  JP_Observation_DentalOral_BodyStructure_DistanceFromLandmark named distanceFromLandmark 0..* and
  JP_Observation_DentalOral_BodyStructure_SurfaceOrientation named surfaceOrientation 0..*
* value[x] 0..0

Extension: JP_Observation_DentalOral_BodyStructure_LandmarkDescription
Id: jp-observation-dentaloral-bodystructure-landmarkdescription
Title: "JP Observation DentalOral BodyStructure LandmarkDescription"
* ^context[+].type = #element
* ^context[=].expression = "Extension"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_DentalOral_BodyStructure_LandmarkDescription"
* ^status = #active
* ^date = "2025-06-24"
* value[x] only CodeableConcept

Extension: JP_Observation_DentalOral_BodyStructure_ClockFacePosition
Id: jp-observation-dentaloral-bodystructure-clockfaceposition
Title: "JP Observation DentalOral BodyStructure ClockFacePosition"
* ^context[+].type = #element
* ^context[=].expression = "Extension"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_DentalOral_BodyStructure_ClockFacePosition"
* ^status = #active
* ^date = "2025-06-24"
* value[x] only CodeableConcept

Extension: JP_Observation_DentalOral_BodyStructure_DistanceFromLandmark
Id: jp-observation-dentaloral-bodystructure-distancefromlandmark
Title: "JP Observation DentalOral BodyStructure DistanceFromLandmark"
* ^context[+].type = #element
* ^context[=].expression = "Extension"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_DentalOral_BodyStructure_DistanceFromLandmark"
* ^status = #active
* ^date = "2025-06-24"
* value[x] only Quantity

Extension: JP_Observation_DentalOral_BodyStructure_SurfaceOrientation
Id: jp-observation-dentaloral-bodystructure-surfaceorientation
Title: "JP Observation DentalOral BodyStructure SurfaceOrientation"
* ^context[+].type = #element
* ^context[=].expression = "Extension"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_DentalOral_BodyStructure_SurfaceOrientation"
* ^status = #active
* ^date = "2025-06-24"
* value[x] only CodeableConcept

Extension: JP_Observation_DentalOral_BodyStructure_Qualifier
Id: jp-observation-dentaloral-bodystructure-qualifier
Title: "JP Observation DentalOral BodyStructure Qualifier"
* ^context[+].type = #element
* ^context[=].expression = "Extension"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_DentalOral_BodyStructure_Qualifier"
* ^status = #active
* ^date = "2025-06-24"
* value[x] only CodeableConcept
