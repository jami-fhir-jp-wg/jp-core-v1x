## 制約

| id | Level | Location | Description | Expression |
| --- | --- | --- | --- | --- |
| prr-1 | Rule | (base) | code要素がある時にだけ、orderDetail要素は存在 | orderDetail.empty() or code.exists |


## 補遺

- 多くのサービスリクエストは検体、体の部位やシステムを指定する必要がある。しかし、血清グルコース、胸部Ｘ線写真などでは、これらの情報はcode要素に組み込まれている。また、specimen要素やbodysite要素もこれらを指定するために使われる。
- 既にある検体へ検査をオーダする場合にだけ、ServiceRequestリソースはSpecimenリソースを参照する。逆に、未採集の検体と一緒にサービスリクエストが最初に作成された時は、SpecimenリソースはServiceRequestリソースを参照する。
- reasonCode要素は多くの場合、保険請求を目的としている。また、reasonCode要素はsupportingInfo要素で言及されたリソースに関連し、処置や診断調査がどのように行われるか、あるいは全く行われないかどうかを決定するために使用される。
- ServiceRequestはWorkflowモジュールの1つであり、その相互運用は高度なFHIRアクティビティであり、各リソースの高度な標準化が前提とされる。そのため、本バージョンでは日本語訳のみとし、参考情報として作成している。
- また、R5では下記の変更点がある。

| 要素 | R4、R4Bからの変更点 |
| --- | --- |
| ServiceRequest.code | - CodeableConceptから、CodeableReferenceへ型が変更 |
| ServiceRequest.orderDetail | CodeableConceptから、BackboneElementへ型が変更 |
| ServiceRequest.orderDetail.parameterFocus | 追加 |
| ServiceRequest.orderDetail.parameter | 必須の要素として追加 |
| ServiceRequest.orderDetail.parameter.code | 必須の要素として追加 |
| ServiceRequest.orderDetail.parameter.value[x] | 必須の要素として追加 |
| ServiceRequest.focus | 追加 |
| ServiceRequest.location | 追加 |
| ServiceRequest.reason | 追加 |
| ServiceRequest.supportingInfo | Reference(Resource)から、CodeableReferenceへ変更 |
| ServiceRequest.bodyStructure | 追加 |
| ServiceRequest.patientInstruction |　stringから、BackboneElementへ型が変更となり、Cardinalityが、"0..*"へ |
| ServiceRequest.patientInstruction.instruction[x] | 追加 |
| ServiceRequest.locationCode | 削除 |
| ServiceRequest.locationReference | 削除 |
| ServiceRequest.reasonCode | 削除（reason要素へ移行）|
| ServiceRequest.reasonReference | 削除 (reason要素へ移行) |

## 検索パラメータ

このリソースの検索パラメータ。基本のパラメータも適用される。詳細は[Searching](http://hl7.org/fhir/R4/search.html)を参照。

| コンフォーマンス | パラメータ | 型 | 説明 | 表現型 |
| ---- | ---- | ---- | ---- | ---- |
| SHALL | identifier | [token](http://hl7.org/fhir/R4/search.html#token) | 業務ID | ServiceRequest.identifier |
| SHALL | intent | [token](http://hl7.org/fhir/R4/search.html#token) | proposal \| plan \| directive \| order \| original-order \| reflex-order \| filler-order \|
| SHALL | subject | [reference](http://hl7.org/fhir/R4/search.html#reference) | 対象者 | ServiceRequest.subject ( [Group](http://hl7.org/fhir/R4/group.html), [Device](http://hl7.org/fhir/R4/device.html), [Patient](http://hl7.org/fhir/R4/patient.html), [Location](http://hl7.org/fhir/R4/location.html)) |
| SHOULD | performer | [reference](http://hl7.org/fhir/R4/search.html#reference) | サービスの実施者 | ServiceRequest.performer ([Practitioner](http://hl7.org/fhir/R4/practitioner.html), [Organization](http://hl7.org/fhir/R4/organization.html), [CareTeam](http://hl7.org/fhir/R4/careteam.html), [Device](http://hl7.org/fhir/R4/device.html), [Patient](http://hl7.org/fhir/R4/patient.html), [HealthcareService](http://hl7.org/fhir/R4/healthcareservice.html), [PractitionerRole](http://hl7.org/fhir/R4/practitionerrole.html), [RelatedPerson](http://hl7.org/fhir/R4/relatedperson.html)) |
| SHOULD | occurrence | [date](http://hl7.org/fhir/R4/search.html#date) | サービスの実施日 | ServiceRequest.occurrence |
| SHOULD | patient | [reference](http://hl7.org/fhir/R4/search.html#reference) | 患者による検索 | ServiceRequest.subject.where(resolve() is Patient) ([Patient](http://hl7.org/fhir/R4/patient.html)) |
| SHALL | status | [token](http://hl7.org/fhir/R4/search.html#token) | draft \| active \| on-hold \| revoked \| completed \| entered-in-error \| unknown | ServiceRequest.status |
| SHOULD | requester | [reference](http://hl7.org/fhir/R4/search.html#reference) | サービスをリクエストした人・物 | ServiceRequest.requester ([Practitioner](http://hl7.org/fhir/R4/practitioner.html), [Organization](http://hl7.org/fhir/R4/organization.html), [Device](http://hl7.org/fhir/R4/device.html), [Patient](http://hl7.org/fhir/R4/patient.html),  [PractitionerRole](http://hl7.org/fhir/R4/practitionerrole.html), [RelatedPerson](http://hl7.org/fhir/R4/relatedperson.html)) |
| MAY | authored | [date](http://hl7.org/fhir/R4/search.html#date) | 署名された日 | ServiceRequest.authoredOn |
| MAY | based-on | [reference](http://hl7.org/fhir/R4/search.html#reference) | 実施すべき対象 | ServiceRequest.basedOn ([CarePlan](http://hl7.org/fhir/R4/careplan.html), [MedicationRequest](http://hl7.org/fhir/R4/medicationrequest.html), [ServiceRequest](http://hl7.org/fhir/R4/servicerequest.html)) |
| MAY | body-site |[token](http://hl7.org/fhir/R4/search.html#token) | 手技の対象部位 | ServiceRequest.bodySite |
| MAY | category | [token](http://hl7.org/fhir/R4/search.html#token) | サービスリクエストの分類 | ServiceRequest.category |
| MAY | code | [token](http://hl7.org/fhir/R4/search.html#token) | リクエスト・オーダされる内容のコード | ServiceRequest.code |
| MAY | encounter | [reference](http://hl7.org/fhir/R4/search.html#reference) | サービスリクエストが作成された場面 | ServiceRequest.encounter ([Encounter](http://hl7.org/fhir/R4/encounter.html)) |
| MAY | instantiates-canonical | [reference](http://hl7.org/fhir/R4/search.html#reference) | FHIRのプロトコールや定義への参照 | ServiceRequest.instantiatesCanonical ([PlanDefinition](http://hl7.org/fhir/R4/plandefinition.html), [ActivityDefinition](http://hl7.org/fhir/R4/activitydefinition.html)) |
| MAY | instantiates-uri | [uri](http://hl7.org/fhir/R4/search.html#uri) | 外部のプロトコールや定義への参照 | ServiceRequest.instantiatesUri | instance-order \| option | ServiceRequest.intent |
| MAY | performer-type | [token](http://hl7.org/fhir/R4/search.html#token) | サービスの実施者の職種 | ServiceRequest.performerType |
| MAY | priority | [token](http://hl7.org/fhir/R4/search.html#token) | routine \| urgent \| asap \| stat | ServiceRequest.priority |
| MAY | replaces | [reference](http://hl7.org/fhir/R4/search.html#reference) | 代替のサービスリクエスト | ServiceRequest.replaces ([ServiceRequest](http://hl7.org/fhir/R4/servicerequest.html)) |
| MAY | requisition | [token](http://hl7.org/fhir/R4/search.html#token) | 複合ID | ServiceRequest.requisition |
| MAY | specimen | [token](http://hl7.org/fhir/R4/search.html#reference) | 検体 | ServiceRequest.specimen ([Specimen](http://hl7.org/fhir/R4/specimen.html)) |
