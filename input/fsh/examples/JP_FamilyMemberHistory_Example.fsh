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

// Example: FamilyMemberHistory for eldest son (長男) with gendered sibling order annotation
Instance: jp-familymemberhistory-example-2
InstanceOf: JP_FamilyMemberHistory
Title: "JP Core FamilyMemberHistory Example 家族歴（息子 長男）"
Description: "息子（長男）の家族歴の例。relationship=SON の場合に性別同胞内出生順拡張を付ける例。"
Usage: #example
* status = #partial
* patient
  * reference = "Patient/jp-patient-example-1"
  * display = "山田 太郎"
* relationship
  * coding[0]
    * system = "http://terminology.hl7.org/CodeSystem/v3-RoleCode"
    * code = #SON
  * extension[0].url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_FamilyMemberHistory_GenderedSiblingOrder"
  * extension[0].valueCodeableConcept.coding = $JP_GenderedSiblingOrder_CS#GSO1_M "長男"
* sex
  * coding[0]
    * system = "http://hl7.org/fhir/administrative-gender"
    * code = #male
* reasonCode[0]
  * text = "糖尿病"
* condition[0]
  * code
    * text = "糖尿病"
