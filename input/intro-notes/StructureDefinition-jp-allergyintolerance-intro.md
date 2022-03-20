<br/>
本プロファイルは、患者のアレルギーや不耐症とその臨床的な評価を表現するAllergyIntoleranceリソースの記録・更新・検索を行う上で、準拠するべき必須となる要素や、サポートすべき拡張、用語、検索パラメータを定義する。

## スコープ

- AllergyIntoleranceリソースは患者のアレルギーや不耐症を表現する。具体的には、特定の物質または物質群への将来の暴露に対して有害反応を起こす傾向、または患者に対する潜在的なリスクを表現する。
- アレルギー又は不耐症の対象物質は、医薬品（適切な用量で正しく投与された場合）、化学物質、食べ物、植物や動物に由来する物質、または昆虫刺傷からの毒などである。

## 想定シナリオ

本プロファイルは、以下のようなユースケースを想定する。

- AllergyIntoleranceリソースの記録・更新・検索。
- 他リソースからの参照（例：AdverseEvent, FamilyMemberHistory）

## 関連するプロファイル
本プロファイルは、以下のリソースに対して定義された各プロファイルから直接参照される可能性がある。

- [AdverseEvent](https://www.hl7.org/fhir/adverseevent.html)
- [ClinicalImpression](https://www.hl7.org/fhir/clinicalimpression.html)
- [FamilyMemberHistory](https://www.hl7.org/fhir/familymemberhistory.html)
- ...（その他多数）

## プロファイル定義