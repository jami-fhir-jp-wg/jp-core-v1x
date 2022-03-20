本プロファイルは、患者、プロバイダー、または組織に関連付けられたロケーションを記録、検索、およびフェッチするために 、FHIR Location リソースを使用するにあたっての、最低限の制約を記述したものである。Location リソースに対して本プロファイルに準拠する場合に必須となる要素や、サポートすべき拡張、用語、検索パラメータを定義する。

## 背景および想定シナリオ

本プロファイルは、以下のようなユースケースを想定している。

- 所在場所名または所在場所の住所による所在場所の検索

- 他のリソースからの所在場所の参照（例：Encounterリソースのhospitalizationで参照される患者の入院前や退院後の所在場所）


## スコープ

所在場所には、偶発的な場所（事前の指定や許可なしに医療に使用される場所）と、正式に指定された専用の場所の両方が含まれる。場所は、プライベート、パブリック、モバイル、または固定であり、小さな冷凍庫から完全な病院の建物または駐車場までの規模になる。本リソースに含まれる所在場所の例を示す（ただし、この一覧に限定されない）。

- 建物、病棟、廊下、部屋またはベッド
- モバイルクリニック
- 冷凍庫、インキュベーター
- 車両またはリフト
- 家、小屋、またはガレージ
- 道路、駐車場、公園
- 救急車（ジェネリック）
- 救急車（特定）
- 患者の家（一般）
- 管轄

これらの所在場所は、何かが発生した患者の所在場所（骨折した部位、例えば足）をカバーすることを目的としていないが、患者が足を骨折した場所（例えば、遊び場）をカバーすることができる。


## 関連するプロファイル

<span style="color: red;">★★コメント ： 各JP リソースの参照個所に、JP版リソースが追加されることを前提としています。★★</span>



JP Location リソースは、以下のリソースから直接参照される。

- UsageContext, Account, ActivityDefinition, AdverseEvent, Appointment, AppointmentResponse, AuditEvent, CarePlan, Claim, ClaimResponse, Contract, CoverageEligibilityRequest, Device, DeviceRequest, DiagnosticReport, Encounter, ExplanationOfBenefit, Flag, HealthcareService, ImagingStudy, Immunization, InsurancePlan, List, itself, MeasureReport, Media, MedicationDispense, Observation, OrganizationAffiliation, PractitionerRole, Procedure, Provenance, ResearchStudy, Schedule, ServiceRequest, Specimen, SupplyDelivery, SupplyRequest and Task


JP Core Location リソースは、以下のリソースを直接参照する。

- Organization, Location and Endpoint


## プロファイル定義