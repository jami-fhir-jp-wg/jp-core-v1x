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
        * system = $JP_ConditionDiseaseModifierReceipt_CS
        * code = #3216
        * display = "過敏性"
      * text = "過敏性"
  * extension[1]
    * url = $JP_Condition_DiseasePostfixModifier
    * valueCodeableConcept
      * coding[0]
        * system = $JP_ConditionDiseaseModifierReceipt_CS
        * code = #1111
        * display = "の初期"
      * text = "の初期"
  * extension[2]
    * url = $JP_Condition_DiseasePostfixModifier
    * valueCodeableConcept
      * coding[0]
        * system = $JP_ConditionDiseaseModifierReceipt_CS
        * code = #08MV
        * display = "疾患"
      * text = "疾患"
  * coding[0]
    * system = "http://terminology.sample.com/CodeSystem/disease/1311234567"
    * code = #MD13062
    * display = "大腸炎"
  * coding[1]
    * system = $JP_ConditionDiseaseCodeMEDISExchange_CS
    * code = #VSES
    * display = "大腸炎"
  *  text = "過敏性大腸炎の初期疾患"
*  bodySite[0]
  *  text = "大腸"
*  subject
  *  reference = "Patient/jp-patient-example-1"
  *  display = "山田 太郎"
*  onsetDateTime = "2017-02-28"
*  abatementDateTime	= "2017-03-07"
*  recordedDate = "2017-03-07"
