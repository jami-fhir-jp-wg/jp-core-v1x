Instance:  jp-condition-example-1
InstanceOf: JP_Condition
Title: "JP Core Condition Example 病名（直腸癌）"
Description: "下血を生じたKRAS野生型の転移性結腸直腸癌の例"
Usage: #example
*  text.status = #additional
*  text.div = "<div xmlns='http://www.w3.org/1999/xhtml'><p class='res-header-id'><b>Generated Narrative: Condition jp-condition-example-1</b></p><a name='jp-condition-example-1'> </a><a name='hcjp-condition-example-1'> </a><a name='jp-condition-example-1-ja'> </a><p><b>clinicalStatus</b>: <span title='Codes:{http://terminology.hl7.org/CodeSystem/condition-clinical active}'>Active</span></p><p><b>verificationStatus</b>: <span title='Codes:{http://terminology.hl7.org/CodeSystem/condition-ver-status confirmed}'>Confirmed</span></p><p><b>category</b>: <span title='Codes:{http://terminology.hl7.org/CodeSystem/condition-category problem-list-item}'>Problem List Item</span></p><p><b>severity</b>: <span title='Codes:{http://jpfhir.jp/fhir/core/CodeSystem/JP_ConditionSeverity_CS MO}'>中度</span></p><p><b>code</b>: <span title='Codes:'>KRAS野生型の転移性結腸直腸癌</span></p><p><b>bodySite</b>: <span title='Codes:'>結腸直腸</span></p><p><b>subject</b>: <a href='Patient-jp-patient-example-1.html'>山田 太郎</a></p><p><b>onset</b>: No display for Age<ol><li>value: 52</li><li>unit: years</li><li>system: http://unitsofmeasure.org</li><li>code: a</li></ol></p><p><b>recordedDate</b>: 2022-08-01</p><h3>Evidences</h3><table class='grid'><tr><td style='display: none'>-</td><td><b>Code</b></td></tr><tr><td style='display: none'>*</td><td><span title='Codes:'>下血</span></td></tr></table></div>"
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
