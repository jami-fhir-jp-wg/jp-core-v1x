// ==============================
//   ConceptMap 定義
// ==============================
Instance: jp-condition-disease-outcome-hl70241-to-snomed
InstanceOf: ConceptMap
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/ConceptMap/JP_ConditionDiseaseOutcomeHL70241_to_SNOMED"
* name = "JP_ConditionDiseaseOutcomeHL70241_to_SNOMED"
* title = "JP Core Condition Disease Outcome HL7 Table 0241 to SNOMED CT ConceptMap"
* status = #active
* experimental = false
* date = "2025-07-30"
* description = "HL7 v2 Table 0241（Patient Outcome）コードと SNOMED CT との対応マッピング。国際的な相互運用性のための参考マッピングであり、SNOMED CT ライセンスの取得が必要。マッピングの採用にあたっては最新の SNOMED CT リリースでの確認が必要。"
* copyright = "JP Core: Copyright HL7 Japan / SNOMED CT: This material includes SNOMED Clinical Terms® (SNOMED CT®) which is used by permission of the International Health Terminology Standards Development Organisation (IHTSDO). All rights reserved. SNOMED CT®, was originally created by The College of American Pathologists."
* sourceUri = "http://jpfhir.jp/fhir/core/CodeSystem/HL70241"
* targetUri = "http://snomed.info/sct"
* group[0].source = "http://jpfhir.jp/fhir/core/CodeSystem/HL70241"
* group[=].target = "http://snomed.info/sct"
// D: 死亡
* group[=].element[+].code = #D
* group[=].element[=].display = "死亡"
* group[=].element[=].target[+].code = #419099009
* group[=].element[=].target[=].display = "Dead (finding)"
* group[=].element[=].target[=].equivalence = #equivalent
// R: 回復
* group[=].element[+].code = #R
* group[=].element[=].display = "回復"
* group[=].element[=].target[+].code = #371236003
* group[=].element[=].target[=].display = "Patient's condition improved (finding)"
* group[=].element[=].target[=].equivalence = #wider
* group[=].element[=].target[=].comment = "「回復」は改善全般を指し、完全回復（F）も含むため、SNOMED CT の「改善」にマップ。完全回復（F）との区別は本マッピングでは #R を wider として扱う。"
// N: 回復せず／変わらない
* group[=].element[+].code = #N
* group[=].element[=].display = "回復せず／変わらない"
* group[=].element[=].target[+].code = #271299001
* group[=].element[=].target[=].display = "Patient's condition unchanged (finding)"
* group[=].element[=].target[=].equivalence = #equivalent
// W: 悪化
* group[=].element[+].code = #W
* group[=].element[=].display = "悪化"
* group[=].element[=].target[+].code = #371240007
* group[=].element[=].target[=].display = "Patient's condition worsened (finding)"
* group[=].element[=].target[=].equivalence = #equivalent
// S: 後遺症
* group[=].element[+].code = #S
* group[=].element[=].display = "後遺症"
* group[=].element[=].target[+].code = #302898002
* group[=].element[=].target[=].display = "Sequela (morphologic abnormality)"
* group[=].element[=].target[=].equivalence = #inexact
* group[=].element[=].target[=].comment = "SNOMED CT の Sequela は形態的異常として分類されており、HL70241 の意味と完全一致はしない。代替として 444784007 (Complication of illness) の使用も検討されたい。"
// F: 完全に回復した
* group[=].element[+].code = #F
* group[=].element[=].display = "完全に回復した"
* group[=].element[=].target[+].code = #370996005
* group[=].element[=].target[=].display = "Patient's condition resolved (finding)"
* group[=].element[=].target[=].equivalence = #equivalent
// U: 未知
* group[=].element[+].code = #U
* group[=].element[=].display = "未知"
* group[=].element[=].target[+].code = #261665006
* group[=].element[=].target[=].display = "Unknown (qualifier value)"
* group[=].element[=].target[=].equivalence = #equivalent
