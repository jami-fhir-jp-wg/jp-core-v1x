Instance: jp-allergyintolerance-example-1
InstanceOf: JP_AllergyIntolerance
Title: "JP Core AllergyIntolerance Example 食物アレルギー（小麦）"
Description: "じん麻疹を生じた小麦粉アレルギーの例"
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
* criticality = #high
* code
  * coding
    * system = $JP_JfagyFoodAllergen_CS
    * code = #J9F692300006
    * display = "小麦粉"
  * text = "こむぎこ"
* patient
  * reference = "Patient/jp-patient-example-1"
  * display = "山田 太郎"
* onsetDateTime = "2022-08-01"
* recordedDate = "2022-08-03" 
* reaction
  * manifestation
    * text = "じん麻疹"
  * severity = #moderate
