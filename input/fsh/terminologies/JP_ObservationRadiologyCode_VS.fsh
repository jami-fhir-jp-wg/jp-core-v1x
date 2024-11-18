ValueSet: JP_ObservationRadiologyCode_VS
Id: jp-observation-radiology-code-vs
Title: "JP Core Observation Radiology Code ValueSet"
Description: "Observation（放射線）コードで使用する項目値セット。LOINCのFindings、Impressionに相当する"
* ^url = $JP_ObservationRadiologyCode_VS
* ^status = #active
* ^experimental = false
* ^date = "2024-11-18"
* ^copyright = "Copyright 日本医療情報学会NeXEHRS課題研究会FHIR日本実装検討WG"
// =================================================
// LOINC
// =================================================
* $Loinc_CS#18782-3 "Radiology Study observation (narrative)（所見）"
* $Loinc_CS#19005-8 "Radiology Imaging study [Impression] (narrative)（インプレッション）"