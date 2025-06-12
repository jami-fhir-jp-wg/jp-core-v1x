Instance: jp-observation-dentaloral-ecs-example
InstanceOf: JP_Observation_DentalOral_eCS
Title: "JP Core Observation DentalOral eCS Example 口腔診査結果（診療情報提供書用）"
Description: "口腔診査結果（現存複数歯の処置状態）"
Usage: #example
* status = #final
* category[first].coding.code = #exam
* category[first].coding.display = "exam"
* category[second].coding.code = #LP89803-8
* category[second].coding.display = "Dental"
* category[third].coding.code = #DO-1-04
* category[third].coding.display = "ClinicalInformationSharing"
* category.text = "現存歯の処置状態"
* code = $Loinc_CS#57133-1 "Referral note"
* subject = Reference(Patient/jp-patient-example-1)
* effectiveDateTime = "2022-10-01"
* issued = "2022-10-24T17:30:00+09:00"
* performer = Reference(Practitioner/jp-practitioner-example-male-1)

/*
* extension[structure][0].valueCodeableConcept.coding.system = "http://jpfhir.jp/fhir/core/CodeSystem/JP_DentalBodySite_CS"
* extension[structure][=].valueCodeableConcept.coding.code = #TB-2-1042
* extension[structure][=].valueCodeableConcept.coding.display = "右側下顎側切歯"
* extension[structure][+].valueCodeableConcept.coding.system = "http://jpfhir.jp/fhir/core/CodeSystem/JP_DentalBodySite_CS"
* extension[structure][=].valueCodeableConcept.coding.code = #TB-2-1041
* extension[structure][=].valueCodeableConcept.coding.display = "右側下顎中切歯"
* bodySite.extension[bodyStructure][+].valueCodeableConcept.coding.system = "http://jpfhir.jp/fhir/core/ValueSet/JP_DentalBodyStructure_VS"
* bodySite.extension[bodyStructure][=].valueCodeableConcept.coding.code = "TP-18-01"
* bodySite.extension[bodyStructure][=].valueCodeableConcept.coding.display = "歯冠部"
* component[0].valueCodeableConcept.coding.system = $JP_DentalPresentTeethObservation_CS
* component[=].valueCodeableConcept.coding.code = #TP09-15
* component[=].valueCodeableConcept.coding.display = "歯の破折（ＦｒＴ）"
*/
