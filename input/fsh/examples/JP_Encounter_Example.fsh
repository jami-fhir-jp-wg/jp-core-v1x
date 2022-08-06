Instance: jp-encounter-example-1
InstanceOf: JP_Encounter
Title: "JP Core Enconter Example 外来"
Description: "外来"
Usage: #example
* status = #finished
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#AMB
* subject = Reference(Patient/jp-patient-example-1) "山田 太郎"
* participant.individual = Reference(Practitioner/jp-practionner-example-female-1) "東京 春子"
* period.start = "2022-05-08T13:08:24+09:00"
* period.end = "2022-05-08T13:23:24+09:00"
* serviceProvider = Reference(Organization/jp-organization-example-clinic) "太郎花子クリニック"