Instance: jp-familymemberhistory-example-1
InstanceOf: JP_FamilyMemberHistory
Title: "JP Core FamilyMemberHistory Example-1 基本的な家族歴（母親）"
Description: "基本的な家族歴の例：MELASが疑われる患者（山田太郎）の母親が糖尿病と難聴を有する"
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
Title: "JP Core FamilyMemberHistory Example-2 家族歴（息子 長男）、氏名が不明"
Description: "同胞内出生順名称の例：MELASが疑われる糖尿病患者（山田太郎）の息子(#SON）が長男（#SBO1_M）は、花粉症の病歴のみで糖尿病の既往なし。"
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
* extension[+].url = $JP_FamilyMemberHistory_SiblingOrder
* extension[=].extension[+].url = "siblingBirthOrder"
* extension[=].extension[=].valueInteger = 1
* extension[=].extension[+].url = "siblingBirthOrderByGender"
* extension[=].extension[=].valueCodeableConcept
  * coding[0]
    * system = "http://jpfhir.jp/fhir/core/CodeSystem/JP_SiblingBirthOrderByGender_CS"
    * code = #SBO1_M
    * display = "長男"
* reasonCode[0].text = "糖尿病"
* condition[0].code.text = "花粉症"
* note[+].text = "糖尿病の既往なし。"

// Example: FamilyMemberHistory for domestic partner
Instance: jp-familymemberhistory-example-3
InstanceOf: JP_FamilyMemberHistory
Title: "JP Core FamilyMemberHistory Example-3 家族歴（内縁の妻）、氏名あり"
Description: "鈴木花子という内縁の妻。血縁関係がなく、病歴情報（reasonCode、condition）はない。"
Usage: #example
* status = #partial
* patient
  * reference = "Patient/jp-patient-example-1"
  * display = "山田 太郎"
* relationship
  * coding[0]
    * system = "http://terminology.hl7.org/CodeSystem/v3-RoleCode"
    * code = #DOMPART
* sex
  * coding[0]
    * system = "http://hl7.org/fhir/administrative-gender"
    * code = #female
* name = "鈴木 花子（内縁の妻）、キーパーソン"

// Example: 
Instance: jp-familymemberhistory-example-4
InstanceOf: JP_FamilyMemberHistory
Title: "JP Core FamilyMemberHistory Example-4 母方のおば（次女）"
Description: "MELAS疑い患者の母方のおば（次女）。母が長女、母方のおじが長男、おばの出生順は３番目。糖尿病に罹患。"
Usage: #example
* status = #partial
* patient
  * reference = "Patient/jp-patient-example-1"
  * display = "山田 太郎"
* relationship
  * coding[0]
    * system = "http://terminology.hl7.org/CodeSystem/v3-RoleCode"
    * code = #MAUNT
* sex
  * coding[0]
  * system = "http://hl7.org/fhir/administrative-gender"
* code = #female 
* name = "母方のおば（次女）"
* extension[+].url = $JP_FamilyMemberHistory_SiblingOrder
* extension[=].extension[+].url = "siblingBirthOrder"
* extension[=].extension[=].valueInteger = 3
* extension[=].extension[+].url = "genderedSiblingBirthOrder"
* extension[=].extension[=].valueCodeableConcept.coding = #GSBO2_F
* extension[=].extension[=].valueCodeableConcept
  * coding[0]
    * system = "http://jpfhir.jp/fhir/core/CodeSystem/JP_SiblingBirthOrderByGender_CS"
    * code = #SBO2_F
    * display = "次女"
* condition[0]
  * code
    * text = "糖尿病"