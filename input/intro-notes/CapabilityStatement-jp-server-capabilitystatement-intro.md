<br/>
この章ではJP Core Requestor[クライアント]から発行される問い合わせに対して応答する責務のある、JP Core Serverに要求される機能(expected capabilities)について記載する。  
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
|Patient                   | [JP Core Patient （患者）プロファイル] |[SHALL] identifier<br/>[SHOULD] name<br/>[SHOULD] birthdate + name<br/>[SHOULD] birthdate + gender<br/>[SHOULD] birthdate + name + gender<br/>[SHOULD] name + phone<br/>[SHOULD] name + address + postalcode<br/>[MAY] family + given + birthdate + gender + phone + address-postalcode|
|Coverage                  | [JP Core Coverage （保険・公費）プロファイル] |[SHOULD] beneficiary<br/>[SHOULD] class-type<br/>[SHOULD] class-value<br/>[SHOULD] dependent<br/>[SHOULD] identifier<br/>[SHOULD] patient<br/>[SHOULD] payor<br/>[SHOULD] policy-holder<br/>[SHOULD] status<br/>[SHOULD] subscriber<br/>[SHOULD] type|
|Encounter                 | [JP Core Encounter （来院・入院）プロファイル] |[SHALL] patient<br/>[SHALL] date + patient<br/>[SHOULD] identifier<br/>[SHOULD] class + patient<br/>[SHOULD] patient + type	<br/>[SHOULD] patient + status|
|Location                  | [JP Core Location （所在場所）プロファイル] |[SHOULD] name<br/>[SHOULD] address<br/>[SHOULD] address-city<br/>[SHOULD] address-state<br/>[SHOULD] address-postalcode|
|Organization              | [JP Core Organization （組織）プロファイル] |[SHOULD] identifier<br/>[SHOULD] name<br/>[SHOULD] address|
|Practitioner              | [JP Core Practitioner （医療従事者）プロファイル] |[SHALL] identifier<br/>[SHALL] name|
|PractitionerRole          | [JP Core PractitionerRole （医療従事者役割)プロファイル] |[SHALL] specialty<br/>[SHALL] practitioner|
|Medication                | [JP Core Medication （薬剤）プロファイル] |
|MedicationRequest         | [[JP Core MedicationRequest （内服・外用薬剤処方）プロファイル] <br/>[JP Core MedicationRequest Injection （注射薬剤処方）プロファイル]|[SHALL] identifier<br/>[SHOULD] patient<br/>[SHOULD] patient + date<br/>[SHOULD] patient + authoredon<br/>[MAY] date + authoredon + category + code + requester|
|MedicationDispense        | [JP Core MedicationDispense （内服・外用薬剤処方調剤・払い出し記録）プロファイル] <br/>[JP Core MedicationDispense Injection （注射薬剤処方調剤・払い出し記録）プロファイル]|[SHALL] identifier<br/>[SHOULD] patient<br/>[SHOULD] patient + whenhandedover<br/>[MAY] whenhandedover + whenprepared + context + code + performer	|
|MedicationAdministration  | [JP Core MedicationAdministration （内服・外用薬剤投与実施情報）プロファイル]<br/>[JP Core MedicationAdministration Injection （注射薬剤投与実施情報）プロファイル]  |[SHALL] identifier<br/>[SHOULD] patient<br/>[SHOULD] patient + effective-time<br/>[MAY]code|
|Observation               |[JP Core Observation Common （共通）プロファイル] <br/>[JP Core Observation LabResult （検体検査結果）プロファイル] <br/>[JP Core Observation VitalSigns （バイタルサイン）プロファイル]<br/>[JP Core Observation BodyMeasurement （身体計測）プロファイル]<br/>[JP Core Observation PhysicalExam （身体所見）プロファイル] <br/>[JP Core Observation SocialHistory （生活背景）プロファイル] |[SHOULD] subject + code + date + based-on<br/>[SHOULD] subject + code + date + value-quantity + based-on<br/>[SHOULD] subject + code + date + value-concept + based-on<br/>[SHOULD] subject + code + date + value-string + based-on<br/>[SHOULD] code + value-quantity + subject<br/>[SHOULD] code + value-concept + subject<br/>[SHOULD] code + value-string + subject<br/>[MAY] subject + category + code + value-quantity<br/>[MAY] subject + category + code + value-quantity + date<br/>[MAY] subject + category + code + value-quantity + encounter|
|ImagingStudy              | [JP Core ImagingStudy Radiology（放射線検査）プロファイル] |[SHOULD] subject + modality<br/>[SHOULD] subject + bodysite<br/>[SHOULD] subject + started<br/>[SHOULD] subject + started + modality + bodysite<br/>[SHOULD] encounter|
|DiagnosticReport          | [JP Core DiagnosticReport Common （共通）プロファイル] <br/>[JP Core DiagnosticReport LabResult （検体検査レポート）プロファイル]<br/>[JP Core DiagnosticReport Radiology （放射線検査レポート）プロファイル] |[SHOULD] subject + category<br/>[SHOULD] subject + category + based-on<br/>[SHOULD] subject + category + date<br/>[SHOULD] based-on<br/>[SHOULD] category<br/>[SHOULD] code<br/>[SHOULD] conclusion<br/>[SHOULD] date<br/>[SHOULD] encounter<br/>[SHOULD] identifier<br/>[SHOULD] issued<br/>[SHOULD] media<br/>[SHOULD] performer<br/>[SHOULD] result<br/>[SHOULD] results-interpreter<br/>[SHOULD] status<br/>[SHOULD] subject|
|AllergyIntolerance        | [JP Core AllergyIntolerance （アレルギー不耐症）プロファイル] |[SHALL] patient<br/>[SHALL] patient + date<br/>[SHOULD] patient + clinicalstatus<br/>[SHOULD] patient + verificationstatus<br/>[SHOULD] patient + type<br/>[SHOULD] patient + category<br/>[SHOULD] patient + criticality
|Condition                 | [JP Core Condition （状態）プロファイル] |[SHALL] patient<br/>[SHALL] patient + date<br/>[SHOULD] patient + clinicalstatus<br/>[SHOULD] patient + verificationstatus<br/>[SHOULD] patient + category|
|Procedure                 | [JP Core Procedure （処置）プロファイル] |[SHALL] patient<br/>[SHALL] patient + date|

## RESTful Capabilities by Resource/Profile:

{% include markdown-link-references.md %}