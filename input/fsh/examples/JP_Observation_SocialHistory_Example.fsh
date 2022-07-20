Instance: jp-observation-socialhistory-example-1
InstanceOf: JP_Observation_SocialHistory
Title: "JP Core Observatio SocialHistory Basic Example"
Description: "JP_ObservationSocialHistoryリソースの1例"
Usage: #example
* id = "social-12345"
* category.coding.code = #social-history
* category.coding.system = "http://terminology.hl7.org/CodeSystem/observation-category"
* category.coding.display = "Social History"
* subject = Reference(Patient/jp-patient-example-1)
* code.coding[0].code = #abc-local-456
* code.coding[=].system = "http://abc-hospital.local/fhir/Observation/localcode"
* code.coding[=].display = "ブリンクマン指数"
* code.coding[1].code = #MD0012920
* code.coding[=].system = "http://jpfhir.jp/Common/CodeSystem/social-history"
* code.coding[=].display = "喫煙指数"
* effectiveDateTime = "2021-10-19T10:00:00+09:00"
* valueQuantity.value = 400
* component[0].code.coding.code = #MD0012910
// TODO : CodeSystemに不整合あり。リソース定義から直す必要あり
* component[=].code.coding.system = "http://jpfhir.jp/Common/CodeSystem/social-history"
* component[=].code.coding.display = "通算喫煙年数"
* component[=].code.text = "通算喫煙年数"
* component[=].valueQuantity.unit = "年"
* component[=].valueQuantity.value = 20
* component[+].code.coding.code = #MD0012900
* component[=].code.coding.system = "http://jpfhir.jp/Common/CodeSystem/social-history"
* component[=].code.coding.display = "１日の喫煙本数"
* component[=].code.text = "１日の喫煙本数"
* component[=].valueQuantity.unit = "本"
* component[=].valueQuantity.value = 20
* performer = Reference(Practitioner/jp-practionner-example-female-2)
* status = #final
