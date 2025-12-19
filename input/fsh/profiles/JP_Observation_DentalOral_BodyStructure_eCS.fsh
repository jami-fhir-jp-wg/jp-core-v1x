Extension: JP_Observation_DentalOral_BodyStructure_eCS
Id: jp-observation-dentaloral-bodystructure-ecs
Title: "JP Core Observation DentalOral BodyStructure IncludedStructure Extension"
Description: "特定の歯を格納するための拡張"
* ^context[+].type = #element
* ^context[=].expression = "Observation.bodySite"
* ^url = $JP_Observation_DentalOral_BodyStructure_eCS
* ^status = #active
* ^date = "2025-07-30"
* . ^short = "特定の歯"
* . ^definition = "特定の歯を格納するための拡張"
* url = $JP_Observation_DentalOral_BodyStructure_eCS (exactly)
* extension contains
    structure 1..1 and
    laterality 0..1 and
    bodyLandmarkOrientation 0..* and
    qualifier 0..*
// structure
* extension[structure] only Extension
* extension[structure].url = "structure" (exactly)
* extension[structure].value[x] 1..1
* extension[structure].value[x] only CodeableConcept
// laterality
* extension[laterality] only Extension
* extension[laterality].url = "laterality" (exactly)
* extension[laterality].value[x] 1..1
* extension[laterality].value[x] only CodeableConcept
// bodyLandmarkOrientation
* extension[bodyLandmarkOrientation] only Extension
* extension[bodyLandmarkOrientation].extension contains
    landmarkDescription 0..* and
    clockFacePosition 0..* and
    distanceFromLandmark 0..* and
    surfaceOrientation 0..*
* extension[bodyLandmarkOrientation].url = "bodyLandmarkOrientation" (exactly)
// bodyLandmarkOrientation.landmarkDescription
* extension[bodyLandmarkOrientation].extension[landmarkDescription] only Extension
* extension[bodyLandmarkOrientation].extension[landmarkDescription].url = "landmarkDescription" (exactly)
* extension[bodyLandmarkOrientation].extension[landmarkDescription].value[x] 1..1
* extension[bodyLandmarkOrientation].extension[landmarkDescription].value[x] only CodeableConcept
// bodyLandmarkOrientation.clockFacePosition
* extension[bodyLandmarkOrientation].extension[clockFacePosition] only Extension
* extension[bodyLandmarkOrientation].extension[clockFacePosition].url = "clockFacePosition" (exactly)
* extension[bodyLandmarkOrientation].extension[clockFacePosition].value[x] 1..1
* extension[bodyLandmarkOrientation].extension[clockFacePosition].value[x] only CodeableConcept
// bodyLandmarkOrientation.distanceFromLandmark
* extension[bodyLandmarkOrientation].extension[distanceFromLandmark] only Extension
* extension[bodyLandmarkOrientation].extension[distanceFromLandmark].extension contains
    value 0..*
* extension[bodyLandmarkOrientation].extension[distanceFromLandmark].url = "distanceFromLandmark" (exactly)
// bodyLandmarkOrientation.distanceFromLandmark.value
* extension[bodyLandmarkOrientation].extension[distanceFromLandmark].extension[value] only Extension
* extension[bodyLandmarkOrientation].extension[distanceFromLandmark].extension[value].url = "value" (exactly)
* extension[bodyLandmarkOrientation].extension[distanceFromLandmark].extension[value].value[x] 1..1
* extension[bodyLandmarkOrientation].extension[distanceFromLandmark].extension[value].value[x] only Quantity
// bodyLandmarkOrientation.surfaceOrientation
* extension[bodyLandmarkOrientation].extension[surfaceOrientation] only Extension
* extension[bodyLandmarkOrientation].extension[surfaceOrientation].url = "surfaceOrientation" (exactly)
* extension[bodyLandmarkOrientation].extension[surfaceOrientation].value[x] 1..1
* extension[bodyLandmarkOrientation].extension[surfaceOrientation].value[x] only CodeableConcept
// qualifier
* extension[qualifier] only Extension
* extension[qualifier].value[x] 1..1
* extension[qualifier].value[x] only CodeableConcept
