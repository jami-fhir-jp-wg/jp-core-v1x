Instance: jp-observation-dentaloral-toothtreatmentcondition-example-3
InstanceOf: JP_Observation_DentalOral_ToothTreatmentCondition
Title: "JP Core Observation DentalOral Tooth Treatment Condition Example 口腔診査結果３（現存歯の処置状態）"
Description: "口腔診査結果３（現存歯の処置状態）"
Usage: #example
* status = #final
* category[first].coding.system = $JP_SimpleObservationCategory_CS
* category[first].coding.code = #exam
* category[first].coding.display = "exam"
* category[second].coding.system = $Loinc_CS
* category[second].coding.code = #LP89803-8
* category[second].coding.display = "Dental"
* category[third].coding.system = $JP_ObservationDentalCategory_CS
* category[third].coding.code = #DO-1-02
* category[third].coding.display = "ToothTreatmentCondition"
* category.text = "現存歯の処置状態"
* code = $Loinc_CS#54570-7 "Oral/Dental Status"
* subject = Reference(Patient/jp-patient-example-1)
* effectiveDateTime = "2022-10-01"
* issued = "2022-10-24T17:30:00+09:00"
* performer = Reference(Practitioner/jp-practitioner-example-male-1)
* bodySite = $JP_DentalBodySite_CS#1026 "左側上顎第１大臼歯"
* bodySite.extension[toothSurface][+].valueCodeableConcept = $JP_DentalSurfaceBodyStructure_CS#TP-13 "切端・咬合面ＩＯ（切端I又は咬合面Ｏ）"
* bodySite.extension[toothSurface][+].valueCodeableConcept = $JP_DentalSurfaceBodyStructure_CS#TP-15 "口蓋側面・舌側面ＰＬ（口蓋側面Ｐ又は舌側面Ｌ（Ｌｉ））"
* bodySite.extension[toothSurface][+].valueCodeableConcept = $JP_DentalSurfaceBodyStructure_CS#TP-16 "近心面Ｍ"
* bodySite.extension[toothSurface][+].valueCodeableConcept = $JP_DentalSurfaceBodyStructure_CS#TP-17 "遠心面Ｄ"
* bodySite.extension[toothSurface][+].valueCodeableConcept = $JP_DentalSurfaceBodyStructure_CS#TP-18 "歯冠部"
* component[+].code.coding[primary].code = #TP-11-22
* component[=].code.coding[primary].display = "部分修復（単純・複雑の情報なし）（金属インレー・金色）（Ｉｎ）"
* component[=].code.coding[sub].code = #TD-2-10
* component[=].code.coding[sub].display = "現在歯【処置歯○】（ブリッジＢｒ支台を含む）"
