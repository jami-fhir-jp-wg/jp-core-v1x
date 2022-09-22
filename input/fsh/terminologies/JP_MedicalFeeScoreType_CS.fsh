CodeSystem: JP_MedicalFeeScoreType_CS
Id: jp-medicalfeescoretype-cs
Title: "JP Core MedicalFeeScoreType CodeSystem"
Description: "診療報酬点数区分コード"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[=].value = "urn:oid:1.2.392.100495.20.3.22"
* ^url = $JP_MedicalFeeScoreType_CS
* ^status = #active
* ^experimental = false
* ^date = "2022-09-26"
* ^caseSensitive = true
* ^valueSet = $JP_MedicalFeeScoreType_VS
* ^content = #complete
* #1 "医科"
* #3 "歯科"
* #4 "調剤"
* #5 "老人保健施設"
* #6 "訪問看護ステーション"
