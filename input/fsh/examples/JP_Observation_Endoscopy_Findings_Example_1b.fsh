Instance: jp-observation-endoscopy-example-findings-1b
InstanceOf: JP_Observation_Endoscopy
Title: "JP Core Observation Endoscopy Example 所見（[大腸 肉眼型1] Is(p)）"
Description: "内視鏡所見（[大腸 肉眼型1] Is(p)）"
Usage: #example
* status = #final
* category[0] = $JP_SimpleObservationCategory_CS#procedure "Procedure"
* category[1] = $Loinc_CS#LP7796-8 "Endoscopy"
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
    * system = "http://jpfhir.jp/fhir/core/CodeSystem/JP_EndoscopyTerminologyCodesJED_CS"
    * code = #Z2L20301
    * display = "[Colon Macroscopic Classification] Type0-Is(p) (Semipedunculated Type)"
  * text = "[大腸 肉眼型1] Is(p)"