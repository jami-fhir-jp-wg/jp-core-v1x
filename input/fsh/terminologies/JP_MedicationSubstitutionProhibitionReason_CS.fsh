CodeSystem: JP_MedicationSubstitutionProhibitionReason_CS
Id: jp-medication-substitution-prohibition-reason-cs
Title: "JP Core Medication Substitution Prohibition Reason CodeSystem"
Description: "後発医薬品への変更不可理由を示すコードシステム。令和6年保険改訂（2024年10月施行）により導入された長期収載医薬品の変更不可理由区分を定義する。MedicationRequest.substitution.reason および MedicationDispense.substitution.reason に使用する。"
* ^url = $JP_MedicationSubstitutionProhibitionReason_CS
* ^status = #active
* ^experimental = false
* ^date = "2026-05-09"
* ^caseSensitive = true
* ^content = #complete
* ^copyright = "FHIR Japanese implementation research working group in Japan Association of Medical Informatics (JAMI) 一般社団法人日本医療情報学会FHIR国内実装基盤研究会"

* #medical-necessity "Medical Necessity" "医療上の必要性が認められるため長期収載医薬品からの変更を不可とする。保険給付は先発医薬品の薬価に対して適用される。"
* #patient-request "Patient Request" "患者の希望により長期収載医薬品からの変更を不可とする。選定療養の対象となり、先発医薬品と後発医薬品の差額の4分の1を患者が負担する。"
