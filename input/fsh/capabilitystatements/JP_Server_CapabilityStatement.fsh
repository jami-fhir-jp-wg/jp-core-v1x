Instance: jp-server-capabilitystatement
InstanceOf: CapabilityStatement
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/CapabilityStatement/JP_Server_CapabilityStatement"
* name = "JP_Server_CapabilityStatement"
* title = "JP Core Server CapabilityStatement"
* status = #active
* experimental = false
* date = "2023-10-31"
* description = "JP Core実装ガイドを利用したサイトを作成する際にサーバ側で規定するCapabilityStatementのOperationsおよびSearch Parametersのリスト例を提示する。JP Core ServerがサポートするFHIRプロファイルに限定しているため、FHIR Baseのプロファイルを利用する際などは必要な項目を追記すること。"
* kind = #requirements
* instantiates = "http://jpfhir.jp/fhir/core/CapabilityStatement/JP_Server_CapabilityStatement"
* fhirVersion = #4.0.1
* format[0] = #xml
* format[+] = #json
* rest.mode = #server

// Patient
* insert SetSearchParameterResource(Patient, JP_Patient)
* rest.resource[=].operation.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].operation.extension.valueCode = #SHOULD
* rest.resource[=].operation.name = "everything"
* rest.resource[=].operation.definition = "http://hl7.org/fhir/OperationDefinition/Patient-everything"
* rest.resource[=].operation.documentation = "この操作が呼び出された場合、すべての患者の、あるいは指定された特定の[id]をもつPatientに関連した全てのリソースを返す。"
* insert PutCombination2(SHOULD, birthdate, name)
* insert PutCombination2(SHOULD, birthdate, gender)
* insert PutCombination3(SHOULD, birthdate, name, gender)
* insert PutCombination2(SHOULD, name, phone)
* insert PutCombination2(SHOULD, name, address-postalcode)
* insert PutCombination6(MAY, family, given, birthdate, gender, phone, address-postalcode)
* insert PutDefinedSearchParam(SHALL, identifier, Patient-identifier, token)
* insert PutDefinedSearchParam(SHOULD, name, Patient-name, string)
* insert PutDefinedSearchParam(MAY, family, individual-family, string)
* insert PutDefinedSearchParam(MAY, given, individual-given, string)
* insert PutDefinedSearchParam(MAY, birthdate, individual-birthdate, date)
* insert PutDefinedSearchParam(MAY, gender, individual-gender, token)
* insert PutDefinedSearchParam(MAY, phone, individual-phone, token)
* insert PutDefinedSearchParam(MAY, address-postalcode, individual-address-postalcode, string)

// Coverage
* insert SetSearchParameterResource(Coverage, JP_Coverage)
* insert PutDefinedSearchParam(SHALL, beneficiary, Coverage-beneficiary, reference)
* insert PutDefinedSearchParam(SHOULD, class-type, Coverage-class-type, token)
* insert PutDefinedSearchParam(SHOULD, class-value, Coverage-class-value, string)
* insert PutDefinedSearchParam(SHOULD, dependent, Coverage-dependent, string)
* insert PutDefinedSearchParam(SHOULD, identifier, Coverage-identifier, token)
* insert PutDefinedSearchParam(SHOULD, patient, Coverage-patient, reference)
* insert PutDefinedSearchParam(SHOULD, payor, Coverage-payor, reference)
* insert PutDefinedSearchParam(SHOULD, policy-holder, Coverage-policy-holder, reference)
* insert PutDefinedSearchParam(SHOULD, status, Coverage-status, token)
* insert PutDefinedSearchParam(SHOULD, subscriber, Coverage-subscriber, reference)
* insert PutDefinedSearchParam(SHOULD, type, Coverage-type, token)

// Encounter
* insert SetSearchParameterResource(Encounter, JP_Encounter)
* rest.resource[=].operation.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].operation.extension.valueCode = #SHOULD
* rest.resource[=].operation.name = "everything"
* rest.resource[=].operation.definition = "http://hl7.org/fhir/OperationDefinition/Encounter-everything"
* rest.resource[=].operation.documentation = "この操作は、この操作が呼び出された特定のEncounterリソースに関連する全ての情報を返す。"
* insert PutCombination2(SHOULD, date, patient)
* insert PutCombination2(SHOULD, class, patient)
* insert PutCombination2(SHOULD, patient, type)
* insert PutCombination2(SHOULD, patient, status)
* insert PutDefinedSearchParam(SHALL, identifier, clinical-identifier, token)
* insert PutDefinedSearchParam(SHOULD, patient, clinical-patient, reference)
* insert PutDefinedSearchParam(MAY, class, Encounter-class, token)
* insert PutDefinedSearchParam(MAY, date, clinical-date, date)
* insert PutDefinedSearchParam(MAY, status, Encounter-status, token)
* insert PutDefinedSearchParam(MAY, type, clinical-type, token)

// Location
* insert SetSearchParameterResource(Location, JP_Location)
* insert PutDefinedSearchParam(SHALL, identifier, Location-identifier, token)
* insert PutDefinedSearchParam(SHALL, name, Location-name, string)
* insert PutDefinedSearchParam(SHOULD, address, Location-address, string)
* insert PutDefinedSearchParam(SHOULD, address-city, Location-address-city, string)
* insert PutDefinedSearchParam(SHOULD, address-state, Location-address-state, string)
* insert PutDefinedSearchParam(SHOULD, address-postalcode, Location-address-postalcode, string)

// Organization
* insert SetSearchParameterResource(Organization, JP_Organization)
* insert PutDefinedSearchParam(SHALL, identifier, Organization-identifier, token)
* insert PutDefinedSearchParam(SHOULD, name, Organization-name, string)
* insert PutDefinedSearchParam(SHOULD, address, Organization-address, string)

// Practitioner
* insert SetSearchParameterResource(Practitioner, JP_Practitioner)
* insert PutDefinedSearchParam(SHALL, identifier, Practitioner-identifier, token)
* insert PutDefinedSearchParam(SHALL, name, Practitioner-name, string)

// PractitionerRole
* insert SetSearchParameterResource(PractitionerRole, JP_PractitionerRole)
* insert PutDefinedSearchParam(SHALL, identifier, PractitionerRole-identifier, token)
* insert PutDefinedSearchParam(SHOULD, specialty, PractitionerRole-specialty, token)
* insert PutDefinedSearchParam(SHOULD, practitioner, PractitionerRole-practitioner, reference)

// Medication
* insert SetSearchParameterResource(Medication, JP_Medication)
* insert PutDefinedSearchParam(SHALL, identifier, Medication-identifier, token)

// MedicationRequest
* insert SetSearchParameterResourceTwo(MedicationRequest, JP_MedicationRequest, JP_MedicationRequest_Injection)
* insert PutCombination2(SHOULD, patient, date)
* insert PutCombination2(SHOULD, patient, authoredon)
* insert PutCombination2(SHOULD, patient, jp-medication-start)
* insert PutCombination5(MAY, date, authoredon, category, code, requester)
* insert PutDefinedSearchParam(SHALL, identifier, clinical-identifier, token)
* insert PutDefinedSearchParam(SHOULD, patient, clinical-patient, reference)
* insert PutDefinedSearchParam(MAY, authoredon, MedicationRequest-authoredon, date)
* insert PutDefinedSearchParam(MAY, date, medications-date, date)
* insert PutDefinedSearchParam(MAY, category, MedicationRequest-category, token)
* insert PutDefinedSearchParam(MAY, code, clinical-code, token)
* insert PutDefinedSearchParam(MAY, requester, MedicationRequest-requester, reference)
* insert PutSearchParam(MAY, jp-medication-start, http://jpfhir.jp/fhir/core/SearchParameter/JP_MedicationRequest_Start_SP, date)

// MedicationDispense
* insert SetSearchParameterResourceTwo(MedicationDispense, JP_MedicationDispense, JP_MedicationDispense_Injection)
* insert PutCombination2(SHOULD, patient, whenhandedover)
* insert PutCombination5(MAY, whenhandedover, whenprepared, context, code, performer)
* insert PutDefinedSearchParam(SHALL, identifier, clinical-identifier, token)
* insert PutDefinedSearchParam(SHOULD, patient, clinical-patient, reference)
* insert PutDefinedSearchParam(MAY, whenhandedover, MedicationDispense-whenhandedover, date)
* insert PutDefinedSearchParam(MAY, whenprepared, MedicationDispense-whenprepared, date)
* insert PutDefinedSearchParam(MAY, code, clinical-code, token)
* insert PutDefinedSearchParam(MAY, performer, MedicationDispense-performer, reference)
* insert PutDefinedSearchParam(MAY, context, MedicationDispense-context, reference)

// MedicationAdministration
* insert SetSearchParameterResourceTwo(MedicationAdministration, JP_MedicationAdministration, JP_MedicationAdministration_Injection)
* insert PutCombination2(SHOULD, patient, effective-time)
* insert PutCombination4(MAY, effective-time, code, performer, request)
* insert PutDefinedSearchParam(SHALL, identifier, clinical-identifier, token)
* insert PutDefinedSearchParam(SHOULD, patient, clinical-patient, reference)
* insert PutDefinedSearchParam(MAY, effective-time, MedicationAdministration-effective-time, date)
* insert PutDefinedSearchParam(MAY, code, clinical-code, token)
* insert PutDefinedSearchParam(MAY, performer, MedicationAdministration-performer, reference)
* insert PutDefinedSearchParam(MAY, request, MedicationAdministration-request, reference)

// Immunization
* insert SetSearchParameterResource(Immunization, JP_Immunization)
* insert PutCombination2(SHOULD, patient, date)
* insert PutCombination2(MAY, date, lot-number)
* insert PutDefinedSearchParam(SHALL, identifier, clinical-identifier, token)
* insert PutDefinedSearchParam(SHOULD, patient, clinical-patient, reference)
* insert PutDefinedSearchParam(MAY, date, clinical-date, date)

// Observation
//TODO: 要確認commonにすべてを記述すべきでは。
* insert SetSearchParameterType(Observation)
* rest.resource[=].operation.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].operation.extension.valueCode = #SHOULD
* rest.resource[=].operation.name = "lastn"
* rest.resource[=].operation.definition = "http://hl7.org/fhir/OperationDefinition/Observation-lastn"
* rest.resource[=].operation.documentation = "オペレーションはある条件に基づく最新、または最新からn件の検査結果/測定結果等を取得するという一般的なニーズを満たすためのオペレーションである。"
* insert SetSearchParameterSupportedProfile(JP_Observation_Common)
* insert SetSearchParameterSupportedProfile(JP_Observation_LabResult)
* insert SetSearchParameterSupportedProfile(JP_Observation_Microbiology)
* insert SetSearchParameterSupportedProfile(JP_Observation_VitalSigns)
* insert SetSearchParameterSupportedProfile(JP_Observation_BodyMeasurement)
* insert SetSearchParameterSupportedProfile(JP_Observation_PhysicalExam)
* insert SetSearchParameterSupportedProfile(JP_Observation_SocialHistory)
* insert PutCombination4(SHOULD, patient, code, date, based-on)
* insert PutCombination5(SHOULD, patient, code, date, value-quantity, based-on)
* insert PutCombination5(SHOULD, patient, code, date, value-concept, based-on)
* insert PutCombination5(SHOULD, patient, code, date, value-string, based-on)
* insert PutCombination3(SHOULD, code, value-quantity, patient)
* insert PutCombination3(SHOULD, code, value-concept, patient)
* insert PutCombination3(SHOULD, code, value-string, patient)
* insert PutCombination4(MAY, patient, category, code, value-quantity)
* insert PutCombination5(MAY, patient, category, code, value-quantity, date)
* insert PutCombination5(MAY, patient, category, code, value-quantity, encounter)
* insert SetSearchParameterInteraction
* insert PutDefinedSearchParam(SHALL, identifier, clinical-identifier, token)
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
//TODO: RadiologyとEndoscopeの見分け方が不明
* insert SetSearchParameterType(ImagingStudy)
* insert SetSearchParameterSupportedProfile(JP_ImagingStudy_Radiology)
* insert SetSearchParameterSupportedProfile(JP_ImagingStudy_Endoscopy)
* insert PutCombination2(SHOULD, patient, modality)
* insert PutCombination2(SHOULD, patient, bodysite)
* insert PutCombination2(SHOULD, patient, started)
* insert PutCombination3(SHOULD, patient, started, modality)
* insert PutCombination4(SHOULD, patient, started, modality, bodysite)
* insert SetSearchParameterInteraction
* insert PutDefinedSearchParam(SHOULD, identifier, clinical-identifier, token)
* insert PutDefinedSearchParam(SHOULD, patient, clinical-patient, reference)
* insert PutDefinedSearchParam(SHOULD, encounter, ImagingStudy-encounter, reference)
* insert PutDefinedSearchParam(MAY, modality, ImagingStudy-modality, token)
* insert PutDefinedSearchParam(MAY, bodysite, ImagingStudy-bodysite, token)
* insert PutDefinedSearchParam(MAY, started, ImagingStudy-started, date)

// DiagnosticReport
* insert SetSearchParameterType(DiagnosticReport)
* insert SetSearchParameterSupportedProfile(JP_DiagnosticReport_Common)
* insert SetSearchParameterSupportedProfile(JP_DiagnosticReport_LabResult)
* insert SetSearchParameterSupportedProfile(JP_DiagnosticReport_Microbiology)
* insert SetSearchParameterSupportedProfile(JP_DiagnosticReport_Radiology)
* insert SetSearchParameterSupportedProfile(JP_DiagnosticReport_Endoscopy)
* insert PutCombination2(SHOULD, patient, category)
* insert PutCombination3(SHOULD, patient, category, based-on)
* insert PutCombination3(SHOULD, patient, category, date)
* insert SetSearchParameterInteraction
* insert PutDefinedSearchParam(SHALL, identifier, clinical-identifier, token)
* insert PutDefinedSearchParam(SHOULD, category, DiagnosticReport-category, token)
* insert PutDefinedSearchParam(SHOULD, code, clinical-code, token)
* insert PutDefinedSearchParam(SHOULD, date, clinical-date, date)
* insert PutDefinedSearchParam(SHOULD, issued, DiagnosticReport-issued, date)
* insert PutDefinedSearchParam(SHOULD, patient, clinical-patient, reference)
* insert PutDefinedSearchParam(SHOULD, performer, DiagnosticReport-performer, reference)
* insert PutDefinedSearchParam(SHOULD, status, DiagnosticReport-status, token)
* insert PutDefinedSearchParam(MAY, based-on, DiagnosticReport-based-on, reference)
* insert PutDefinedSearchParam(MAY, conclusion, DiagnosticReport-conclusion, token)
* insert PutDefinedSearchParam(MAY, encounter, clinical-encounter, reference)
* insert PutDefinedSearchParam(MAY, media, DiagnosticReport-media, reference)
* insert PutDefinedSearchParam(MAY, result, DiagnosticReport-result, reference)
* insert PutDefinedSearchParam(MAY, results-interpreter, DiagnosticReport-results-interpreter, reference)
* insert PutDefinedSearchParam(MAY, specimen, DiagnosticReport-specimen, reference)

// AllergyIntolerance
* insert SetSearchParameterResource(AllergyIntolerance, JP_AllergyIntolerance)
* insert PutCombination2(MAY, patient, date)
* insert PutCombination2(MAY, patient, clinical-status)
* insert PutCombination2(MAY, patient, verification-status)
* insert PutCombination2(MAY, patient, type)
* insert PutCombination2(MAY, patient, category)
* insert PutCombination2(MAY, patient, criticality)
* insert PutDefinedSearchParam(SHALL, identifier, clinical-identifier, token)
* insert PutDefinedSearchParam(SHOULD, patient, clinical-patient, reference)
* insert PutDefinedSearchParam(MAY, clinical-status, AllergyIntolerance-clinical-status, token)
* insert PutDefinedSearchParam(MAY, date, clinical-date, date)
* insert PutDefinedSearchParam(MAY, category, AllergyIntolerance-category, token)
* insert PutDefinedSearchParam(MAY, verification-status, AllergyIntolerance-verification-status, token)
* insert PutDefinedSearchParam(MAY, criticality, AllergyIntolerance-criticality, token)
* insert PutDefinedSearchParam(MAY, type, clinical-type, token)

// Condition
* insert SetSearchParameterResource(Condition, JP_Condition)
* insert PutCombination2(MAY, patient, onset-date)
* insert PutCombination2(MAY, patient, clinical-status)
* insert PutCombination2(MAY, patient, verification-status)
* insert PutCombination2(MAY, patient, category)
* insert PutDefinedSearchParam(SHALL, identifier, clinical-identifier, token)
* insert PutDefinedSearchParam(SHOULD, patient, clinical-patient, reference)
* insert PutDefinedSearchParam(MAY, clinical-status, Condition-clinical-status, token)
* insert PutDefinedSearchParam(MAY, onset-date, Condition-onset-date, date)
* insert PutDefinedSearchParam(MAY, category, Condition-category, token)
* insert PutDefinedSearchParam(MAY, verification-status, Condition-verification-status, token)

// Procedure
* insert SetSearchParameterResource(Procedure, JP_Procedure)
* insert PutCombination2(MAY, patient, date)
* insert PutDefinedSearchParam(SHALL, identifier, clinical-identifier, token)
* insert PutDefinedSearchParam(SHOULD, patient, clinical-patient, reference)
* insert PutDefinedSearchParam(MAY, date, clinical-date, date)

// FamilyMemberHistory
* insert SetSearchParameterResource(FamilyMemberHistory, JP_FamilyMemberHistory)
* insert PutCombination2(MAY, patient, relationship)
* insert PutCombination2(MAY, patient, status)
* insert PutDefinedSearchParam(SHALL, identifier, clinical-identifier, token)
* insert PutDefinedSearchParam(SHOULD, patient, clinical-patient, reference)
* insert PutDefinedSearchParam(MAY, status, FamilyMemberHistory-status, token)
* insert PutDefinedSearchParam(MAY, relationship, FamilyMemberHistory-relationship, token)

* rest.interaction[0].code = #transaction
* rest.interaction[+].code = #batch
* rest.interaction[+].code = #search-system
* rest.interaction[+].code = #history-system