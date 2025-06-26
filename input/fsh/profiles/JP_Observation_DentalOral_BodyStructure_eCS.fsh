Extension: JP_Observation_DentalOral_BodyStructure_eCS
Id: jp-observation-dentaloral-bodystructure-ecs
Title: "JP Core Observation DentalOral BodyStructure Extension"
Description: "特定の歯を格納するための拡張"
* ^context[+].type = #element
* ^context[=].expression = "Observation"
* ^url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Observation_DentalOral_BodyStructure_eCS"
* ^status = #active
* ^date = "2025-06-24"
* . ^short = "特定の歯"
* . ^definition = "特定の歯を格納するための拡張"
* extension contains
    structure 1..1 and
    laterality 0..1 and
    bodyLandmarkOrientation 0..* and
    qualifier 0..*
//TO:extensionではなく、Slicingを定義している。
* extension[structure] only Extension
* extension[structure].url only uri
* extension[structure].value[x] 1..1
* extension[structure].value[x] only CodeableConcept
* extension[laterality] only Extension
* extension[laterality].url only uri
* extension[laterality].value[x] 1..1
* extension[laterality].value[x] only CodeableConcept
* extension[bodyLandmarkOrientation] only Extension
//TODO:extensionではなく、Slicingを定義している。
* extension[bodyLandmarkOrientation].extension contains
    landmarkDescription 0..1 and
    clockFacePosition 0..1 and
    distanceFromLandmark 0..1 and
    surfaceOrientation 0..1
* extension[bodyLandmarkOrientation].extension[landmarkDescription] only Extension
* extension[bodyLandmarkOrientation].extension[landmarkDescription].url only uri
* extension[bodyLandmarkOrientation].extension[landmarkDescription].url = "landmarkDescription" (exactly)
* extension[bodyLandmarkOrientation].extension[landmarkDescription].value[x] 1..1
* extension[bodyLandmarkOrientation].extension[landmarkDescription].value[x] only CodeableConcept
* extension[bodyLandmarkOrientation].extension[clockFacePosition] only Extension
* extension[bodyLandmarkOrientation].extension[clockFacePosition].url only uri
* extension[bodyLandmarkOrientation].extension[clockFacePosition].url = "clockFacePosition" (exactly)
* extension[bodyLandmarkOrientation].extension[clockFacePosition].value[x] 1..1
* extension[bodyLandmarkOrientation].extension[clockFacePosition].value[x] only CodeableConcept
* extension[bodyLandmarkOrientation].extension[distanceFromLandmark] only Extension
* extension[bodyLandmarkOrientation].extension[distanceFromLandmark].url only uri
* extension[bodyLandmarkOrientation].extension[distanceFromLandmark].url = "distanceFromLandmark" (exactly)
* extension[bodyLandmarkOrientation].extension[distanceFromLandmark].extension contains value 1..1
* extension[bodyLandmarkOrientation].extension[distanceFromLandmark].extension[value] only Extension
* extension[bodyLandmarkOrientation].extension[distanceFromLandmark].extension[value].url only uri
* extension[bodyLandmarkOrientation].extension[distanceFromLandmark].extension[value].url = "value" (exactly)
* extension[bodyLandmarkOrientation].extension[distanceFromLandmark].extension[value].value[x] 1..1
* extension[bodyLandmarkOrientation].extension[distanceFromLandmark].extension[value].value[x] only Quantity
* extension[bodyLandmarkOrientation].extension[surfaceOrientation] only Extension
* extension[bodyLandmarkOrientation].extension[surfaceOrientation].url only uri
* extension[bodyLandmarkOrientation].extension[surfaceOrientation].url = "surfaceOrientation" (exactly)
* extension[bodyLandmarkOrientation].extension[surfaceOrientation].value[x] 1..1
* extension[bodyLandmarkOrientation].extension[surfaceOrientation].value[x] only CodeableConcept
* extension[qualifier] only Extension
* extension[qualifier].url only uri
* extension[qualifier].value[x] 1..1
* extension[qualifier].value[x] only CodeableConcept
* extension[qualifier].value[x].coding ^slicing.discriminator.type = #value
* extension[qualifier].value[x].coding ^slicing.discriminator.path = "system"
* extension[qualifier].value[x].coding ^slicing.ordered = false
* extension[qualifier].value[x].coding ^slicing.rules = #open
* extension[qualifier].value[x].coding contains
    root 0..1 and
    suface 0..1
* extension[qualifier].value[x].coding[root] from $JP_DentalRootBodyStructure_VS (preferred)
* extension[qualifier].value[x].coding[root].system = $JP_DentalRootBodyStructure_CS (exactly)
* extension[qualifier].value[x].coding[suface] from $JP_DentalSurfaceBodyStructure_VS (preferred)
* extension[qualifier].value[x].coding[suface].system = $JP_DentalSurfaceBodyStructure_CS (exactly)
