// ==============================
//   病理サンプルインスタンス
// ==============================

// ------------------------------
// 患者サンプル
// ------------------------------
Instance: PatientPathologyExample
InstanceOf: JP_Patient
Usage: #example
Description: "病理検査を受ける患者の例"
* identifier.system = "urn:oid:1.2.392.100495.20.3.51.11311234567"
* identifier.value = "12345678"
* name[0].use = #official
* name[0].family = "田中"
* name[0].given = "太郎"
* name[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation"
* name[0].extension[0].valueCode = #IDE
* name[1].use = #official
* name[1].family = "タナカ"
* name[1].given = "タロウ"
* name[1].extension[0].url = "http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation"
* name[1].extension[0].valueCode = #SYL
* gender = #male
* birthDate = "1970-01-01"

// ------------------------------
// 検体サンプル（胃生検）
// ------------------------------
Instance: SpecimenPathologyBiopsy
InstanceOf: JP_Specimen_Pathology
Usage: #example
Description: "胃生検検体の例"
* identifier.system = "http://example.org/pathology/specimen-id"
* identifier.value = "SP-2024-00123-A1"
* accessionIdentifier.system = "http://example.org/pathology/accession-id"
* accessionIdentifier.value = "PATH-2024-00123"
* status = #available
* type.coding.system = $SnomedCT_CS
* type.coding.code = #119376003
* type.coding.display = "Tissue specimen"
* type.text = "胃生検組織"
* subject = Reference(PatientPathologyExample)
* receivedTime = "2024-01-15T09:00:00+09:00"
* collection.collectedDateTime = "2024-01-15T08:30:00+09:00"
* collection.method.coding.system = $SnomedCT_CS
* collection.method.coding.code = #129314006
* collection.method.coding.display = "Biopsy"
* collection.bodySite.coding.system = $SnomedCT_CS
* collection.bodySite.coding.code = #69695003
* collection.bodySite.coding.display = "Stomach"
* collection.bodySite.text = "胃体部小弯"
* processing[0].description = "10%中性緩衝ホルマリン固定"
* processing[0].timeDateTime = "2024-01-15T09:30:00+09:00"
* container[0].identifier[0].value = "Block-A1"
* container[0].description = "パラフィンブロック A1"
* extension[0].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Specimen_Pathology_BlockNumber"
* extension[0].valueString = "A1"

// ------------------------------
// 観察結果サンプル（肉眼所見）
// ------------------------------
Instance: ObservationPathologyGross
InstanceOf: JP_Observation_Pathology
Usage: #example
Description: "病理肉眼所見の例"
* status = #final
* category[0].coding.system = "http://terminology.hl7.org/CodeSystem/observation-category"
* category[0].coding.code = #laboratory
* category[1].coding.system = $Loinc_CS
* category[1].coding.code = #LP7839-6
* category[1].coding.display = "病理"
* code.coding.system = $Loinc_CS
* code.coding.code = #22634-0
* code.coding.display = "Pathology report gross observation"
* subject = Reference(PatientPathologyExample)
* effectiveDateTime = "2024-01-15T10:00:00+09:00"
* valueString = "3mm大の粘膜片3個。いずれも灰白色調で、明らかな腫瘍性変化は認めず。"
* specimen = Reference(SpecimenPathologyBiopsy)

// ------------------------------
// 観察結果サンプル（顕微鏡所見）
// ------------------------------
Instance: ObservationPathologyMicro
InstanceOf: JP_Observation_Pathology
Usage: #example
Description: "病理顕微鏡所見の例"
* status = #final
* category[0].coding.system = "http://terminology.hl7.org/CodeSystem/observation-category"
* category[0].coding.code = #laboratory
* category[1].coding.system = $Loinc_CS
* category[1].coding.code = #LP7839-6
* category[1].coding.display = "病理"
* code.coding.system = $Loinc_CS
* code.coding.code = #22635-7
* code.coding.display = "Pathology report microscopic observation"
* subject = Reference(PatientPathologyExample)
* effectiveDateTime = "2024-01-15T14:00:00+09:00"
* valueString = "慢性炎症細胞浸潤を伴う胃粘膜組織。腸上皮化生を認める。悪性所見なし。"
* specimen = Reference(SpecimenPathologyBiopsy)
* method.coding.system = $JP_PathologyStainMethod_CS
* method.coding.code = #he-stain
* method.coding.display = "HE染色"

// ------------------------------
// 観察結果サンプル（免疫染色）
// ------------------------------
Instance: ObservationPathologyImmuno
InstanceOf: JP_Observation_Pathology
Usage: #example
Description: "免疫染色結果の例"
* status = #final
* category[0].coding.system = "http://terminology.hl7.org/CodeSystem/observation-category"
* category[0].coding.code = #laboratory
* category[1].coding.system = $Loinc_CS
* category[1].coding.code = #LP7839-6
* category[1].coding.display = "病理"
* code.coding.system = $Loinc_CS
* code.coding.code = #85336-0
* code.coding.display = "Helicobacter pylori immunohistochemistry"
* subject = Reference(PatientPathologyExample)
* effectiveDateTime = "2024-01-15T15:00:00+09:00"
* valueCodeableConcept.coding.system = "http://snomed.info/sct"
* valueCodeableConcept.coding.code = #10828004
* valueCodeableConcept.coding.display = "Positive"
* valueCodeableConcept.text = "陽性"
* specimen = Reference(SpecimenPathologyBiopsy)
* method.text = "免疫組織化学染色"

// ------------------------------
// 観察結果サンプル（最終診断）
// ------------------------------
Instance: ObservationPathologyDiagnosis
InstanceOf: JP_Observation_Pathology
Usage: #example
Description: "病理最終診断の例"
* status = #final
* category[0].coding.system = "http://terminology.hl7.org/CodeSystem/observation-category"
* category[0].coding.code = #laboratory
* category[1].coding.system = $Loinc_CS
* category[1].coding.code = #LP7839-6
* category[1].coding.display = "病理"
* code.coding.system = $Loinc_CS
* code.coding.code = #22637-3
* code.coding.display = "Pathology report final diagnosis"
* subject = Reference(PatientPathologyExample)
* effectiveDateTime = "2024-01-15T16:00:00+09:00"
* valueCodeableConcept.coding.system = $SnomedCT_CS
* valueCodeableConcept.coding.code = #235653009
* valueCodeableConcept.coding.display = "Helicobacter pylori associated chronic gastritis"
* valueCodeableConcept.text = "ヘリコバクター・ピロリ関連慢性胃炎"
* specimen = Reference(SpecimenPathologyBiopsy)

// ------------------------------
// 診断レポートサンプル
// ------------------------------
Instance: DiagnosticReportPathologyExample
InstanceOf: JP_DiagnosticReport_Pathology
Usage: #example
Description: "病理診断レポートの例"
* identifier.system = "http://example.org/pathology/report-id"
* identifier.value = "PATH-2024-00123"
* status = #final
* category[0].coding.system = $Loinc_CS
* category[0].coding.code = #LP7839-6
* category[0].coding.display = "病理"
* code.coding.system = $Loinc_CS
* code.coding.code = #60568-3
* code.coding.display = "Pathology Synoptic report"
* subject = Reference(PatientPathologyExample)
* effectiveDateTime = "2024-01-15T16:00:00+09:00"
* issued = "2024-01-15T16:30:00+09:00"
* specimen = Reference(SpecimenPathologyBiopsy)
* result[0] = Reference(ObservationPathologyGross)
* result[0].display = "肉眼所見"
* result[1] = Reference(ObservationPathologyMicro)
* result[1].display = "顕微鏡所見"
* result[2] = Reference(ObservationPathologyImmuno)
* result[2].display = "免疫染色"
* result[3] = Reference(ObservationPathologyDiagnosis)
* result[3].display = "最終診断"
* conclusion = "胃体部小弯：慢性胃炎、H. pylori陽性"
* conclusionCode.coding.system = $SnomedCT_CS
* conclusionCode.coding.code = #235653009
* conclusionCode.coding.display = "Helicobacter pylori associated chronic gastritis"

// ------------------------------
// 顕微鏡写真サンプル
// ------------------------------
Instance: MediaPathologyMicrophoto
InstanceOf: JP_Media_Pathology
Usage: #example
Description: "病理顕微鏡写真の例"
* status = #completed
* type = #image
* modality.coding.system = $JP_PathologyMediaModality_CS
* modality.coding.code = #microscopic-photo
* modality.coding.display = "顕微鏡写真"
* subject = Reference(PatientPathologyExample)
* createdDateTime = "2024-01-15T14:30:00+09:00"
* bodySite.coding.system = $SnomedCT_CS
* bodySite.coding.code = #69695003
* bodySite.coding.display = "Stomach"
* bodySite.text = "胃体部小弯"
* deviceName = "Olympus BX53 顕微鏡カメラシステム"
* height = 2048
* width = 2560
* content.contentType = #image/jpeg
* content.url = "http://example.org/pathology/images/microscopic-00123-01.jpg"
* content.title = "HE染色 400倍"
* note[0].text = "慢性炎症細胞浸潤と腸上皮化生を認める"
* partOf = Reference(DiagnosticReportPathologyExample)
* extension[0].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Media_Pathology_Magnification"
* extension[0].valueDecimal = 400
* extension[1].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Media_Pathology_StainMethod"
* extension[1].valueCodeableConcept.coding.system = $JP_PathologyStainMethod_CS
* extension[1].valueCodeableConcept.coding.code = #he-stain
* extension[1].valueCodeableConcept.coding.display = "HE染色"
* extension[2].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Media_Pathology_SpecimenLabel"
* extension[2].extension[0].url = "blockNumber"
* extension[2].extension[0].valueString = "A1"
* extension[2].extension[1].url = "slideNumber"
* extension[2].extension[1].valueString = "A1-1"

// ------------------------------
// WSI画像サンプル
// ------------------------------
Instance: ImagingStudyPathologyWSI
InstanceOf: JP_ImagingStudy_Pathology
Usage: #example
Description: "病理WSI画像の例"
* identifier.system = "urn:dicom:uid"
* identifier.value = "urn:oid:1.2.392.200036.9116.2.2024.1234567"
* status = #available
* modality.system = "http://dicom.nema.org/resources/ontology/DCM"
* modality.code = #SM
* modality.display = "Slide Microscopy"
* subject = Reference(PatientPathologyExample)
* started = "2024-01-15T14:00:00+09:00"
* numberOfSeries = 1
* numberOfInstances = 3
* description = "胃生検標本のWSIスキャン"
* series[0].uid = "1.2.392.200036.9116.2.2024.1234567.1"
* series[0].number = 1
* series[0].modality.system = "http://dicom.nema.org/resources/ontology/DCM"
* series[0].modality.code = #SM
* series[0].description = "HE染色"
* series[0].numberOfInstances = 3
* series[0].specimen = Reference(SpecimenPathologyBiopsy)
* series[0].started = "2024-01-15T14:00:00+09:00"
* series[0].instance[0].uid = "1.2.392.200036.9116.2.2024.1234567.1.1"
* series[0].instance[0].sopClass.system = "urn:ietf:rfc:3986"
* series[0].instance[0].sopClass.code = #"urn:oid:1.2.840.10008.5.1.4.1.1.77.1.6"
* series[0].instance[0].number = 1
* series[0].instance[0].title = "20x magnification"
* series[0].instance[1].uid = "1.2.392.200036.9116.2.2024.1234567.1.2"
* series[0].instance[1].sopClass.system = "urn:ietf:rfc:3986"
* series[0].instance[1].sopClass.code = #urn:oid:1.2.840.10008.5.1.4.1.1.77.1.6
* series[0].instance[1].number = 2
* series[0].instance[1].title = "40x magnification"
* series[0].instance[2].uid = "1.2.392.200036.9116.2.2024.1234567.1.3"
* series[0].instance[2].sopClass.system = "urn:ietf:rfc:3986"
* series[0].instance[2].sopClass.code = #urn:oid:1.2.840.10008.5.1.4.1.1.77.1.6
* series[0].instance[2].number = 3
* series[0].instance[2].title = "100x magnification"