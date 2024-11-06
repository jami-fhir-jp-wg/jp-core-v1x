Instance: jp-observation-endoscopy-example-diagnosis-2
InstanceOf: JP_Observation_Endoscopy
Title: "JP Core Observation Endoscopy Example 診断（[鋸歯状病変] HP）"
Description: "内視鏡診断（[鋸歯状病変] HP）"
Usage: #example
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#procedure "Procedure"
* category[1] = $Loinc_CS#LP7796-8 "内視鏡"
* code
  * coding
    * system = $Loinc_CS
    * code = #19811-9
    * display = "Diagnosis Endoscopy Procedure Narrative"
  * text = "内視鏡診断"
* subject = Reference(Patient/jp-patient-example-1) "山田 太郎"
* encounter = Reference(Encounter/jp-encounter-example-1)
* effectiveDateTime = "2024-06-30T10:24:30+09:00"
* performer = Reference(Practitioner/jp-practitioner-example-male-1)
* valueCodeableConcept
  * coding
    * system = $JP_EndoscopyTerminologyCodesJED_CS
    * code = #Z2L30401
    * display = "[鋸歯状病変] HP"
  * text = "[鋸歯状病変] HP"
* hasMember[0] = Reference(Observation/jp-observation-endoscopy-example-findings-2a) "大きさ　長径５（ｍｍ）"
* hasMember[1] = Reference(Observation/jp-observation-endoscopy-example-findings-2b) "[大腸 肉眼型1] IIa"