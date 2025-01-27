Instance: jp-observation-endoscopy-example-findings-1a
InstanceOf: JP_Observation_Endoscopy
Title: "JP Core Observation Endoscopy Example 所見（大きさ　長径４（ｍｍ））"
Description: "内視鏡所見（大きさ　長径４（ｍｍ））"
Usage: #example
* status = #final
* category[first] = $JP_SimpleObservationCategory_CS#procedure "Procedure"
* category[second] = $Loinc_CS#LP7796-8 "内視鏡"
* code
  * coding
    * system = $Loinc_CS
    * code = #19778-0
    * display = "Indications description Narrative Endoscopy"
  * text = "内視鏡所見"
* subject = Reference(Patient/jp-patient-example-1) "山田 太郎"
* encounter = Reference(Encounter/jp-encounter-example-1)
* effectiveDateTime = "2024-06-30T10:24:30+09:00"
* performer = Reference(Practitioner/jp-practitioner-example-male-1)
* valueCodeableConcept
  * coding
    * system = $JP_EndoscopyTerminologyCodesJED_CS
    * code = #Z2L20800
    * display = "大きさ 長径（mm）（記述する）"
  * text = "大きさ　長径４（ｍｍ）"