Instance: jp-observation-dentaloral-toothexistence-example-3
InstanceOf: JP_Observation_DentalOral_ToothExistence
Title: "JP Core Observation DentalOral Tooth Existence Example 口腔診査結果３（歯の有無）"
Description: "口腔診査結果３（歯の有無）"
Usage: #example
* status = #final
* category[first].coding.code = #exam
* category[first].coding.display = "exam"
* category[second].coding.code = #LP89803-8
* category[second].coding.display = "Dental"
* category[third].coding.code = #DO-1-01
* category[third].coding.display = "ToothExistence"
* category.text = "歯の有無"
* code = $Loinc_CS#54570-7 "Oral/Dental Status"
* subject = Reference(Patient/jp-patient-example-1)
* valueCodeableConcept = $JP_DentalFundamentalStatus_CS#TB-3-0 "現存歯"
* effectiveDateTime = "2022-10-01"
* issued = "2022-10-24T17:30:00+09:00"
* hasMember = Reference(Observation/jp-observation-dentaloral-toothtreatmentcondition-example-3)
* performer = Reference(Practitioner/jp-practitioner-example-male-1)
* bodySite = $JP_DentalBodySite_CS#1026 "左側上顎第１大臼歯"
* bodySite.extension[bodySiteStatus].valueCodeableConcept = $JP_DentalBodySiteStatus_CS#0