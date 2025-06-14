Extension: JP_Observation_DentalOral_BodyStructure_eCS
Id: jp-observation-dentaloral-bodystructure-ecs
Title: "JP Core Observation DentalOral BodyStructure Extension"
Description: "特定の歯を格納するための拡張"
Context: Observation
* ^url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Observation_DentalOral_BodyStructure_eCS"
* ^version = "1.2.0"
* ^status = #active
* ^date = "2025-06-24"
* ^publisher = "FHIR Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)"
* ^contact.name = "FHIR Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)"
* ^contact.telecom[0].system = #url
* ^contact.telecom[=].value = "http://jpfhir.jp"
* ^contact.telecom[+].system = #email
* ^contact.telecom[=].value = "office@hlfhir.jp"
* ^jurisdiction = urn:iso:std:iso:3166#JP "Japan"
* ^copyright = "Copyright FHIR Japanese implementation research working group in Japan Association of Medical Informatics (JAMI) 一般社団法人日本医療情報学会NeXEHRS課題研究会FHIR日本実装検討WG"
* . ^short = "特定の歯"
* . ^definition = "特定の歯を格納するための拡張"
* extension contains
    structure 1..1 and
    laterality 0..1 and
    bodyLandmarkOrientation 0..* and
    qualifier 0..*
* extension[structure] only Extension
* extension[structure].url only uri
* extension[structure].value[x] 1..1
* extension[structure].value[x] only CodeableConcept
* extension[laterality] only Extension
* extension[laterality].url only uri
* extension[laterality].value[x] 1..1
* extension[laterality].value[x] only CodeableConcept
* extension[bodyLandmarkOrientation] only Extension
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
