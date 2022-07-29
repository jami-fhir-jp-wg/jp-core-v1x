Instance:  jp-procedurerole-example-1
InstanceOf: JP_PractitionerRole
Title:   "JP Core ProcedureRole 診察"
Description: "JP_ProcedureRole "
Usage:  #example
* contained[0] = jp-healthcareservice-example-1
* contained[+] = jp-endpoint-example-1
* identifier.system = "http://www.acme.org/practitioners"
* identifier.value = "23"
* active = true
* period.start = "2012-01-01"
* period.end = "2012-03-31"
* practitioner = Reference(Practitioner/jp-practionner-example-male-1) "大阪 一郎"
* organization = Reference(Organization/jp-organization-example-hospital) "健康第一病院"
* code = $JP_ProcedurePerformerRoleCodes_CS#B12101
* location = Reference(Location/jp-location-example-examinationroom) "外来101診察室"
* healthcareService = Reference(HealthcareService/example)
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
* endpoint = Reference(Endpoint/jp-endpoint-example-1)


Instance: jp-healthcareservice-example-1
InstanceOf: HealthcareService
Usage: #inline
* contained[0] = jp-endpoint-example-1
* identifier.system = "http://example.org/shared-ids"
* identifier.value = "HS-12"
* active = true
* providedBy = Reference(Organization/jp-organization-example-hospital) "健康第一病院"
* category = http://terminology.hl7.org/CodeSystem/service-category#8 "Counselling"
* category.text = "Counselling"
// * type[0] = http://snomed.info/sct#394913002 "Psychotherapy"
// * type[+] = http://snomed.info/sct#394587001 "Psychiatry"
// * specialty = http://snomed.info/sct#47505003 "Posttraumatic stress disorder"
* location = Reference(Location/jp-location-example-examinationroom)
* name = "Consulting psychologists and/or psychology services"
* comment = "Providing Specialist psychology services to the greater Den Burg area, many years of experience dealing with PTSD issues"
* extraDetails = "Several assessments are required for these specialist services, and the waiting times can be greater than 3 months at times. Existing patients are prioritized when requesting appointments on the schedule."
* coverageArea = Reference(Location/jp-location-example-ward)
* serviceProvisionCode = http://terminology.hl7.org/CodeSystem/service-provision-conditions#cost "Fees apply"
* eligibility.code.coding.display = "DVA Required"
* eligibility.comment = "Evidence of application for DVA status may be sufficient for commencing assessment"
* program.text = "PTSD outreach"
* characteristic.coding.display = "Wheelchair access"
* referralMethod[0] = #phone "Phone"
* referralMethod[+] = #fax "Fax"
* referralMethod[+] = #elec "Secure Messaging"
* referralMethod[+] = #semail "Secure Email"
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
* notAvailable[0].description = "Christmas/Boxing Day"
* notAvailable[=].during.start = "2021-12-25"
* notAvailable[=].during.end = "2021-12-26"
* notAvailable[+].description = "New Years Day"
* notAvailable[=].during.start = "2022-01-01"
* notAvailable[=].during.end = "2022-01-01"
* availabilityExceptions = "Reduced capacity is available during the Christmas period"
* endpoint = Reference(Endpoint/jp-endpoint-example-1)


Instance: jp-endpoint-example-1
InstanceOf: Endpoint
Usage: #inline
* identifier.system = "http://example.org/enpoint-identifier"
* identifier.value = "epcp12"
* status = #active
* connectionType = http://terminology.hl7.org/CodeSystem/endpoint-connection-type#hl7-fhir-rest
* name = "Health Intersections CarePlan Hub"
* managingOrganization = Reference(Organization/jp-organization-example-hospital)
* contact.system = #email
* contact.value = "endpointmanager@example.org"
* contact.use = #work
* period.start = "2014-09-01"
* payloadType = http://hl7.org/fhir/resource-types#CarePlan
* payloadMimeType = #application/fhir+xml
* address = "http://fhir3.healthintersections.com.au/open/CarePlan"
* header = "bearer-code BASGS534s4"