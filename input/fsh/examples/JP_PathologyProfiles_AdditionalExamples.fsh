// Additional standalone examples for Observation, ImagingStudy, and Media

// Observation example - 胃癌生検
Instance: JP_ObservationPathology_Example_GastricBiopsy
InstanceOf: JP_Observation_Pathology
Usage: #example
Title: "病理観察結果例（胃癌生検）"
Description: "胃癌生検の病理観察結果例"

* status = #final
* category[first] = $JP_SimpleObservationCategory_CS#procedure "Procedure"
* category[second].coding.system = $Loinc_CS
* category[second].coding.code = #LP29708-2
* category[second].coding.display = "Pathology"
* code = $Loinc_CS#22634-0 "Pathology report final diagnosis"
* subject = Reference(Patient/jp-patient-example-1)
* effectiveDateTime = "2025-08-14T09:30:00+09:00"
* valueString = "胃腺癌、低分化型、signet-ring cell carcinoma"
* bodySite = $JP_PathologyTerminology_CS#organ.stomach "胃"
* method = $JP_PathologyTerminology_CS#staining.he "HE染色"
* hasMember[0] = Reference(Observation/jp-observation-pathology-gastric-microscopic)
* hasMember[1] = Reference(Observation/jp-observation-pathology-gastric-immunostain)

// Related microscopic finding
Instance: jp-observation-pathology-gastric-microscopic
InstanceOf: JP_Observation_Pathology  
Usage: #inline
Title: "胃癌組織所見"
Description: "胃癌生検の組織所見"

* status = #final
* category[first] = $JP_SimpleObservationCategory_CS#procedure "Procedure"
* category[second].coding.system = $Loinc_CS
* category[second].coding.code = #LP29708-2
* category[second].coding.display = "Pathology"
* code = $Loinc_CS#22637-3 "Pathology report microscopic observation"
* subject = Reference(Patient/jp-patient-example-1)
* effectiveDateTime = "2025-08-14T09:30:00+09:00"
* valueString = "印環細胞癌の所見。細胞質内にムチンを含有した印環細胞が散在性に浸潤している。"
* bodySite = $JP_PathologyTerminology_CS#organ.stomach "胃"
* method = $JP_PathologyTerminology_CS#staining.he "HE染色"

// Related immunostain finding
Instance: jp-observation-pathology-gastric-immunostain
InstanceOf: JP_Observation_Pathology
Usage: #inline
Title: "胃癌免疫染色所見"
Description: "胃癌生検の免疫染色所見"

* status = #final
* category[first] = $JP_SimpleObservationCategory_CS#procedure "Procedure"
* category[second].coding.system = $Loinc_CS
* category[second].coding.code = #LP29708-2
* category[second].coding.display = "Pathology"
* code = $Loinc_CS#22637-3 "Pathology report microscopic observation"
* subject = Reference(Patient/jp-patient-example-1)
* effectiveDateTime = "2025-08-14T09:30:00+09:00"
* valueString = "免疫組織化学的検索結果"
* bodySite = $JP_PathologyTerminology_CS#organ.stomach "胃"
* method = $JP_PathologyTerminology_CS#staining.immunohistochemistry "免疫組織化学"
* component[0].code.text = "CK7"
* component[0].valueString = "陽性"
* component[1].code.text = "CK20" 
* component[1].valueString = "陽性"
* component[2].code.text = "CDX2"
* component[2].valueString = "陽性"
* component[3].code.text = "Her2"
* component[3].valueString = "陰性（0）"

// ImagingStudy example - 肺癌
Instance: JP_ImagingStudyPathology_Example_LungCancer
InstanceOf: JP_ImagingStudy_Pathology
Usage: #example
Title: "病理画像検査例（肺癌）"
Description: "肺癌の病理画像検査例"

* identifier.system = "urn:dicom:uid"
* identifier.value = "1.2.840.113619.2.5.1762583153.215519.978957063.80"
* status = #available
* modality = $DICOM_DCM_CS#GM "General Microscopy"
* subject = Reference(Patient/jp-patient-example-1)
* started = "2025-08-14T13:00:00+09:00"
* reasonCode = $JP_PathologyTerminology_CS#morphology.adenocarcinoma "腺癌"
* reasonReference = Reference(Condition/jp-condition-lung-cancer)
* description = "肺腺癌生検の顕微鏡検査"
* numberOfSeries = 4
* numberOfInstances = 25
* note.text = "TTF-1, napsin A による免疫染色を含む"

* series[0].uid = "1.2.840.113619.2.5.1762583153.215519.978957063.80.1"
* series[0].number = 1
* series[0].modality = $DICOM_DCM_CS#GM "General Microscopy"
* series[0].description = "HE染色（×40）"
* series[0].numberOfInstances = 8
* series[0].bodySite = $JP_PathologyTerminology_CS#organ.lung "肺"
* series[0].started = "2025-08-14T13:00:00+09:00"
* series[0].performer = Reference(Practitioner/jp-practitioner-example-male-1)

* series[1].uid = "1.2.840.113619.2.5.1762583153.215519.978957063.80.2"
* series[1].number = 2
* series[1].modality = $DICOM_DCM_CS#GM "General Microscopy"
* series[1].description = "HE染色（×100）"
* series[1].numberOfInstances = 6
* series[1].bodySite = $JP_PathologyTerminology_CS#organ.lung "肺"

* series[2].uid = "1.2.840.113619.2.5.1762583153.215519.978957063.80.3"
* series[2].number = 3
* series[2].modality = $DICOM_DCM_CS#GM "General Microscopy"
* series[2].description = "免疫組織化学（TTF-1）"
* series[2].numberOfInstances = 6
* series[2].bodySite = $JP_PathologyTerminology_CS#organ.lung "肺"

* series[3].uid = "1.2.840.113619.2.5.1762583153.215519.978957063.80.4"
* series[3].number = 4
* series[3].modality = $DICOM_DCM_CS#GM "General Microscopy"
* series[3].description = "免疫組織化学（napsin A）"
* series[3].numberOfInstances = 5
* series[3].bodySite = $JP_PathologyTerminology_CS#organ.lung "肺"

// Media example - 甲状腺細胞診
Instance: JP_MediaPathology_Example_ThyroidCytology
InstanceOf: JP_Media_Pathology
Usage: #example
Title: "病理画像例（甲状腺細胞診）"
Description: "甲状腺細胞診の顕微鏡画像例"

* status = #completed
* type = #image
* modality = $DICOM_DCM_CS#GM "General Microscopy"
* view = $JP_PathologyTerminology_CS#staining.pas "PAS染色"
* subject = Reference(Patient/jp-patient-example-1)
* encounter = Reference(Encounter/jp-encounter-example-1)
* createdDateTime = "2025-08-14T14:45:00+09:00"
* issued = "2025-08-14T15:00:00+09:00"
* operator = Reference(Practitioner/jp-practitioner-example-female-1)
* reasonCode = $JP_PathologyTerminology_CS#cytology-diagnosis "細胞診断"
* bodySite = $JP_PathologyTerminology_CS#organ.thyroid "甲状腺"
* deviceName = "Olympus BX53 顕微鏡"
* height = 2048
* width = 2048
* content.contentType = #image/tiff
* content.language = #ja-JP
* content.url = "https://example.com/thyroid-cytology-pas.tiff"
* content.size = 8388608
* content.title = "甲状腺細胞診 PAS染色 ×400"
* content.creation = "2025-08-14T14:45:00+09:00"
* note[0].time = "2025-08-14T15:00:00+09:00"
* note[0].text = "濾胞細胞の集塊を認める。細胞異型は軽度。PAS染色でコロイド様物質が陽性。"

// Media example - WSI (Whole Slide Imaging)
Instance: JP_MediaPathology_Example_WSI_Prostate
InstanceOf: JP_Media_Pathology
Usage: #example  
Title: "病理画像例（前立腺WSI）"
Description: "前立腺生検のWhole Slide Imaging例"

* status = #completed
* type = #image
* modality = $DICOM_DCM_CS#GM "General Microscopy"
* view = $JP_PathologyTerminology_CS#staining.he "HE染色"
* subject = Reference(Patient/jp-patient-example-1)
* createdDateTime = "2025-08-14T16:30:00+09:00"
* issued = "2025-08-14T17:00:00+09:00"
* operator = Reference(Practitioner/jp-practitioner-example-male-1)
* reasonCode = $JP_PathologyTerminology_CS#specimen-type.biopsy "生検"
* bodySite = $JP_PathologyTerminology_CS#organ.prostate "前立腺"
* deviceName = "Aperio ScanScope XT"
* height = 46000
* width = 32000
* content.contentType = #image/svs
* content.language = #ja-JP
* content.url = "https://example.com/prostate-biopsy-he.svs"
* content.size = 134217728
* content.title = "前立腺生検 HE染色 全体像（WSI）"
* content.creation = "2025-08-14T16:30:00+09:00"
* note[0].time = "2025-08-14T17:00:00+09:00"
* note[0].text = "前立腺生検6本のうち2本に腺癌を認める。Gleason score 3+4=7。WSI形式で全体像を取得。"
