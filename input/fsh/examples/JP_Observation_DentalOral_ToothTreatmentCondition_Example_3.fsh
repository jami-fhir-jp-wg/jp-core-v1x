Instance: jp-observation-dentaloral-toothtreatmentcondition-example-3
InstanceOf: JP_Observation_DentalOral_ToothTreatmentCondition
Title: "JP Core Observation DentalOral Tooth Treatment Condition Example 口腔診査結果３（現存歯の処置状態）"
Description: "口腔診査結果３（現存歯の処置状態）"
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
* bodySite = $JP_DentalBodySite_VS#TB-2-1026 "左側上顎第１大臼歯"
* bodyStructure[0] = $JP_DentalBodyStructure_VS#TP-13-01 "切端・咬合面ＩＯ（切端I又は咬合面Ｏ）"
* bodyStructure[+] = $JP_DentalBodyStructure_VS#TP-15-01 "口蓋側面・舌側面ＰＬ（口蓋側面Ｐ又は舌側面Ｌ（Ｌｉ））"
* bodyStructure[+] = $JP_DentalBodyStructure_VS#TP-16-01 "近心面Ｍ"
* bodyStructure[+] = $JP_DentalBodyStructure_VS#TP-17-01 "遠心面Ｄ"
* bodyStructure[+] = $JP_DentalBodyStructure_VS#TP-18-01 "歯冠部"
* component[0].code[primary] = $JP_DentalPresentTeethObservation_VS#TP-11-22 "部分修復（単純・複雑の情報なし）（金属インレー・金色）（Ｉｎ）"
* component[0].code[sub]= $JP_DentalSimplePresentTeethObservation_VS#TD-2-10 "現在歯【処置歯○】（ブリッジＢｒ支台を含む）"