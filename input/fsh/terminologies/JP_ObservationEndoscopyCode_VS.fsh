ValueSet: JP_ObservationEndoscopyCode_VS
Id: jp-observation-endoscopy-code-vs
Title: "JP Core Observation Endoscopy Code ValueSet"
Description: "Observation（内視鏡）コードで使用する項目値セット。LOINCとJED用語のうち臓器毎のFindings、Diagnosis（Characterization）に該当するコードの組み合わせ"
* ^url = $JP_ObservationEndoscopyCode_VS
* ^status = #active
* ^experimental = false
* ^date = "2024-11-18"
* ^copyright = "Copyright JED-Project、JAHIS、日本医療情報学会NeXEHRS課題研究会FHIR日本実装検討WG  
This material contains content from LOINC (http://loinc.org). LOINC is copyright © 1995+, Regenstrief Institute, Inc. and the Logical Observation Identifiers Names and Codes (LOINC) Committee and is available at no cost under the license at http://loinc.org/license. LOINC® is a registered United States trademark of Regenstrief Institute, Inc"
// =================================================
// LOINC
// =================================================
* $Loinc_CS#19778-0 "Indications description Narrative Endoscopy（内視鏡による所見）"
* $Loinc_CS#19811-9 "Diagnosis Endoscopy Procedure Narrative（内視鏡による診断）"
// =================================================
// JED　臓器毎のFindings
// =================================================
* $JP_EndoscopyTerminologyCodesJED_CS#Z2A20000 "[頭頚部] 所見（存在所見）"
* $JP_EndoscopyTerminologyCodesJED_CS#Z2B20000 "[食道] 所見（存在所見）"
* $JP_EndoscopyTerminologyCodesJED_CS#Z2B2A000 "食道静脈瘤ー所見詳細"
* $JP_EndoscopyTerminologyCodesJED_CS#Z2C20000 "[胃] 所見（存在所見）"
* $JP_EndoscopyTerminologyCodesJED_CS#Z2D20000 "[十二指腸] 所見（存在所見）"
* $JP_EndoscopyTerminologyCodesJED_CS#Z2F20000 "[主乳頭] 所見（存在所見）"
* $JP_EndoscopyTerminologyCodesJED_CS#Z2FA4000 "[主乳頭 - 膵・胆道内視鏡] 所見"
* $JP_EndoscopyTerminologyCodesJED_CS#Z2G20000 "[副乳頭] 所見（存在所見）"
* $JP_EndoscopyTerminologyCodesJED_CS#Z2H40000 "[胆道] 肉眼型"
* $JP_EndoscopyTerminologyCodesJED_CS#Z2H20000 "[胆道] 所見（存在所見）"
* $JP_EndoscopyTerminologyCodesJED_CS#Z2H51000 "[胆道] 深達度"
* $JP_EndoscopyTerminologyCodesJED_CS#Z2HA4000 "[胆道 - 膵・胆道内視鏡] 所見"
* $JP_EndoscopyTerminologyCodesJED_CS#Z2HB0000 "[胆道] ＊超音波所見"
* $JP_EndoscopyTerminologyCodesJED_CS#Z2M20000 "[膵] 所見（存在所見）"
* $JP_EndoscopyTerminologyCodesJED_CS#Z2M51000 "[膵] 深達度予測"
* $JP_EndoscopyTerminologyCodesJED_CS#Z2MA4000 "[膵 - 膵・胆道内視鏡] 所見"
* $JP_EndoscopyTerminologyCodesJED_CS#Z2MB0000 "[膵] ＊超音波所見"
* $JP_EndoscopyTerminologyCodesJED_CS#Z2J20000 "[小腸] 所見（存在所見）"
* $JP_EndoscopyTerminologyCodesJED_CS#Z2L20000 "[大腸] 所見（存在所見）"
// =================================================
// JED　臓器毎のDiagnosis
// =================================================
* $JP_EndoscopyTerminologyCodesJED_CS#Z2A30000 "[頭頚部] 診断（質的診断）"
* $JP_EndoscopyTerminologyCodesJED_CS#Z2B30000 "[食道] 診断（質的診断）"
* $JP_EndoscopyTerminologyCodesJED_CS#Z2C30000 "[胃] 診断（質的診断）"
* $JP_EndoscopyTerminologyCodesJED_CS#Z2D30000 "[十二指腸] 診断（質的診断）"
* $JP_EndoscopyTerminologyCodesJED_CS#Z2F30000 "[主乳頭] 診断（質的診断）"
* $JP_EndoscopyTerminologyCodesJED_CS#Z2G30000 "[副乳頭] 診断（質的診断）"
* $JP_EndoscopyTerminologyCodesJED_CS#Z2H30000 "[胆道] 診断（質的診断）"
* $JP_EndoscopyTerminologyCodesJED_CS#Z2HC0000 "[胆道] ＊超音波診断"
* $JP_EndoscopyTerminologyCodesJED_CS#Z2HD1000 "[胆道 - 超音波進展度診断] 癌進展度診断"
* $JP_EndoscopyTerminologyCodesJED_CS#Z2M30000 "[膵] 診断（質的診断）"
* $JP_EndoscopyTerminologyCodesJED_CS#Z2MC0000 "[膵] ＊超音波診断"
* $JP_EndoscopyTerminologyCodesJED_CS#Z2MD1000 "[膵 - 超音波進展度診断] 癌進展度診断"
* $JP_EndoscopyTerminologyCodesJED_CS#Z2J30000 "[小腸] 診断（質的診断）"
* $JP_EndoscopyTerminologyCodesJED_CS#Z2L30000 "[大腸] 診断（質的診断）"