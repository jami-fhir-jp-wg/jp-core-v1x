Instance: jp-familymemberhistory-example-1
InstanceOf: JP_FamilyMemberHistory
Title: "JP Core FamilyMemberHistory Example-1 母親"
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
    * display = "母親"
* sex
  * coding[0]
    * system = "http://hl7.org/fhir/administrative-gender"
    * code = #female
* reasonCode[0]
  * text = "MELASの疑い"
* condition[0]
  * code
    * text = "糖尿病"
* condition[1]
  * code
    * text = "難聴"

Instance: jp-familymemberhistory-example-2
InstanceOf: JP_FamilyMemberHistory
Title: "JP Core FamilyMemberHistory Example-2 息子（長男）"
Description: "同胞内出生順名称の例：MELASが疑われる糖尿病患者（山田太郎）の息子が長男で、花粉症の病歴のみを有し、糖尿病の既往はない。"
Usage: #example
* status = #partial
* patient
  * reference = "Patient/jp-patient-example-1"
  * display = "山田 太郎"
* relationship
  * coding[0]
    * system = "http://terminology.hl7.org/CodeSystem/v3-RoleCode"
    * code = #SON
    * display = "実息子"
  * extension[SiblingOrder].extension[siblingBirthOrder].valueInteger = 1
  * extension[SiblingOrder].extension[siblingBirthOrderByGender].valueCodeableConcept
    * coding[0]
      * system = "http://jpfhir.jp/fhir/core/CodeSystem/JP_SiblingBirthOrderByGender_CS"
      * code = #SBO1_M
      * display = "長男"
* sex
  * coding[0]
    * system = "http://hl7.org/fhir/administrative-gender"
    * code = #male
* reasonCode[0].text = "MELASの疑い"
* condition[0].code
  * text = "花粉症"
  * coding[0]
    * system = "http://hl7.org/fhir/sid/icd-10"
    * code = #J30.4
    * display = "アレルギー性鼻炎（詳細不明）"
* note[+].text = "糖尿病の既往なし。"

Instance: jp-familymemberhistory-example-3
InstanceOf: JP_FamilyMemberHistory
Title: "JP Core FamilyMemberHistory Example-3 内縁のパートナー（血縁なし）"
Description: "血縁関係のない例：鈴木花子という内縁のパートナー、血縁関係がないためMELAS疑いに関する家族歴聴取対象外で、病歴情報（reasonCode、condition）はない。"
Usage: #example
* status = #partial
* patient
  * reference = "Patient/jp-patient-example-1"
  * display = "山田 太郎"
* relationship
  * coding[0]
    * system = "http://terminology.hl7.org/CodeSystem/v3-RoleCode"
    * code = #DOMPART
    * display = "内縁のパートナー"
* sex
  * coding[0]
    * system = "http://hl7.org/fhir/administrative-gender"
    * code = #female
* name = "鈴木 花子"

Instance: jp-familymemberhistory-example-4
InstanceOf: JP_FamilyMemberHistory
Title: "JP Core FamilyMemberHistory Example-4 母方のおば（次女）"
Description: "同胞内出生順と性別同胞内出生順名称の出生順が異なる例：MELASが疑われる患者の母方のおば（次女）。糖尿病に罹患しており、MELAS保因者と思われる。次女であるが出生順は３番目で、姉１人、兄１人がいることが推論される。"
Usage: #example
* status = #partial
* patient
  * reference = "Patient/jp-patient-example-1"
  * display = "山田 太郎"
* relationship
  * coding[0]
    * system = "http://terminology.hl7.org/CodeSystem/v3-RoleCode"
    * code = #MAUNT
    * display = "母方のおば"
  * extension[SiblingOrder].extension[siblingBirthOrder].valueInteger = 3
  * extension[SiblingOrder].extension[siblingBirthOrderByGender].valueCodeableConcept
    * coding[0]
      * system = "http://jpfhir.jp/fhir/core/CodeSystem/JP_SiblingBirthOrderByGender_CS"
      * code = #SBO2_F
      * display = "次女"
* sex
  * coding[0]
    * system = "http://hl7.org/fhir/administrative-gender"
    * code = #female
* reasonCode[0]
  * text = "MELASの疑い"
* condition[0]
  * code
    * text = "糖尿病"