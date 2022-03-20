<br/>
このResource/Profileは注射の薬剤処方の投与実施情報を表現する。薬剤処方は指示する項目、使用する用語集、プロセスなどにおいて諸外国と日本では異なっており、日本国内で規格を運用するためにExtensionの追加や用語集の追加・変更を行った。現在、日本での注射関連規格として利用されている [JAHIS注射データ交換規約Ver.2.1C](https://www.jahis.jp/standard/detail/id=590) を参考にした。

## 背景および想定シナリオ
本プロファイルは、以下のようなユースケースを想定している。

- 電子カルテから特定の患者の注射実施情報を検索する
- SS-MIX2やJAHIS注射データ交換規約に準拠した注射実施メッセージをJSONに変換する

## スコープ
<h3>対象</h3>

このProfileの対象は注射の一般的な薬剤処方の投与実施情報を電子的に連携するためのメッセージを記述することである。

<h3>対象としないこと</h3>

このProfileは注射の薬剤に関するものであり、内服・外用薬剤については対象としない。内服・外用薬剤は、指示の仕方や指示する項目が注射とは大きく異なるため、別のProfileとして記述することとする。

また、このリソースは薬剤の投与実施に関するものであり、指示（オーダー）、調剤や払い出しは対象としない。それぞれ、MedicationRequest、MedicationDispense が対応するリソースである。

## 関連するプロファイル

JP MedicationAdministrationリソースは、以下のリソースから直接参照される。

- JP Core Observationリソース
- JP Core Procedureリソース

JP MedicationAdministrationリソースは、以下のリソースを直接参照する。

- JP Core Patientリソース
- JP Core Encounterリソース
- JP Core Practitionerリソース
- JP Core PractitionerRoleリソース
- JP Core MedicationRequestリソース
- JP Core Medicationリソース

## プロファイル定義