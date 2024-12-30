Instance:  jp-condition-diagnosis-example-1
InstanceOf: JP_Condition_Diagnosis
Title: "JP Core Condition Diagnosis Example 病名（過敏性大腸炎の初期疾患）"
Description: "過敏性大腸炎の初期疾患の例"
Usage: #example
* extension[0]
  * url = $JP_Condition_DiseaseOutcome
  * valueCodeableConcept
    * coding[0]
      * system = "http://terminology.sample.com/CodeSystem/disease-outcome"
      * code = #2
      * display = "寛解"
    * coding[1]
      * system = $JP_ConditionDiseaseOutcomeJHSD0006_CS
      * code = #M
      * display = "寛解"
    * text = "寛解"
*  identifier
  * system = "http://terminology.sample.com/IdSystem/disease/1311234567"
  * value = "123456789012345"
*  clinicalStatus
  * coding[0]
    * system = "http://terminology.hl7.org/CodeSystem/condition-clinical"
    * code = #remission
    * display = "Remission"
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
    *  system = $JP_ConditionSeverity_CS
    *  code = #MO
    *  display = "中度"
*  code
  * extension[0]
    * url = $JP_Condition_DiseasePrefixModifier
    * valueCodeableConcept
      * coding[0]
        * system = $JP_Modifier_MEDIS_Concept_CS
        * code = #5194
        * display = "右"
      * text = "右"
  * extension[1]
    * url = $JP_Condition_DiseasePostfixModifier
    * valueCodeableConcept
      * coding[0]
        * system = $JP_Modifier_MEDIS_Concept_CS
        * code = #1486
        * display = "の術後"
      * text = "の術後"
  * coding[0]
    * system = "http://terminology.sample.com/CodeSystem/disease/1311234567"
    * code = #MD13062
    * display = "橈骨遠位端骨折"
  * coding[1]
    * system = $JP_Disease_MEDIS_Concept_CS
    * code = #CJTR
    * display = "橈骨遠位端骨折"
  *  text = "右橈骨遠位端骨折の術後"
*  bodySite[0]
  *  text = "右橈骨遠位端"
*  subject
  *  reference = "Patient/jp-patient-example-1"
  *  display = "山田 太郎"
*  onsetDateTime = "2017-02-28"
*  abatementDateTime	= "2017-03-07"
*  recordedDate = "2017-03-07"
