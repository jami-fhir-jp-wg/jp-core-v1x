Instance: jp-client-capabilitystatement
InstanceOf: CapabilityStatement
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/CapabilityStatement/JP_Client_CapabilityStatement"
* name = "JP_Client_CapabilityStatement"
* title = "JP Core Client CapabilityStatement"
* status = #active
* experimental = false
* date = "2023-10-31"
* description = "JP Core実装ガイドを利用したサイトを作成する際にクライアント側で規定するCapabilityStatementのOperationsおよびSearch Parametersのリスト例を提示する。JP Core ServerがサポートするFHIRプロファイルに限定しているため、FHIR Baseのプロファイルを利用する際などは必要な項目を追記すること。"
* kind = #requirements
* instantiates = "http://jpfhir.jp/fhir/core/CapabilityStatement/JP_Client_CapabilityStatement"
* fhirVersion = #4.0.1
* format[0] = #json
* format[+] = #xml
* rest.mode = #client

// Patient
* insert SetSearchParameterResource(Patient, JP_Patient)
* insert PutDefinedSearchParam(MAY, identifier, Patient-identifier, token)
* insert PutDefinedSearchParam(MAY, name, Patient-name, string)
* insert PutDefinedSearchParam(MAY, family, individual-family, string)
* insert PutDefinedSearchParam(MAY, given, individual-given, string)
* insert PutDefinedSearchParam(MAY, birthdate, individual-birthdate, date)
* insert PutDefinedSearchParam(MAY, gender, individual-gender, token)
* insert PutDefinedSearchParam(MAY, phone, individual-phone, token)
* insert PutDefinedSearchParam(MAY, address-postalcode, individual-address-postalcode, string)

// Coverage
* insert SetSearchParameterResource(Coverage, JP_Coverage)
* insert PutDefinedSearchParam(MAY, beneficiary, Coverage-beneficiary, reference)
* insert PutDefinedSearchParam(MAY, class-type, Coverage-class-type, token)
* insert PutDefinedSearchParam(MAY, class-value, Coverage-class-value, string)
* insert PutDefinedSearchParam(MAY, dependent, Coverage-dependent, string)
* insert PutDefinedSearchParam(MAY, identifier, Coverage-identifier, token)
* insert PutDefinedSearchParam(MAY, patient, Coverage-patient, reference)
* insert PutDefinedSearchParam(MAY, payor, Coverage-payor, reference)
* insert PutDefinedSearchParam(MAY, policy-holder, Coverage-policy-holder, reference)
* insert PutDefinedSearchParam(MAY, status, Coverage-status, token)
* insert PutDefinedSearchParam(MAY, subscriber, Coverage-subscriber, reference)
* insert PutDefinedSearchParam(MAY, type, Coverage-type, token)

// Encounter
* insert SetSearchParameterResource(Encounter, JP_Encounter)
* insert PutDefinedSearchParam(MAY, patient, clinical-patient, reference)
* insert PutDefinedSearchParam(MAY, identifier, clinical-identifier, token)
* insert PutDefinedSearchParam(MAY, class, Encounter-class, token)
* insert PutDefinedSearchParam(MAY, date, clinical-date, date)
* insert PutDefinedSearchParam(MAY, status, Encounter-status, token)
* insert PutDefinedSearchParam(MAY, type, clinical-type, token)

// Location
* insert SetSearchParameterResource(Location, JP_Location)
* insert PutDefinedSearchParam(MAY, identifier, Location-identifier, token)
* insert PutDefinedSearchParam(MAY, name, Location-name, string)
* insert PutDefinedSearchParam(MAY, address, Location-address, string)
* insert PutDefinedSearchParam(MAY, address-city, Location-address-city, string)
* insert PutDefinedSearchParam(MAY, address-state, Location-address-state, string)
* insert PutDefinedSearchParam(MAY, address-postalcode, Location-address-postalcode, string)

// Organization
* insert SetSearchParameterResource(Organization, JP_Organization)
* insert PutDefinedSearchParam(MAY, identifier, Organization-identifier, token)
* insert PutDefinedSearchParam(MAY, name, Organization-name, string)
* insert PutDefinedSearchParam(MAY, address, Organization-address, string)

// Practitioner
* insert SetSearchParameterResource(Practitioner, JP_Practitioner)
* insert PutDefinedSearchParam(MAY, identifier, Practitioner-identifier, token)
* insert PutDefinedSearchParam(MAY, name, Practitioner-name, string)

// PractitionerRole
* insert SetSearchParameterResource(PractitionerRole, JP_PractitionerRole)
* insert PutDefinedSearchParam(MAY, identifier, PractitionerRole-identifier, token)
* insert PutDefinedSearchParam(MAY, specialty, PractitionerRole-specialty, token)
* insert PutDefinedSearchParam(MAY, practitioner, PractitionerRole-practitioner, reference)

// Medication
* insert SetSearchParameterResource(Medication, JP_Medication)
* insert PutDefinedSearchParam(MAY, identifier, Medication-identifier, token)

// MedicationRequest
* insert SetSearchParameterResourceTwo(MedicationRequest, JP_MedicationRequest, JP_MedicationRequest_Injection)
* insert PutDefinedSearchParam(MAY, identifier, clinical-identifier, token)
* insert PutDefinedSearchParam(MAY, patient, clinical-patient, reference)
* insert PutDefinedSearchParam(MAY, authoredon, MedicationRequest-authoredon, date)
* insert PutDefinedSearchParam(MAY, date, medications-date, date)
* insert PutDefinedSearchParam(MAY, category, MedicationRequest-category, token)
* insert PutDefinedSearchParam(MAY, code, clinical-code, token)
* insert PutDefinedSearchParam(MAY, requester, MedicationRequest-requester, reference)
* insert PutSearchParam(MAY, jp-medication-start, http://jpfhir.jp/fhir/core/SearchParameter/JP_MedicationRequest_Start_SP, date)

// MedicationDispense
* insert SetSearchParameterResourceTwo(MedicationDispense, JP_MedicationDispense, JP_MedicationDispense_Injection)
* insert PutDefinedSearchParam(MAY, identifier, clinical-identifier, token)
* insert PutDefinedSearchParam(MAY, patient, clinical-patient, reference)
* insert PutDefinedSearchParam(MAY, whenhandedover, MedicationDispense-whenhandedover, date)
* insert PutDefinedSearchParam(MAY, whenprepared, MedicationDispense-whenprepared, date)
* insert PutDefinedSearchParam(MAY, code, clinical-code, token)
* insert PutDefinedSearchParam(MAY, performer, MedicationDispense-performer, reference)
* insert PutDefinedSearchParam(MAY, context, MedicationDispense-context, reference)

// MedicationAdministration
* insert SetSearchParameterResourceTwo(MedicationAdministration, JP_MedicationAdministration, JP_MedicationAdministration_Injection)
* insert PutDefinedSearchParam(MAY, identifier, clinical-identifier, token)
* insert PutDefinedSearchParam(MAY, patient, clinical-patient, reference)
* insert PutDefinedSearchParam(MAY, effective-time, MedicationAdministration-effective-time, date)
* insert PutDefinedSearchParam(MAY, code, clinical-code, token)
* insert PutDefinedSearchParam(MAY, performer, MedicationAdministration-performer, reference)
* insert PutDefinedSearchParam(MAY, request, MedicationAdministration-request, reference)

// Immunization
* insert SetSearchParameterResource(Immunization, JP_Immunization)
* insert PutDefinedSearchParam(MAY, identifier, clinical-identifier, token)
* insert PutDefinedSearchParam(MAY, patient, clinical-patient, reference)
* insert PutDefinedSearchParam(MAY, date, clinical-date, date)

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
* insert PutDefinedSearchParam(MAY, identifier, clinical-identifier, token)
* insert PutDefinedSearchParam(MAY, patient, clinical-patient, reference)
* insert PutDefinedSearchParam(MAY, category, Observation-category, token)
* insert PutDefinedSearchParam(MAY, code, clinical-code, token)
* insert PutDefinedSearchParam(MAY, date, clinical-date, date)
* insert PutDefinedSearchParam(MAY, encounter, clinical-encounter, reference)
* insert PutDefinedSearchParam(MAY, value-quantity, Observation-value-quantity, quantity)
* insert PutDefinedSearchParam(MAY, value-concept, Observation-value-concept, token)
* insert PutDefinedSearchParam(MAY, value-string, Observation-value-string, string)
* insert PutDefinedSearchParam(MAY, based-on, Observation-based-on, reference)

// ImagingStudy
* insert SetSearchParameterType(ImagingStudy)
* insert SetSearchParameterSupportedProfile(JP_ImagingStudy_Radiology)
* insert SetSearchParameterSupportedProfile(JP_ImagingStudy_Endoscopy)
* insert SetSearchParameterInteraction
* insert PutDefinedSearchParam(MAY, identifier, clinical-identifier, token)
* insert PutDefinedSearchParam(MAY, patient, clinical-patient, reference)
* insert PutDefinedSearchParam(MAY, modality, ImagingStudy-modality, token)
* insert PutDefinedSearchParam(MAY, bodysite, ImagingStudy-bodysite, token)
* insert PutDefinedSearchParam(MAY, started, ImagingStudy-started, date)
* insert PutDefinedSearchParam(MAY, encounter, ImagingStudy-encounter, reference)

// DiagnosticReport
* insert SetSearchParameterType(DiagnosticReport)
* insert SetSearchParameterSupportedProfile(JP_DiagnosticReport_Common)
* insert SetSearchParameterSupportedProfile(JP_DiagnosticReport_LabResult)
* insert SetSearchParameterSupportedProfile(JP_DiagnosticReport_Microbiology)
* insert SetSearchParameterSupportedProfile(JP_DiagnosticReport_Radiology)
* insert SetSearchParameterSupportedProfile(JP_DiagnosticReport_Endoscopy)
* insert SetSearchParameterInteraction
* insert PutDefinedSearchParam(MAY, based-on, DiagnosticReport-based-on, reference)
* insert PutDefinedSearchParam(MAY, category, DiagnosticReport-category, token)
* insert PutDefinedSearchParam(MAY, code, clinical-code, token)
* insert PutDefinedSearchParam(MAY, conclusion, DiagnosticReport-conclusion, token)
* insert PutDefinedSearchParam(MAY, date, clinical-date, date)
* insert PutDefinedSearchParam(MAY, encounter, clinical-encounter, reference)
* insert PutDefinedSearchParam(MAY, identifier, clinical-identifier, token)
* insert PutDefinedSearchParam(MAY, issued, DiagnosticReport-issued, date)
* insert PutDefinedSearchParam(MAY, media, DiagnosticReport-media, reference)
* insert PutDefinedSearchParam(MAY, patient, clinical-patient, reference)
* insert PutDefinedSearchParam(MAY, performer, DiagnosticReport-performer, reference)
* insert PutDefinedSearchParam(MAY, result, DiagnosticReport-result, reference)
* insert PutDefinedSearchParam(MAY, results-interpreter, DiagnosticReport-results-interpreter, reference)
* insert PutDefinedSearchParam(MAY, specimen, DiagnosticReport-specimen, reference)
* insert PutDefinedSearchParam(MAY, status, DiagnosticReport-status, token)

// AllergyIntolerance
* insert SetSearchParameterResource(AllergyIntolerance, JP_AllergyIntolerance)
* insert PutDefinedSearchParam(MAY, identifier, clinical-identifier, token)
* insert PutDefinedSearchParam(MAY, patient, clinical-patient, reference)
* insert PutDefinedSearchParam(MAY, clinical-status, AllergyIntolerance-clinical-status, token)
* insert PutDefinedSearchParam(MAY, date, clinical-date, date)
* insert PutDefinedSearchParam(MAY, category, AllergyIntolerance-category, token)
* insert PutDefinedSearchParam(MAY, verification-status, AllergyIntolerance-verification-status, token)
* insert PutDefinedSearchParam(MAY, criticality, AllergyIntolerance-criticality, token)
* insert PutDefinedSearchParam(MAY, type, clinical-type, token)

// Condition
* insert SetSearchParameterResource(Condition, JP_Condition)
* insert PutDefinedSearchParam(MAY, identifier, clinical-identifier, token)
* insert PutDefinedSearchParam(MAY, patient, clinical-patient, reference)
* insert PutDefinedSearchParam(MAY, clinical-status, Condition-clinical-status, token)
* insert PutDefinedSearchParam(MAY, onset-date, Condition-onset-date, date)
* insert PutDefinedSearchParam(MAY, category, Condition-category, token)
* insert PutDefinedSearchParam(MAY, verification-status, Condition-verification-status, token)

// Procedure
* insert SetSearchParameterResource(Procedure, JP_Procedure)
* insert PutDefinedSearchParam(MAY, identifier, clinical-identifier, token)
* insert PutDefinedSearchParam(MAY, patient, clinical-patient, reference)
* insert PutDefinedSearchParam(MAY, date, clinical-date, date)

// FamilyMemberHistory
* insert SetSearchParameterResource(FamilyMemberHistory, JP_FamilyMemberHistory)
* insert PutDefinedSearchParam(MAY, identifier, clinical-identifier, token)
* insert PutDefinedSearchParam(MAY, patient, clinical-patient, reference)
* insert PutDefinedSearchParam(MAY, status, FamilyMemberHistory-status, token)
* insert PutDefinedSearchParam(MAY, relationship, FamilyMemberHistory-relationship, token)


* rest.interaction[0].code = #transaction
* rest.interaction[+].code = #batch
* rest.interaction[+].code = #search-system
* rest.interaction[+].code = #history-system



// // 入力テンプレート
// * insert SetSearchParameterResource(, )
// * insert PutDefinedSearchParam(MAY, , , )
