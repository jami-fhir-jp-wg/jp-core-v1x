Instance: jp-familymemberhistory-example-1
InstanceOf: JP_FamilyMemberHistory
Title: "JP Core FamilyMemberHistory Example-1 母親"
Description: "基本的な家族歴の例：MELASが疑われる患者（山田太郎）の母親が糖尿病と難聴を有する。"
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
Description: "出生順呼称の例1（子世代）：MELASが疑われる糖尿病患者（山田太郎）の息子（長男）で、花粉症の病歴のみを有し、糖尿病の既往はない。"
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
* extension[BirthOrderLabel].valueCodeableConcept
  * coding[0]
    * system = "http://jpfhir.jp/fhir/core/CodeSystem/JP_BirthOrderLabel_CS"
    * code = #son-1
    * display = "first son"
  * text = "長男"
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
Description: "出生順呼称の例2（親世代）：MELASが疑われる患者の母方のおばが、家族内で次女と呼称されている例。"
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
* extension[BirthOrderLabel].valueCodeableConcept
  * coding[0]
    * system = "http://jpfhir.jp/fhir/core/CodeSystem/JP_BirthOrderLabel_CS"
    * code = #daughter-2
    * display = "second daughter"
  * text = "次女"
* sex
  * coding[0]
    * system = "http://hl7.org/fhir/administrative-gender"
    * code = #female
* reasonCode[0]
  * text = "MELASの疑い"
* condition[0]
  * code
    * text = "糖尿病"
* note[+].text = "糖尿病に罹患しており、MELAS保因者と思われる。"


Instance: jp-familymemberhistory-example-list
InstanceOf: List
Usage: #example
* status = #current
* mode = #snapshot
* code.coding[0].system = "http://loinc.org"
* code.coding[0].code = #8670-2
* code.coding[0].display = "History of family member diseases"
* code.text = "家族歴"
* subject.reference = "Patient/jp-patient-example-1"
* subject.display = "山田 太郎"
* entry[0].item.reference = "FamilyMemberHistory/jp-familymemberhistory-example-1"
* entry[0].item.display = "母親"
* entry[1].item.reference = "FamilyMemberHistory/jp-familymemberhistory-example-2"
* entry[1].item.display = "息子（長男）"
* entry[2].item.reference = "FamilyMemberHistory/jp-familymemberhistory-example-3"
* entry[2].item.display = "内縁のパートナー"
* entry[3].item.reference = "FamilyMemberHistory/jp-familymemberhistory-example-4"
* entry[3].item.display = "母方のおば（次女）"