<span style="color:;">患者のケアやその他の健康関連サービスを受けている個人または動物に関する人口統計およびその他の管理情報。</span>

## スコープ

本リソースは、以下を含む幅広い健康関連活動に関与する患者と動物に関するデータをカバーしている。

- 治療
- 精神科医療
- 社会福祉
- 妊娠ケア
- 看護と生活支援
- 健康サービス
- 個人の健康と運動データの追跡

本リソースのデータは、患者個人に関する情報をカバーしている。その属性は、管理、財務、およびロジスティックな手続きをサポートするために必要な人口統計学的情報に焦点を当てている。患者の記録は、通常、患者のケアを行う各組織によって作成・維持される。従って、複数の組織で治療を受けている患者又は動物は、その情報を複数のPatientリソースに存在させることができる。

全ての概念が基本リソースに含まれているわけではないが(人種、民族、臓器提供の有無、国籍等)、特定の法域のために定義されたプロファイルや標準的な拡張機能に含まれている場合がある。このようなフィールドは、法域によって大きく異なり、似たような概念でも名前や値セットが異なることが多いのですが、マッピングや交換ができるほど似ているわけではない。

本プロファイルは、患者に関する情報の登録や検索、取得のために 、FHIR Patientリソースを使用するにあたっての、最低限の制約を記述したものである。Patientリソースに対して本プロファイルに準拠する場合に必須となる要素や、サポートすべき拡張、用語、検索パラメータを定義する。

## 背景および想定シナリオ

本プロファイルは、以下のようなユースケースを想定している。

- 氏名などの患者情報による患者基本情報の検索

- 他のリソースからの患者基本情報の参照

## 関連するプロファイル


JP Patientリソースは、以下のリソースから直接参照される。

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
 - BodyStructure
 - CarePlan
 - CareTeam
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
 - Coverage
 - CoverageEligibilityRequest
 - CoverageEligibilityResponse
 - DetectedIssue
 - Device
 - DeviceRequest
 - DeviceUseStatement
 - DiagnosticReport
 - DocumentManifest
 - DocumentReference
 - Encounter
 - EnrollmentRequest
 - EpisodeOfCare
 - ExplanationOfBenefit
 - FamilyMemberHistory
 - Flag
 - Goal
 - Group
 - GuidanceResponse
 - ImagingStudy
 - Immunization
 - ImmunizationEvaluation
 - ImmunizationRecommendation
 - Invoice
 - List
 - MeasureReport
 - Media
 - MedicationAdministration
 - MedicationDispense
 - MedicationRequest
 - MedicationStatement
 - MolecularSequence
 - NutritionOrder
 - Observation
 - itself
 - Person
 - Procedure
 - Provenance
 - QuestionnaireResponse
 - RelatedPerson
 - RequestGroup
 - ResearchSubject
 - RiskAssessment
 - Schedule
 - ServiceRequest
 - Specimen
 - SupplyDelivery
 - SupplyRequest
 - Task
 - VisionPrescription

JP Patient リソースは、以下のリソースを直接参照する。
- Patient
- Organization
- Practitioner
- PractitionerRole
- RelatedPerson

## プロファイル定義
