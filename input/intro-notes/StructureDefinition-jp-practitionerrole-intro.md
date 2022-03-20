<span style="color: ;">医療者が組織で一定期間担当する可能性のある特定の役割/場所/専門分野/サービスのセット。</span>
<br/>
本プロファイルは、PractitionerRoleリソースが医療者の役割を記録、検索、および取得するための最小の期待値を設定する。 これは、このプロファイルを使用するときにPractitionerRoleリソースに存在する必要がある必須のコア要素、拡張機能、語彙、および値セットを識別する。



## 背景および想定シナリオ

本プロファイルは、以下のようなユースケースを想定している。

- 医療者の臨床専門分野による医療者役割の検索

- 他のリソースからの医療者役割の参照（例：Encounterリソースのparticipantで参照される患者の関係者の医療者役割）


## スコープ

医療者役割は、医療者が組織に提供できるサービスの場所と種類の記録をカバーする。

医療者役割の他のインスタンスで必要に応じて、ロール、スペシャリティ、ロケーションテレコム、およびHealthcareServiceプロパティを繰り返すことができる。 単一の場所のサービス値のコレクションを記録するシステムもあれば、単一のサービスとそれが利用可能な場所のリストを記録するシステムもある。 どちらも、このデータを表すための許容可能なオプションである。可用性、通信、またはその他の詳細がすべてのヘルスケアサービス間で同じではない場合、または場所ごとに個別の医療者役割インスタンスを作成する必要がある。


## 関連するプロファイル


JP PractitionerRole リソースは、以下のリソースから直接参照される。

- Signature, Account, AdverseEvent, AllergyIntolerance, Appointment, AppointmentResponse, AuditEvent, Basic, BiologicallyDerivedProduct, CarePlan, CareTeam, CatalogEntry, ChargeItem, Claim, ClaimResponse, ClinicalImpression, Communication, CommunicationRequest, Composition, Condition, Consent, Contract, CoverageEligibilityRequest, CoverageEligibilityResponse, DetectedIssue, DeviceRequest, DeviceUseStatement, DiagnosticReport, DocumentManifest, DocumentReference, Encounter, EnrollmentRequest, EnrollmentResponse, EpisodeOfCare, ExplanationOfBenefit, Flag, Goal, Group, ImagingStudy, Immunization, Invoice, Linkage, List, MeasureReport, Media, MedicationAdministration, MedicationDispense, MedicationRequest, MedicationStatement, MedicinalProduct, MessageHeader, NutritionOrder, Observation, Patient, PaymentNotice, PaymentReconciliation, Procedure, Provenance, QuestionnaireResponse, RequestGroup, ResearchStudy, RiskAssessment, Schedule, ServiceRequest, Specimen, SupplyDelivery, SupplyRequest, Task, VerificationResult and VisionPrescription

JP Core PractitionerRole リソースは、以下のリソースを直接参照する。

- Practitioner, Organization, Location, HealthcareService and Endpoint

## プロファイル定義