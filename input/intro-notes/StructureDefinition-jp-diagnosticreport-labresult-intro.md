<br/>
本プロファイルは、患者に関連付けられた検査結果を記録、検索、および取得するための`DiagnosticReport`リソースを使用するにあたっての、最低限の制約を記述したものである。またこのプロファイルを使用するときに、どの要素、拡張機能、語彙、および値セットがリソースに存在する必要があるかを示す。

検体検査結果は、通常は`Observation`リソースを参照する`DiagnosticReport`リソースを使用してグループ化および要約されたものである。

各`Observation`リソースは、個々の検体検査と結果値またはコンポーネントの結果値を表す。 また、レポート形式またはフリーテキストで表示することもできる。


## 背景および想定シナリオ

本プロファイルは、以下のようなユースケースを想定している。

 - 患者に属する検体検査レポートの参照
 <!--
 - `Patient`リソースからの指定された（患者の）検体採取日、検査項目、検査オーダの依頼科での検体検査情報の参照
 - `Patient`リソースからの指定された（患者の）検体採取日、検査項目、検査結果値（範囲、または範囲外）検査オーダの依頼科での検体検査情報の参照
 - `Patient`リソースからの指定された（患者の）検体採取日、検査項目、検査結果値（特定のコード）検査オーダの依頼科での検体検査情報の参照
 - `Patient`リソースからの指定された（患者の）検体採取日、検査項目、検査結果値（特定の文字列）検査オーダの依頼科での検体検査情報の参照
 - 検査項目、検査結果値に対し条件に合致する検体検査情報、または関連する他のリソース（`Observation`リソースや、`Patient`リソース等）の参照。
-->
## スコープ

多くの診断プロセスは、観察（`Observation`）と診断レポート（`DiagnosticReport`）を生成する手続きである点に留意する必要がある。

[`Observation`リソース](http://www.hl7.org/fhir/observation.html)とは 対照的に、`DiagnosticReport`リソースには通常、いくつかの所見、画像、画像レポート、テキストおよびコード化された解釈、テンプレート化された報告書などが含まれる。検体検査レポートは、`DiagnosticReport`リソースを使用して表す必要がある。`Observation`リソースは、特定の調査のいくつかの小さな所見のまとめを提供するために`DiagnosticReport`から参照される。

<!--
 `Observtion`はヘルスケアの中心的な要素であり、診断の支援、進捗状況の監視、ベースラインやパターンの決定、さらには人口統計学的特性の把握に使用されます。ほとんどの`Observation`は、いくつかのメタデータを持つ単純な名前/値のペアのアサーションであるが、いくつかの`Observation`は、他の`Observation`を論理的にグループ化したり、あるいはマルチコンポーネントの`Observation`であったりする。

このプロファイルでは上記想定シナリオにて用いられる`Observation`の用途がスコープであり、患者基本情報の中でも特に検体検査に該当する情報項目の１つを取り扱う際に、必要な要件を定義している。
-->
## 関連するプロファイル

このプロファイルは、以下のリソースに対して定義された各プロファイルから直接参照される可能性がある。

- [`CarePlan`](https://www.hl7.org/fhir/careplan.html)
- [`ChargeItem`](https://www.hl7.org/fhir/chargeitem.html)
- [`ClinicalImpression`](https://www.hl7.org/fhir/clinicalimpression.html)
- [`Communication`](https://www.hl7.org/fhir/communication.html)
- [`CommunicationRequest`](https://www.hl7.org/fhir/communicationrequest.html)
- [`Condition`](Condition)
- [`Contract`](https://www.hl7.org/fhir/contract.html)
- [`DeviceRequest`](https://www.hl7.org/fhir/devicerequest.html)
- [`DeviceUseStatement`](https://www.hl7.org/fhir/deviceusestatement.html)
- [`FamilyMemberHistory`](https://www.hl7.org/fhir/familymemberhistory.html)
- [`GuidanceResponse`](https://www.hl7.org/fhir/guidanceresponse.html)
- [`ImagingStudy`](https://www.hl7.org/fhir/imagingstudy.html)
- [`Immunization`](https://www.hl7.org/fhir/immunization.html)
- [`MedicationAdministration`](https://www.hl7.org/fhir/medicationadministration.html)
- [`MedicationStatement`](https://www.hl7.org/fhir/medicationstatement.html)
- [`Procedure`](Procedure)
- [`RequestGroup`](https://www.hl7.org/fhir/requestgroup.html)
- [`RiskAssessment`](https://www.hl7.org/fhir/riskassessment.html)
- [`ServiceRequest`](https://www.hl7.org/fhir/servicerequest.html)
- [`SupplyRequest`](https://www.hl7.org/fhir/supplyrequest.html)


## プロファイル定義