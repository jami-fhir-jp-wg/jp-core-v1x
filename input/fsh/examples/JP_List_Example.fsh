Instance: jp-list-example-1
InstanceOf: List
Title: "JP Core List Example-1 家族歴一覧"
Description: "家族歴一覧の例：MELASが疑われる患者（山田太郎）の家族構成員（母親、息子、内縁のパートナー、母方のおば）のFamilyMemberHistoryを一覧化したListリソース。"
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
