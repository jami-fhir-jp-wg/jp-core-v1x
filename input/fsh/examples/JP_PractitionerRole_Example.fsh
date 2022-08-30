Instance:  jp-practitionerrole-example-1
InstanceOf: JP_PractitionerRole
Title:   "JP Core ProcedureRole Example 精神科外来サービス担当"
Description: "精神科外来サービス担当"
Usage:  #example
* contained[0] = jp-healthcareservice-example-1
* identifier.system = "http://www.acme.org/practitioners"
* identifier.value = "23"
* active = true
* period.start = "2012-01-01"
* period.end = "2012-03-31"
* practitioner = Reference(Practitioner/jp-practitioner-example-male-1) "大阪 一郎"
* organization = Reference(Organization/jp-organization-example-hospital) "健康第一病院"
* code = $JP_PractitionerRole_CS#B12101
* location = Reference(Location/jp-location-example-examinationroom) "外来101診察室"
* healthcareService = Reference(HealthcareService/jp-healthcareservice-example-1)
* telecom[0].system = #phone
* telecom[=].value = "3456"
* telecom[=].use = #work
* telecom[+].system = #email
* telecom[=].value = "ichiro.osaka@example.org"
* telecom[=].use = #work
* availableTime[0].daysOfWeek[0] = #mon
* availableTime[=].daysOfWeek[+] = #tue
* availableTime[=].daysOfWeek[+] = #wed
* availableTime[=].availableStartTime = "09:00:00"
* availableTime[=].availableEndTime = "16:30:00"
* availableTime[+].daysOfWeek[0] = #thu
* availableTime[=].daysOfWeek[+] = #fri
* availableTime[=].availableStartTime = "09:00:00"
* availableTime[=].availableEndTime = "12:00:00"
* notAvailable.description = "大阪 一郎は2017年5月中に長期休暇を取る予定です。"
* notAvailable.during.start = "2017-05-01"
* notAvailable.during.end = "2017-05-20"
* availabilityExceptions = "祝祭日やクリスマス・年末年始の休暇中は、大阪 一郎は休日です。"

Instance: jp-healthcareservice-example-1
InstanceOf: HealthcareService
Title:   "HealthcareService Example 精神科外来サービス"
Usage: #inline
* identifier.system = "http://example.org/shared-ids"
* identifier.value = "HS-12"
* active = true
* providedBy = Reference(Organization/jp-organization-example-hospital) "健康第一病院"
* category = http://terminology.hl7.org/CodeSystem/service-category#8
* type[0] = http://terminology.hl7.org/CodeSystem/service-type#147
* type[+] = http://terminology.hl7.org/CodeSystem/service-type#142
// * specialty = http://xxxx/yyyy/zzzz "Posttraumatic stress disorder"
* location = Reference(Location/jp-location-example-examinationroom)
* name = "PTSDに関する精神科もしくは診療内科のサービス"
* coverageArea = Reference(Location/jp-location-example-ward)
* serviceProvisionCode = http://terminology.hl7.org/CodeSystem/service-provision-conditions#cost "Fees apply"
* eligibility.code.coding.display = "精神科もしくは心療内科の専門医"
* eligibility.comment = "精神科もしくは心療内科の専門医を資格を有します。"
* program.text = "PTSD回復プログラム"
* characteristic.coding.display = "車いすでのアクセス"
* referralMethod[0] = http://terminology.hl7.org/CodeSystem/service-referral-method#phone
* referralMethod[+] = http://terminology.hl7.org/CodeSystem/service-referral-method#fax
* referralMethod[+] = http://terminology.hl7.org/CodeSystem/service-referral-method#elec
* referralMethod[+] = http://terminology.hl7.org/CodeSystem/service-referral-method#semail
* appointmentRequired = false
* availableTime[0].daysOfWeek = #wed
* availableTime[=].allDay = true
* availableTime[+].daysOfWeek[0] = #mon
* availableTime[=].daysOfWeek[+] = #tue
* availableTime[=].daysOfWeek[+] = #thu
* availableTime[=].daysOfWeek[+] = #fri
* availableTime[=].availableStartTime = "08:30:00"
* availableTime[=].availableEndTime = "05:30:00"
* availableTime[+].daysOfWeek[0] = #sat
* availableTime[=].daysOfWeek[+] = #fri
* availableTime[=].availableStartTime = "09:30:00"
* availableTime[=].availableEndTime = "04:30:00"
* notAvailable[0].description = "勤労感謝の日"
* notAvailable[=].during.start = "2021-11-23"
* notAvailable[=].during.end = "2021-11-23"
* notAvailable[+].description = "年始休暇"
* notAvailable[=].during.start = "2022-01-01"
* notAvailable[=].during.end = "2022-01-03"
* availabilityExceptions = "年末年始は予約数を減らして開院しています。"
