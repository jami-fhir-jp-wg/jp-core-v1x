// Example 1: 組織診断（乳癌の生検）
Instance: JP_DiagnosticReportPathology_Example_1
InstanceOf: JP_DiagnosticReport_Pathology
Usage: #example
Title: "病理診断レポート例1（乳癌組織診断）"
Description: "乳癌の組織診断における病理診断レポートの例"

* status = #final
* category[first] = $Loinc_CS#LP29708-2 "Pathology"
* code = $Loinc_CS#33717-0 "Pathology report"
* subject = Reference(Patient/jp-patient-example-1)
* effectiveDateTime = "2025-08-14"
* issued = "2025-08-16T14:30:00+09:00"
* performer[0] = Reference(Practitioner/jp-practitioner-example-male-1) "病理 太郎"
* resultsInterpreter[0] = Reference(Practitioner/jp-practitioner-example-male-1) "病理 太郎"
* specimen = Reference(Specimen/jp-specimen-example-pathology-1)
* result[0] = Reference(Observation/jp-observation-pathology-example-final-diagnosis-1)
* result[1] = Reference(Observation/jp-observation-pathology-example-gross-finding-1)
* result[2] = Reference(Observation/jp-observation-pathology-example-microscopic-finding-1)
* result[3] = Reference(Observation/jp-observation-pathology-example-immunostain-1)
* imagingStudy = Reference(ImagingStudy/jp-imagingstudy-pathology-example-1)
* conclusion = "乳腺浸潤性乳管癌、中分化型、T1cN0M0、Stage IA"
* conclusionCode[0] = $JP_PathologyTerminology_CS#morphology.adenocarcinoma "腺癌"
* conclusionCode[1] = $JP_PathologyTerminology_CS#organ.breast "乳腺"
* presentedForm.contentType = #application/pdf
* presentedForm.language = #ja-JP
* presentedForm.title = "病理診断報告書"
* presentedForm.url = "https://example.com/pathology-report-1.pdf"

// Final diagnosis observation
Instance: jp-observation-pathology-example-final-diagnosis-1
InstanceOf: JP_Observation_Pathology
Usage: #inline
Title: "病理最終診断例1"
Description: "乳癌の最終診断"

* status = #final
* category[first] = $JP_SimpleObservationCategory_CS#procedure "Procedure"
* category[second].coding.system = $Loinc_CS
* category[second].coding.code = #LP29708-2
* category[second].coding.display = "Pathology"
* code = $Loinc_CS#22634-0 "Pathology report final diagnosis"
* subject = Reference(Patient/jp-patient-example-1)
* effectiveDateTime = "2025-08-14"
* valueString = "乳腺浸潤性乳管癌、中分化型、組織学的グレード2"
* bodySite = $JP_PathologyTerminology_CS#organ.breast "乳腺"
* specimen = Reference(Specimen/jp-specimen-example-pathology-1)
* method = $JP_PathologyTerminology_CS#staining.he "HE染色"
* component[0].code = $Loinc_CS#33747-0 "Histologic grade"
* component[0].valueString = "Grade 2 (中分化型)"
* component[1].code = $Loinc_CS#21889-1 "Size Tumor"
* component[1].valueString = "1.8 cm"

// Gross finding observation
Instance: jp-observation-pathology-example-gross-finding-1
InstanceOf: JP_Observation_Pathology
Usage: #inline
Title: "肉眼所見例1"
Description: "乳癌の肉眼所見"

* status = #final
* category[first] = $JP_SimpleObservationCategory_CS#procedure "Procedure"
* category[second].coding.system = $Loinc_CS
* category[second].coding.code = #LP29708-2
* category[second].coding.display = "Pathology"
* code = $Loinc_CS#22636-5 "Pathology report gross observation"
* subject = Reference(Patient/jp-patient-example-1)
* effectiveDateTime = "2025-08-14"
* valueString = "右乳腺外上象限に1.8×1.5×1.2cmの灰白色、境界不明瞭な腫瘤を認める。割面は白色充実性で、中心部に壊死を伴う。"
* bodySite = $JP_PathologyTerminology_CS#organ.breast "乳腺"
* specimen = Reference(Specimen/jp-specimen-example-pathology-1)

// Microscopic finding observation  
Instance: jp-observation-pathology-example-microscopic-finding-1
InstanceOf: JP_Observation_Pathology
Usage: #inline
Title: "組織所見例1"
Description: "乳癌の組織所見"

* status = #final
* category[first] = $JP_SimpleObservationCategory_CS#procedure "Procedure"
* category[second].coding.system = $Loinc_CS
* category[second].coding.code = #LP29708-2
* category[second].coding.display = "Pathology"
* code = $Loinc_CS#22637-3 "Pathology report microscopic observation"
* subject = Reference(Patient/jp-patient-example-1)
* effectiveDateTime = "2025-08-14"
* valueString = "腺管構造を示す浸潤性乳管癌。核異型は中等度、細胞密度は高い。間質には線維化と炎症細胞浸潤を認める。"
* bodySite = $JP_PathologyTerminology_CS#organ.breast "乳腺"
* specimen = Reference(Specimen/jp-specimen-example-pathology-1)
* method = $JP_PathologyTerminology_CS#staining.he "HE染色"

// Immunostain observation
Instance: jp-observation-pathology-example-immunostain-1
InstanceOf: JP_Observation_Pathology
Usage: #inline
Title: "免疫染色所見例1"
Description: "乳癌の免疫組織化学所見"

* status = #final
* category[first] = $JP_SimpleObservationCategory_CS#procedure "Procedure"
* category[second].coding.system = $Loinc_CS
* category[second].coding.code = #LP29708-2
* category[second].coding.display = "Pathology"
* code = $Loinc_CS#22637-3 "Pathology report microscopic observation"
* subject = Reference(Patient/jp-patient-example-1)
* effectiveDateTime = "2025-08-14"
* valueString = "免疫組織化学染色所見"
* bodySite = $JP_PathologyTerminology_CS#organ.breast "乳腺"
* specimen = Reference(Specimen/jp-specimen-example-pathology-1)
* method = $JP_PathologyTerminology_CS#staining.immunohistochemistry "免疫組織化学"
* component[0].code.text = "ER"
* component[0].valueString = "陽性（90%, 3+）"
* component[1].code.text = "PgR"
* component[1].valueString = "陽性（80%, 3+）"
* component[2].code.text = "HER2"
* component[2].valueString = "陰性（0）"
* component[3].code.text = "Ki-67"
* component[3].valueString = "20%"

// ImagingStudy example
Instance: jp-imagingstudy-pathology-example-1
InstanceOf: JP_ImagingStudy_Pathology
Usage: #inline
Title: "病理画像検査例1"
Description: "乳癌の病理画像検査"

* identifier.system = "urn:dicom:uid"
* identifier.value = "1.2.840.113619.2.5.1762583153.215519.978957063.78"
* status = #available
* modality = $DICOM_DCM_CS#GM "General Microscopy"
* subject = Reference(Patient/jp-patient-example-1)
* started = "2025-08-14T09:00:00+09:00"
* reasonCode = $JP_PathologyTerminology_CS#morphology.adenocarcinoma "腺癌"
* description = "乳腺組織の顕微鏡検査"
* numberOfSeries = 3
* numberOfInstances = 15

* series[0].uid = "1.2.840.113619.2.5.1762583153.215519.978957063.78.1"
* series[0].number = 1
* series[0].modality = $DICOM_DCM_CS#GM "General Microscopy"
* series[0].description = "HE染色"
* series[0].numberOfInstances = 8
* series[0].bodySite = $JP_PathologyTerminology_CS#organ.breast "乳腺"

* series[1].uid = "1.2.840.113619.2.5.1762583153.215519.978957063.78.2"
* series[1].number = 2
* series[1].modality = $DICOM_DCM_CS#GM "General Microscopy"
* series[1].description = "免疫組織化学（ER）"
* series[1].numberOfInstances = 4
* series[1].bodySite = $JP_PathologyTerminology_CS#organ.breast "乳腺"

* series[2].uid = "1.2.840.113619.2.5.1762583153.215519.978957063.78.3"
* series[2].number = 3
* series[2].modality = $DICOM_DCM_CS#GM "General Microscopy"  
* series[2].description = "免疫組織化学（Ki-67）"
* series[2].numberOfInstances = 3
* series[2].bodySite = $JP_PathologyTerminology_CS#organ.breast "乳腺"
