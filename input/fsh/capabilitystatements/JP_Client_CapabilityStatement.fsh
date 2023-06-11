Instance: jp-client-capabilitystatement
InstanceOf: CapabilityStatement
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/CapabilityStatement/JP_Client_CapabilityStatement"
* name = "JP_Client_CapabilityStatement"
* title = "JP Core Client CapabilityStatement"
* status = #active
* experimental = false
* date = "2022-10-24"
* description = "JP Core実装ガイドを利用したサイトを作成する際にクライアント側で規定するCapablityStatementのOperationsおよびSearch Parametersのリスト例を提示する。JP Core ServerがサポートするFHIRプロファイルに限定しているため、FHIR Baseのプロファイルを利用する際などは必要な項目を追記すること。"
* kind = #requirements
* instantiates = "http://jpfhir.jp/fhir/core/CapabilityStatement/JP_Client_CapabilityStatement"
* fhirVersion = #4.0.1
* format[0] = #json
* format[+] = #xml
* rest.mode = #client

// Patient
* insert SetSearchParameterResource(Patient, JP_Patient)
* insert PutDefinedSearchParam(identifier, Patient-identifier, token)
* insert PutDefinedSearchParam(name, Patient-name, string)
* insert PutDefinedSearchParam(family, individual-family, string)
* insert PutDefinedSearchParam(given, individual-given, string)
* insert PutDefinedSearchParam(birthdate, individual-birthdate, date)
* insert PutDefinedSearchParam(gender, individual-gender, token)
* insert PutDefinedSearchParam(phone, individual-phone, token)
* insert PutDefinedSearchParam(address-postalcode, individual-address-postalcode, string)

// Coverage
* insert SetSearchParameterResource(Coverage, JP_Coverage)
* insert PutDefinedSearchParam(beneficiary, Coverage-beneficiary, reference)
* insert PutDefinedSearchParam(class-type, Coverage-class-type, token)
* insert PutDefinedSearchParam(class-value, Coverage-class-value, string)
* insert PutDefinedSearchParam(dependent, Coverage-dependent, string)
* insert PutDefinedSearchParam(identifier, Coverage-identifier, token)
* insert PutDefinedSearchParam(patient, Coverage-patient, reference)
* insert PutDefinedSearchParam(payor, Coverage-payor, reference)
* insert PutDefinedSearchParam(policy-holder, Coverage-policy-holder, reference)
* insert PutDefinedSearchParam(status, Coverage-status, token)
* insert PutDefinedSearchParam(subscriber, Coverage-subscriber, reference)
* insert PutDefinedSearchParam(type, Coverage-type, token)

// Encounter
* insert SetSearchParameterResource(Encounter, JP_Encounter)
* insert PutDefinedSearchParam(patient, clinical-patient, reference)
* insert PutDefinedSearchParam(identifier, clinical-identifier, token)
* insert PutDefinedSearchParam(class, Encounter-class, token)
* insert PutDefinedSearchParam(date, clinical-date, date)
* insert PutDefinedSearchParam(status, Encounter-status, token)
* insert PutDefinedSearchParam(type, clinical-type, token)

// Location
* insert SetSearchParameterResource(Location, JP_Location)
* insert PutDefinedSearchParam(identifier, Location-identifier, token)
* insert PutDefinedSearchParam(name, Location-name, string)
* insert PutDefinedSearchParam(address, Location-address, string)
* insert PutDefinedSearchParam(address-city, Location-address-city, string)
* insert PutDefinedSearchParam(address-state, Location-address-state, string)
* insert PutDefinedSearchParam(address-postalcode, Location-address-postalcode, string)

// Organization
* insert SetSearchParameterResource(Organization, JP_Organization)
* insert PutDefinedSearchParam(identifier, Organization-identifier, token)
* insert PutDefinedSearchParam(name, Organization-name, string)
* insert PutDefinedSearchParam(address, Organization-address, string)

// Practitioner
* insert SetSearchParameterResource(Practitioner, JP_Practitioner)
* insert PutDefinedSearchParam(identifier, Practitioner-identifier, token)
* insert PutDefinedSearchParam(name, Practitioner-name, string)

// PractitionerRole
* insert SetSearchParameterResource(PractitionerRole, JP_PractitionerRole)
* insert PutDefinedSearchParam(identifier, PractitionerRole-identifier, token)
* insert PutDefinedSearchParam(specialty, PractitionerRole-specialty, token)
* insert PutDefinedSearchParam(practitioner, PractitionerRole-practitioner, reference)

// Medication
* insert SetSearchParameterResource(Medication, JP_Medication)
* insert PutDefinedSearchParam(identifier, Medication-identifier, token)

// MedicationRequest
* insert SetSearchParameterResourceTwo(MedicationRequest, JP_MedicationRequest, JP_MedicationRequest_Injection)
* insert PutDefinedSearchParam(identifier, clinical-identifier, token)
* insert PutDefinedSearchParam(patient, clinical-patient, reference)
* insert PutDefinedSearchParam(authoredon, MedicationRequest-authoredon, date)
* insert PutDefinedSearchParam(date, medications-date, date)
* insert PutDefinedSearchParam(category, MedicationRequest-category, token)
* insert PutDefinedSearchParam(code, clinical-code, token)
* insert PutDefinedSearchParam(requester, MedicationRequest-requester, reference)
* insert PutSearchParam(jp-medication-start, http://jpfhir.jp/fhir/core/SearchParameter/JP_MedicationRequest_Start_SP, date)

// MedicationDispense
* insert SetSearchParameterResourceTwo(MedicationDispense, JP_MedicationDispense, JP_MedicationDispense_Injection)
* insert PutDefinedSearchParam(identifier, clinical-identifier, token)
* insert PutDefinedSearchParam(patient, clinical-patient, reference)
* insert PutDefinedSearchParam(whenhandedover, MedicationDispense-whenhandedover, date)
* insert PutDefinedSearchParam(whenprepared, MedicationDispense-whenprepared, date)
* insert PutDefinedSearchParam(code, clinical-code, token)
* insert PutDefinedSearchParam(performer, MedicationDispense-performer, reference)
* insert PutDefinedSearchParam(context, MedicationDispense-context, reference)

// MedicationAdministration
* insert SetSearchParameterResourceTwo(MedicationAdministration, JP_MedicationAdministration, JP_MedicationAdministration_Injection)
* insert PutDefinedSearchParam(identifier, clinical-identifier, token)
* insert PutDefinedSearchParam(patient, clinical-patient, reference)
* insert PutDefinedSearchParam(effective-time, MedicationAdministration-effective-time, date)
* insert PutDefinedSearchParam(code, clinical-code, token)
* insert PutDefinedSearchParam(performer, MedicationAdministration-performer, reference)
* insert PutDefinedSearchParam(request, MedicationAdministration-request, reference)

// Immunization
* insert SetSearchParameterResource(Immunization, JP_Immunization)
* insert PutDefinedSearchParam(identifier, clinical-identifier, token)
* insert PutDefinedSearchParam(patient, clinical-patient, reference)
* insert PutDefinedSearchParam(date, clinical-date, date)

// Observation
* insert SetSearchParameterType(Observation)
* insert SetSearchParameterSupportedProfile(JP_Observation_Common)
* insert SetSearchParameterSupportedProfile(JP_Observation_LabResult)
* insert SetSearchParameterSupportedProfile(JP_Observation_Microbiology)
* insert SetSearchParameterSupportedProfile(JP_Observation_VitalSigns)
* insert SetSearchParameterSupportedProfile(JP_Observation_BodyMeasurement)
* insert SetSearchParameterSupportedProfile(JP_Observation_PhysicalExam)
* insert SetSearchParameterSupportedProfile(JP_Observation_SocialHistory)
* insert SetSearchParameterInteraction
* insert PutDefinedSearchParam(identifier, clinical-identifier, token)
* insert PutDefinedSearchParam(patient, clinical-patient, reference)
* insert PutDefinedSearchParam(category, Observation-category, token)
* insert PutDefinedSearchParam(code, clinical-code, token)
* insert PutDefinedSearchParam(date, clinical-date, date)
* insert PutDefinedSearchParam(encounter, clinical-encounter, reference)
* insert PutDefinedSearchParam(value-quantity, Observation-value-quantity, quantity)
* insert PutDefinedSearchParam(value-concept, Observation-value-concept, token)
* insert PutDefinedSearchParam(value-string, Observation-value-string, string)
* insert PutDefinedSearchParam(based-on, Observation-based-on, reference)

// ImagingStudy
* insert SetSearchParameterType(ImagingStudy)
* insert SetSearchParameterSupportedProfile(JP_ImagingStudy_Radiology)
* insert SetSearchParameterSupportedProfile(JP_ImagingStudy_Endoscopy)
* insert SetSearchParameterInteraction
* insert PutDefinedSearchParam(identifier, clinical-identifier, token)
* insert PutDefinedSearchParam(patient, clinical-patient, reference)
* insert PutDefinedSearchParam(modality, ImagingStudy-modality, token)
* insert PutDefinedSearchParam(bodysite, ImagingStudy-bodysite, token)
* insert PutDefinedSearchParam(started, ImagingStudy-started, date)
* insert PutDefinedSearchParam(encounter, /ImagingStudy-encounter, reference)


// DiagnosticReport
* insert SetSearchParameterType(DiagnosticReport)
* insert SetSearchParameterSupportedProfile(JP_DiagnosticReport_Common)
* insert SetSearchParameterSupportedProfile(JP_DiagnosticReport_LabResult)
* insert SetSearchParameterSupportedProfile(JP_DiagnosticReport_Microbiology)
* insert SetSearchParameterSupportedProfile(JP_DiagnosticReport_Radiology)
* insert SetSearchParameterSupportedProfile(JP_DiagnosticReport_Endoscopy)
* insert SetSearchParameterInteraction
* insert PutDefinedSearchParam(based-on, DiagnosticReport-based-on, reference)
* insert PutDefinedSearchParam(category, DiagnosticReport-category, token)
* insert PutDefinedSearchParam(code, clinical-code, token)
* insert PutDefinedSearchParam(conclusion, DiagnosticReport-conclusion, token)
* insert PutDefinedSearchParam(date, clinical-date, date)
* insert PutDefinedSearchParam(encounter, clinical-encounter, reference)
* insert PutDefinedSearchParam(identifier, clinical-identifier, token)
* insert PutDefinedSearchParam(issued, DiagnosticReport-issued, date)
* insert PutDefinedSearchParam(media, DiagnosticReport-media, reference)
* insert PutDefinedSearchParam(patient, clinical-patient, reference)
* insert PutDefinedSearchParam(performer, DiagnosticReport-performer, reference)
* insert PutDefinedSearchParam(result, DiagnosticReport-result, reference)
* insert PutDefinedSearchParam(results-interpreter, DiagnosticReport-results-interpreter, reference)
* insert PutDefinedSearchParam(specimen, DiagnosticReport-specimen, reference)
* insert PutDefinedSearchParam(status, DiagnosticReport-status, token)

// AllergyIntolerance
* insert SetSearchParameterResource(AllergyIntolerance, JP_AllergyIntolerance)
* insert PutDefinedSearchParam(identifier, clinical-identifier, token)
* insert PutDefinedSearchParam(patient, clinical-patient, reference)
* insert PutDefinedSearchParam(clinical-status, AllergyIntolerance-clinical-status, token)
* insert PutDefinedSearchParam(date, clinical-date, date)
* insert PutDefinedSearchParam(category, AllergyIntolerance-category, token)
* insert PutDefinedSearchParam(verification-status, AllergyIntolerance-verification-status, token)
* insert PutDefinedSearchParam(criticality, AllergyIntolerance-criticality, token)
* insert PutDefinedSearchParam(type, clinical-type, token)

// Condition
* insert SetSearchParameterResource(Condition, JP_Condition)
* insert PutDefinedSearchParam(identifier, clinical-identifier, token)
* insert PutDefinedSearchParam(patient, clinical-patient, reference)
* insert PutDefinedSearchParam(clinical-status, Condition-clinical-status, token)
* insert PutDefinedSearchParam(onset-date, Condition-onset-date, date)
* insert PutDefinedSearchParam(category, Condition-category, token)
* insert PutDefinedSearchParam(verification-status, Condition-verification-status, token)

// Procedure
* insert SetSearchParameterResource(Procedure, JP_Procedure)
* insert PutDefinedSearchParam(identifier, clinical-identifier, token)
* insert PutDefinedSearchParam(patient, clinical-patient, reference)
* insert PutDefinedSearchParam(date, clinical-date, date)

// FamilyMemberHistory
* insert SetSearchParameterResource(FamilyMemberHistory, JP_FamilyMemberHistory)
* insert PutDefinedSearchParam(identifier, clinical-identifier, token)
* insert PutDefinedSearchParam(patient, clinical-patient, reference)
* insert PutDefinedSearchParam(status, FamilyMemberHistory-status, token)
* insert PutDefinedSearchParam(relationship, FamilyMemberHistory-relationship, token)

// // 
// * insert SetSearchParameterResource(, )
// * insert PutDefinedSearchParam(, , )
// * insert PutDefinedSearchParam(, , )
// * insert PutDefinedSearchParam(, , )
// * insert PutDefinedSearchParam(, , )
// * insert PutDefinedSearchParam(, , )
// * insert PutDefinedSearchParam(, , )
// * insert PutDefinedSearchParam(, , )
// * insert PutDefinedSearchParam(, , )
// * insert PutDefinedSearchParam(, , )
// * insert PutDefinedSearchParam(, , )
// * insert PutDefinedSearchParam(, , )
// * insert PutDefinedSearchParam(, , )

* rest.interaction[0].code = #transaction
* rest.interaction[+].code = #batch
* rest.interaction[+].code = #search-system
* rest.interaction[+].code = #history-system