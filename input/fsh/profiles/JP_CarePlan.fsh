Profile: JP_CarePlan
Parent: CarePlan
Id: jp-careplan
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_CarePlan"
* ^status = #draft
* basedOn only Reference(JP_CarePlan)
* replaces only Reference(JP_CarePlan)
* partOf only Reference(JP_CarePlan)
* subject only Reference(JP_Patient)
* encounter only Reference(JP_Encounter)
* author only Reference(Device or RelatedPerson or CareTeam or JP_Patient or JP_Practitioner or JP_PractitionerRole or JP_Organization)
* contributor only Reference(Device or RelatedPerson or CareTeam or JP_Patient or JP_Practitioner or JP_PractitionerRole or JP_Organization)
* addresses only Reference(JP_Condition)
* activity.reference only Reference(Appointment or CommunicationRequest or DeviceRequest or NutritionOrder or Task or ServiceRequest or VisionPrescription or RequestGroup or JP_MedicationRequest)
* activity.detail.reasonReference only Reference(DocumentReference or JP_Condition or JP_Observation_Common or JP_DiagnosticReport_Common)
* activity.detail.performer only Reference(RelatedPerson or CareTeam or HealthcareService or Device or JP_Practitioner or JP_PractitionerRole or JP_Organization or JP_Patient)
* activity.detail.product[x] only CodeableConcept or Reference(Substance or JP_Medication)