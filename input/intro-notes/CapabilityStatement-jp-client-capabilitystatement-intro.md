<br/>
この章ではJP Core Clientの期待される機能について説明する。
JP Core Serverによってサポートされる FHIR プロファイル・RESTful操作・検索パラメータの完全なリストを定義する。  
JP Core Clientは個別のユースケースや意味的な要請に応じてこれらのリストを通じて必要なデータにアクセスすることができる。

## FHIR RESTful Capabilities
- JP Coreは以下の要件を必須とする(**SHALL**)
  - FHIR仕様に基づくRESTfulなふるまいの実装
- 以下のレスポンスクラスを返すこと
  - (Status 400): invalid parameter
  - (Status 401/4xx): unauthorized request
  - (Status 403): insufficient scope
  - (Status 404): unknown resource
  - (Status 410): deleted resource.

- 全てのJP Core interactionにおいてjson記述をサポートすること(**SHOULD**)  

- JP Coreは以下の要件を満たすべきである(**SHOULD**)
  - 各インスタンス を、FHIR meta.profile 属性の一部としてサポートされる JP Core profileとして認識すること

- JP Coreでは以下の要件を実装しても良い(**MAY**)。
  - 全てのJP Core interactionにおいてXML記述をサポートすること

- セキュリティ  
  - See the General Security Considerations section for requirements and recommendations.
  - サーバーはunauthorizedなリクエストに対してはHTTP 401を返さなければならない。(**SHALL**)

## 検索条件サマリ

|Resource Type|Supported Profiles|Supported Searches|
|---|---|---|
|Patient                   | [JP Core Patient （患者）プロファイル] |[SHOULD] identifier<br/>[MAY] name<br/>[MAY] birthdate + name<br/>[MAY] birthdate + gender<br/>[MAY] birthdate + name + gender<br/>[MAY] name + phone<br/>[MAY] name + address + postalcode<br/>[MAY] family + given + birthdate + gender + phone + address-postalcode|
|Coverage                  | [JP Core Coverage （保険・公費）プロファイル] |[MAY] beneficiary<br/>[MAY] class-type<br/>[MAY] class-value<br/>[MAY] dependent<br/>[SHOULD] identifier<br/>[MAY] patient<br/>[MAY] payor<br/>[MAY] policy-holder<br/>[MAY] status<br/>[MAY] subscriber<br/>[MAY] type|
|Encounter                 | [JP Core Encounter （来院・入院）プロファイル] |[MAY] patient<br/>[MAY] date + patient<br/>[SHOULD] identifier<br/>[MAY] class + patient<br/>[MAY] patient + type	<br/>[MAY] patient + status|
|Location                  | [JP Core Location （所在場所）プロファイル] |[MAY] name<br/>[MAY] address<br/>[MAY] address-city<br/>[MAY] address-state<br/>[MAY] address-postalcode|
|Organization              | [JP Core Organization （組織）プロファイル] |[SHOULD] identifier<br/>[MAY] name<br/>[MAY] address|
|Practitioner              | [JP Core Practitioner （医療従事者）プロファイル] |[SHALL] identifier<br/>[MAY] name|
|PractitionerRole          | [JP Core PractitionerRole （医療従事者役割)プロファイル] |[MAY] specialty<br/>[MAY] practitioner|
|Medication                | [JP Core Medication （薬剤）プロファイル] |
|MedicationRequest         | [JP Core MedicationRequest （内服・外用薬剤処方）プロファイル] <br/>[JP Core MedicationRequest Injection （注射薬剤処方）プロファイル] |[SHOULD] identifier<br/>[MAY] patient<br/>[MAY] patient + date<br/>[MAY] patient + authoredon<br/>[MAY] date + authoredon + category + code + requester|
|MedicationDispense        | [JP Core MedicationDispense （内服・外用薬剤処方調剤・払い出し記録）プロファイル] <br/>[JP Core MedicationDispense Injection （注射薬剤処方調剤・払い出し記録）プロファイル]|[SHOULD] identifier<br/>[MAY] patient<br/>[MAY] patient + whenhandedover<br/>[MAY] whenhandedover + whenprepared + context + code + performer	|
|MedicationAdministration  | [JP Core MedicationAdministration （内服・外用薬剤投与実施情報）プロファイル]<br/>[JP Core MedicationAdministration Injection （注射薬剤投与実施情報）プロファイル] |[SHOULD] identifier<br/>[MAY] patient<br/>[MAY] patient + effective-time<br/>[MAY]code|
|Observation               | [JP Core Observation Common （共通）プロファイル] <br/>[JP Core Observation LabResult （検体検査結果）プロファイル] <br/>[JP Core Observation VitalSigns （バイタルサイン）プロファイル]<br/>[JP Core Observation BodyMeasurement （身体計測）プロファイル]<br/>[JP Core Observation PhysicalExam （身体所見）プロファイル] <br/>[JP Core Observation SocialHistory （生活背景）プロファイル] |[MAY] subject + code + date + based-on<br/>[MAY] subject + code + date + value-quantity + based-on<br/>[MAY] subject + code + date + value-concept + based-on<br/>[MAY] subject + code + date + value-string + based-on<br/>[MAY] code + value-quantity + subject<br/>[MAY] code + value-concept + subject<br/>[MAY] code + value-string + subject<br/>[MAY] subject + category + code + value-quantity<br/>[MAY] subject + category + code + value-quantity + date<br/>[MAY] subject + category + code + value-quantity + encounter|
|ImagingStudy              | [JP Core ImagingStudy Radiology（放射線検査）プロファイル] |[MAY] subject + modality<br/>[MAY] subject + bodysite<br/>[MAY] subject + started<br/>[MAY] subject + started + modality + bodysite<br/>[MAY]encounter|
|DiagnosticReport          | [JP Core DiagnosticReport Common （共通）プロファイル] <br/>[JP Core DiagnosticReport LabResult （検体検査レポート）プロファイル]<br/>[JP Core DiagnosticReport Radiology （放射線検査レポート）プロファイル] |[MAY] subject + category<br/>[JP Core DiagnosticReport Radiology （放射線検査レポート）プロファイル][MAY] subject + category + based-on<br/>[MAY] subject + category + date<br/>[MAY] based-on<br/>[MAY] category<br/>[MAY] code<br/>[MAY] conclusion<br/>[MAY] date<br/>[MAY] encounter<br/>[SHOULD] identifier<br/>[MAY] issued<br/>[MAY] media<br/>[MAY] performer<br/>[MAY] result<br/>[MAY] results-interpreter<br/>[MAY] status<br/>[MAY] subject|
|AllergyIntolerance        | [JP Core AllergyIntolerance （アレルギー不耐症）プロファイル] |[MAY] patient<br/>[MAY] patient + date<br/>[MAY] patient + clinicalstatus<br/>[MAY] patient + verificationstatus<br/>[MAY] patient + type<br/>[MAY] patient + category<br/>[MAY] patient + criticality
|Condition                 | [JP Core Condition （状態）プロファイル] |[MAY] patient<br/>[MAY] patient + date<br/>[MAY] patient + clinicalstatus<br/>[MAY] patient + verificationstatus<br/>[MAY] patient + category|
|Procedure                 | [JP Core Procedure （処置）プロファイル] |[MAY] patient<br/>[MAY] patient + date|

## RESTful Capabilities by Resource/Profile:

{% include markdown-link-references.md %}