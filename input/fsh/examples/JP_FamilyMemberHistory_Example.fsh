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
    * system = "http://hl7.org/fhir/administrative-gender"
    * code = #female
* reasonCode[0]
  * text = "難聴"
* condition[0]
  * code
    * text = "糖尿病"
* condition[1]
  * code
    * text = "難聴"

// Example: FamilyMemberHistory for eldest son with sibling order annotation
Instance: jp-familymemberhistory-example-2
InstanceOf: JP_FamilyMemberHistory
Title: "JP Core FamilyMemberHistory Example 家族歴（息子 長男）"
Description: "息子（長男）。同胞内出生順名称（長男）を付与した例。"
Usage: #example
* status = #partial
* patient
* reference = "Patient/jp-patient-example-1"
* display = "山田 太郎"
* relationship
* coding[0]
* system = "http://terminology.hl7.org/CodeSystem/v3-RoleCode"
* code = #SON
* sex
* coding[0]
* system = "http://hl7.org/fhir/administrative-gender"
* code = #male
* extension[+].url = $JP_FamilyMemberHistory_GenogramBasedSiblingOrder
* extension[=].extension[+].url = "siblingBirthOrder"
* extension[=].extension[=].valueInteger = 1
* extension[=].extension[+].url = "genderedSiblingBirthOrder"
* extension[=].extension[=].valueCodeableConcept.coding = #GSBO1_M
* reasonCode[0]
* text = "糖尿病"
* condition[0]
* code
* text = "糖尿病"

// Example: FamilyMemberHistory for domestic partner
Instance: jp-familymemberhistory-example-3
InstanceOf: JP_FamilyMemberHistory
Title: "JP Core FamilyMemberHistory Example 家族歴（内縁の妻）"
Description: "内縁の妻。血縁関係がなく、病歴情報（reasonCode、condition）はない。"
Usage: #example
* status = #partial
* patient
* reference = "Patient/jp-patient-example-1"
* display = "山田　太郎"
* relationship
* coding[0]
* system = "http://terminology.hl7.org/CodeSystem/v3-RoleCode"
* code = #DOMPART

