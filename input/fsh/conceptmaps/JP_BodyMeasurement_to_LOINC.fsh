// ==============================
//   ConceptMap 定義
// ==============================
Instance: jp-bodymeasurement-to-loinc
InstanceOf: ConceptMap
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/ConceptMap/JP_BodyMeasurement_to_LOINC"
* name = "JP_BodyMeasurement_to_LOINC"
* title = "JP Core BodyMeasurement to LOINC ConceptMap"
* status = #active
* experimental = false
* date = "2025-07-30"
* description = "JP Core 身体計測コード（MEDIS 看護実践用語標準マスター由来）と LOINC との対応マッピング。\
相互運用性向上のための参考マッピングであり、すべての項目を網羅しているわけではない。\
マッピングの採用にあたっては各施設の臨床的判断が必要。"
* copyright = "JP Core: Copyright MEDIS-DC 一般財団法人 医療情報システム開発センター / LOINC: This content LOINC® is copyright © 1995+ Regenstrief Institute, Inc. and the Logical Observation Identifiers Names and Codes (LOINC) Committee and is available at no cost under the license at http://loinc.org/license. LOINC® is a registered United States trademark of Regenstrief Institute, Inc."
* sourceUri = "http://jpfhir.jp/fhir/core/CodeSystem/JP_ObservationBodyMeasurementCode_CS"
* targetUri = "http://loinc.org"
* group[0].source = "http://jpfhir.jp/fhir/core/CodeSystem/JP_ObservationBodyMeasurementCode_CS"
* group[=].target = "http://loinc.org"
// --- 体重 ---
* group[=].element[+].code = #31000296
* group[=].element[=].display = "体重(Kg)"
* group[=].element[=].target[+].code = #29463-7
* group[=].element[=].target[=].display = "Body weight"
* group[=].element[=].target[=].equivalence = #equivalent
* group[=].element[+].code = #31000297
* group[=].element[=].display = "体重(g)"
* group[=].element[=].target[+].code = #29463-7
* group[=].element[=].target[=].display = "Body weight"
* group[=].element[=].target[=].equivalence = #equivalent
* group[=].element[=].target[=].comment = "単位は g だが体重という概念は同一。LOINC 29463-7 で UCUM単位 g を指定して表現する。"
// --- 身長 ---
* group[=].element[+].code = #31000298
* group[=].element[=].display = "身長"
* group[=].element[=].target[+].code = #8302-2
* group[=].element[=].target[=].display = "Body height"
* group[=].element[=].target[=].equivalence = #equivalent
// --- 胸囲 ---
* group[=].element[+].code = #31000299
* group[=].element[=].display = "胸囲"
* group[=].element[=].target[+].code = #9561-3
* group[=].element[=].target[=].display = "Chest circumference at xiphoid process"
* group[=].element[=].target[=].equivalence = #wider
* group[=].element[=].target[=].comment = "LOINCの概念は胸骨剣状突起レベルを指定しているが、JP側はレベル未指定。"
// --- 腹囲 ---
* group[=].element[+].code = #31000300
* group[=].element[=].display = "腹囲（臍上）"
* group[=].element[=].target[+].code = #8280-0
* group[=].element[=].target[=].display = "Waist Circumference at umbilicus [Length] by Tape measure"
* group[=].element[=].target[=].equivalence = #equivalent
* group[=].element[+].code = #31000301
* group[=].element[=].display = "腹囲"
* group[=].element[=].target[+].code = #56115-9
* group[=].element[=].target[=].display = "Waist Circumference by Tape measure"
* group[=].element[=].target[=].equivalence = #equivalent
// --- 体脂肪率 ---
* group[=].element[+].code = #31001697
* group[=].element[=].display = "体脂肪率"
* group[=].element[=].target[+].code = #41982-0
* group[=].element[=].target[=].display = "Percentage of body fat Measured"
* group[=].element[=].target[=].equivalence = #equivalent
// --- 出生体重 ---
* group[=].element[+].code = #31002900
* group[=].element[=].display = "出生体重"
* group[=].element[=].target[+].code = #8339-4
* group[=].element[=].target[=].display = "Birth weight Measured"
* group[=].element[=].target[=].equivalence = #equivalent
// --- BMI ---
* group[=].element[+].code = #31003020
* group[=].element[=].display = "ＢＭＩ"
* group[=].element[=].target[+].code = #39156-5
* group[=].element[=].target[=].display = "Body mass index (BMI) [Ratio]"
* group[=].element[=].target[=].equivalence = #equivalent
// --- 標準体重 ---
* group[=].element[+].code = #31003138
* group[=].element[=].display = "標準体重"
* group[=].element[=].target[+].code = #59574-4
* group[=].element[=].target[=].display = "Body weight special circumstances"
* group[=].element[=].target[=].equivalence = #inexact
* group[=].element[=].target[=].comment = "LOINCに標準体重（理想体重）の直接対応コードがないため暫定。"
// --- 上腕周囲長（ＡＣ） ---
* group[=].element[+].code = #31003421
* group[=].element[=].display = "上腕周囲長（ＡＣ）"
* group[=].element[=].target[+].code = #56072-2
* group[=].element[=].target[=].display = "Arm circumference"
* group[=].element[=].target[=].equivalence = #wider
* group[=].element[=].target[=].comment = "LOINCは上腕の左右を区別しないため wider。"
// --- 下腿周囲長（ＣＣ） ---
* group[=].element[+].code = #31003422
* group[=].element[=].display = "下腿周囲長（ＣＣ）"
* group[=].element[=].target[+].code = #56162-1
* group[=].element[=].target[=].display = "Calf circumference"
* group[=].element[=].target[=].equivalence = #wider
* group[=].element[=].target[=].comment = "LOINCは下腿の左右を区別しないため wider。"
// --- 頭囲 ---
* group[=].element[+].code = #31006116
* group[=].element[=].display = "頭囲"
* group[=].element[=].target[+].code = #9843-4
* group[=].element[=].target[=].display = "Head Occipital-frontal circumference by Tape measure"
* group[=].element[=].target[=].equivalence = #equivalent
// --- 握力 ---
* group[=].element[+].code = #31006215
* group[=].element[=].display = "握力（右）"
* group[=].element[=].target[+].code = #62951-8
* group[=].element[=].target[=].display = "Grip strength Hand - right Dynamometer"
* group[=].element[=].target[=].equivalence = #equivalent
* group[=].element[+].code = #31006216
* group[=].element[=].display = "握力（左）"
* group[=].element[=].target[+].code = #62952-6
* group[=].element[=].target[=].display = "Grip strength Hand - left Dynamometer"
* group[=].element[=].target[=].equivalence = #equivalent
// --- 体重変化量 ---
* group[=].element[+].code = #31003727
* group[=].element[=].display = "体重変化量(Kg)"
* group[=].element[=].target[+].code = #79300-3
* group[=].element[=].target[=].display = "Weight change [Mass]"
* group[=].element[=].target[=].equivalence = #equivalent
