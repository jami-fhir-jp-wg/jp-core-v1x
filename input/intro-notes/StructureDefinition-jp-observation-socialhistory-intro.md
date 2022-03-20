<br/>
本プロファイル説明は、患者に付属する一項目分のバイタルサイン情報について、情報の登録や検索、取得のために、`JP_Observation_SocialHistory`リソースを使用するにあたっての、最低限の制約を記述したものである。
`JP_Observation_SocialHistory` リソースに対して本プロファイルに準拠する場合に必須となる要素や、サポートすべき拡張、用語、検索パラメータを定義する。


## 背景および想定シナリオ

本プロファイルは、以下のようなユースケースを想定している。
- `Patient`リソースから指定された日時、期間での患者生活背景情報の参照
- `Patient`リソースから指定された患者生活背景情報項目に対する、指定された期間での患者生活背景情報の参照
- 指定された期間や患者生活背景情報項目に対し、条件に合致する患者生活背景情報、または関連する他のリソース（`Observation`リソースや、`Patient`リソース等）の参照。


## スコープ

`Observtion`はヘルスケアの中心的な要素であり、診断の支援、進捗状況の監視、ベースラインやパターンの決定、さらには人口統計学的特性の把握に使用されます。ほとんどの`Observation`は、いくつかのメタデータを持つ単純な名前/値のペアのアサーションであるが、いくつかの `Observation`は、他の`Observation`を論理的にグループ化したり、あるいはマルチコンポーネントの`Observation`であったりする。

このプロファイルでは上記想定シナリオにて用いられる`Observation`の用途がスコープであり、患者基本情報の中でも特に患者バイタルサインに該当する情報項目の１つを取り扱う際に、必要な要件を定義している。


## 関連するプロファイル
このプロファイルは、以下のリソースに対して定義された各プロファイルから直接参照される可能性がある。

- [`AdverseEvent`](https://www.hl7.org/fhir/adverseevent.html)
- [`Appointment`](https://www.hl7.org/fhir/appointment.html)
- [`CarePlan`](https://www.hl7.org/fhir/careplan.html)
- [`ChargeItem`](https://www.hl7.org/fhir/chargeitem.html)
- [`ClinicalImpression`](https://www.hl7.org/fhir/clinicalimpression.html)
- [`Communication`](https://www.hl7.org/fhir/communication.html)
- [`CommunicationRequest`](https://www.hl7.org/fhir/communicationrequest.html)
- [`Condition`](Condition)
- [`Contract`](https://www.hl7.org/fhir/contract.html)
- [`DeviceRequest`](https://www.hl7.org/fhir/devicerequest.html)
- [`DeviceUseStatement`](https://www.hl7.org/fhir/deviceusestatement.html)
- [`DiagnosticReport`](/DiagnosticReport)
- [`Encounter`](Encounter)
- [`FamilyMemberHistory`](https://www.hl7.org/fhir/familymemberhistory.html)
- [`Goal`](https://www.hl7.org/fhir/goal.html)
- [`GuidanceResponse`](https://www.hl7.org/fhir/guidanceresponse.html)
- [`ImagingStudy`](ImagingStudy2)
- [`Immunization`](https://www.hl7.org/fhir/immunization.html)
- [`MedicationAdministration`](https://www.hl7.org/fhir/medicationadministration.html)
- [`MedicationRequest`](https://www.hl7.org/fhir/MedicationRequest.html)
- [`MedicationStatement`](https://www.hl7.org/fhir/medicationstatement.html)
- [`MolecularSequence`](https://www.hl7.org/fhir/molecularsequence.html)
- [`Observation`](ObservationSocialHistory)
- [`Procedure`](Procedure)
- [`QuestionnaireResponse`](https://www.hl7.org/fhir/questionnaireresponse.html)
- [`RequestGroup`](https://www.hl7.org/fhir/requestgroup.html)
- [`RiskAssessment`](https://www.hl7.org/fhir/riskassessment.html)
- [`ServiceRequest`](https://www.hl7.org/fhir/servicerequest.html)
- [`SupplyRequest`](https://www.hl7.org/fhir/supplyrequest.html)

## プロファイル定義