Instance:  jp-condition-example-1
InstanceOf: JP_Condition
Title: "JP Core Condition Basic Example"
Description: "JP_Conditionリソースの1例"
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
    *  system = "http://jpfhir.jp/fhir/CodeSystem/***"
    *  code = #problem-list-item
*  severity
  *  coding[0]
    *  system = "http://snomed.info/sct"
    *  code = #24484000
    *  display = "Severe"
*  code
  *  coding[0]
    *  system = "http://jpfhir.jp/fhir/CodeSystem/***"
    *  code = #MK26
    *  display = "ＫＲＡＳ遺伝子野生型結腸癌"
  *  coding[1]
    *  system = "http://jpfhir.jp/fhir/CodeSystem/***"
    *  code = #F833
    *  display = "ＫＲＡＳ遺伝子野生型直腸癌"
  *  coding[2]
    *  system = "http://jpfhir.jp/fhir/CodeSystem/***"
    *  code = #P0A0
    *  display = "転移性大腸腫瘍"
  *  text = "KRAS野生型の転移性結腸直腸癌"
*  bodySite[0]
  *  coding[0]
    *  system = "http://jpfhir.jp/fhir/CodeSystem/***"
    *  code = #a
    *  display = "結腸"
  *  coding[0]
    *  system = "http://jpfhir.jp/fhir/CodeSystem/***"
    *  code = #b
    *  display = "直腸"   
  *  text = "結腸直腸"
*  subject
  *  reference = "Patient/jp-patient-example-1"
  *  display = "山田 太郎"
*  onsetAge
  *  value = 52
  *  unit = "years"
  *  system = "http://unitsofmeasure.org"
  *  code = #a
*  recordedDate = "2020-12-01"
*  evidence[0]
  *  code[0]
    * coding[0]
      *  system = "http://jpfhir.jp/fhir/CodeSystem/***"
      *  code = #c
  // *  detail[0]
  //   *  reference = ".../example"
  //   *  display = "..."
