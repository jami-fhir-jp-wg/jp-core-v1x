Instance:  jp-condition-example-1
InstanceOf: JP_Condition
Title: "JP Core Condition Example 病名（直腸癌）"
Description: "下血を生じたKRAS野生型の転移性結腸直腸癌の例"
Usage: #example
*  clinicalStatus
  *  coding[0]
    *  system = "http://terminology.hl7.org/CodeSystem/condition-clinical"
    *  code = #active
*  verificationStatus
  *  coding[0]
    *  system = "http://terminology.hl7.org/CodeSystem/condition-ver-status"
    *  code = #confirmed
*  category[0]
  *  coding[0]
    *  system = "http://terminology.hl7.org/CodeSystem/condition-category"
    *  code = #problem-list-item
*  severity
  *  coding[0]
    *  system = "http://jpfhir.jp/fhir/core/CodeSystem/JP_ConditionSeverity_CS"
    *  code = #MO
    *  display = "中度"
*  code
  *  text = "KRAS野生型の転移性結腸直腸癌"
*  bodySite[0]
  *  text = "結腸直腸"
*  subject
  *  reference = "Patient/jp-patient-example-1"
  *  display = "山田 太郎"
*  onsetAge
  *  value = 52
  *  unit = "years"
  *  system = "http://unitsofmeasure.org"
  *  code = #a
*  recordedDate = "2022-08-01"
*  evidence[0]
  *  code[0]
    *  text = "下血"
