ValueSet: JP_MedicationUsageInjection_VS
Id: jp-medication-usage-injection-vs
Title: "JP Core MedicationReuqest Injection Usage ValueSet"
Description: "注射用MedicationRequestで使用する用法コードの値セット"
* ^url = $JP_MedicationUsageInjection_VS
* ^status = #active
* ^experimental = false
* ^date = "2023-06-26"
* ^copyright = "Copyright Japan Association of Medical Informatics (JAMI)  一般社団法人日本医療情報学会"

* include codes from system $JP_MedicationAsNeededConditionJAMI_CS
* include codes from system $JP_MedicationAsNeededConditionMERIT9_CS
