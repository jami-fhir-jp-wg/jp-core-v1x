Instance: jp-familymemberhistory-example-1
InstanceOf: JP_FamilyMemberHistory
Title: "JP Core FamilyMemberHistory Example-1 基本的な家族歴（母親）"
Description: "基本的な家族歴の例：難聴に罹患している患者（山田太郎）の母親が糖尿病と難聴を有する"
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
Description: "同胞内出生順名称（長男）の例：糖尿病に罹患している患者（山田太郎）の息子（#SON）が長男（#GSBO1_M）で糖尿病を有する。もう１人の息子は次男だが、氏名は日常診療では聴取されない。"
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
* extension[=].extension[=].valueCodeableConcept.text = "長男"
* reasonCode[0]
* text = "糖尿病"
* condition[0]
* code
* text = "糖尿病"

// Example: FamilyMemberHistory for domestic partner
Instance: jp-familymemberhistory-example-3
InstanceOf: JP_FamilyMemberHistory
Title: "JP Core FamilyMemberHistory Example-3 家族歴（内縁の妻）、氏名あり"
Description: "ジェノグラムの例：鈴木花子という内縁の妻。血縁関係がなく、病歴情報（reasonCode、condition）はない。"
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
Description: "同胞内出生順名称の例：母方のおばが次女。母方のおじが長男、もう１人の母方のおばが長女で、出生順は３番目。"
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
* name = "母方の叔母（次女）"
* extension[+].url = $JP_FamilyMemberHistory_GenogramBasedSiblingOrder
* extension[=].extension[+].url = "siblingBirthOrder"
* extension[=].extension[=].valueInteger = 3
* extension[=].extension[+].url = "genderedSiblingBirthOrder"
* extension[=].extension[=].valueCodeableConcept.coding = #GSBO2_F
* extension[=].extension[=].valueCodeableConcept.text = "次女"
