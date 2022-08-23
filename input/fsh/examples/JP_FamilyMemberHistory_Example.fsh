Instance: jp-familymemberhistory-example-1
InstanceOf: JP_FamilyMemberHistory
Title: "JP Core FamilyMemberHistory Example 家族歴（母親）"
Description: "母親が糖尿病と難聴を有する家族歴の例"
Usage: #example
* status = #partial
* patient
  * reference = "Patient/jp-patient-example-1"
  * display = "山田 太郎"
* relationship
  * coding[0]
    * system = "http://terminology.hl7.org/CodeSystem/v3-RoleCode"
    * code = #MTH
* sex
  * coding[0]
    * system = http://hl7.org/fhir/administrative-gender
    * code = #female
* reasonCode[0]
  * text = "難聴"
* condition[0]
  * code
    * text = "糖尿病" 
* condition[1]
  * code
    * text = "難聴" 
