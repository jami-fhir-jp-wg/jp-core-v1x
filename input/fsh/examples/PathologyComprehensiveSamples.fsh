// ==============================
//   病理包括的サンプルインスタンス（6種類）
// ==============================

// ==============================
// 1. 肺癌手術検体
// ==============================

Instance: PatientLungCancer
InstanceOf: JP_Patient
Usage: #example
Description: "肺癌患者の例"
* identifier.system = "urn:oid:1.2.392.100495.20.3.51.11311234567"
* identifier.value = "23456789"
* name[0].family = "山田"
* name[0].given = "花子"
* gender = #female
* birthDate = "1955-05-15"

Instance: SpecimenLungResection
InstanceOf: JP_Specimen_Pathology
Usage: #example
Description: "肺葉切除検体"
* identifier.system = "http://example.org/pathology/specimen-id"
* identifier.value = "SP-2024-00456-LC"
* accessionIdentifier.value = "PATH-2024-00456"
* status = #available
* type.coding.system = $SnomedCT_CS
* type.coding.code = #119376003
* type.coding.display = "Tissue specimen"
* type.text = "右上葉切除標本"
* subject = Reference(PatientLungCancer)
* receivedTime = "2024-02-01T10:00:00+09:00"
* collection.collectedDateTime = "2024-02-01T09:00:00+09:00"
* collection.method.text = "手術切除"
* collection.bodySite.coding.system = $SnomedCT_CS
* collection.bodySite.coding.code = #44714003
* collection.bodySite.coding.display = "Right upper lobe of lung"

Instance: ObservationLungGross
InstanceOf: JP_Observation_Pathology
Usage: #example
Description: "肺癌肉眼所見"
* status = #final
* category[0].coding.code = #laboratory
* category[1].coding.system = $Loinc_CS
* category[1].coding.code = #LP7839-6
* code.coding.system = $Loinc_CS
* code.coding.code = #22634-0
* subject = Reference(PatientLungCancer)
* effectiveDateTime = "2024-02-01T14:00:00+09:00"
* valueString = "右上葉：3.5×3.0×2.5cm大の灰白色充実性腫瘤。胸膜浸潤あり。"
* specimen = Reference(SpecimenLungResection)

Instance: ObservationLungMicro
InstanceOf: JP_Observation_Pathology
Usage: #example
Description: "肺癌顕微鏡所見"
* status = #final
* category[0].coding.code = #laboratory
* category[1].coding.system = $Loinc_CS
* category[1].coding.code = #LP7839-6
* code.coding.system = $Loinc_CS
* code.coding.code = #22635-7
* subject = Reference(PatientLungCancer)
* effectiveDateTime = "2024-02-02T10:00:00+09:00"
* valueString = "腺癌、中分化型。脈管侵襲あり。リンパ節転移1/15。"
* specimen = Reference(SpecimenLungResection)

Instance: ObservationLungImmunoTTF1
InstanceOf: JP_Observation_Pathology
Usage: #example
Description: "TTF-1免疫染色"
* status = #final
* category[0].coding.code = #laboratory
* category[1].coding.system = $Loinc_CS
* category[1].coding.code = #LP7839-6
* code.text = "TTF-1免疫染色"
* subject = Reference(PatientLungCancer)
* effectiveDateTime = "2024-02-02T14:00:00+09:00"
* valueCodeableConcept.text = "陽性"
* specimen = Reference(SpecimenLungResection)

Instance: DiagnosticReportLungCancer
InstanceOf: JP_DiagnosticReport_Pathology
Usage: #example
Description: "肺癌病理診断レポート"
* identifier.value = "PATH-2024-00456"
* status = #final
* category.coding.system = $Loinc_CS
* category.coding.code = #LP7839-6
* code.coding.system = $Loinc_CS
* code.coding.code = #60568-3
* subject = Reference(PatientLungCancer)
* effectiveDateTime = "2024-02-02T16:00:00+09:00"
* specimen = Reference(SpecimenLungResection)
* result[0] = Reference(ObservationLungGross)
* result[1] = Reference(ObservationLungMicro)
* result[2] = Reference(ObservationLungImmunoTTF1)
* conclusion = "肺腺癌、pT2aN1M0、Stage IIB"

// ==============================
// 2. 乳癌針生検
// ==============================

Instance: PatientBreastCancer
InstanceOf: JP_Patient
Usage: #example
Description: "乳癌患者の例"
* identifier.value = "34567890"
* name[0].family = "佐藤"
* name[0].given = "美咲"
* gender = #female
* birthDate = "1965-03-20"

Instance: SpecimenBreastBiopsy
InstanceOf: JP_Specimen_Pathology
Usage: #example
Description: "乳腺針生検検体"
* identifier.value = "SP-2024-00789-BB"
* accessionIdentifier.value = "PATH-2024-00789"
* status = #available
* type.coding.system = $SnomedCT_CS
* type.coding.code = #119295008
* type.coding.display = "Specimen obtained by biopsy"
* type.text = "乳腺針生検"
* subject = Reference(PatientBreastCancer)
* receivedTime = "2024-02-10T13:00:00+09:00"
* collection.collectedDateTime = "2024-02-10T10:00:00+09:00"
* collection.method.coding.system = $SnomedCT_CS
* collection.method.coding.code = #14152002
* collection.method.coding.display = "Core needle biopsy"
* collection.bodySite.text = "右乳房C領域"

Instance: ObservationBreastMicro
InstanceOf: JP_Observation_Pathology
Usage: #example
Description: "乳癌顕微鏡所見"
* status = #final
* category[0].coding.code = #laboratory
* category[1].coding.system = $Loinc_CS
* category[1].coding.code = #LP7839-6
* code.coding.system = $Loinc_CS
* code.coding.code = #22635-7
* subject = Reference(PatientBreastCancer)
* effectiveDateTime = "2024-02-11T10:00:00+09:00"
* valueString = "浸潤性乳管癌、組織学的グレード2。"
* specimen = Reference(SpecimenBreastBiopsy)

Instance: ObservationBreastER
InstanceOf: JP_Observation_Pathology
Usage: #example
Description: "エストロゲン受容体"
* status = #final
* category[0].coding.code = #laboratory
* category[1].coding.system = $Loinc_CS
* category[1].coding.code = #LP7839-6
* code.coding.system = $Loinc_CS
* code.coding.code = #85337-8
* code.coding.display = "Estrogen receptor"
* subject = Reference(PatientBreastCancer)
* effectiveDateTime = "2024-02-11T14:00:00+09:00"
* valueCodeableConcept.text = "陽性（90%）"
* specimen = Reference(SpecimenBreastBiopsy)

Instance: ObservationBreastHER2
InstanceOf: JP_Observation_Pathology
Usage: #example
Description: "HER2免疫染色"
* status = #final
* category[0].coding.code = #laboratory
* category[1].coding.system = $Loinc_CS
* category[1].coding.code = #LP7839-6
* code.coding.system = $Loinc_CS
* code.coding.code = #85319-6
* code.coding.display = "HER2"
* subject = Reference(PatientBreastCancer)
* effectiveDateTime = "2024-02-11T14:00:00+09:00"
* valueCodeableConcept.text = "2+"
* specimen = Reference(SpecimenBreastBiopsy)

Instance: DiagnosticReportBreastCancer
InstanceOf: JP_DiagnosticReport_Pathology
Usage: #example
Description: "乳癌病理診断レポート"
* identifier.value = "PATH-2024-00789"
* status = #final
* category.coding.system = $Loinc_CS
* category.coding.code = #LP7839-6
* code.coding.system = $Loinc_CS
* code.coding.code = #60568-3
* subject = Reference(PatientBreastCancer)
* effectiveDateTime = "2024-02-11T16:00:00+09:00"
* specimen = Reference(SpecimenBreastBiopsy)
* result[0] = Reference(ObservationBreastMicro)
* result[1] = Reference(ObservationBreastER)
* result[2] = Reference(ObservationBreastHER2)
* conclusion = "浸潤性乳管癌、ER陽性、PgR陽性、HER2 2+（FISH推奨）"

// ==============================
// 3. 大腸ポリープ内視鏡切除
// ==============================

Instance: PatientColonPolyp
InstanceOf: JP_Patient
Usage: #example
Description: "大腸ポリープ患者"
* identifier.value = "45678901"
* name[0].family = "鈴木"
* name[0].given = "健一"
* gender = #male
* birthDate = "1950-07-10"

Instance: SpecimenColonPolyp
InstanceOf: JP_Specimen_Pathology
Usage: #example
Description: "大腸ポリープ切除検体"
* identifier.value = "SP-2024-00234-CP"
* accessionIdentifier.value = "PATH-2024-00234"
* status = #available
* type.coding.system = $SnomedCT_CS
* type.coding.code = #119376003
* type.text = "内視鏡的粘膜切除標本"
* subject = Reference(PatientColonPolyp)
* receivedTime = "2024-02-15T11:00:00+09:00"
* collection.collectedDateTime = "2024-02-15T09:30:00+09:00"
* collection.method.text = "EMR（内視鏡的粘膜切除術）"
* collection.bodySite.text = "S状結腸"

Instance: ObservationColonGross
InstanceOf: JP_Observation_Pathology
Usage: #example
Description: "大腸ポリープ肉眼所見"
* status = #final
* category[0].coding.code = #laboratory
* category[1].coding.system = $Loinc_CS
* category[1].coding.code = #LP7839-6
* code.coding.system = $Loinc_CS
* code.coding.code = #22634-0
* subject = Reference(PatientColonPolyp)
* effectiveDateTime = "2024-02-15T14:00:00+09:00"
* valueString = "15×12mm大の有茎性ポリープ。表面は分葉状。"
* specimen = Reference(SpecimenColonPolyp)

Instance: ObservationColonMicro
InstanceOf: JP_Observation_Pathology
Usage: #example
Description: "大腸ポリープ顕微鏡所見"
* status = #final
* category[0].coding.code = #laboratory
* category[1].coding.system = $Loinc_CS
* category[1].coding.code = #LP7839-6
* code.coding.system = $Loinc_CS
* code.coding.code = #22635-7
* subject = Reference(PatientColonPolyp)
* effectiveDateTime = "2024-02-16T10:00:00+09:00"
* valueString = "管状腺腫、低異型度。断端陰性。"
* specimen = Reference(SpecimenColonPolyp)

Instance: DiagnosticReportColonPolyp
InstanceOf: JP_DiagnosticReport_Pathology
Usage: #example
Description: "大腸ポリープ病理診断レポート"
* identifier.value = "PATH-2024-00234"
* status = #final
* category.coding.system = $Loinc_CS
* category.coding.code = #LP7839-6
* code.coding.system = $Loinc_CS
* code.coding.code = #60568-3
* subject = Reference(PatientColonPolyp)
* effectiveDateTime = "2024-02-16T14:00:00+09:00"
* specimen = Reference(SpecimenColonPolyp)
* result[0] = Reference(ObservationColonGross)
* result[1] = Reference(ObservationColonMicro)
* conclusion = "管状腺腫、低異型度、完全切除"

// ==============================
// 4. 子宮頸部細胞診
// ==============================

Instance: PatientCervicalCytology
InstanceOf: JP_Patient
Usage: #example
Description: "子宮頸部細胞診患者"
* identifier.value = "56789012"
* name[0].family = "高橋"
* name[0].given = "由美"
* gender = #female
* birthDate = "1980-11-25"

Instance: SpecimenCervicalCytology
InstanceOf: JP_Specimen_Pathology
Usage: #example
Description: "子宮頸部細胞診検体"
* identifier.value = "SP-2024-00567-CC"
* accessionIdentifier.value = "PATH-2024-00567"
* status = #available
* type.coding.system = $SnomedCT_CS
* type.coding.code = #119361006
* type.coding.display = "Cytology specimen"
* type.text = "子宮頸部擦過細胞診"
* subject = Reference(PatientCervicalCytology)
* receivedTime = "2024-02-20T10:00:00+09:00"
* collection.collectedDateTime = "2024-02-20T09:00:00+09:00"
* collection.method.text = "ブラシ擦過"
* collection.bodySite.coding.system = $SnomedCT_CS
* collection.bodySite.coding.code = #71252005
* collection.bodySite.coding.display = "Cervix uteri"

Instance: ObservationCervicalCytology
InstanceOf: JP_Observation_Pathology
Usage: #example
Description: "子宮頸部細胞診所見"
* status = #final
* category[0].coding.code = #laboratory
* category[1].coding.system = $Loinc_CS
* category[1].coding.code = #LP7839-6
* code.coding.system = $Loinc_CS
* code.coding.code = #47527-7
* code.coding.display = "Cervical cytology"
* subject = Reference(PatientCervicalCytology)
* effectiveDateTime = "2024-02-21T10:00:00+09:00"
* valueCodeableConcept.coding.system = "http://snomed.info/sct"
* valueCodeableConcept.coding.code = #165084003
* valueCodeableConcept.coding.display = "Negative for intraepithelial lesion or malignancy"
* valueCodeableConcept.text = "NILM（陰性）"
* specimen = Reference(SpecimenCervicalCytology)

Instance: DiagnosticReportCervicalCytology
InstanceOf: JP_DiagnosticReport_Pathology
Usage: #example
Description: "子宮頸部細胞診レポート"
* identifier.value = "PATH-2024-00567"
* status = #final
* category.coding.system = $Loinc_CS
* category.coding.code = #LP7839-6
* code.coding.system = $Loinc_CS
* code.coding.code = #47527-7
* subject = Reference(PatientCervicalCytology)
* effectiveDateTime = "2024-02-21T14:00:00+09:00"
* specimen = Reference(SpecimenCervicalCytology)
* result = Reference(ObservationCervicalCytology)
* conclusion = "NILM（陰性）、炎症性変化あり"

// ==============================
// 5. 前立腺針生検（12箇所）
// ==============================

Instance: PatientProstateBiopsy
InstanceOf: JP_Patient
Usage: #example
Description: "前立腺生検患者"
* identifier.value = "67890123"
* name[0].family = "渡辺"
* name[0].given = "正男"
* gender = #male
* birthDate = "1945-04-15"

Instance: SpecimenProstateBiopsy1
InstanceOf: JP_Specimen_Pathology
Usage: #example
Description: "前立腺生検検体（右尖部）"
* identifier.value = "SP-2024-00890-PB1"
* accessionIdentifier.value = "PATH-2024-00890"
* status = #available
* type.coding.system = $SnomedCT_CS
* type.coding.code = #119295008
* type.text = "前立腺針生検"
* subject = Reference(PatientProstateBiopsy)
* receivedTime = "2024-02-25T14:00:00+09:00"
* collection.collectedDateTime = "2024-02-25T10:00:00+09:00"
* collection.method.text = "経直腸的針生検"
* collection.bodySite.text = "前立腺右尖部"

Instance: ObservationProstateGleason
InstanceOf: JP_Observation_Pathology
Usage: #example
Description: "前立腺癌Gleasonスコア"
* status = #final
* category[0].coding.code = #laboratory
* category[1].coding.system = $Loinc_CS
* category[1].coding.code = #LP7839-6
* code.coding.system = $Loinc_CS
* code.coding.code = #35266-6
* code.coding.display = "Gleason score"
* subject = Reference(PatientProstateBiopsy)
* effectiveDateTime = "2024-02-26T14:00:00+09:00"
* valueCodeableConcept.text = "Gleason score 3+4=7"
* specimen = Reference(SpecimenProstateBiopsy1)

Instance: DiagnosticReportProstateBiopsy
InstanceOf: JP_DiagnosticReport_Pathology
Usage: #example
Description: "前立腺生検病理診断レポート"
* identifier.value = "PATH-2024-00890"
* status = #final
* category.coding.system = $Loinc_CS
* category.coding.code = #LP7839-6
* code.coding.system = $Loinc_CS
* code.coding.code = #60568-3
* subject = Reference(PatientProstateBiopsy)
* effectiveDateTime = "2024-02-26T16:00:00+09:00"
* specimen = Reference(SpecimenProstateBiopsy1)
* result = Reference(ObservationProstateGleason)
* conclusion = "前立腺腺癌、Gleason score 3+4=7、右側6/6本、左側4/6本陽性"

// ==============================
// 6. 皮膚生検（悪性黒色腫疑い）
// ==============================

Instance: PatientSkinBiopsy
InstanceOf: JP_Patient
Usage: #example
Description: "皮膚生検患者"
* identifier.value = "78901234"
* name[0].family = "中村"
* name[0].given = "健太"
* gender = #male
* birthDate = "1960-08-30"

Instance: SpecimenSkinBiopsy
InstanceOf: JP_Specimen_Pathology
Usage: #example
Description: "皮膚生検検体"
* identifier.value = "SP-2024-00345-SB"
* accessionIdentifier.value = "PATH-2024-00345"
* status = #available
* type.coding.system = $SnomedCT_CS
* type.coding.code = #119325001
* type.coding.display = "Skin biopsy specimen"
* subject = Reference(PatientSkinBiopsy)
* receivedTime = "2024-02-28T11:00:00+09:00"
* collection.collectedDateTime = "2024-02-28T09:30:00+09:00"
* collection.method.text = "パンチ生検"
* collection.bodySite.text = "左足底"

Instance: ObservationSkinMicro
InstanceOf: JP_Observation_Pathology
Usage: #example
Description: "皮膚生検顕微鏡所見"
* status = #final
* category[0].coding.code = #laboratory
* category[1].coding.system = $Loinc_CS
* category[1].coding.code = #LP7839-6
* code.coding.system = $Loinc_CS
* code.coding.code = #22635-7
* subject = Reference(PatientSkinBiopsy)
* effectiveDateTime = "2024-03-01T10:00:00+09:00"
* valueString = "表皮内から真皮にかけて異型メラノサイトの増殖。Breslow厚1.2mm。"
* specimen = Reference(SpecimenSkinBiopsy)

Instance: ObservationSkinS100
InstanceOf: JP_Observation_Pathology
Usage: #example
Description: "S-100蛋白免疫染色"
* status = #final
* category[0].coding.code = #laboratory
* category[1].coding.system = $Loinc_CS
* category[1].coding.code = #LP7839-6
* code.text = "S-100蛋白"
* subject = Reference(PatientSkinBiopsy)
* effectiveDateTime = "2024-03-01T14:00:00+09:00"
* valueCodeableConcept.text = "陽性"
* specimen = Reference(SpecimenSkinBiopsy)

Instance: ObservationSkinHMB45
InstanceOf: JP_Observation_Pathology
Usage: #example
Description: "HMB-45免疫染色"
* status = #final
* category[0].coding.code = #laboratory
* category[1].coding.system = $Loinc_CS
* category[1].coding.code = #LP7839-6
* code.text = "HMB-45"
* subject = Reference(PatientSkinBiopsy)
* effectiveDateTime = "2024-03-01T14:00:00+09:00"
* valueCodeableConcept.text = "陽性"
* specimen = Reference(SpecimenSkinBiopsy)

Instance: DiagnosticReportSkinMelanoma
InstanceOf: JP_DiagnosticReport_Pathology
Usage: #example
Description: "悪性黒色腫病理診断レポート"
* identifier.value = "PATH-2024-00345"
* status = #final
* category.coding.system = $Loinc_CS
* category.coding.code = #LP7839-6
* code.coding.system = $Loinc_CS
* code.coding.code = #60568-3
* subject = Reference(PatientSkinBiopsy)
* effectiveDateTime = "2024-03-01T16:00:00+09:00"
* specimen = Reference(SpecimenSkinBiopsy)
* result[0] = Reference(ObservationSkinMicro)
* result[1] = Reference(ObservationSkinS100)
* result[2] = Reference(ObservationSkinHMB45)
* conclusion = "悪性黒色腫、Breslow厚1.2mm、Clark level III"