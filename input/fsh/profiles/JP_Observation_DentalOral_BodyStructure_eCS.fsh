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
  //  and JP_Observation_DentalOral_BodyStructure_ExcludedStructure excludedStructure 0..*
* value[x] 0..0


// Extension: JP_Observation_DentalOral_BodyStructure_ExcludedStructure
// Id: jp-observation-dentaloral-bodystructure-excludedstructure
// Title: "JP Observation DentalOral BodyStructure ExcludedStructure"
// Description: "特定の歯を格納するための拡張"
// * ^url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Observation_DentalOral_BodyStructure_ExcludedStructure"
// * ^status = #active
// * url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_DentalOral_BodyStructure_ExcludedStructure"
// * ^context[+].type = #Element

Extension: JP_Observation_DentalOral_BodyStructure_IncludedStructure
Id: jp-observation-dentaloral-bodystructure-includedstructure
Title: "JP Observation DentalOral BodyStructure IncludedStructure"
Description: "特定の歯を格納するための拡張"
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
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_DentalOral_BodyStructure_Structure"
* ^status = #active
* value[x] only CodeableConcept


Extension: JP_Observation_DentalOral_BodyStructure_Laterality
Id: jp-observation-dentaloral-bodystructure-laterality
Title: "JP Observation DentalOral BodyStructure Laterality"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_DentalOral_BodyStructure_Laterality"
* ^status = #active
* value[x] only CodeableConcept


Extension: JP_Observation_DentalOral_BodyStructure_BodyLandmarkOrientation
Id: jp-observation-dentaloral-bodystructure-bodylandmarkorientation	
Title: "JP Observation DentalOral BodyStructure Laterality"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_DentalOral_BodyStructure_BodyLandmarkOrientation"
* ^status = #active
* extension contains
  JP_Observation_DentalOral_BodyStructure_LandmarkDescription named landmarkDescription	0..1 and
  distanceFromLandmark 0..1 and
  surfaceOrientation 0..*
* value[x] 0..0

Extension: JP_Observation_DentalOral_BodyStructure_LandmarkDescription
Id: jp-observation-dentaloral-bodystructure-landmarkdescription
Title: "JP Observation DentalOral BodyStructure Laterality"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_DentalOral_BodyStructure_LandmarkDescription"
* ^status = #active
* value[x] only CodeableConcept


Extension: JP_Observation_DentalOral_BodyStructure_SurfaceOrientation
Id: jp-observation-dentaloral-bodystructure-surfaceorientation
Title: "JP Observation DentalOral BodyStructure urfaceOrientation"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_DentalOral_BodyStructure_urfaceOrientation"
* ^status = #active
* value[x] only CodeableConcept


Extension: JP_Observation_DentalOral_BodyStructure_Qualifier
Id: jp-observation-dentaloral-bodystructure-qualifier	
Title: "JP Observation DentalOral BodyStructure Qualifier"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_DentalOral_BodyStructure_Qualifier"
* ^status = #active
* value[x] only CodeableConcept
