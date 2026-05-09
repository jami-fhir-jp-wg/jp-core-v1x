ValueSet: JP_MedicationSubstitutionProhibitionReason_VS
Id: jp-medication-substitution-prohibition-reason-vs
Title: "JP Core Medication Substitution Prohibition Reason ValueSet"
Description: "後発医薬品への変更不可理由を示す値セット。令和6年保険改訂（2024年10月施行）により導入された長期収載医薬品の変更不可理由区分（医療上の必要性・患者希望）を含む。MedicationRequest.substitution.reason および MedicationDispense.substitution.reason に使用する。"
* ^url = $JP_MedicationSubstitutionProhibitionReason_VS
* ^status = #active
* ^experimental = false
* ^date = "2026-05-09"
* ^copyright = "FHIR Japanese implementation research working group in Japan Association of Medical Informatics (JAMI) 一般社団法人日本医療情報学会FHIR国内実装基盤研究会"

* include codes from system $JP_MedicationSubstitutionProhibitionReason_CS
