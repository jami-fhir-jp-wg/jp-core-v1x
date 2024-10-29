Instance: jp-observation-endoscopy-example-diagnosis-1
InstanceOf: JP_Observation_Endoscopy
Title: "JP Core Observation Endoscopy Example 診断（腺腫）"
Description: "内視鏡診断（腺腫）"
Usage: #example
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#procedure "Procedure"
* category[1] = $Loinc_CS#LP7796-8 "Endoscopy"
* code
  * coding
    * system = "http://jpfhir.jp/fhir/core/CodeSystem/JP_ObservationEndoscopyCode_VS"
    * code = #19811-9
    * display = "Diagnosis Endoscopy Procedure Narrative"
  * text = "内視鏡診断"
* subject = Reference(Patient/jp-patient-example-1) "山田 太郎"
* encounter = Reference(Encounter/jp-encounter-example-1)
* effectiveDateTime = "2024-06-30T10:24:30+09:00"
* performer = Reference(Practitioner/jp-practitioner-example-male-1)
* valueCodeableConcept
  * coding
    * system = "http://jpfhir.jp/fhir/core/CodeSystem/JP_ObservationEndoscopyValueJed_VS"
    * code = #Z2L30301
    * display = "[Tumor] Adenoma / Early Colorectal Cancer"
  * text = "[腫瘍] 腺腫・早期大腸癌"
* hasMember[0] = Reference(Observation/jp-observation-endoscopy-example-findings-1a) "大きさ　長径４（ｍｍ）"
* hasMember[1] = Reference(Observation/jp-observation-endoscopy-example-findings-1b) "[大腸 肉眼型1] Is(p)"