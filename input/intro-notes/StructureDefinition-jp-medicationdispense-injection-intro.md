<br/>

このプロファイルは注射、注入を含む薬剤処方の調剤情報をMedicationDispenseリソースを使用して表現する。日本国内で規格を運用するためにExtensionの追加や用語集の追加・変更を行った。
以下、このプロファイルのMedicationDispenseリソースを「JP Core MedicationDispense Injectionリソース」と呼ぶ。

## 背景および想定シナリオ
このプロファイルは、以下のようなユースケースを想定している。

- 医療機関内の薬剤部門システムや調剤薬局のシステムから特定の患者に対する注射、注入薬剤の調剤情報を検索する

## スコープ
<h3>対象</h3>

このプロファイルの対象は注射、注入を含む一般的な薬剤処方の調剤情報を電子的に連携するためのメッセージを記述することである。

<h3>対象としないこと</h3>

このプロファイルのMedicationDispenseリソースは薬剤の調剤情報に関するものであり、処方指示や実施記録は対象としない。それぞれ、MedicationRequest, MedicationAdministrationが対応するリソースである。

## 関連するプロファイル
JP Core MedicationDispense Injectionリソースは、以下のリソースから直接参照される。

- JP Core Observationリソース

JP Core MedicationDispense Injection リソースは、以下のリソースを直接参照する。

- JP Core Patientリソース
- JP Core Encounterリソース
- JP Core Practitionerリソース
- JP Core PractitionerRoleリソース
- JP Core Organizationリソース
- JP Core MedicationRequest Injectionリソース
- JP Core Medicationリソース

## プロファイル定義