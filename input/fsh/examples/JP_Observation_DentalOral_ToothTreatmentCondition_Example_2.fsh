Instance: jp-observation-dentaloral-toothtreatmentcondition-example-2
InstanceOf: JP_Observation_DentalOral_ToothTreatmentCondition
Title: "JP Core Observation DentalOral Tooth Treatment Condition Example 口腔診査結果２（現存歯の処置状態）"
Description: "口腔診査結果２（現存歯の処置状態）"
Usage: #example
* status = #final
* category[first].coding.code = #procedure
* category[first].coding.display = "Procedure"
* category[second].coding.code = #LP89803-8
* category[second].coding.display = "Dental"
* category[third].coding.code = #DO-1-02
* category[third].coding.display = "ToothTreatmentCondition"
* category.text = "現存歯の処置状態"
* code = $Loinc_CS#54570-7 "Oral/Dental Status"
* subject = Reference(Patient/jp-patient-example-1)
* effectiveDateTime = "2022-10-01"
* issued = "2022-10-24T17:30:00+09:00"
* performer = Reference(Practitioner/jp-practitioner-example-male-1)
* bodySite = $JP_DentalBodySite_CS#TB-2-1011 "右側上顎中切歯"
* bodySite.extension[bodyStructure].valueCodeableConcept.coding = $JP_DentalBodyStructure_CS#TP-18-01 "歯冠部"
* component[+].code.coding[primary].code = #TP-3-02
* component[=].code.coding[primary].display = "失活歯"
* component[=].code.coding[sub].code = #TD-2-10
* component[=].code.coding[sub].display = "現在歯【処置歯○】（ブリッジＢｒ支台を含む）"
* component[+].code.coding[primary].code = #TP-21-06
* component[=].code.coding[primary].display = "全部修復（全部非金属冠・材質不明、又は材質記載なし・歯冠色）（ＪＣ）"
* component[=].code.coding[sub].code = #TD-2-10
* component[=].code.coding[sub].display = "現在歯【処置歯○】（ブリッジＢｒ支台を含む）"