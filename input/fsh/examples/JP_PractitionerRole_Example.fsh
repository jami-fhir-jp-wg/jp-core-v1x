Instance:  jp-practitionerrole-example-1
InstanceOf: JP_PractitionerRole
Title:   "JP Core ProcedureRole Example 精神科外来サービス担当"
Description: "精神科外来サービス担当"
Usage:  #example
* identifier.system = "http://www.acme.org/practitioners"
* identifier.value = "23"
* active = true
* period.start = "2012-01-01"
* period.end = "2012-03-31"
* practitioner = Reference(Practitioner/jp-practitioner-example-male-1) "大阪 一郎"
* organization = Reference(Organization/jp-organization-example-hospital) "健康第一病院"
* code = $JP_PractitionerRole_CS#JPR10000
* location = Reference(Location/jp-location-example-examinationroom) "外来101診察室"
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
