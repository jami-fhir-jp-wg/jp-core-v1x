// Example 2: 細胞診断（子宮頸部細胞診）
Instance: JP_DiagnosticReportPathology_Example_2
InstanceOf: JP_DiagnosticReport_Pathology
Usage: #example
Title: "病理診断レポート例2（子宮頸部細胞診）"
Description: "子宮頸部細胞診における病理診断レポートの例"

* status = #final
* category[first] = $Loinc_CS#LP29708-2 "Pathology"
* code = $Loinc_CS#33717-0 "Pathology report"
* subject = Reference(Patient/jp-patient-example-1)
* effectiveDateTime = "2025-08-14"
* issued = "2025-08-15T11:30:00+09:00"
* performer[0] = Reference(Practitioner/jp-practitioner-example-female-1) "細胞 花子"
* resultsInterpreter[0] = Reference(Practitioner/jp-practitioner-example-female-1) "細胞 花子"
* specimen = Reference(Specimen/jp-specimen-example-pathology-2)
* result[0] = Reference(Observation/jp-observation-pathology-example-cytology-diagnosis-1)
* result[1] = Reference(Observation/jp-observation-pathology-example-cytology-finding-1)
* conclusion = "クラスII（良性異型）、炎症性変化"
* conclusionCode[0] = $JP_PathologyTerminology_CS#cytology-diagnosis.class2 "クラスII（炎症性変化）"
* conclusionCode[1] = $JP_PathologyTerminology_CS#organ.uterus "子宮"
* presentedForm.contentType = #application/pdf
* presentedForm.language = #ja-JP
* presentedForm.title = "細胞診報告書"
* presentedForm.url = "https://example.com/cytology-report-1.pdf"

// Cytology diagnosis observation
Instance: jp-observation-pathology-example-cytology-diagnosis-1
InstanceOf: JP_Observation_Pathology
Usage: #inline
Title: "細胞診断例1"
Description: "子宮頸部細胞診の診断"

* status = #final
* category[first] = $JP_SimpleObservationCategory_CS#procedure "Procedure"
* category[second].coding.system = $Loinc_CS
* category[second].coding.code = #LP29708-2
* category[second].coding.display = "Pathology"
* code = $Loinc_CS#22634-0 "Pathology report final diagnosis"
* subject = Reference(Patient/jp-patient-example-1)
* effectiveDateTime = "2025-08-14"
* valueString = "ベセスダ分類：NILM（Negative for Intraepithelial Lesion or Malignancy）"
* bodySite = $JP_PathologyTerminology_CS#organ.uterus "子宮"
* specimen = Reference(Specimen/jp-specimen-example-pathology-2)
* component[0].code.text = "パパニコロウ分類"
* component[0].valueString = "クラスII"
* component[1].code.text = "ベセスダ分類"
* component[1].valueString = "NILM"
* component[2].code.text = "検体適性"
* component[2].valueString = "適正"

// Cytology finding observation
Instance: jp-observation-pathology-example-cytology-finding-1
InstanceOf: JP_Observation_Pathology
Usage: #inline
Title: "細胞所見例1"
Description: "子宮頸部細胞診の所見"

* status = #final
* category[first] = $JP_SimpleObservationCategory_CS#procedure "Procedure"
* category[second].coding.system = $Loinc_CS
* category[second].coding.code = #LP29708-2
* category[second].coding.display = "Pathology"
* code = $Loinc_CS#22637-3 "Pathology report microscopic observation"
* subject = Reference(Patient/jp-patient-example-1)
* effectiveDateTime = "2025-08-14"
* valueString = "扁平上皮細胞に軽度の炎症性変化を認める。好中球の浸潤とともに扁平上皮細胞の軽度腫大を認めるが、異型性は認められない。"
* bodySite = $JP_PathologyTerminology_CS#organ.uterus "子宮"
* specimen = Reference(Specimen/jp-specimen-example-pathology-2)
* component[0].code.text = "扁平上皮細胞"
* component[0].valueString = "軽度炎症性変化あり、異型なし"
* component[1].code.text = "腺細胞"
* component[1].valueString = "正常範囲内"
* component[2].code.text = "炎症細胞"
* component[2].valueString = "好中球の浸潤（軽度）"
