Instance: jp-observation-dentaloral-toothtreatmentcondition-example-2
InstanceOf: JP_Observation_DentalOral_ToothTreatmentCondition
Title: "JP Core Observation DentalOral Tooth Treatment Condition Example 口腔診査結果２（現存歯の処置状態）"
Description: "口腔診査結果２（現存歯の処置状態）"
Usage: #example
* status = #final
* category[first] = $JP_SimpleObservationCategory_CS#procedure "Procedure"
* category[second] = $Loinc_CS#LP89803-8 "Dental Oral"
* category[third] = $JP_ObservationDentalCategory_VS#DO-1-02 "ToothTreatmentCondition"
* category.text = "現存歯の処置状態"
* code = $Loinc_CS#54570-7 "Oral/Dental Status"
* subject = Reference(Patient/jp-patient-example-1)
* effectiveDateTime = "2022-10-01"
* issued = "2022-10-24T17:30:00+09:00"
* performer = Reference(Practitioner/jp-practitioner-example-male-1)
* bodySite = $JP_DentalBodySite_VS#TB-2-1011 "右側上顎中切歯"
* bodyStructure = $JP_DentalBodyStructure_VS#TP-18-01 "歯冠部"
* component[0].code[primary] = $JP_DentalPresentTeethObservation_VS#TP-3-02 "失活歯"
* component[0].code[sub]= $JP_DentalSimplePresentTeethObservation_VS#TD-2-10 "現在歯【処置歯○】（ブリッジＢｒ支台を含む）"
* component[+].code[primary] = $JP_DentalPresentTeethObservation_VS#TP-21-06 "全部修復（全部非金属冠・材質不明、又は材質記載なし・歯冠色）（ＪＣ）"
* component[+].code[sub]= $JP_DentalSimplePresentTeethObservation_VS#TD-2-10 "現在歯【処置歯○】（ブリッジＢｒ支台を含む）"