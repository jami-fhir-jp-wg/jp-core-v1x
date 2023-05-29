Instance: jp-observation-socialhistory-example-1
InstanceOf: JP_Observation_SocialHistory
Title: "JP Core Observation SocialHistory Example 社会的背景（喫煙）"
Description: "喫煙に関する項目"
Usage: #example
* category[socialHistory] = $JP_SimpleObservationCategory_CS#social-history "Social History"
* subject = Reference(Patient/jp-patient-example-1)
* code.coding[0] = http://abc-hospital.local/fhir/Observation/localcode#abc-local-456 "ブリンクマン指数"
* code.coding[+] = $JP_ObservationSocialHistoryCode_CS#MD0012920 "喫煙指数"
* effectiveDateTime = "2021-10-19T10:00:00+09:00"
* valueQuantity.value = 400
* component[0].code.coding = $JP_ObservationSocialHistoryCode_CS#MD0012910 "通算喫煙年数"
* component[=].code.text = "通算喫煙年数"
* component[=].valueQuantity.unit = "年"
* component[=].valueQuantity.value = 20
* component[+].code.coding = $JP_ObservationSocialHistoryCode_CS#MD0012900 "１日の喫煙本数"
* component[=].code.text = "１日の喫煙本数"
* component[=].valueQuantity.unit = "本"
* component[=].valueQuantity.value = 20
* performer = Reference(Practitioner/jp-practitioner-example-female-2)
* status = #final
