## 背景および想定シナリオ
`Observation`リソースに対する主な用途は以下の通り。
- 体重、血圧、体温などのバイタルサイン
- 血糖値や推定GFRなどの検体検査結果
- 骨密度や胎児測定値などの画像検査結果
- 腹部圧痛などの臨床所見（※）
- 目の色など、個人的な特徴
- 喫煙歴、社会歴、家族支援、認知状態など

※ 臨床所見と疾患の境界は、医療オントロジーの課題となる。一般的なガイドについては、[`Observation`リソースの境界](https://www.hl7.org/fhir/observation.html#bnr)および[`Condition`リソースの境界](https://www.hl7.org/fhir/condition.html#bnr)のセクションを参照のこと。

## スコープ
`Observation`（検査、観察）はヘルスケアの中心的な要素であり、診断の補助、進行状況のモニタリング、基準とパターンの決定、人口統計的特性の把握に使用される。ほとんどの`Observation`は、メタデータを含む単純な名前/値のペアとなる。一部の`Observation`は、他の`Observation`を論理的にグループ化したり、複数の要素から構成される場合もある。

`DiagnosticReport`（検査レポート）リソースは一連の検査の臨床/ワークフローの文脈を定義する。`Observation`リソースは`DiagnosticReport`から参照されることで、検査、画像、その他の臨床および診断データから表現されるレポートを形作る。

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
- [`DiagnosticReport`](DiagnosticReport)
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
- [`Observation`](Observation)
- [`Procedure`](Procedure)
- [`QuestionnaireResponse`](https://www.hl7.org/fhir/questionnaireresponse.html)
- [`RequestGroup`](https://www.hl7.org/fhir/requestgroup.html)
- [`RiskAssessment`](https://www.hl7.org/fhir/riskassessment.html)
- [`ServiceRequest`](https://www.hl7.org/fhir/servicerequest.html)
- [`SupplyRequest`](https://www.hl7.org/fhir/supplyrequest.html)

## プロファイル定義