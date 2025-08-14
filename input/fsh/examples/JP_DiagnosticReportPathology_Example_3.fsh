// Example 3: 手術検体（大腸癌の切除標本）
Instance: JP_DiagnosticReportPathology_Example_3
InstanceOf: JP_DiagnosticReport_Pathology
Usage: #example
Title: "病理診断レポート例3（大腸癌手術検体）"
Description: "大腸癌の手術検体における病理診断レポートの例"

* status = #final
* category[first] = $Loinc_CS#LP29708-2 "Pathology"
* code = $Loinc_CS#33717-0 "Pathology report"
* subject = Reference(Patient/jp-patient-example-1)
* effectiveDateTime = "2025-08-14"
* issued = "2025-08-18T16:00:00+09:00"
* performer[0] = Reference(Practitioner/jp-practitioner-example-male-2) "消化器病理 次郎"
* resultsInterpreter[0] = Reference(Practitioner/jp-practitioner-example-male-2) "消化器病理 次郎"
* specimen = Reference(Specimen/jp-specimen-example-pathology-3)
* result[0] = Reference(Observation/jp-observation-pathology-example-final-diagnosis-3)
* result[1] = Reference(Observation/jp-observation-pathology-example-gross-finding-3)
* result[2] = Reference(Observation/jp-observation-pathology-example-microscopic-finding-3)
* result[3] = Reference(Observation/jp-observation-pathology-example-lymphnode-3)
* result[4] = Reference(Observation/jp-observation-pathology-example-tnm-staging-3)
* imagingStudy = Reference(ImagingStudy/jp-imagingstudy-pathology-example-3)
* media.link = Reference(Media/jp-media-pathology-example-3)
* media.comment = "肉眼写真および組織像"
* conclusion = "結腸腺癌、中分化型、T3N1M0、Stage IIIB、根治度A"
* conclusionCode[0] = $JP_PathologyTerminology_CS#morphology.adenocarcinoma "腺癌"
* conclusionCode[1] = $JP_PathologyTerminology_CS#organ.colon "大腸"
* presentedForm.contentType = #application/pdf
* presentedForm.language = #ja-JP
* presentedForm.title = "手術検体病理診断報告書"
* presentedForm.url = "https://example.com/surgical-pathology-report-1.pdf"

// Final diagnosis observation
Instance: jp-observation-pathology-example-final-diagnosis-3
InstanceOf: JP_Observation_Pathology
Usage: #inline
Title: "病理最終診断例3"
Description: "大腸癌の最終診断"

* status = #final
* category[first] = $JP_SimpleObservationCategory_CS#procedure "Procedure"
* category[second].coding.system = $Loinc_CS
* category[second].coding.code = #LP29708-2
* category[second].coding.display = "Pathology"
* code = $Loinc_CS#22634-0 "Pathology report final diagnosis"
* subject = Reference(Patient/jp-patient-example-1)
* effectiveDateTime = "2025-08-14"
* valueString = "結腸腺癌、中分化型、pT3N1M0、Stage IIIB"
* bodySite = $JP_PathologyTerminology_CS#organ.colon "大腸"
* specimen = Reference(Specimen/jp-specimen-example-pathology-3)
* method = $JP_PathologyTerminology_CS#staining.he "HE染色"
* component[0].code.text = "組織型"
* component[0].valueString = "腺癌（中分化型）"
* component[1].code.text = "腫瘍径"
* component[1].valueString = "4.5 × 3.8 × 2.1 cm"
* component[2].code.text = "浸潤度"
* component[2].valueString = "pT3（固有筋層を越えて浸潤）"
* component[3].code.text = "リンパ節転移"
* component[3].valueString = "pN1（1個のリンパ節に転移）"

// Gross finding observation
Instance: jp-observation-pathology-example-gross-finding-3
InstanceOf: JP_Observation_Pathology
Usage: #inline
Title: "肉眼所見例3"
Description: "大腸癌の肉眼所見"

* status = #final
* category[first] = $JP_SimpleObservationCategory_CS#procedure "Procedure"
* category[second].coding.system = $Loinc_CS
* category[second].coding.code = #LP29708-2
* category[second].coding.display = "Pathology"
* code = $Loinc_CS#22636-5 "Pathology report gross observation"
* subject = Reference(Patient/jp-patient-example-1)
* effectiveDateTime = "2025-08-14"
* valueString = "S状結腸に4.5×3.8cmの潰瘍を伴う隆起性病変を認める。腫瘍は漿膜面に露出している。切除断端は陰性。"
* bodySite = $JP_PathologyTerminology_CS#organ.colon "大腸"
* specimen = Reference(Specimen/jp-specimen-example-pathology-3)
* component[0].code.text = "腫瘍の局在"
* component[0].valueString = "S状結腸"
* component[1].code.text = "肉眼型"
* component[1].valueString = "2型（潰瘍限局型）"
* component[2].code.text = "腫瘍径"
* component[2].valueString = "4.5 × 3.8 cm"
* component[3].code.text = "口側断端"
* component[3].valueString = "陰性（腫瘍から5.2cm）"
* component[4].code.text = "肛門側断端"
* component[4].valueString = "陰性（腫瘍から4.8cm）"

// Microscopic finding observation  
Instance: jp-observation-pathology-example-microscopic-finding-3
InstanceOf: JP_Observation_Pathology
Usage: #inline
Title: "組織所見例3"
Description: "大腸癌の組織所見"

* status = #final
* category[first] = $JP_SimpleObservationCategory_CS#procedure "Procedure"
* category[second].coding.system = $Loinc_CS
* category[second].coding.code = #LP29708-2
* category[second].coding.display = "Pathology"
* code = $Loinc_CS#22637-3 "Pathology report microscopic observation"
* subject = Reference(Patient/jp-patient-example-1)
* effectiveDateTime = "2025-08-14"
* valueString = "中分化腺癌。腺管構造は比較的保たれているが、核異型は中等度。固有筋層を越えて漿膜下組織に浸潤している。"
* bodySite = $JP_PathologyTerminology_CS#organ.colon "大腸"
* specimen = Reference(Specimen/jp-specimen-example-pathology-3)
* method = $JP_PathologyTerminology_CS#staining.he "HE染色"
* component[0].code.text = "分化度"
* component[0].valueString = "中分化型"
* component[1].code.text = "核異型"
* component[1].valueString = "中等度"
* component[2].code.text = "腺管形成"
* component[2].valueString = "50-95%"
* component[3].code.text = "浸潤様式"
* component[3].valueString = "中間型"

// Lymph node observation
Instance: jp-observation-pathology-example-lymphnode-3
InstanceOf: JP_Observation_Pathology
Usage: #inline
Title: "リンパ節所見例3"
Description: "大腸癌のリンパ節所見"

* status = #final
* category[first] = $JP_SimpleObservationCategory_CS#procedure "Procedure"
* category[second].coding.system = $Loinc_CS
* category[second].coding.code = #LP29708-2
* category[second].coding.display = "Pathology"
* code = $Loinc_CS#22637-3 "Pathology report microscopic observation"
* subject = Reference(Patient/jp-patient-example-1)
* effectiveDateTime = "2025-08-14"
* valueString = "検索リンパ節15個中1個に転移を認める（腸管傍リンパ節）"
* bodySite = $JP_PathologyTerminology_CS#organ.colon "大腸"
* specimen = Reference(Specimen/jp-specimen-example-pathology-3)
* method = $JP_PathologyTerminology_CS#staining.he "HE染色"
* component[0].code.text = "検索リンパ節数"
* component[0].valueString = "15個"
* component[1].code.text = "転移陽性リンパ節数"  
* component[1].valueString = "1個"
* component[2].code.text = "転移リンパ節の部位"
* component[2].valueString = "腸管傍リンパ節"

// TNM staging observation
Instance: jp-observation-pathology-example-tnm-staging-3
InstanceOf: JP_Observation_Pathology
Usage: #inline
Title: "TNM分類例3"
Description: "大腸癌のTNM分類"

* status = #final
* category[first] = $JP_SimpleObservationCategory_CS#procedure "Procedure"
* category[second].coding.system = $Loinc_CS
* category[second].coding.code = #LP29708-2
* category[second].coding.display = "Pathology"
* code = $Loinc_CS#22634-0 "Pathology report final diagnosis"
* subject = Reference(Patient/jp-patient-example-1)
* effectiveDateTime = "2025-08-14"
* valueString = "pT3N1M0, Stage IIIB"
* bodySite = $JP_PathologyTerminology_CS#organ.colon "大腸"
* specimen = Reference(Specimen/jp-specimen-example-pathology-3)
* component[0].code.text = "pT"
* component[0].valueString = "pT3"
* component[1].code.text = "pN"
* component[1].valueString = "pN1"
* component[2].code.text = "pM"
* component[2].valueString = "pM0"
* component[3].code.text = "Stage"
* component[3].valueString = "IIIB"

// ImagingStudy example
Instance: jp-imagingstudy-pathology-example-3
InstanceOf: JP_ImagingStudy_Pathology
Usage: #inline
Title: "病理画像検査例3"
Description: "大腸癌の病理画像検査"

* identifier.system = "urn:dicom:uid"
* identifier.value = "1.2.840.113619.2.5.1762583153.215519.978957063.79"
* status = #available
* modality = $DICOM_DCM_CS#GM "General Microscopy"
* subject = Reference(Patient/jp-patient-example-1)
* started = "2025-08-14T14:00:00+09:00"
* reasonCode = $JP_PathologyTerminology_CS#morphology.adenocarcinoma "腺癌"
* description = "大腸癌手術検体の顕微鏡検査"
* numberOfSeries = 2
* numberOfInstances = 20

* series[0].uid = "1.2.840.113619.2.5.1762583153.215519.978957063.79.1"
* series[0].number = 1
* series[0].modality = $DICOM_DCM_CS#GM "General Microscopy"
* series[0].description = "HE染色（腫瘍部）"
* series[0].numberOfInstances = 12
* series[0].bodySite = $JP_PathologyTerminology_CS#organ.colon "大腸"

* series[1].uid = "1.2.840.113619.2.5.1762583153.215519.978957063.79.2"
* series[1].number = 2
* series[1].modality = $DICOM_DCM_CS#GM "General Microscopy"
* series[1].description = "HE染色（リンパ節）"
* series[1].numberOfInstances = 8
* series[1].bodySite = $JP_PathologyTerminology_CS#organ.colon "大腸"

// Media example
Instance: jp-media-pathology-example-3
InstanceOf: JP_Media_Pathology
Usage: #inline
Title: "病理画像例3"
Description: "大腸癌の肉眼写真"

* status = #completed
* type = #image
* modality = $DICOM_DCM_CS#XC "External-camera Photography"
* subject = Reference(Patient/jp-patient-example-1)
* createdDateTime = "2025-08-14T10:30:00+09:00"
* issued = "2025-08-14T11:00:00+09:00"
* operator = Reference(Practitioner/jp-practitioner-example-male-2)
* reasonCode = $JP_PathologyTerminology_CS#specimen-type.surgical "手術検体"
* bodySite = $JP_PathologyTerminology_CS#organ.colon "大腸"
* deviceName = "病理写真撮影装置"
* height = 2048
* width = 1536
* content.contentType = #image/jpeg
* content.language = #ja-JP
* content.url = "https://example.com/pathology-macro-photo-3.jpg"
* content.size = 1048576
* content.title = "S状結腸癌切除標本肉眼写真"
* note.text = "切除標本の肉眼写真。腫瘍の形態と大きさ、切除断端の状態を示す。"
