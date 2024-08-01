ValueSet: JP_ConditionDiseaseModifierMEDISExchange_VS
Id: jp-condition-disease-modifier-medis-exchange-vs
Title: "JP Core Condition Disease Modifier MEDIS Exchange ValueSet"
Description: "MEDIS ICD10対応標準病名マスター(修飾語交換用コード) を示す値セット"
* ^url = $JP_ConditionDiseaseModifierMEDISExchange_VS
* ^status = #active
* ^experimental = false
* ^date = "2023-08-05"
* ^copyright = "Copyright FHIR Japanese implementation research working group in Japan Association of Medical Informatics (JAMI) 一般社団法人日本医療情報学会NeXEHRS課題研究会FHIR日本実装検討WG"

// 現状はMEDIS交換用コードのコードシステムをそのまま使用する
* include codes from system $JP_ConditionDiseaseModifierMEDISExchange_CS
* include codes from system $JP_ConditionDiseaseModifierReceipt_CS

