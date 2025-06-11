Instance: jp-observation-dentaloral-missingtoothcondition-example-6
InstanceOf: JP_Observation_DentalOral_MissingToothCondition
Title: "JP Core Observation DentalOral Missing Tooth Condition Example 口腔診査結果５（欠損歯の状態）"
Description: "口腔診査結果５（欠損歯の状態）"
Usage: #example
* status = #final
* category[first].coding.code = #procedure
* category[first].coding.display = "Procedure"
* category[second].coding.code = #LP89803-8
* category[second].coding.display = "Dental"
* category[third].coding.display = "MissingToothCondition"
* category.text = "現存歯の処置状態"
* code = $Loinc_CS#54570-7 "Oral/Dental Status"
* subject = Reference(Patient/jp-patient-example-1)
* effectiveDateTime = "2022-10-01"
* issued = "2022-10-24T17:30:00+09:00"
* performer = Reference(Practitioner/jp-practitioner-example-male-1)
* bodySite = $JP_DentalBodySite_CS#TB-2-1046 "右側下顎第１大臼歯"
//* bodySite.extension[bodyStructure].valueCodeableConcept.coding = $JP_DentalBodyStructure_CS#TP-18-01 "歯冠部"
* component.code.coding[primary].code = #TM-4-02
* component.code.coding[primary].display = "有床義歯（レジン床）"
* component.code.coding[sub].code = #TD-2-59
* component.code.coding[sub].display = "欠損歯【喪失歯（欠損補綴歯・義歯・人工歯）(△)】"
