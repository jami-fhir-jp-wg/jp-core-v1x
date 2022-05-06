Instance: jp-allergyintolerance-example1
InstanceOf: JP_AllergyIntolerance
Title: "JP Core AllergyIntolerance Example1"
Usage: #example
* clinicalStatus
  * coding[0]
    * system = "http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical"
    * code = #active
* verificationStatus
  * coding[0]
    * system = "http://terminology.hl7.org/CodeSystem/allergyintolerance-verification"
    * code = #confirmed
* type = #allergy 
* category = #food
* criticality = #low 
* code
  * coding
    * system = "http://jpfhir.jp/fhir/core/JP_AllergyIntolerance/CodeSystem/JFAGY"
    * code = #J7F7111190
    * display = "さば類"
  * text = "ゴマサバ"
* patient
  * reference = "Patient/jp-patient-example1"
  * display = "・・・・"
* onsetDateTime = "2021-08-22"
* recordedDate = "2021-08-23" 
* reaction
  * manifestation
    * coding
      * system = "http://jpfhir.jp/fhir/CodeSystem/***"
      * code = #***
      * display = "蕁麻疹"
    * text = "じん麻疹"
  * severity = #mild
