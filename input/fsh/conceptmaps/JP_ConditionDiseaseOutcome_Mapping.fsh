// ==============================
//   ConceptMap 定義：病名転帰 3 系統間マッピング（HL70241 ↔ JHSD0006）
// ==============================
Instance: jp-condition-disease-outcome-hl70241-to-jhsd0006
InstanceOf: ConceptMap
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/ConceptMap/JP_ConditionDiseaseOutcomeHL70241_to_JHSD0006"
* name = "JP_ConditionDiseaseOutcomeHL70241_to_JHSD0006"
* title = "JP Core Condition Disease Outcome HL7 Table 0241 to JHSD0006 ConceptMap"
* status = #active
* experimental = false
* date = "2025-07-30"
* description = "HL7 v2 Table 0241（Patient Outcome）コードと JAHIS JHSD表0006（転帰区分）との対応マッピング。JP Core JP_Condition_Diagnosis プロファイルにおいて、両コード体系で転帰を記録する際の変換の参考として使用する。2 つの体系は概念的粒度が異なるため、一部のコードは wider または inexact となる。"
* copyright = "JP Core: Copyright HL7 Japan (出典：HL7-0241) / JHSD0006: Copyright Japanese Association of Healthcare Information Systems Industry(JAHIS) 一般社団法人保健医療福祉情報システム工業会"
* sourceUri = "http://jpfhir.jp/fhir/core/CodeSystem/HL70241"
* targetUri = "http://jpfhir.jp/fhir/core/CodeSystem/JHSD0006"
* group[0].source = "http://jpfhir.jp/fhir/core/CodeSystem/HL70241"
* group[=].target = "http://jpfhir.jp/fhir/core/CodeSystem/JHSD0006"
// D: 死亡 → JHSD0006 に死亡コードなし
* group[=].element[+].code = #D
* group[=].element[=].display = "死亡"
* group[=].element[=].target[+].code = #O
* group[=].element[=].target[=].display = "その他"
* group[=].element[=].target[=].equivalence = #inexact
* group[=].element[=].target[=].comment = "JHSD0006 に死亡に直接対応するコードがないため「その他」にマップ。レセプト電算転帰の #3（死亡）との組み合わせ使用を推奨。"
// R: 回復 → 寛解
* group[=].element[+].code = #R
* group[=].element[=].display = "回復"
* group[=].element[=].target[+].code = #M
* group[=].element[=].target[=].display = "寛解"
* group[=].element[=].target[=].equivalence = #wider
* group[=].element[=].target[=].comment = "「寛解（M）」は症状の軽減・消失を示し、「回復（R）」の一側面に相当するが、完全回復（F）は寛解の上位概念ではないため wider。"
// N: 回復せず／変わらない → 継続
* group[=].element[+].code = #N
* group[=].element[=].display = "回復せず／変わらない"
* group[=].element[=].target[+].code = #C
* group[=].element[=].target[=].display = "継続"
* group[=].element[=].target[=].equivalence = #wider
* group[=].element[=].target[=].comment = "「継続（C）」は治療継続中を示し、変わらない状態に相当するが、悪化（W）も継続に包含されるため wider。"
// W: 悪化 → 継続（JHSD0006 に悪化コードなし）
* group[=].element[+].code = #W
* group[=].element[=].display = "悪化"
* group[=].element[=].target[+].code = #C
* group[=].element[=].target[=].display = "継続"
* group[=].element[=].target[=].equivalence = #inexact
* group[=].element[=].target[=].comment = "JHSD0006 に悪化の直接対応コードがないため「継続」にマップ。情報が失われるため、悪化状態の記録にはレセプト電算転帰または SNOMED CT マッピングを推奨。"
// S: 後遺症 → その他
* group[=].element[+].code = #S
* group[=].element[=].display = "後遺症"
* group[=].element[=].target[+].code = #O
* group[=].element[=].target[=].display = "その他"
* group[=].element[=].target[=].equivalence = #inexact
* group[=].element[=].target[=].comment = "JHSD0006 に後遺症の直接対応コードがない。"
// F: 完全に回復した → 寛解
* group[=].element[+].code = #F
* group[=].element[=].display = "完全に回復した"
* group[=].element[=].target[+].code = #M
* group[=].element[=].target[=].display = "寛解"
* group[=].element[=].target[=].equivalence = #wider
* group[=].element[=].target[=].comment = "「寛解（M）」は部分的寛解も含むため wider。完全回復であることをより精確に示すには SNOMED CT マッピング（370996005 Patient's condition resolved）も併用推奨。"
// U: 未知 → その他
* group[=].element[+].code = #U
* group[=].element[=].display = "未知"
* group[=].element[=].target[+].code = #O
* group[=].element[=].target[=].display = "その他"
* group[=].element[=].target[=].equivalence = #relatedto

// ==============================
//   ConceptMap 定義：病名転帰 3 系統間マッピング（HL70241 ↔ レセプト電算転帰）
// ==============================
Instance: jp-condition-disease-outcome-hl70241-to-receipt
InstanceOf: ConceptMap
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/ConceptMap/JP_ConditionDiseaseOutcomeHL70241_to_Receipt"
* name = "JP_ConditionDiseaseOutcomeHL70241_to_Receipt"
* title = "JP Core Condition Disease Outcome HL7 Table 0241 to Receipt ConceptMap"
* status = #active
* experimental = false
* date = "2025-07-30"
* description = "HL7 v2 Table 0241（Patient Outcome）コードとレセプト電算システム転帰区分との対応マッピング。JP Core JP_Condition_Diagnosis プロファイルにおいて、両コード体系で転帰を記録する際の変換の参考として使用する。"
* copyright = "JP Core: Copyright HL7 Japan (出典：HL7-0241) / レセプト電算: Copyright 社会保険診療報酬支払基金"
* sourceUri = "http://jpfhir.jp/fhir/core/CodeSystem/HL70241"
* targetUri = "http://jpfhir.jp/fhir/core/CodeSystem/JP_ConditionDiseaseOutcomeReceipt_CS"
* group[0].source = "http://jpfhir.jp/fhir/core/CodeSystem/HL70241"
* group[=].target = "http://jpfhir.jp/fhir/core/CodeSystem/JP_ConditionDiseaseOutcomeReceipt_CS"
// D: 死亡 → 3: 死亡
* group[=].element[+].code = #D
* group[=].element[=].display = "死亡"
* group[=].element[=].target[+].code = #3
* group[=].element[=].target[=].display = "死亡"
* group[=].element[=].target[=].equivalence = #equivalent
// R: 回復 → 2: 治ゆ
* group[=].element[+].code = #R
* group[=].element[=].display = "回復"
* group[=].element[=].target[+].code = #2
* group[=].element[=].target[=].display = "治ゆ"
* group[=].element[=].target[=].equivalence = #wider
* group[=].element[=].target[=].comment = "「治ゆ」は完全回復を指すため、「回復（R）」より狭義。F（完全回復）のみが equivalent。"
// N: 回復せず／変わらない → 1: 治ゆ・死亡・中止以外（継続）
* group[=].element[+].code = #N
* group[=].element[=].display = "回復せず／変わらない"
* group[=].element[=].target[+].code = #1
* group[=].element[=].target[=].display = "治ゆ、死亡、中止以外"
* group[=].element[=].target[=].equivalence = #wider
* group[=].element[=].target[=].comment = "「1：治ゆ・死亡・中止以外」は継続中全般を示すため wider。悪化（W）や後遺症（S）も #1 に含まれる。"
// W: 悪化 → 1: 治ゆ・死亡・中止以外（継続）
* group[=].element[+].code = #W
* group[=].element[=].display = "悪化"
* group[=].element[=].target[+].code = #1
* group[=].element[=].target[=].display = "治ゆ、死亡、中止以外"
* group[=].element[=].target[=].equivalence = #wider
* group[=].element[=].target[=].comment = "レセプト電算に悪化の直接対応コードがないため「継続（#1）」にマップ。情報が失われる。"
// S: 後遺症 → 1: 治ゆ・死亡・中止以外（継続）
* group[=].element[+].code = #S
* group[=].element[=].display = "後遺症"
* group[=].element[=].target[+].code = #1
* group[=].element[=].target[=].display = "治ゆ、死亡、中止以外"
* group[=].element[=].target[=].equivalence = #wider
* group[=].element[=].target[=].comment = "レセプト電算に後遺症の直接対応コードがないため「継続（#1）」にマップ。"
// F: 完全に回復した → 2: 治ゆ
* group[=].element[+].code = #F
* group[=].element[=].display = "完全に回復した"
* group[=].element[=].target[+].code = #2
* group[=].element[=].target[=].display = "治ゆ"
* group[=].element[=].target[=].equivalence = #equivalent
// U: 未知 → 1: 治ゆ・死亡・中止以外（デフォルト）
* group[=].element[+].code = #U
* group[=].element[=].display = "未知"
* group[=].element[=].target[+].code = #1
* group[=].element[=].target[=].display = "治ゆ、死亡、中止以外"
* group[=].element[=].target[=].equivalence = #relatedto
* group[=].element[=].target[=].comment = "不明な転帰の暫定値。実際の転帰確認後に適切なコードに更新すること。"
