Instance: jp-allergyintolerance-example
InstanceOf: JP_AllergyIntolerance
Title: "JP Core AllergyIntolerance Example"
Usage: #example
* id = "example"
* clinicalStatus
  * coding[0]
    * system = "http://hl7.org/fhir/ValueSet/allergyintolerance-clinical"
    * code = #active
* verificationStatus
  * coding[0]
    * system = "http://hl7.org/fhir/ValueSet/allergyintolerance-verification"
    * code = #confirmed
* type = #allergy 
* category = #jp_food
* criticality = #low 
* code
  * coding
    * system = "http://jpfhir.jp/fhir/core/JP_AllergyIntolerance/CodeSystem/JFAGY"
    * code = #J7F7111190
    * display = "さば類"
  * text = "ゴマサバ"
* patient
  * reference = "Patient/example"
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
