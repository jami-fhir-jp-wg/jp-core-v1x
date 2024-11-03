Instance: jp-observation-dentaloral-toothexistence-example-2
InstanceOf: JP_Observation_DentalOral_ToothExistence
Title: "JP Core Observation DentalOral Tooth Existence Example 口腔診査結果２（歯の有無）"
Description: "口腔診査結果２（歯の有無）"
Usage: #example
* status = #final
* category[first] = $JP_SimpleObservationCategory_CS#procedure "Procedure"
* category[second] = $Loinc_CS#LP89803-8 "Dental Oral"
* category[third] = $JP_ObservationDentalCategory_VS#DO-1-01 "ToothExistence"
* category.text = "歯の有無"
* code = $Loinc_CS#54570-7 "Oral/Dental Status"
* subject = Reference(Patient/jp-patient-example-1)
* valueCodeableConcept = $JP_DentalFundamentalStatus_VS#TB-3-0 "現存歯"
* effectiveDateTime = "2022-10-01"
* issued = "2022-10-24T17:30:00+09:00"
* hasMember = Reference(Observation/jp-observation-dentaloral-toothtreatmentcondition-example-2)
* performer = Reference(Practitioner/jp-practitioner-example-male-1)
* bodySite = $JP_DentalBodySite_VS#TB-2-1011 "右側上顎中切歯"
//* bodySiteStatus = $JP_DentalBodySiteStatus_VS#TB-3-3 "支台歯"