<br/>
本プロファイルは、医療従事者に関する情報の登録や検索、取得のために 、FHIR Practitioner リソースを使用するにあたっての、最低限の制約を記述したものである。Practitioner リソースに対して本プロファイルに準拠する場合に必須となる要素や、サポートすべき拡張、用語、検索パラメータを定義する。

## 背景および想定シナリオ

本プロファイルは、以下のようなユースケースを想定している。

- 氏名または医籍登録番号による医療従事者の検索

- 他のリソースからの医療従事者情報の参照（例：Patientリソースの generalPractitionerで参照される患者の主治医や、Encounterリソースのparticipantで参照される診察の担当医）


## スコープ

医療（ヘルスケア）の提供、及び、ヘルスケア関連サービスに、直接的、または、間接的に係わる全ての人を表す。本リソースに含まれる医療従事者の例を示す（ただし、この一覧に限定されない）。

- 医師、歯科医師、薬剤師
- 看護師、保健師、医療クラーク
- 助産師、栄養士、心理士
- 臨床検査技師、放射線技師
- 臨床工学技士、義肢装具士
- 医療事務者（受付担当者）

本リソースは、友人や親戚、隣人のケアをする個人のように、正式な責任を持たずに医療に関与する個人を表現するために使用してはならない。それらの情報は、患者の関係者として RelatedPerson リソースを使用して表現されるべきである。

Practitioner リソースは、ヘルスケアサービスの提供組織を代表し、複数の患者のために行動する個人に対して使用される。一方で、RelatedPerson リソースは、特定の組織に関連づけられておらず、特定の患者に関係する個人を表現するために使用される。

PractitionerRole リソースは、医療従事者が、特定の組織において与えられている役割の詳細を表す。特定の施設に関係しない資格や識別子（例：医籍番号や麻薬施用者免許証番号）は、Practitioner リソースに記録することが望ましい。一方で、特定の施設における医療従事者の識別子や役割（例：特定の医療機関における医療従事者ID）は、施設を表すOrganizationリソースとあわせて PractitionerRole リソースに記録することが望ましい。



## 関連するプロファイル


JP Practitioner リソースは、以下のリソースから直接参照される。

 - Annotation
 - Signature
 - Account
 - AdverseEvent
 - AllergyIntolerance
 - Appointment
 - AppointmentResponse
 - AuditEvent
 - Basic
 - BiologicallyDerivedProduct
 - CarePlan
 - CareTeam
 - CatalogEntry
 - ChargeItem
 - Claim
 - ClaimResponse
 - ClinicalImpression
 - Communication
 - CommunicationRequest
 - Composition
 - Condition
 - Consent
 - Contract
 - CoverageEligibilityRequest
 - CoverageEligibilityResponse
 - DetectedIssue
 - DeviceRequest
 - DeviceUseStatement
 - DiagnosticReport
 - DocumentManifest
 - DocumentReference
 - Encounter
 - EnrollmentRequest
 - EnrollmentResponse
 - EpisodeOfCare
 - ExplanationOfBenefit
 - Flag
 - Goal
 - Group
 - ImagingStudy
 - Immunization
 - Invoice
 - Linkage
 - List
 - MeasureReport
 - Media
 - MedicationAdministration
 - MedicationDispense
 - MedicationRequest
 - MedicationStatement
 - MessageHeader
 - NutritionOrder
 - Observation
 - Patient
 - PaymentNotice
 - PaymentReconciliation
 - Person
 - PractitionerRole
 - Procedure
 - Provenance
 - QuestionnaireResponse
 - RequestGroup
 - ResearchStudy
 - RiskAssessment
 - Schedule
 - ServiceRequest
 - Specimen
 - SupplyDelivery
 - SupplyRequest
 - Task
 - VerificationResult
 - VisionPrescription

JP Practitioner リソースは、以下のリソースを直接参照する。

- Organization 

## プロファイル定義