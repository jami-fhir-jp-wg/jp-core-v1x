<br/>
本プロファイルは、患者の健康状態とその臨床的な評価を表現するConditionリソースの記録・更新・検索を行う上で、準拠するべき必須となる要素や、サポートすべき拡張、用語、検索パラメータを定義する。

## スコープ

- Conditionリソースは、患者の健康上の懸念となるレベルに達した、身体的、精神的、社会的な<strong>負</strong>の状態(conditon)や問題（problem／issue）、医療者による診断(diagnosis)、生じたイベント(event)、置かれている状況(situation)、臨床医学的概念(clinical concept)を表現する。
- 健康上の<strong>負の状態</strong>を表すものであるため、"妊娠"のようにそれが正常なものである場合にはConditionの対象外である。

## 想定シナリオ

本プロファイルは、以下のようなユースケースを想定する。

- Conditionリソースの記録・更新・検索。
- 他のリソースからの参照（例：FamilyMemberHistory, Observation, Procedure）

## 関連するプロファイル

本プロファイルは、以下のリソースに対して定義された各プロファイルから直接参照される可能性がある。

- [AdverseEvent](https://www.hl7.org/fhir/adverseevent.html)
- [Appointment](https://www.hl7.org/fhir/appointment.html)
- [CarePlan](https://www.hl7.org/fhir/careplan.html)
- ...（その他多数）

## プロファイル定義