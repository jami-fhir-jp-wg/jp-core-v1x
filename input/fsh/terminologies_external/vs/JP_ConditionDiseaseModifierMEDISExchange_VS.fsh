ValueSet: JP_Modifier_MEDIS_Concept_VS
Id: jp-condition-disease-modifier-medis-exchange-vs
Title: "JP Core Condition Disease Modifier MEDIS Exchange ValueSet"
Description: "MEDIS ICD10対応標準病名マスター(修飾語交換用コード) を示す値セット"
* ^url = $JP_Modifier_MEDIS_Concept_VS
* ^status = #active
* ^experimental = false
* ^date = "2024-12-30"
* ^copyright = "Copyright MEDIS-DC 一般財団法人 医療情報システム開発センター"

// 現状はMEDIS交換用コードのコードシステムをそのまま使用する
* include codes from system $JP_Modifier_MEDIS_Concept_CS

